<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>  
<%@ page import="javax.servlet.http.HttpSession" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>User Payment Page</title>  

    <style>  
        body {  
            font-family: Arial, sans-serif;  
            background-color: #f4f4f9;  
            margin: 0;  
            padding: 0;  
        }  

        .container {  
            width: 80%;  
            margin: 30px auto;  
            padding: 20px;  
            background-color: #ffffff;  
            border-radius: 8px;  
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  
        }  

        h2 {  
            text-align: center;  
            color: #333;  
        }  

        .user-info,  
        .tax-info {  
            margin-bottom: 20px;  
        }  

        .user-info p,  
        .tax-info p {  
            font-size: 18px;  
            color: #555;  
        }  

        .tax-info table {  
            width: 100%;  
            border-collapse: collapse;  
        }  

        .tax-info table, th, td {  
            border: 1px solid #ddd;  
        }  

        th, td {  
            padding: 10px;  
            text-align: left;  
        }  

        .total-amount {  
            font-size: 20px;  
            font-weight: bold;  
            text-align: center;  
            color: #28a745;  
            margin-top: 20px;  
        }  

        .back-button {  
            display: flex;  
            justify-content: center;  
            gap: 20px;  
            margin-top: 30px;  
        }  

        button {  
            background-color: #007bff;  
            color: white;  
            padding: 10px 20px;  
            border: none;  
            border-radius: 4px;  
            cursor: pointer;  
            font-size: 16px;  
        }  

        button:hover {  
            background-color: #0056b3;  
        }  
    </style>  
</head>  

<body>  

<%  
    String userId = request.getParameter("userId");  
    String ownerName = "";  
    String address = "";  
    String propertyType = "";  
    double sizeInSqMeters = 0;  
    String waterSource = "";  
    int estimatedWaterUsage = 0;  

    Connection con = null;  
    PreparedStatement ps = null;  
    ResultSet rs = null;  

    try {  
        Class.forName("oracle.jdbc.driver.OracleDriver");  
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "kicha");  

        // Fetch user property details  
        String query = "SELECT * FROM PropertyDetails WHERE user_id = ?";  
        ps = con.prepareStatement(query);  
        ps.setString(1, userId);  
        rs = ps.executeQuery();  

        if (rs.next()) {  
            ownerName = rs.getString("owner_name");  
            address = rs.getString("address");  
            propertyType = rs.getString("property_type");  
            sizeInSqMeters = rs.getDouble("size_sq_meters");  
            waterSource = rs.getString("water_source");  
            estimatedWaterUsage = rs.getInt("estimated_water_usage");  
        } else {  
            out.println("<h3>User not found.</h3>");  
            return;  
        }  

        // Water Tax Calculation  
        double waterTax = 0.0;  
        if ("municipal".equals(waterSource)) {  
            if (estimatedWaterUsage <= 10000) {  
                waterTax = 15 * (estimatedWaterUsage / 1000.0);  
            } else if (estimatedWaterUsage <= 20000) {  
                waterTax = 12 * (estimatedWaterUsage / 1000.0);  
            } else if (estimatedWaterUsage <= 50000) {  
                waterTax = 10 * (estimatedWaterUsage / 1000.0);  
            } else {  
                waterTax = 8 * (estimatedWaterUsage / 1000.0);  
            }  
        } else if ("borewell".equals(waterSource)) {  
            if (estimatedWaterUsage <= 10000) {  
                waterTax = 5 * (estimatedWaterUsage / 1000.0);  
            } else if (estimatedWaterUsage <= 20000) {  
                waterTax = 4 * (estimatedWaterUsage / 1000.0);  
            } else if (estimatedWaterUsage <= 50000) {  
                waterTax = 3 * (estimatedWaterUsage / 1000.0);  
            } else {  
                waterTax = 2 * (estimatedWaterUsage / 1000.0);  
            }  
        }  

        // Property Tax Calculation  
        double propertyTax = 0.0;  
        if ("urban".equals(propertyType)) {  
            if (sizeInSqMeters <= 1000) {  
                propertyTax = 5 * sizeInSqMeters;  
            } else if (sizeInSqMeters <= 2000) {  
                propertyTax = 6 * sizeInSqMeters;  
            } else if (sizeInSqMeters <= 5000) {  
                propertyTax = 8 * sizeInSqMeters;  
            } else {  
                propertyTax = 10 * sizeInSqMeters;  
            }  
        } else if ("rural".equals(propertyType)) {  
            if (sizeInSqMeters <= 1000) {  
                propertyTax = 3 * sizeInSqMeters;  
            } else if (sizeInSqMeters <= 2000) {  
                propertyTax = 4 * sizeInSqMeters;  
            } else if (sizeInSqMeters <= 5000) {  
                propertyTax = 5 * sizeInSqMeters;  
            } else {  
                propertyTax = 6 * sizeInSqMeters;  
            }  
        }  

        double totalAmount = waterTax + propertyTax;  

        // Store in session  
        HttpSession arp = request.getSession();  
        arp.setAttribute("user_id", userId);  
        arp.setAttribute("tax_type", "Water Tax");  
        arp.setAttribute("amount", totalAmount);  
%>  

    <div class="container">  
        <h2>Payment Information for User <%= userId %></h2>  

        <div class="user-info">  
            <p><strong>Owner Name:</strong> <%= ownerName %></p>  
            <p><strong>Property Address:</strong> <%= address %></p>  
            <p><strong>Property Type:</strong> <%= propertyType %></p>  
            <p><strong>Water Source:</strong> <%= waterSource %></p>  
            <p><strong>Size (sq. meters):</strong> <%= sizeInSqMeters %></p>  
            <p><strong>Estimated Water Usage (liters):</strong> <%= estimatedWaterUsage %></p>  
        </div>  

        <div class="tax-info">  
            <h3>Tax Breakdown</h3>  
            <table>  
                <tr>  
                    <th>Water Tax</th>  
                    <td>₹<%= waterTax %></td>  
                </tr>  
                <tr>  
                    <th>Property Tax</th>  
                    <td>₹<%= propertyTax %></td>  
                </tr>  
            </table>  
        </div>  

        <div class="total-amount">  
            Total Amount to Pay: ₹<%= totalAmount %>  
        </div>  

        <div class="back-button">  
            <form action="transactionStatus.jsp" method="GET">  
                <button type="submit">Pay Now</button>  
            </form>  
            <form action="getUserId.jsp">  
                <button type="submit">Go Back</button>  
            </form>  
        </div>  
    </div>  

<%  
    } catch (SQLException e) {  
        out.println("<h3>Error: " + e.getMessage() + "</h3>");  
    } catch (ClassNotFoundException e) {  
        out.println("<h3>Error: Database Driver not found.</h3>");  
    } catch (Exception e) {  
        out.println("<h3>An unexpected error occurred: " + e.getMessage() + "</h3>");  
    } finally {  
        try {  
            if (rs != null) rs.close();  
            if (ps != null) ps.close();  
            if (con != null) con.close();  
        } catch (SQLException e) {  
            out.println("<h3>Error closing resources: " + e.getMessage() + "</h3>");  
        }  
    }  
%>  

</body>  
</html>

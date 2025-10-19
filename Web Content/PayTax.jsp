<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Property Details</title>  

    <style>  
        body {  
            font-family: Arial, sans-serif;  
            background-color: #f4f4f9;  
            margin: 0;  
            padding: 0;  
        }  

        h2 {  
            text-align: center;  
            color: #333;  
            margin-top: 30px;  
        }  

        table {  
            width: 90%;  
            margin: 20px auto;  
            border-collapse: collapse;  
            background-color: #fff;  
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  
        }  

        th, td {  
            border: 1px solid #ddd;  
            padding: 10px;  
            text-align: center;  
            font-size: 16px;  
        }  

        th {  
            background-color: #f2f2f2;  
            color: #333;  
        }  

        tr:nth-child(even) {  
            background-color: #f9f9f9;  
        }  

        .pay-button {  
            padding: 6px 14px;  
            background-color: #28a745;  
            color: #fff;  
            border: none;  
            border-radius: 4px;  
            cursor: pointer;  
            font-size: 14px;  
        }  

        .pay-button:hover {  
            background-color: #218838;  
        }  
    </style>  
</head>  

<body>  
    <h2>Property Details</h2>  

    <table>  
        <thead>  
            <tr>  
                <th>Property ID</th>  
                <th>Property Type</th>  
                <th>Address</th>  
                <th>Status</th>  
                <th>Action</th>  
            </tr>  
        </thead>  

        <tbody>  
            <%  
                Connection con = null;  
                Statement stmt = null;  
                ResultSet rs = null;  

                try {  
                    Class.forName("oracle.jdbc.driver.OracleDriver");  
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "kicha");  
                    stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);  

                    String query = "SELECT * FROM PropertyDetails";  
                    rs = stmt.executeQuery(query);  

                    if (con != null && rs != null) {  
                        while (rs.next()) {  
                            String propertyId = rs.getString("user_id");  
                            String propertyType = rs.getString("property_type");  
                            String address = rs.getString("address");  
                            String status = rs.getString("status");  
            %>  

            <tr>  
                <td><%= propertyId %></td>  
                <td><%= propertyType %></td>  
                <td><%= address %></td>  
                <td><%= status %></td>  
                <td>  
                    <% if ("Accepted".equalsIgnoreCase(status)) { %>  
                        <a href="DownloadServlet"><button class="pay-button">View</button></a>  
                    <% } %>  
                </td>  
            </tr>  

            <%  
                        }  
                    } else {  
                        out.println("<tr><td colspan='5'>Database connection failed</td></tr>");  
                    }  
                } catch (Exception e) {  
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");  
                } finally {  
                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }  
                }  
            %>  
        </tbody>  
    </table>  
</body>  
</html>

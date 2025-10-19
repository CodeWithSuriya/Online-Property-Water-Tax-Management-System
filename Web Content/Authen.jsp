<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property Details</title>
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .pay-button {
            padding: 5px 15px;
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .pay-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Property Details</h2>
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
                Connection c = null;
                Statement s = null;
                ResultSet rs = null;

                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    c = DriverManager.getConnection(
                        "jdbc:oracle:thin:@localhost:1521:XE", "system", "kicha"
                    );

                    s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    String query = "SELECT * FROM PropertyDetails";
                    rs = s.executeQuery(query);

                    if (c != null && rs != null) {
                        while (rs.next()) {
                            String propertyId = rs.getString("user_Id");
                            String propertyType = rs.getString("property_Type");
                            String address = rs.getString("address");
                            String status = rs.getString("status");
            %>
            <tr>
                <td><%= propertyId %></td>
                <td><%= propertyType %></td>
                <td><%= address %></td>
                <td><%= status %></td>
                <td>
                    <form action="accept" method="post">
                        <input type="hidden" name="user_id" value="<%= propertyId %>">
                        <button class="pay-button">Accept</button>
                    </form>
                </td>
            </tr>
            <%
                        }
                    } else {
                        out.println("Database connection failed");
                    }
                } catch (Exception e) {
                    out.println(e);
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (s != null) try { s.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (c != null) try { c.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </tbody>
    </table>
</body>
</html>

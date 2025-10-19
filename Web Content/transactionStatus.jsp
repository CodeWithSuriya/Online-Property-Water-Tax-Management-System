<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment - Online Tax Management System</title>

    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 400px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #555;
            font-weight: bold;
            text-align: left;
        }

        input[type="text"],
        input[type="password"],
        input[type="month"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="text"]:read-only {
            background-color: #f0f0f0;
            color: #555;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #218838;
        }

        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background: #ffffff url('data:image/svg+xml;utf8,<svg fill="%23333" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 10px center;
            background-size: 16px;
        }

        ::placeholder {
            color: #aaa;
            font-style: italic;
        }

        input:focus,
        select:focus {
            border-color: #28a745;
            outline: none;
        }

        @media (max-width: 450px) {
            .container {
                width: 90%;
                padding: 15px;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Make a Payment</h1>

        <%
            HttpSession arp = request.getSession();

            // Retrieve session attributes
            String uid = (String) arp.getAttribute("user_id");
            String taxType = (String) arp.getAttribute("tax_type");
            Double amount = (Double) arp.getAttribute("amount");

            // Check for valid payment details
            if (taxType != null && amount != null) {
        %>

        <!-- Payment Form -->
        <form action="transstatus" method="post">
            <input type="hidden" name="user_id" value="<%= uid %>">

            <label>Select Tax Type:</label>
            <input type="text" id="tax" name="tax" value="<%= taxType %>" readonly>

            <label for="amount">Amount Due:</label>
            <input type="text" id="amount" name="amount" value="<%= amount %>" readonly>

            <button type="submit">Pay Now</button>
        </form>

        <%
            } else {
                out.println("<p style='color:red;'>Error: Missing payment details.</p>");
            }
        %>
    </div>
</body>
</html>

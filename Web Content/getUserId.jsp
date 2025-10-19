<%--  
    Document   : getUserId  
    Created on : 10 Nov, 2024, 1:00:03 PM  
    Author     : 91979  
--%>  

<%@ page contentType="text/html" pageEncoding="UTF-8" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Enter User ID</title>  
    <style>  
        body {  
            font-family: Arial, sans-serif;  
            background-color: #f4f4f9;  
            margin: 0;  
            padding: 0;  
            display: flex;  
            justify-content: center;  
            align-items: center;  
            height: 100vh;  
        }  

        .container {  
            width: 50%;  
            max-width: 400px;  
            background-color: #fff;  
            padding: 20px;  
            border-radius: 8px;  
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  
            text-align: center;  
        }  

        h2 {  
            color: #333;  
            margin-bottom: 20px;  
        }  

        label {  
            font-size: 16px;  
            color: #555;  
        }  

        input[type="text"] {  
            width: 80%;  
            padding: 10px;  
            margin-top: 10px;  
            border: 1px solid #ccc;  
            border-radius: 4px;  
            font-size: 16px;  
        }  

        button {  
            background-color: #007bff;  
            color: white;  
            padding: 10px 20px;  
            border: none;  
            border-radius: 4px;  
            cursor: pointer;  
            margin-top: 15px;  
            font-size: 16px;  
        }  

        button:hover {  
            background-color: #0056b3;  
        }  
    </style>  
</head>  

<body>  
    <div class="container">  
        <h2>Enter User ID</h2>  
        <form action="getUserDetails.jsp" method="post">  
            <label for="userId">User ID:</label><br>  
            <input type="text" id="userId" name="userId" required><br><br>  
            <button type="submit">Submit</button>  
        </form>  
    </div>  
</body>  
</html>

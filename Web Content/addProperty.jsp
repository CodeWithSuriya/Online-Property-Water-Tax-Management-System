<%--  
    Document   : addProperty  
    Created on : 10 Nov, 2024, 1:13:45 PM  
    Author     : 91979  
--%>  

<%@ page contentType="text/html" pageEncoding="UTF-8" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Property and Water Details Form</title>  

    <style>  
        body {  
            font-family: Arial, sans-serif;  
            display: flex;  
            justify-content: center;  
            align-items: center;  
            height: 100vh;  
            margin: 0;  
            background-color: #e9f5f0;  
        }  

        .form-container {  
            background: #ffffff;  
            padding: 25px;  
            border-radius: 8px;  
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);  
            max-width: 600px;  
            width: 100%;  
            text-align: center;  
        }  

        h2 {  
            color: #333;  
            margin-bottom: 20px;  
        }  

        label {  
            display: block;  
            margin-top: 15px;  
            text-align: left;  
            font-weight: bold;  
            color: #333;  
        }  

        input[type="text"],  
        input[type="number"] {  
            width: 100%;  
            padding: 10px;  
            margin-top: 5px;  
            margin-bottom: 15px;  
            border: 1px solid #ccc;  
            border-radius: 4px;  
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);  
            box-sizing: border-box;  
        }  

        .radio-group {  
            display: flex;  
            justify-content: flex-start;  
            gap: 20px;  
            margin-top: 5px;  
        }  

        .radio-group label {  
            display: flex;  
            align-items: center;  
            font-weight: normal;  
            color: #333;  
        }  

        .radio-group input[type="radio"] {  
            margin-left: 8px;  
            transform: scale(1.2);  
        }  

        button {  
            width: 100%;  
            padding: 12px;  
            background-color: #4CAF50;  
            color: white;  
            border: none;  
            border-radius: 4px;  
            cursor: pointer;  
            font-size: 16px;  
            font-weight: bold;  
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);  
        }  

        button:hover {  
            background-color: #45a049;  
        }  

        @media (max-width: 600px) {  
            body {  
                padding: 10px;  
            }  

            .form-container {  
                padding: 20px;  
            }  

            button {  
                padding: 10px;  
                font-size: 15px;  
            }  
        }  
    </style>  
</head>  

<body>  
    <div class="form-container">  
        <h2>Property Details Form</h2>  

        <form action="PropertyServlet" method="POST">  
            <label for="user_id">ID:</label>  
            <input type="text" id="user_id" name="user_id" required>  

            <label for="address">Address:</label>  
            <input type="text" id="address" name="address" required>  

            <label>Type:</label>  
            <div class="radio-group">  
                <label>Urban  
                    <input type="radio" name="type" value="urban" required>  
                </label>  
                <label>Rural  
                    <input type="radio" name="type" value="rural">  
                </label>  
            </div>  

            <label for="size">Size (sq meters):</label>  
            <input type="number" id="size" name="size" step="0.01" required>  

            <label for="owner_name">Owner Name:</label>  
            <input type="text" id="owner_name" name="owner_name" required>  

            <label>Water Source:</label>  
            <div class="radio-group">  
                <label>Municipal  
                    <input type="radio" name="water_source" value="municipal" required>  
                </label>  
                <label>Borewell  
                    <input type="radio" name="water_source" value="borewell">  
                </label>  
            </div>  

            <label for="estimated_water_usage">Estimated Water Usage (in liters):</label>  
            <input type="number" id="estimated_water_usage" name="estimated_water_usage" required>  

            <input type="hidden" name="status" value="waiting">  

            <button type="submit">Submit</button>  
        </form>  
    </div>  
</body>  
</html>

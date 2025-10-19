<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Authority Authentication</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-image: url('3.jpeg'); /* Path to the uploaded image */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f0f8ff;
        }

        .authority-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 300px;
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
        }

        .auth-button {
            width: 100%;
            padding: 15px;
            font-size: 1.2em;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .auth-button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .auth-button:active {
            background-color: #004080;
        }
    </style>
</head>
<body>

    <div class="authority-container">
        <h2>Authority Authentication</h2>
        <button class="auth-button" onclick="authenticate()">Authenticate</button>
    </div>

    <script>
        function authenticate() {
            alert("Authentication process initiated.");
            // Add your authentication logic here
        }
    </script>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login Page</title>
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
            height: 100vh;
            margin: 0;
            background-color: #f2f2f2;
        }

        .login-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
        }

        .button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
        }

        .login-button {
            background-color: #0066cc;
            color: #fff;
        }

        .signup-button {
            background-color: #4CAF50;
            color: #fff;
        }

        .button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>User Login</h2>
        <form action="UserLoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" class="input-field" required>
            <input type="password" name="password" placeholder="Password" class="input-field" required>

            <button type="submit" class="button login-button">Login</button>
            <button type="button" class="button signup-button" onclick="window.location.href='SignUp.jsp'">Sign Up</button>
            <button type="button" class="button signup-button" onclick="window.location.href='Back.jsp'">Back</button>
        </form>
    </div>

</body>
</html>

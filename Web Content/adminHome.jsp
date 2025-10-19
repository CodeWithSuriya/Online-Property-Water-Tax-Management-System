<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Home - Water Tax Management System</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-image: url('2.jpg'); /* Path to the uploaded image */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header */
        header {
            background-color: rgba(0, 77, 153, 0.9); /* Semi-transparent */
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }

        header h1 {
            font-size: 2.2em;
            margin-bottom: 10px;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1.1em;
            padding: 8px 12px;
            transition: background 0.3s ease, transform 0.3s ease;
            border-radius: 4px;
        }

        nav ul li a:hover {
            background-color: #0066cc;
            transform: scale(1.05);
        }

        /* Main Section */
        main {
            flex-grow: 1;
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        main h2 {
            font-size: 1.8em;
            color: #004d99;
            margin-bottom: 15px;
        }

        main p {
            font-size: 1.1em;
            margin-bottom: 20px;
        }

        section h3 {
            font-size: 1.5em;
            color: #004d99;
            margin-bottom: 10px;
        }

        section ul {
            list-style-type: disc;
            margin-left: 20px;
            text-align: left;
        }

        section ul li {
            font-size: 1.1em;
            margin: 5px 0;
        }

        /* Footer */
        footer {
            background-color: rgba(0, 77, 153, 0.9); /* Semi-transparent */
            color: #fff;
            text-align: center;
            padding: 10px;
            font-size: 0.9em;
            margin-top: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            nav ul {
                flex-direction: column;
                gap: 10px;
            }

            header h1 {
                font-size: 1.6em;
            }

            main h2, section h3 {
                font-size: 1.4em;
            }
        }

        @media (max-width: 480px) {
            nav ul {
                font-size: 0.9em;
            }

            main {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin Home</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="payTax.jsp">View Data</a></li>
                <li><a href="index.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>

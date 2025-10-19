
## Overview
The **Online Property / Water Tax Management System** is a web-based application designed to simplify the process of managing property and water taxes. Users can register, login, add property details, calculate taxes, and pay them online. Admin and authority roles are included for management and verification of property data.

This project eliminates manual calculations and physical tax submissions, making the system more efficient and user-friendly.

---

## Features
- **User Features:**
  - Register and login securely.
  - Add property details (address, size, type, water source, estimated water usage).
  - Calculate water and property tax automatically.
  - View tax breakdown and make payments online.
  - Download payment reports.
  
- **Admin/Authority Features:**
  - View user properties and water usage.
  - Approve or reject property details.
  - Access payment and transaction history.

- **Responsive Design:**
  - Works on desktop, tablet, and mobile devices.

---

## Technologies Used
- **Frontend:** HTML5, CSS3, JSP
- **Backend:** Java Servlet, JSP
- **Database:** Oracle Database
- **Server:** Apache Tomcat
- **Version Control:** Git & GitHub

---

## Project Structure
```

Online-Property-Water-Tax-Management-System/
│
├── src/
│   ├── implementation/         # Java backend implementations
│   ├── Database/               # Database connection classes
│   └── Bean/                   # JavaBeans for data encapsulation
│
├── WebContent/
│   ├── index.jsp               # Home page
│   ├── Admin.jsp               # Admin panel
│   ├── UserProfile.jsp         # User dashboard
│   ├── AuthorityLogin.jsp      # Authority login
│   ├── SignUp.jsp              # User registration
│   ├── UserLogin.jsp           # User login
│   ├── addProperty.jsp         # Add property form
│   ├── getUserId.jsp           # Enter user ID for tax
│   ├── getUserDetails.jsp      # Fetch user details
│   ├── payTax.jsp              # Pay tax page
│   ├── transactionStatus.jsp   # Transaction confirmation
│   └── Error.jsp               # Error page
│
├── images/                     # Uploaded images like 2.jpg, 3.jpeg
├── README.md                   # Project documentation
└── styles.css                  # Optional CSS file

````

---

## Setup and Installation

### Prerequisites
- Java Development Kit (JDK 8+)
- Apache Tomcat 9+
- Oracle Database XE
- Git (for cloning the repository)

### Steps to Setup
1. **Clone the Repository**
   ```bash
   git clone https://github.com/CodeWithSuriya/Online-Property-Water-Tax-Management-System.git
````

2. **Database Setup**

   * Open Oracle Database and create a database named `XE`.
   * Create the table `PropertyDetails`:

   ```sql
   CREATE TABLE PropertyDetails (
       user_id VARCHAR2(50) PRIMARY KEY,
       owner_name VARCHAR2(100),
       address VARCHAR2(255),
       property_type VARCHAR2(20),
       size_sq_meters NUMBER(10,2),
       water_source VARCHAR2(50),
       estimated_water_usage NUMBER,
       status VARCHAR2(20)
   );
   ```

   * Insert sample data if needed.

3. **Configure Tomcat**

   * Copy the project folder to Tomcat's `webapps` directory.
   * Start the Tomcat server and navigate to:

   ```
   http://localhost:8080/Online-Property-Water-Tax-Management-System
   ```

4. **Update Database Credentials**

   * In `implementation` folder, update `Connection` strings if your Oracle username/password differs.

---

## How to Use

1. Open the home page (`index.jsp`) in your browser.
2. Register a new user via `SignUp.jsp`.
3. Login using `UserLogin.jsp`.
4. Add property details using `addProperty.jsp`.
5. Calculate taxes and make payment via `payTax.jsp`.
6. Admins and authorities can view and approve property details from their respective dashboards.

---

## Future Enhancements

* Add **email notifications** for tax reminders.
* Integrate **online payment gateways** like Razorpay or PayPal.
* Implement **role-based access control** for more security.
* Mobile application version for Android/iOS.

---

## Author

**Suriya E**

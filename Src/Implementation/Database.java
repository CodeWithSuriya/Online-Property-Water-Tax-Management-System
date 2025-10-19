package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database class handles the creation of a connection to the Oracle database.
 * 
 * @author 91979
 */
public class Database {

    // Static connection object
    private static Connection con;

    /**
     * Creates and returns a connection to the Oracle database.
     * 
     * @return Connection object
     */
    public static Connection createConnection() {
        if (con != null) {
            return con; // Return existing connection if already created
        }

        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish connection
            con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE", // Database URL
                    "system",                              // Username
                    "kicha"                                // Password
            );

            System.out.println("Connection established successfully.");

        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database.");
            e.printStackTrace();
        }

        return con;
    }
}

package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * PropertyServlet handles submission of property details
 * and stores them in the PropertyDetails database table.
 * 
 * Author: 91979
 */
@WebServlet("/PropertyServlet")
public class PropertyServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String JDBC_USERNAME = "system";
    private static final String JDBC_PASSWORD = "kicha";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        String userId = request.getParameter("user_id");
        String address = request.getParameter("address");
        String propertyType = request.getParameter("type");
        String ownerName = request.getParameter("owner_name");
        String waterSource = request.getParameter("water_source");
        String status = request.getParameter("status");

        float sizeSqMeters;
        int estimatedWaterUsage;

        // Parse numeric parameters
        try {
            sizeSqMeters = Float.parseFloat(request.getParameter("size"));
            estimatedWaterUsage = Integer.parseInt(request.getParameter("estimated_water_usage"));
        } catch (NumberFormatException e) {
            response.getWriter().println("Error: Invalid number format.");
            return;
        }

        // Load Oracle JDBC Driver
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            response.getWriter().println("Error: SQL JDBC Driver not found.");
            return;
        }

        // Insert data into database
        String sql = "INSERT INTO PropertyDetails "
                   + "(user_id, address, property_type, size_sq_meters, owner_name, "
                   + "estimated_water_usage, water_source, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setString(1, userId);
            statement.setString(2, address);
            statement.setString(3, propertyType);
            statement.setFloat(4, sizeSqMeters);
            statement.setString(5, ownerName);
            statement.setInt(6, estimatedWaterUsage);
            statement.setString(7, waterSource);
            statement.setString(8, status);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                // Forward to getUserId.jsp after successful insertion
                RequestDispatcher rd = request.getRequestDispatcher("getUserId.jsp");
                rd.forward(request, response);
            } else {
                response.getWriter().println("Failed to save property and water usage details.");
            }

        } catch (SQLException e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

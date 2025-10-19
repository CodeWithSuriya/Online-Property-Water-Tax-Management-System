package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * AcceptServlet updates the status of a property to 'Accepted'
 * based on the provided user_id.
 * 
 * Author: 91979
 */
@WebServlet(name = "AcceptServlet", urlPatterns = {"/accept"})
public class AcceptServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String JDBC_USERNAME = "system";
    private static final String JDBC_PASSWORD = "kicha";

    /**
     * Processes requests for both HTTP GET and POST methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String userId = request.getParameter("user_id");

        if (userId == null || userId.isEmpty()) {
            try (PrintWriter out = response.getWriter()) {
                out.println("Error: User ID is missing.");
            }
            return;
        }

        try (PrintWriter out = response.getWriter()) {
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Update status in database
            String sql = "UPDATE PropertyDetails SET STATUS = 'Accepted' WHERE user_id = ?";

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, userId);
                int rowsUpdated = ps.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("<h1>Status Updated to Accepted!</h1>");
                } else {
                    out.println("<h1>No records found for user ID: " + userId + "</h1>");
                }

            } catch (SQLException e) {
                out.println("<h1>Database error: " + e.getMessage() + "</h1>");
                e.printStackTrace();
            }

        } catch (ClassNotFoundException e) {
            throw new ServletException("Oracle JDBC Driver not found.", e);
        }
    }

    // Handles HTTP GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Handles HTTP POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Returns a short description of the servlet
    @Override
    public String getServletInfo() {
        return "Servlet to accept property status for a given user ID";
    }
}

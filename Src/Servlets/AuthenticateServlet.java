package servlets;

import java.io.IOException;
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
 * AuthenticateServlet handles the authorization of properties.
 * If the property is accepted, it updates the database and redirects to Authen.jsp.
 * Otherwise, it redirects to Error.jsp.
 * 
 * Author: 91979
 */
@WebServlet(name = "AuthenticateServlet", urlPatterns = {"/AuthenticateServlet"})
public class AuthenticateServlet extends HttpServlet {

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

        String auth = request.getParameter("auth");
        String propertyId = request.getParameter("PropertyId");

        if (auth != null && auth.equals("Accepted") && propertyId != null && !propertyId.isEmpty()) {
            try {
                // Load Oracle JDBC Driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish connection
                try (Connection con = DriverManager.getConnection(
                        "jdbc:oracle:thin:@localhost:1521:XE", "system", "kicha")) {

                    // Use prepared statement to prevent SQL injection
                    String sql = "UPDATE PropertyDetails SET auth=? WHERE propertyId=?";
                    try (PreparedStatement ps = con.prepareStatement(sql)) {
                        ps.setString(1, auth);
                        ps.setString(2, propertyId);

                        int result = ps.executeUpdate();

                        if (result != 0) {
                            response.sendRedirect("Authen.jsp?success=1");
                        } else {
                            response.sendRedirect("Error.jsp");
                        }
                    }
                }

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                response.sendRedirect("Error.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("Error.jsp");
            }
        } else {
            response.sendRedirect("Error.jsp");
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
        return "Servlet for handling property authentication";
    }
}

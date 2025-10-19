package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet to handle payment transactions and update transaction status.
 * Inserts payment details into the database.
 * 
 * Author: 91979
 */
@WebServlet("/transstatus")
public class transstatus extends HttpServlet {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String JDBC_USER = "system";
    private static final String JDBC_PASSWORD = "kicha";
    private static final Logger LOGGER = Logger.getLogger(transstatus.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Generate a unique payment ID
        String paymentId = generatePaymentId();

        // Retrieve payment amount, tax type, and user_id from the request
        String amountParam = request.getParameter("amount");
        String taxType = request.getParameter("tax");
        String user_id = request.getParameter("user_id");
        double paymentAmount;

        // Validate amount input
        try {
            paymentAmount = Double.parseDouble(amountParam);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid payment amount: {0}", amountParam);
            response.setContentType("text/html");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("<p style='color:red;'>Invalid payment amount provided.</p>");
            return;
        }

        // Transaction status
        String transactionStatus = "Paid";

        // Insert payment record into the database
        try {
            insertPaymentRecord(paymentId, paymentAmount, taxType, transactionStatus, user_id);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error saving payment record", e);
            response.setContentType("text/html");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("<p style='color:red;'>Error saving payment record.</p>");
            return;
        }

        // Send success response with a form to redirect back to user home
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<h3>Payment Successful!</h3>");
            out.println("<form action='UserHome.jsp'>");
            out.println("<input type='submit' value='Home Page'>");
            out.println("</form>");
        }
    }

    /**
     * Generates a unique payment ID using UUID.
     * @return Unique payment ID string
     */
    private String generatePaymentId() {
        return "PAY-" + UUID.randomUUID().toString();
    }

    /**
     * Inserts a payment record into the database.
     *
     * @param paymentId Unique payment ID
     * @param amount Payment amount
     * @param taxType Type of tax
     * @param status Transaction status
     * @param user_id User ID
     * @throws SQLException if database insertion fails
     */
    private void insertPaymentRecord(String paymentId, double amount, String taxType,
                                     String status, String user_id) throws SQLException {

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO payments (payment_id, amount, tax_type, transaction_status, user_id) VALUES (?, ?, ?, ?, ?)")) {

            stmt.setString(1, paymentId);
            stmt.setDouble(2, amount);
            stmt.setString(3, taxType);
            stmt.setString(4, status);
            stmt.setString(5, user_id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database insertion error", e);
            throw e;
        }
    }
}

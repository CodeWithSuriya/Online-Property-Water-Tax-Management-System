package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * DownloadServlet generates a text file containing the tax payment invoice receipt
 * and prompts the user to download it.
 * 
 * Author: 91979
 */
@WebServlet(name = "DownloadServlet", urlPatterns = {"/DownloadServlet"})
public class DownloadServlet extends HttpServlet {

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

        // Set content type and attachment header for file download
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=tabledata.txt");

        StringBuilder fileContent = new StringBuilder();

        try {
            fileContent.append("THE TAX PAYMENT INVOICE RECEIPT\n\n");
            fileContent.append("--------------------------------------------------------\n");
            fileContent.append("Thank you for your payment!\n\n");
            fileContent.append("\n\n"); // Optional separator for multiple invoices
        } catch (Exception e) {
            e.printStackTrace();
            fileContent.append("Error fetching data: ").append(e.getMessage());
        }

        // Write content to response output stream
        try (PrintWriter out = response.getWriter()) {
            out.write(fileContent.toString());
            out.flush();
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
        return "Servlet for downloading tax payment invoice as a text file";
    }
}

package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import implementation.implement;

/**
 * AuthLoginServlet handles the login process for authority users.
 * If authentication succeeds, the user is redirected to AuthorityHome.jsp,
 * otherwise redirected to Error.jsp.
 * 
 * Author: 91979
 */
@WebServlet(name = "AuthLoginServlet", urlPatterns = {"/AuthLoginServlet"})
public class AuthLoginServlet extends HttpServlet {

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
        
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve username and password from request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create instance of implementation class to handle authentication
        implement inter = new implement();
        int result = inter.AuthLogin(username, password);

        if (result != 0) {
            // Successful login: create session and redirect
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            response.sendRedirect("AuthorityHome.jsp");
        } else {
            // Failed login: redirect to error page
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
        return "Servlet for handling authority user login";
    }
}

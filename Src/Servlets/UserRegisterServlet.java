package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.RegisterUser;
import implementation.implement;

/**
 * UserRegisterServlet handles registration for new users.
 * On successful registration, users are redirected to UserHome.jsp,
 * otherwise redirected to Error.jsp.
 * 
 * Author: 91979
 */
@WebServlet(name = "UserRegisterServlet", urlPatterns = {"/UserRegisterServlet"})
public class UserRegisterServlet extends HttpServlet {

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

        // Retrieve username and password from request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create RegisterUser object and set details
        RegisterUser reg = new RegisterUser();
        reg.setUsername(username);
        reg.setPassword(password);

        // Call implementation class to handle registration
        implement inter = new implement();
        int result = inter.UserRegister(reg);

        // Redirect based on registration success or failure
        if (result != 0) {
            response.sendRedirect("UserHome.jsp");
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
        return "Servlet for handling user registration";
    }
}

package controller;

import dao.RegistrationDAO;
import model.Registration;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewmembers")
public class ViewMembersController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RegistrationDAO dao = new RegistrationDAO();
        List<Registration> members = dao.getAllRegistrations();

        String editEmail = request.getParameter("editEmail");
        request.setAttribute("members", members);
        request.setAttribute("editEmail", editEmail);

        RequestDispatcher rd = request.getRequestDispatcher("viewmembers.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);  // allow POST too for editEmail form submission
    }
}

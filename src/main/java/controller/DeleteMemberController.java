package controller;

import dao.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import model.Registration;

@WebServlet("/delete")
public class DeleteMemberController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String programId = request.getParameter("programId");
        String email = request.getParameter("email");

        RegistrationDAO dao = new RegistrationDAO();
        dao.deleteRegistration(programId, email);

        List<Registration> members = dao.getAllRegistrations();
        request.setAttribute("members", members);
        request.getRequestDispatcher("viewmembers.jsp").forward(request, response);
    }
}

package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import model.Registration;
import dao.RegistrationDAO;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String programId = request.getParameter("programId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        double weight = Double.parseDouble(request.getParameter("weight"));

        Registration reg = new Registration(programId, name, email, phone, age, gender, weight);
        RegistrationDAO dao = new RegistrationDAO();
        dao.saveRegistration(reg);

        response.sendRedirect("success.jsp");
    }
}

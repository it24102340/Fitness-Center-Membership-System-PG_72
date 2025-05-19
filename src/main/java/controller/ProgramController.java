package controller;

import dao.ProgramDAO;
import model.Program;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ProgramController extends HttpServlet {

    private ProgramDAO programDAO = new ProgramDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Program> programs = programDAO.getAllPrograms();

        request.setAttribute("programs", programs);
        request.getRequestDispatcher("programs.jsp").forward(request, response);
    }
}

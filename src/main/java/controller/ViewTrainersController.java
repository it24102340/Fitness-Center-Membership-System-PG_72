package controller;

import dao.TrainerDAO;
import model.Trainer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/trainers")
public class ViewTrainersController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TrainerDAO dao = new TrainerDAO();
        List<Trainer> trainers = dao.getAllTrainers();

        request.setAttribute("trainers", trainers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("trainers.jsp");
        dispatcher.forward(request, response);
    }
}

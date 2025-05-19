package controller;

import dao.programDetailsDAO;
import model.programDetails;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/programDetails")
public class programDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            // invalid id, you can forward to error page or set id = 0
        }

        programDetailsDAO dao = new programDetailsDAO();
        programDetails p = dao.getProgramById(id);

        if (p == null) {
            request.setAttribute("error", "Program not found");
        } else {
            request.setAttribute("program", p);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("programDetails.jsp");
        dispatcher.forward(request, response);
    }
}

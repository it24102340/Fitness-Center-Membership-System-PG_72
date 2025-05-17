package com.fitness.controller;

import com.fitness.model.Member;
import com.fitness.service.MembershipService;
import com.fitness.service.MembershipPlanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/membership-status")
public class MembershipStatusServlet extends HttpServlet {
    private MembershipService membershipService;
    private MembershipPlanService membershipPlanService;

    @Override
    public void init() throws ServletException {
        // Use a persistent location for members.csv
        String memberFilePath = System.getProperty("user.home") + "/fitness-center-data/members.csv";
        membershipPlanService = new MembershipPlanService();
        membershipService = new MembershipService(memberFilePath);
        membershipService.setMembershipPlanService(membershipPlanService);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        
        if (email != null && !email.trim().isEmpty()) {
            Optional<Member> member = membershipService.getMemberByEmail(email);
            if (member.isPresent()) {
                request.setAttribute("member", member.get());
                request.setAttribute("status", member.get().getStatus());
                Member m = member.get();
                if (m.getCurrentPlan() != null && m.getCurrentPlan().getName() != null) {
                    request.setAttribute("currentPlan", membershipPlanService.getAllPlans().stream()
                        .filter(p -> p.getName().equals(m.getCurrentPlan().getName()))
                        .findFirst().orElse(null));
                } else {
                    request.setAttribute("currentPlan", null);
                }
            } else {
                request.setAttribute("error", "No member found with that email");
            }
        }
        
        request.getRequestDispatcher("/WEB-INF/views/membership-status.jsp")
               .forward(request, response);
    }
} 
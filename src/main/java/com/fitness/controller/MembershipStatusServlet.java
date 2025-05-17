package com.fitness.controller;

import com.fitness.model.Member;
import com.fitness.model.MembershipPlan;
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
        String memberFilePath = "E:/React/Test/fitness_test/src/main/webapp/WEB-INF/data/members.csv";
        System.out.println("[DEBUG] Using member file: " + memberFilePath);
        membershipPlanService = new MembershipPlanService();
        membershipService = new MembershipService(memberFilePath);
        membershipService.setMembershipPlanService(membershipPlanService);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("[DEBUG] MembershipStatusServlet doGet called");
        String email = request.getParameter("email");
        
        if (email != null && !email.trim().isEmpty()) {
            Optional<Member> member = membershipService.getMemberByEmail(email);
            if (member.isPresent()) {
                request.setAttribute("member", member.get());
                request.setAttribute("status", member.get().getStatus());
                Member m = member.get();
                System.out.println("[DEBUG] Member: " + m.getEmail() + ", PlanId: " + (m.getCurrentPlan() != null ? m.getCurrentPlan().getId() : "null"));
                MembershipPlan plan = null;
                if (m.getCurrentPlan() != null && m.getCurrentPlan().getId() != null) {
                    plan = membershipPlanService.getPlanById(m.getCurrentPlan().getId());
                }
                System.out.println("[DEBUG] Looked up plan: " + (plan != null ? plan.getName() : "null"));
                request.setAttribute("currentPlan", plan);
            } else {
                request.setAttribute("error", "No member found with that email");
            }
        }
        
        request.getRequestDispatcher("/WEB-INF/views/membership-status.jsp")
               .forward(request, response);
    }
} 
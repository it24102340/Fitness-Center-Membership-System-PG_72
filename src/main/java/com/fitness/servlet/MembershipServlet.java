package com.fitness.servlet;

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
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@WebServlet("/membership/*")
public class MembershipServlet extends HttpServlet {
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
        String path = request.getPathInfo();
        
        if (path == null || path.equals("/")) {
            // Show membership form
            request.getRequestDispatcher("/WEB-INF/views/membership/form.jsp").forward(request, response);
            return;
        }
        
        if (path.equals("/status")) {
            String email = request.getParameter("email");
            if (email != null && !email.trim().isEmpty()) {
                Optional<Member> memberOpt = membershipService.getMemberByEmail(email);
                if (memberOpt.isPresent()) {
                    Member member = memberOpt.get();
                    request.setAttribute("member", member);
                    request.setAttribute("status", member.getStatus());
                    System.out.println("[DEBUG] Member: " + member.getEmail() + ", PlanId: " + (member.getCurrentPlan() != null ? member.getCurrentPlan().getId() : "null"));
                    MembershipPlan plan = null;
                    if (member.getCurrentPlan() != null && member.getCurrentPlan().getId() != null) {
                        plan = membershipPlanService.getPlanById(member.getCurrentPlan().getId());
                    }
                    System.out.println("[DEBUG] Looked up plan: " + (plan != null ? plan.getName() : "null"));
                    request.setAttribute("currentPlan", plan);
                } else {
                    request.setAttribute("error", "No member found with that email");
                }
            }
            request.getRequestDispatcher("/WEB-INF/views/membership/status.jsp").forward(request, response);
            return;
        }
        
        if (path.equals("/upgrade")) {
            String memberIdStr = request.getParameter("memberId");
            List<MembershipPlan> allPlans = membershipPlanService.getAllPlans();
            System.out.println("Loaded plans:");
            for (MembershipPlan p : allPlans) {
                System.out.println("ID: " + p.getId() + ", Name: " + p.getName());
            }
            request.setAttribute("plans", allPlans); // Always set plans
            if (memberIdStr != null) {
                Long memberId = Long.parseLong(memberIdStr);
                System.out.println("[DEBUG] Upgrade page: Looking up member with ID: " + memberId);
                for (Member m : membershipService.getAllMembers()) {
                    System.out.println("ID: " + m.getId() + ", Email: " + m.getEmail());
                }
                Optional<Member> memberOpt = membershipService.getAllMembers().stream()
                    .filter(m -> m.getId() != null && m.getId().equals(memberId))
                    .findFirst();
                if (memberOpt.isPresent()) {
                    Member member = memberOpt.get();
                    // Find the real plan object by name
                    MembershipPlan currentPlan = null;
                    if (member.getCurrentPlan() != null && member.getCurrentPlan().getName() != null) {
                        currentPlan = allPlans.stream()
                            .filter(p -> p.getName().equals(member.getCurrentPlan().getName()))
                            .findFirst()
                            .orElse(null);
                    }
                    request.setAttribute("member", member);
                    request.setAttribute("currentPlan", currentPlan);
                } else {
                    System.out.println("[DEBUG] No member found with ID: " + memberId);
                    request.setAttribute("error", "No member found with that ID.");
                }
            } else {
                request.setAttribute("error", "No memberId provided.");
            }
            request.getRequestDispatcher("/WEB-INF/views/membership/upgrade.jsp").forward(request, response);
            return;
        }
        
        // Debug: Print all loaded members and their plans
        System.out.println("Loaded members:");
        for (Member m : membershipService.getAllMembers()) {
            System.out.println("ID: " + m.getId() + ", Email: " + m.getEmail() + ", Plan: " + (m.getCurrentPlan() != null ? m.getCurrentPlan().getName() : "None"));
        }
        
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String path = request.getPathInfo();
        
        if (path == null || path.equals("/")) {
            // Handle membership registration
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String dateOfBirthStr = request.getParameter("dateOfBirth");
            String address = request.getParameter("address");
            String planId = request.getParameter("planId");
            
            try {
                LocalDate dateOfBirth = LocalDate.parse(dateOfBirthStr);
                MembershipPlan plan = membershipPlanService.getPlanById(Long.parseLong(planId));
                
                Member member = membershipService.subscribe(
                    firstName, lastName, email, phone, dateOfBirth, address, plan
                );
                // Debug: Print all loaded members and their plans after registration
                System.out.println("After registration, loaded members:");
                for (Member m : membershipService.getAllMembers()) {
                    System.out.println("ID: " + m.getId() + ", Email: " + m.getEmail() + ", Plan: " + (m.getCurrentPlan() != null ? m.getCurrentPlan().getName() : "None"));
                }
                request.setAttribute("member", member);
                request.getRequestDispatcher("/WEB-INF/views/membership/success.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("error", "Failed to register membership: " + e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/membership/form.jsp").forward(request, response);
            }
            return;
        }
        
        if (path.equals("/upgrade")) {
            String memberIdStr = request.getParameter("memberId");
            String planIdStr = request.getParameter("planId");
            if (memberIdStr != null && planIdStr != null) {
                Long memberId = Long.parseLong(memberIdStr);
                Optional<Member> memberOpt = membershipService.getAllMembers().stream()
                    .filter(m -> m.getId() != null && m.getId().equals(memberId))
                    .findFirst();
                MembershipPlan newPlan = membershipPlanService.getPlanById(Long.parseLong(planIdStr));
                if (memberOpt.isPresent() && newPlan != null) {
                    Member member = memberOpt.get();
                    member.setCurrentPlan(newPlan);
                    // Optionally update expiry date
                    if (newPlan.getDurationInMonths() > 0) {
                        member.setExpiryDate(java.time.LocalDate.now().plusMonths(newPlan.getDurationInMonths()));
                    }
                    membershipService.saveMember(member);
                    request.setAttribute("member", member);
                    request.setAttribute("currentPlan", newPlan);
                    request.setAttribute("plans", membershipPlanService.getAllPlans());
                    request.setAttribute("success", "Membership plan upgraded successfully!");
                    request.getRequestDispatcher("/WEB-INF/views/membership/upgrade.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("error", "Invalid member or plan selected.");
                }
            } else {
                request.setAttribute("error", "Please select a plan to upgrade.");
            }
            // If error, reload the upgrade page with error message
            if (memberIdStr != null) {
                Long memberId = Long.parseLong(memberIdStr);
                Optional<Member> memberOpt = membershipService.getAllMembers().stream()
                    .filter(m -> m.getId() != null && m.getId().equals(memberId))
                    .findFirst();
                if (memberOpt.isPresent()) {
                    Member member = memberOpt.get();
                    MembershipPlan currentPlan = null;
                    if (member.getCurrentPlan() != null && member.getCurrentPlan().getName() != null) {
                        currentPlan = membershipPlanService.getAllPlans().stream()
                            .filter(p -> p.getName().equals(member.getCurrentPlan().getName()))
                            .findFirst()
                            .orElse(null);
                    }
                    request.setAttribute("member", member);
                    request.setAttribute("currentPlan", currentPlan);
                    request.setAttribute("plans", membershipPlanService.getAllPlans());
                }
            }
            request.getRequestDispatcher("/WEB-INF/views/membership/upgrade.jsp").forward(request, response);
            return;
        }
        
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
} 
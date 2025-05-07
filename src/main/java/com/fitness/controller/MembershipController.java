package com.fitness.controller;

import com.fitness.model.Member;
import com.fitness.model.MembershipPlan;
import com.fitness.service.MembershipService;
import com.fitness.service.MembershipPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/membership")
public class MembershipController {

    @Autowired
    private MembershipService membershipService;
    @Autowired
    private MembershipPlanService membershipPlanService;

    @GetMapping("/register")
    public String showRegisterPage(@RequestParam("planId") Long planId, Model model) {
        MembershipPlan selectedPlan = membershipPlanService.getPlanById(planId);
        if (selectedPlan == null) {
            model.addAttribute("error", "Invalid or missing plan selected.");
        } else {
            model.addAttribute("plan", selectedPlan);
        }
        return "membership/register";
    }

    // Show the upgrade form
    @GetMapping("/upgrade/{memberId}")
    public String showUpgradeForm(@PathVariable Long memberId, Model model, RedirectAttributes redirectAttributes) {
        try {
            Member member = membershipService.getMemberById(memberId);
            if (member == null) {
                redirectAttributes.addFlashAttribute("error", "Member not found. Please check your membership status first.");
                return "redirect:/membership/status-lookup";
            }
            
            List<MembershipPlan> availablePlans = membershipPlanService.getAllPlans();
            if (availablePlans == null || availablePlans.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "No plans available for upgrade.");
                return "redirect:/membership/status-lookup";
            }
            
            model.addAttribute("member", member);
            model.addAttribute("availablePlans", availablePlans);
            return "membership/upgrade";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "An error occurred while loading the upgrade form: " + e.getMessage());
            return "redirect:/membership/status-lookup";
        }
    }

    // Handle the upgrade POST
    @PostMapping("/upgrade/{memberId}")
    public String upgradePlan(@PathVariable Long memberId, @RequestParam("newPlanId") Long newPlanId, 
                            Model model, RedirectAttributes redirectAttributes) {
        Member member = null;
        try {
            member = membershipService.getMemberById(memberId);
            if (member == null) {
                redirectAttributes.addFlashAttribute("error", "Member not found. Please check your membership status first.");
                return "redirect:/membership/status-lookup";
            }
            
            MembershipPlan newPlan = membershipPlanService.getPlanById(newPlanId);
            if (newPlan == null) {
                redirectAttributes.addFlashAttribute("error", "Selected plan not found. Please try again.");
                return "redirect:/membership/status?email=" + member.getEmail();
            }
            
            // Check if trying to upgrade to the same plan
            if (member.getCurrentPlan() != null && member.getCurrentPlan().getId().equals(newPlanId)) {
                redirectAttributes.addFlashAttribute("error", "You are already subscribed to this plan.");
                return "redirect:/membership/status?email=" + member.getEmail();
            }
            
            membershipService.upgradePlan(memberId, newPlan);
            redirectAttributes.addFlashAttribute("success", "Membership plan upgraded successfully!");
            return "redirect:/membership/status?email=" + member.getEmail();
            
        } catch (Exception e) {
            String email = (member != null) ? member.getEmail() : "";
            redirectAttributes.addFlashAttribute("error", "An error occurred while upgrading the plan: " + e.getMessage());
            return "redirect:/membership/status?email=" + email;
        }
    }

    @PostMapping("/register")
    public String handleRegister(
        @RequestParam("name") String name,
        @RequestParam("email") String email,
        @RequestParam("phone") String phone,
        @RequestParam("planId") Long planId,
        RedirectAttributes redirectAttributes
    ) {
        MembershipPlan plan = membershipPlanService.getPlanById(planId);
        if (plan == null) {
            redirectAttributes.addFlashAttribute("error", "Invalid plan selected.");
            return "redirect:/membership/register?planId=" + planId;
        }
        // Validate phone number (E.164 format)
        if (!phone.matches("^\\+?[1-9]\\d{1,14}$")) {
            redirectAttributes.addFlashAttribute("error", "Phone number must be in international format, e.g. +1234567890");
            return "redirect:/membership/register?planId=" + planId;
        }
        // Split name into first and last name
        String[] names = name.trim().split(" ", 2);
        String firstName = names[0];
        String lastName = names.length > 1 ? names[1] : "";
        // Use a valid placeholder address
        String address = "123 Main St";
        membershipService.subscribe(
            firstName,
            lastName,
            email,
            phone,
            java.time.LocalDate.of(2000,1,1), // Placeholder DOB
            address,
            plan
        );
        redirectAttributes.addFlashAttribute("success", "Registration successful!");
        return "redirect:/membership/status?email=" + email;
    }

    @GetMapping("/status")
    public String showStatus(@RequestParam("email") String email, Model model) {
        Member member = membershipService.findMemberByEmail(email);
        if (member == null) {
            model.addAttribute("error", "No member found with that email.");
            return "membership/status";
        }
        model.addAttribute("member", member);
        model.addAttribute("currentPlan", member.getCurrentPlan());
        return "membership/status";
    }

    @GetMapping("/status-lookup")
    public String showStatusLookupForm() {
        return "membership/status-lookup";
    }

    @PostMapping("/status-lookup")
    public String handleStatusLookup(@RequestParam("email") String email) {
        return "redirect:/membership/status?email=" + email;
    }

    @GetMapping({"/upgrade", "/upgrade/"})
    public String handleUpgradeNoId(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", "Please check your membership status first to upgrade your plan.");
        return "redirect:/membership/status-lookup";
    }

    @PostMapping("/cancel/{memberId}")
    public String cancelMembership(@PathVariable Long memberId, RedirectAttributes redirectAttributes) {
        Member member = membershipService.getMemberById(memberId);
        if (member == null) {
            redirectAttributes.addFlashAttribute("error", "Member not found.");
            return "redirect:/membership/status-lookup";
        }
        member.setStatus("CANCELLED");
        membershipService.saveMemberToFile(member);
        redirectAttributes.addFlashAttribute("success", "Your membership has been cancelled.");
        return "redirect:/membership/status?email=" + member.getEmail();
    }
} 
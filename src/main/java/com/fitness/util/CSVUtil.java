package com.fitness.util;

import com.fitness.model.Member;
import com.fitness.model.MembershipPlan;
import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CSVUtil {
    private static final String MEMBER_CSV_FILE = "C:/Users/thine/OneDrive/Desktop/Java project/GYM6/src/main/webapp/WEB-INF/data/members.csv";
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE;

    public static void saveMember(Member member) {
        System.out.println("[DEBUG] Saving member to CSV: " + member.getEmail());
        try {
            // Create directory if it doesn't exist
            File directory = new File(MEMBER_CSV_FILE).getParentFile();
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // Check if file exists to determine if we need to write headers
            boolean fileExists = new File(MEMBER_CSV_FILE).exists();
            
            try (FileWriter fw = new FileWriter(MEMBER_CSV_FILE, true);
                 BufferedWriter bw = new BufferedWriter(fw);
                 PrintWriter out = new PrintWriter(bw)) {
                
                if (!fileExists) {
                    System.out.println("[DEBUG] Creating new CSV file with headers");
                    out.println("id,firstName,lastName,email,phone,dateOfBirth,address,status,joinDate,lastRenewalDate,expiryDate,planId,planType");
                }

                // Write member data
                String memberData = String.format("%d,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s",
                    member.getId(),
                    escapeCsv(member.getFirstName()),
                    escapeCsv(member.getLastName()),
                    escapeCsv(member.getEmail()),
                    escapeCsv(member.getPhone()),
                    member.getDateOfBirth().format(DATE_FORMATTER),
                    escapeCsv(member.getAddress()),
                    member.getStatus(),
                    member.getJoinDate().format(DATE_FORMATTER),
                    member.getLastRenewalDate() != null ? member.getLastRenewalDate().format(DATE_FORMATTER) : "",
                    member.getExpiryDate() != null ? member.getExpiryDate().format(DATE_FORMATTER) : "",
                    member.getCurrentPlan() != null && member.getCurrentPlan().getId() != null ? member.getCurrentPlan().getId() : "",
                    member.getCurrentPlan() != null && member.getCurrentPlan().getPlanType() != null ? escapeCsv(member.getCurrentPlan().getPlanType()) : ""
                );
                System.out.println("[DEBUG] Writing member data: " + memberData);
                out.println(memberData);
            }
            System.out.println("[DEBUG] Successfully saved member to CSV");
        } catch (IOException e) {
            System.err.println("[ERROR] Failed to save member to CSV: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static List<Member> loadMembers() {
        List<Member> members = new ArrayList<>();
        System.out.println("[DEBUG] Loading members from CSV: " + MEMBER_CSV_FILE);
        try (BufferedReader br = new BufferedReader(new FileReader(MEMBER_CSV_FILE))) {
            String line;
            boolean isFirstLine = true;
            while ((line = br.readLine()) != null) {
                if (isFirstLine) {
                    isFirstLine = false;
                    continue; // Skip header
                }
                String[] data = line.split(",");
                if (data.length >= 13) { // Now expecting 13 columns
                    Member member = new Member();
                    member.setId(Long.parseLong(data[0]));
                    member.setFirstName(unescapeCsv(data[1]));
                    member.setLastName(unescapeCsv(data[2]));
                    member.setEmail(unescapeCsv(data[3]));
                    member.setPhone(unescapeCsv(data[4]));
                    member.setDateOfBirth(LocalDate.parse(data[5], DATE_FORMATTER));
                    member.setAddress(unescapeCsv(data[6]));
                    member.setStatus(data[7]);
                    member.setJoinDate(LocalDate.parse(data[8], DATE_FORMATTER));
                    if (!data[9].isEmpty()) {
                        member.setLastRenewalDate(LocalDate.parse(data[9], DATE_FORMATTER));
                    }
                    if (!data[10].isEmpty()) {
                        member.setExpiryDate(LocalDate.parse(data[10], DATE_FORMATTER));
                    }
                    // Set planId and planType if available
                    if ((!data[11].isEmpty() && !data[11].equals("null")) || (!data[12].isEmpty() && !data[12].equals("null"))) {
                        MembershipPlan plan = new MembershipPlan();
                        if (!data[11].isEmpty() && !data[11].equals("null")) {
                            try {
                                plan.setId(Long.parseLong(data[11]));
                            } catch (NumberFormatException e) {
                                plan.setId(null);
                            }
                        }
                        if (!data[12].isEmpty() && !data[12].equals("null")) {
                            plan.setPlanType(unescapeCsv(data[12]));
                        }
                        member.setCurrentPlan(plan);
                    }
                    members.add(member);
                    System.out.println("[DEBUG] Loaded member: ID=" + member.getId() + 
                                     ", Email=" + member.getEmail() + 
                                     ", PlanId=" + (member.getCurrentPlan() != null ? member.getCurrentPlan().getId() : "None") +
                                     ", PlanType=" + (member.getCurrentPlan() != null ? member.getCurrentPlan().getPlanType() : "None"));
                }
            }
        } catch (IOException e) {
            System.err.println("[ERROR] Failed to load members from CSV: " + e.getMessage());
            e.printStackTrace();
        }
        return members;
    }

    private static String escapeCsv(String value) {
        if (value == null) return "";
        if (value.contains(",") || value.contains("\"") || value.contains("\n")) {
            return "\"" + value.replace("\"", "\"\"") + "\"";
        }
        return value;
    }

    private static String unescapeCsv(String value) {
        if (value == null) return "";
        if (value.startsWith("\"") && value.endsWith("\"")) {
            value = value.substring(1, value.length() - 1);
            return value.replace("\"\"", "\"");
        }
        return value;
    }
} 
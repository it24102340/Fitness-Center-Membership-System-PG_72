<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Program" %>
<%@ page import="dao.ProgramDAO" %>

<%
    ProgramDAO dao = new ProgramDAO();
    List<Program> programs = dao.getAllPrograms();
%>

<html>
<head>
    <title>Choose Your Program</title>
</head>
<body style="font-family: Arial, sans-serif; background: #f5f7fa; margin: 0; padding: 40px;">

<h1 style="text-align: center; color: #2d2f48;">Choose Your Program</h1>
<p style="text-align: center; color: #6c757d;">Select a workout program that matches your fitness level</p>

<div style="display: flex; justify-content: center; gap: 20px; margin-top: 40px; flex-wrap: wrap;">

    <%
        if (programs != null && !programs.isEmpty()) {
            for (Program p : programs) {
    %>
    <div style="background: white; padding: 20px; border-radius: 12px; width: 300px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); margin-bottom: 20px;">
        <h2 style="color: #2d2f48;"><%= p.getName() %></h2>

        <%
            String category = p.getCategory();
            String bgColor = "#e0f0ff";
            String textColor = "#007bff";

            if ("Basic".equalsIgnoreCase(category)) {
                bgColor = "#e0f0ff"; textColor = "#007bff";
            } else if ("Bodybuilding".equalsIgnoreCase(category)) {
                bgColor = "#ffe6eb"; textColor = "#e60073";
            } else if ("Advanced".equalsIgnoreCase(category)) {
                bgColor = "#f3e6ff"; textColor = "#9900cc";
            } else if ("Personal Training".equalsIgnoreCase(category)) {
                bgColor = "#d4f7dc"; textColor = "#2d8a40";
            }
        %>

        <span style="background: <%= bgColor %>; color: <%= textColor %>; padding: 4px 12px; border-radius: 20px; font-size: 14px;">
            <%= category %>
        </span>

        <p style="margin-top: 16px;"><%= p.getDescription() %></p>
        <p><strong>Duration:</strong> <%= p.getDuration() %></p>

        <div style="display: flex; gap: 10px;">
            <a href="programDetails?id=<%= p.getId() %>"
               style="flex: 1; padding: 10px; text-align: center; border: 2px solid #007bff; color: #007bff; border-radius: 6px; text-decoration: none;">
                View Details
            </a>
            <a href="register.jsp?programId=<%= p.getId() %>"
               style="flex: 1; padding: 10px; text-align: center; background: #007bff; color: white; border-radius: 6px; text-decoration: none;">
                Choose Program
            </a>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p style="text-align:center; color: #777;">No programs found.</p>
    <%
        }
    %>

</div>

<div style="text-align: center; margin-top: 40px;">
    <a href="index.jsp" style="color: #007bff; text-decoration: none;">← Back to Home</a>
</div>

</body>
</html>

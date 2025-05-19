<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.programDetails" %>
<%
    programDetails p = (programDetails) request.getAttribute("program");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Program Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/fitness-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 40px;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            width: 600px;
            margin: auto;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        h1, h2 {
            text-align: center;
            color: #2d2f48;
        }
        .tag {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
            margin-top: 10px;
        }
        .button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            text-align: center;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        p {
            color: #333;
        }
    </style>
</head>
<body>
<h1>Program Details</h1>
<div class="container">
    <% if (error != null) { %>
    <h2 style="color: red;"><%= error %></h2>
    <p>Please go back and select a valid program.</p>
    <a class="back-link" href="programs.jsp">← Back to Programs</a>
    <% } else if (p != null) { %>
    <h2><%= p.getName() %></h2>
    <div class="tag" style="background:#ddd; color:#333;"><%= p.getTopic() %></div>
    <p style="margin-top: 20px;"><%= p.getDescription() %></p>
    <p><strong>Duration:</strong> <%= p.getDuration() %></p>
    <p><strong>Trainer:</strong> <%= p.getTrainer() %></p>
    <p><strong>Level:</strong> <%= p.getLevel() %></p>
    <p><strong>Focus Areas:</strong> <%= p.getFocus() %></p>

    <div style="text-align: center;">
        <a class="button" href="register.jsp?programId=<%= p.getId() %>">Choose This Program</a>
    </div>
    <a class="back-link" href="programs.jsp">← Back to Programs</a>
    <% } else { %>
    <h2>No Program Selected</h2>
    <a class="back-link" href="programs.jsp">← Back to Programs</a>
    <% } %>
</div>
</body>
</html>

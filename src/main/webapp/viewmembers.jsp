<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Registration" %>
<%
    List<Registration> members = (List<Registration>) request.getAttribute("members");
    String editEmail = (String) request.getAttribute("editEmail");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Members</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .back-button {
            display: block;
            width: 140px;
            margin: 20px auto;
            padding: 10px;
            background-color: #3498db;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            margin: 10px auto;
        }

        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #eee;
        }

        h2 {
            text-align: center;
        }

        .form-inline input {
            width: 100px;
        }
    </style>
</head>
<body>
<h2>Registered Members</h2>

<a href="index.jsp" class="back-button">← Back to Home</a>

<table>
    <tr>
        <th>Program ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Weight</th>
        <th>Actions</th>
    </tr>
    <%
        if (members != null && !members.isEmpty()) {
            for (Registration reg : members) {
                boolean isEditing = editEmail != null && editEmail.equals(reg.getEmail());
    %>
    <tr>
        <% if (isEditing) { %>
        <form action="edit" method="post">
            <td><input type="text" name="programId" value="<%= reg.getProgramId() %>" readonly/></td>
            <td><input type="text" name="name" value="<%= reg.getName() %>"/></td>
            <td><input type="text" name="email" value="<%= reg.getEmail() %>" readonly/></td>
            <td><input type="text" name="phone" value="<%= reg.getPhone() %>"/></td>
            <td><input type="text" name="age" value="<%= reg.getAge() %>"/></td>
            <td><input type="text" name="gender" value="<%= reg.getGender() %>"/></td>
            <td><input type="text" name="weight" value="<%= reg.getWeight() %>"/></td>
            <td>
                <input type="submit" value="Save"/>
                <a href="viewmembers">Cancel</a>
            </td>
        </form>
        <% } else { %>
        <td><%= reg.getProgramId() %></td>
        <td><%= reg.getName() %></td>
        <td><%= reg.getEmail() %></td>
        <td><%= reg.getPhone() %></td>
        <td><%= reg.getAge() %></td>
        <td><%= reg.getGender() %></td>
        <td><%= reg.getWeight() %></td>
        <td>
            <!-- Inline Delete -->
            <form action="delete" method="get" style="display:inline;">
                <input type="hidden" name="programId" value="<%= reg.getProgramId() %>"/>
                <input type="hidden" name="email" value="<%= reg.getEmail() %>"/>
                <input type="submit" value="Delete"/>
            </form>
        </td>
        <% } %>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="8">No members found.</td>
    </tr>
    <% } %>
</table>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String programId = request.getParameter("programId");
%>
<html>
<head>
    <title>Register for Program</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 40px;
        }

        .form-container {
            background: white;
            max-width: 500px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2d2f48;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #444;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .submit-btn {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        .error {
            color: red;
            font-size: 13px;
        }
    </style>

    <script>
        function validateForm() {
            const weight = document.forms["regForm"]["weight"].value;
            if (parseFloat(weight) < 40) {
                alert("Weight must be at least 40 kg.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="form-container">
    <h2>Register for Fitness Program</h2>

    <form name="regForm" action="register" method="post" onsubmit="return validateForm();">
        <!-- Hidden input to send the selected programId -->
        <input type="hidden" name="programId" value="<%= programId %>">

        <label for="name">Full Name:</label>
        <input type="text" name="name" required placeholder="Enter your full name">

        <label for="email">Email:</label>
        <input type="email" name="email" required placeholder="example@email.com">

        <label for="phone">Phone Number:</label>
        <input type="tel" name="phone" pattern="[0-9]{10}" required placeholder="10-digit number">

        <label for="age">Age:</label>
        <input type="number" name="age" min="16" max="100" required placeholder="Your age">

        <label for="gender">Gender:</label>
        <select name="gender" required>
            <option value="">-- Select Gender --</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>

        <label for="weight">Weight (kg):</label>
        <input type="number" name="weight" required min="40" placeholder="Minimum 40kg required">

        <button type="submit" class="submit-btn">Register Now</button>
    </form>

    <a class="back-link" href="programDetails.jsp?id=<%= programId %>">← Back to Program Details</a>
</div>

</body>
</html>

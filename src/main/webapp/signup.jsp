<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Member Signup - ZACSON</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: #000000;
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
        }

        .main-container {
            position: relative;
            width: 100%;
            min-height: 100vh;
            background: url('https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?auto=compress&cs=tinysrgb&w=600') no-repeat center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 5rem;
        }

        .main-container::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
        }

        .signup-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form-title {
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 2rem;
            color: #ffffff;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            background: rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 4px;
            color: #ffffff;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #ff0000;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.3);
        }

        .signup-button {
            width: 100%;
            padding: 0.75rem;
            background: #ff0000;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .signup-button:hover {
            background: #cc0000;
            transform: translateY(-2px);
        }

        .error-message {
            background-color: rgba(255, 235, 235, 0.95);
            border: 1px solid rgba(255, 0, 0, 0.1);
            color: #ff0033;
            padding: 1rem;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 1rem;
            font-size: 0.95rem;
            box-shadow: 0 2px 4px rgba(255, 0, 0, 0.1);
            display: none;
        }

        .error-message.show {
            display: block;
            animation: fadeIn 0.3s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-link {
            text-align: center;
            margin-top: 1rem;
        }

        .login-link a {
            color: #ff0000;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .login-link a:hover {
            color: #cc0000;
            text-decoration: underline;
        }

        /* Navigation Bar Styles */
        .nav-container {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            z-index: 1000;
            padding: 1rem 2rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .nav-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-logo {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-logo:hover {
            color: #ff0000;
        }

        .nav-logo span {
            font-size: 1.8rem;
        }

        .nav-link {
            color: #ffffff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 1rem;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-link:hover {
            color: #ff0000;
            transform: translateY(-1px);
        }

        .back-arrow {
            font-size: 1.2rem;
            line-height: 1;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="nav-container">
        <div class="nav-content">
            <div class="flex items-center gap-8">
                <a href="index.jsp" class="nav-logo">
                    <span>💪</span> ZACSON
                </a>
                <a href="index.jsp" class="nav-link">
                    <span class="back-arrow">←</span> BACK TO HOME
                </a>
            </div>
        </div>
    </nav>

    <div class="main-container">
        <div class="signup-container">
            <h2 class="form-title">Member Signup</h2>
            <div id="signupError" class="error-message">Please fill in all required fields.</div>
            <form id="signupForm" onsubmit="return handleSignup(event)">
                <input type="text" id="fullname" name="fullname" placeholder="Full Name" class="form-input" required>
                <input type="email" id="email" name="email" placeholder="Email" class="form-input" required>
                <input type="text" id="username" name="username" placeholder="Username" class="form-input" required>
                <input type="password" id="password" name="password" placeholder="Password" class="form-input" required>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" class="form-input" required>
                <button type="submit" class="signup-button">Sign Up</button>
            </form>
            <div class="login-link">
                Already a member? <a href="member-login.jsp">Login here</a>
            </div>
        </div>
    </div>

    <script>
        function handleSignup(event) {
            event.preventDefault();
            const fullname = document.getElementById('fullname').value;
            const email = document.getElementById('email').value;
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorDiv = document.getElementById('signupError');

            // Basic validation
            if (!fullname || !email || !username || !password || !confirmPassword) {
                errorDiv.textContent = "Please fill in all required fields.";
                errorDiv.classList.add('show');
                return false;
            }

            if (password !== confirmPassword) {
                errorDiv.textContent = "Passwords do not match.";
                errorDiv.classList.add('show');
                return false;
            }

            // Get existing users or initialize empty array
            const registeredUsers = JSON.parse(localStorage.getItem('registeredUsers')) || [];

            // Check if username already exists
            if (registeredUsers.some(user => user.username === username)) {
                errorDiv.textContent = "Username already exists. Please choose another.";
                errorDiv.classList.add('show');
                return false;
            }

            // Add new user
            registeredUsers.push({
                fullname,
                email,
                username,
                password,
                dateRegistered: new Date().toISOString()
            });

            // Save updated users list
            localStorage.setItem('registeredUsers', JSON.stringify(registeredUsers));
            
            // Save last signup username for auto-fill in login
            localStorage.setItem('lastSignupUsername', username);

            // Redirect to login page
            window.location.href = 'member-login.jsp?signup=success';
            return false;
        }
    </script>
</body>
</html> 
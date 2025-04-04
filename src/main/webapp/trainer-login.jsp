<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trainer Login - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: #000000;
            color: #ffffff;
            overflow-x: hidden;
            font-family: 'Poppins', sans-serif;
            position: relative;
        }

        .main-container {
            position: relative;
            width: 100%;
            min-height: 100vh;
            background: url('https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?auto=compress&cs=tinysrgb&w=600') no-repeat center fixed;
            background-size: cover;
            background-attachment: fixed;
            z-index: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-container::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, 
                rgba(255, 0, 0, 0.2),
                rgba(0, 0, 0, 0.3)
            );
            z-index: 1;
            pointer-events: none;
        }

        .nav-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            border-bottom: none;
            padding: 0.5rem 0;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 1rem;
            position: relative;
        }

        .logo-icon {
            font-size: 2rem;
            color: #ffffff;
            text-shadow: 0 0 10px rgba(255, 0, 0, 0.4);
            transition: transform 0.3s ease;
        }

        .logo-icon:hover {
            transform: scale(1.1);
        }

        .logo-text {
            color: #ffffff;
            font-size: 1.5rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-to-home {
            color: #ffffff;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
            position: relative;
            transition: all 0.3s ease;
            font-weight: 500;
            padding: 0.5rem 1rem;
        }

        .back-to-home:hover {
            color: #00BFFF;
            text-shadow: 
                0 0 10px rgba(0, 191, 255, 0.8),
                0 0 20px rgba(0, 191, 255, 0.4);
        }

        .login-container {
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            position: relative;
            z-index: 2;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .login-title {
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 2rem;
            color: #ffffff;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .input-field {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 4px;
            color: #ffffff;
            transition: all 0.3s ease;
        }

        .input-field:focus {
            outline: none;
            border-color: #ff0000;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.2);
        }

        .login-button {
            width: 100%;
            padding: 0.75rem;
            background: #ff0000;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-button:hover {
            background: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 4px 20px rgba(255, 0, 0, 0.4);
        }

        .error-message {
            background-color: rgba(255, 235, 235, 0.95);
            border: 1px solid rgba(255, 0, 0, 0.1);
            color: #ff0033;
            padding: 1rem;
            border-radius: 8px;
            text-align: center;
            margin: 1rem 0;
            font-size: 0.95rem;
            box-shadow: 0 2px 4px rgba(255, 0, 0, 0.1);
            display: none;
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

        .error-message.show {
            display: block;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Navigation Bar -->
        <nav class="nav-container">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex justify-between items-center h-16">
                    <div class="flex items-center">
                        <div class="logo-container">
                            <span class="logo-icon">🏋️</span>
                            <span class="logo-text">ZACSON</span>
                        </div>
                    </div>
                    <a href="index.jsp" class="back-to-home">← BACK TO HOME</a>
                </div>
            </div>
        </nav>

        <!-- Login Form -->
        <div class="login-container">
            <h2 class="login-title">Trainer Login</h2>
            <div id="loginError" class="error-message"></div>
            <form id="trainerLoginForm" onsubmit="return trainerLogin(event)">
                <input type="text" id="username" class="input-field" placeholder="Username" required>
                <input type="password" id="password" class="input-field" placeholder="Password" required>
                <button type="submit" class="login-button">Login</button>
            </form>
        </div>
    </div>

    <script>
        function trainerLogin(event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const loginError = document.getElementById('loginError');

            // Trainer credentials
            const validCredentials = {
                'GYMTR1': 'image.pngtrainer123'
            };

            if (username && password) {
                if (validCredentials[username] === password) {
                    // Store trainer login status
                    localStorage.setItem('trainerLoggedIn', 'true');
                    localStorage.setItem('trainerUsername', username);
                    // Redirect to trainer dashboard or home page
                    window.location.href = 'index.jsp';
                } else {
                    loginError.textContent = "Invalid username or password. Please try again.";
                    loginError.classList.add('show');
                }
            } else {
                loginError.textContent = "Please enter both username and password.";
                loginError.classList.add('show');
            }
            return false;
        }
    </script>
</body>
</html> 
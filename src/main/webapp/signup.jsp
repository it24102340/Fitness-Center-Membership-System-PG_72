<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Member Signup - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .login-container {
            background: linear-gradient(135deg, #991b1b 0%, #dc2626 30%, #ef4444 50%, #dc2626 70%, #991b1b 100%);
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }
        
        /* Animated background particles */
        .login-container::before,
        .login-container::after {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            top: -50%;
            left: -50%;
            z-index: 0;
            animation: rotate 20s linear infinite;
            background-image: 
                radial-gradient(circle at 30% 30%, rgba(239, 68, 68, 0.4) 0%, transparent 10%),
                radial-gradient(circle at 70% 70%, rgba(220, 38, 38, 0.4) 0%, transparent 10%),
                radial-gradient(circle at 50% 50%, rgba(153, 27, 27, 0.4) 0%, transparent 10%),
                radial-gradient(circle at 20% 80%, rgba(239, 68, 68, 0.4) 0%, transparent 10%),
                radial-gradient(circle at 80% 20%, rgba(220, 38, 38, 0.4) 0%, transparent 10%);
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        .login-container::after {
            animation: rotate 15s linear infinite reverse;
            opacity: 0.7;
        }

        /* Floating shapes */
        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(5px);
            border-radius: 50%;
            animation: floatShape 10s infinite;
        }

        .shape:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 15%;
            animation-delay: -2s;
        }

        .shape:nth-child(3) {
            width: 80px;
            height: 80px;
            bottom: 20%;
            left: 20%;
            animation-delay: -4s;
        }

        @keyframes floatShape {
            0%, 100% {
                transform: translateY(0) rotate(0deg) scale(1);
            }
            50% {
                transform: translateY(-20px) rotate(180deg) scale(1.1);
            }
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Enhanced card effects */
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            transform: translateY(0);
            transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            z-index: 1;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .login-card::before {
            content: '';
            position: absolute;
            inset: -2px;
            background: linear-gradient(45deg, #dc2626, #ef4444, #991b1b, #dc2626);
            border-radius: inherit;
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s ease;
            animation: borderGlow 3s linear infinite;
        }

        @keyframes borderGlow {
            0%, 100% {
                filter: brightness(1) blur(1px);
            }
            50% {
                filter: brightness(1.2) blur(2px);
            }
        }

        .login-card:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 20px 40px rgba(220, 38, 38, 0.3);
        }

        .login-card:hover::before {
            opacity: 1;
        }

        /* Enhanced button effects */
        .login-button {
            background: linear-gradient(45deg, #991b1b, #dc2626, #ef4444);
            background-size: 200% 200%;
            animation: gradientShift 3s ease infinite;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.3) 0%, transparent 60%);
            transform: rotate(0deg);
            animation: buttonGlow 3s linear infinite;
        }

        @keyframes buttonGlow {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Enhanced input field effects */
        .input-field {
            border: 2px solid #e5e7eb;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        .input-field:focus {
            border-color: #dc2626;
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1);
            outline: none;
            animation: inputPulse 1.5s infinite;
            background: rgba(255, 255, 255, 1);
        }

        @keyframes inputPulse {
            0% { box-shadow: 0 0 0 0 rgba(220, 38, 38, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(220, 38, 38, 0); }
            100% { box-shadow: 0 0 0 0 rgba(220, 38, 38, 0); }
        }

        /* Enhanced icon effects */
        .member-icon {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            position: relative;
            animation: iconFloat 4s ease-in-out infinite;
        }

        @keyframes iconFloat {
            0%, 100% { 
                transform: translateY(0) rotate(0deg) scale(1); 
                filter: drop-shadow(0 0 8px rgba(220, 38, 38, 0.3));
            }
            50% { 
                transform: translateY(-15px) rotate(10deg) scale(1.1); 
                filter: drop-shadow(0 0 12px rgba(220, 38, 38, 0.5));
            }
        }

        /* Enhanced link effects */
        .nav-link {
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(to right, #991b1b, #dc2626);
            transition: width 0.3s ease;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        .nav-link:hover {
            text-shadow: 0 0 8px rgba(220, 38, 38, 0.3);
            color: #dc2626;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Floating shapes -->
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>

        <nav class="bg-white/90 backdrop-blur-sm shadow-lg">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <a href="index.jsp" class="flex items-center space-x-2">
                            <span class="text-2xl">💪</span>
                            <span class="font-bold text-xl text-gray-800">Fitness Center</span>
                        </a>
                    </div>
                    <div class="flex items-center space-x-4">
                        <a href="index.jsp" class="nav-link text-gray-600 hover:text-red-600 transition-colors">Home</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="min-h-[calc(100vh-4rem)] flex items-center justify-center p-4">
            <div class="login-card w-full max-w-md p-8">
                <div class="text-center">
                    <div class="member-icon">💪</div>
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">Member Signup</h1>
                    <p class="text-gray-600 mb-8">Start your fitness journey today!</p>
                </div>

                <form action="${pageContext.request.contextPath}/auth/signup" method="post" class="space-y-6">
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Username</label>
                        <input type="text" id="username" name="username" required
                               class="input-field w-full px-4 py-2 rounded-lg"
                               placeholder="Choose a username">
                    </div>

                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                        <input type="email" id="email" name="email" required
                               class="input-field w-full px-4 py-2 rounded-lg"
                               placeholder="Enter your email">
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                        <input type="password" id="password" name="password" required
                               class="input-field w-full px-4 py-2 rounded-lg"
                               placeholder="Create a password">
                    </div>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="bg-red-50 text-red-500 text-sm p-3 rounded-lg">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <button type="submit" class="login-button w-full py-3 rounded-lg text-white font-semibold">
                        Create Account
                    </button>
                </form>

                <div class="mt-6 text-center">
                    <p class="text-sm text-gray-600">
                        Join our fitness community and transform your life!
                    </p>
                    <p class="mt-4 text-sm text-gray-600">
                        Already a member? <a href="member-login.jsp" class="text-red-600 hover:text-red-700 font-medium hover:underline">Login here</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 
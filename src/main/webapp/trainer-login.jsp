<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trainer Login - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .login-container {
            background: linear-gradient(135deg, #065f46 0%, #047857 50%, #065f46 100%);
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }
        .login-container::before,
        .login-container::after {
            content: '';
            position: absolute;
            width: 150%;
            height: 150%;
            animation: rotate 15s linear infinite;
        }
        .login-container::before {
            background: radial-gradient(circle, rgba(16, 185, 129, 0.1) 0%, transparent 50%);
            animation: pulse 8s infinite, rotate 15s linear infinite;
        }
        .login-container::after {
            background: radial-gradient(circle, rgba(5, 150, 105, 0.1) 0%, transparent 40%);
            animation: pulse 8s infinite reverse, rotate 12s linear infinite reverse;
        }
        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        @keyframes pulse {
            0% { transform: scale(1) translate(-50%, -50%); opacity: 0.5; }
            50% { transform: scale(1.2) translate(-40%, -40%); opacity: 0.8; }
            100% { transform: scale(1) translate(-50%, -50%); opacity: 0.5; }
        }
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            transform: translateY(0);
            transition: all 0.3s ease;
            position: relative;
            z-index: 1;
        }
        .login-card::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, #059669, #047857, #059669);
            border-radius: inherit;
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }
        .login-card:hover::before {
            opacity: 1;
            animation: borderRotate 2s linear infinite;
        }
        @keyframes borderRotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .login-button {
            background: linear-gradient(to right, #059669, #047857);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .login-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                120deg,
                transparent,
                rgba(255, 255, 255, 0.3),
                transparent
            );
            animation: shine 2s infinite;
        }
        @keyframes shine {
            100% { left: 100%; }
        }
        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
            animation: pulse-button 1.5s infinite;
        }
        @keyframes pulse-button {
            0% { box-shadow: 0 0 0 0 rgba(5, 150, 105, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(5, 150, 105, 0); }
            100% { box-shadow: 0 0 0 0 rgba(5, 150, 105, 0); }
        }
        .input-field {
            border: 2px solid #e5e7eb;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            border-color: #059669;
            box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.1);
            outline: none;
            animation: input-pulse 1.5s infinite;
        }
        @keyframes input-pulse {
            0% { box-shadow: 0 0 0 0 rgba(5, 150, 105, 0.2); }
            70% { box-shadow: 0 0 0 5px rgba(5, 150, 105, 0); }
            100% { box-shadow: 0 0 0 0 rgba(5, 150, 105, 0); }
        }
        .trainer-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            animation: float 3s ease-in-out infinite;
            position: relative;
        }
        .trainer-icon::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(5, 150, 105, 0.2) 0%, transparent 70%);
            animation: glow 2s infinite;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
        }
        @keyframes glow {
            0%, 100% { opacity: 0.5; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.1); }
        }
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
            left: 0;
            background: #059669;
            transition: width 0.3s ease;
        }
        .nav-link:hover::after {
            width: 100%;
        }
        .nav-link:hover {
            text-shadow: 0 0 8px rgba(5, 150, 105, 0.3);
        }
    </style>
</head>
<body>
    <div class="login-container">
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
                        <a href="index.jsp" class="nav-link text-gray-600 hover:text-green-600 transition-colors">Home</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="min-h-[calc(100vh-4rem)] flex items-center justify-center p-4">
            <div class="login-card w-full max-w-md p-8">
                <div class="text-center">
                    <div class="trainer-icon">🏋️</div>
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">Trainer Portal</h1>
                    <p class="text-gray-600 mb-8">Secure access for trainers only</p>
                </div>

                <form action="${pageContext.request.contextPath}/auth/trainer-login" method="post" class="space-y-6">
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Trainer Username</label>
                        <input type="text" id="username" name="username" required
                               class="input-field w-full px-4 py-2 rounded-lg"
                               placeholder="Enter your trainer username">
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                        <input type="password" id="password" name="password" required
                               class="input-field w-full px-4 py-2 rounded-lg"
                               placeholder="Enter your password">
                    </div>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="bg-red-50 text-red-500 text-sm p-3 rounded-lg">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <button type="submit" class="login-button w-full py-3 rounded-lg text-white font-semibold">
                        Access Dashboard
                    </button>
                </form>

                <div class="mt-6 text-center">
                    <p class="text-sm text-gray-600">
                        This portal is restricted to authorized trainers only.
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 
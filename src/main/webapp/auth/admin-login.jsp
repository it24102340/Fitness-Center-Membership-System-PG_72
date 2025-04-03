<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .login-container {
            background: linear-gradient(135deg, #e8f2ff 0%, #d1e3ff 100%);
            min-height: 100vh;
        }
        .login-card {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        .login-button {
            background: linear-gradient(to right, #3b82f6, #1d4ed8);
            transition: all 0.3s ease;
        }
        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
        }
        .input-field {
            border: 2px solid #e5e7eb;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            outline: none;
        }
        .admin-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            animation: float 3s ease-in-out infinite;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <nav class="bg-white shadow-sm">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <a href="index.jsp" class="flex items-center space-x-2">
                            <span class="text-2xl">💪</span>
                            <span class="font-bold text-xl text-gray-800">Fitness Center</span>
                        </a>
                    </div>
                    <div class="flex items-center space-x-4">
                        <a href="index.jsp" class="text-gray-600 hover:text-blue-600 transition-colors">Home</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="min-h-[calc(100vh-4rem)] flex items-center justify-center p-4">
            <div class="login-card w-full max-w-md p-8">
                <div class="text-center">
                    <div class="admin-icon">👑</div>
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">Admin Portal</h1>
                    <p class="text-gray-600 mb-8">Secure access for administrators only</p>
                </div>

                <form action="${pageContext.request.contextPath}/auth/admin-login" method="post" class="space-y-6">
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Admin Username</label>
                        <input type="text" id="username" name="username" required
                               class="input-field w-full px-4 py-2 rounded-lg"
                               placeholder="Enter your admin username">
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
                        This portal is restricted to authorized administrators only.
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 
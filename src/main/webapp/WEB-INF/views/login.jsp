<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
        }
        .gym-pattern {
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%234ECDC4' fill-opacity='0.1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        .float-animation {
            animation: float 3s ease-in-out infinite;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-blue-100 min-h-screen gym-pattern">
    <!-- Navigation -->
    <nav class="bg-white shadow-lg fixed w-full top-0 z-50">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2">
                        <span class="text-2xl">💪</span>
                        <span class="font-bold text-xl text-gray-800">Fitness Center</span>
                    </a>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="${pageContext.request.contextPath}/" class="text-gray-600 hover:text-blue-600">
                        <i class="fas fa-home"></i> Home
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-4 h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-xl w-full max-w-md relative overflow-hidden">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-gray-800 mb-2">Welcome Back! 💪</h1>
                <p class="text-gray-600">Let's get back to your fitness journey!</p>
            </div>

            <!-- Login Form -->
            <form action="${pageContext.request.contextPath}/auth/login" method="post" class="space-y-6">
                <input type="hidden" name="redirect" value="/courses">
                
                <!-- Username -->
                <div>
                    <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                    <input type="text" id="username" name="username" required
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Password -->
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Error Message Display -->
                <% if (request.getAttribute("error") != null) { %>
                    <div class="text-red-500 text-sm">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <!-- Submit Button -->
                <button type="submit"
                        class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                    Let's Get Moving! 🏃‍♂️
                </button>
            </form>

            <!-- Sign Up Link -->
            <div class="text-center mt-4">
                <p class="text-sm text-gray-600">
                    New to our fitness family?
                    <a href="signup.jsp" class="login-btn member-btn text-white px-6 py-2 rounded-lg">
                        Sign up here
                    </a>
                </p>
            </div>
        </div>
    </div>

    <!-- Floating Icons -->
    <div class="fixed top-0 left-0 w-full h-full pointer-events-none z-0 overflow-hidden">
        <div class="absolute top-20 left-10 text-5xl float-animation" style="animation-delay: 0s;">🏋️‍♂️</div>
        <div class="absolute top-40 right-20 text-5xl float-animation" style="animation-delay: 1s;">💪</div>
        <div class="absolute bottom-20 left-1/4 text-5xl float-animation" style="animation-delay: 2s;">🎯</div>
    </div>
</body>
</html> 
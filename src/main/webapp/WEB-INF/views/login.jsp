<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #FF6B6B 0%, #4ECDC4 100%);
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
<body class="bg-gradient-to-br from-gray-900 to-gray-800 min-h-screen gym-pattern">
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
                <div class="flex items-center space-x-8">
                    <a href="${pageContext.request.contextPath}/" class="text-gray-600 hover:text-blue-600 transition-colors duration-300">Home</a>
                    <a href="${pageContext.request.contextPath}/auth/signup" class="bg-blue-600 text-white px-4 py-2 rounded-full hover:bg-blue-700 transition-colors duration-300">Sign Up</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto p-4 relative z-10 mt-20">
        <div class="max-w-md mx-auto bg-white bg-opacity-95 rounded-lg shadow-2xl overflow-hidden transform hover:scale-[1.02] transition-all duration-300">
            <div class="p-8">
                <h1 class="text-3xl font-bold text-center mb-6 text-gray-800">
                    Welcome Back! 💪
                </h1>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline"><%= request.getAttribute("error") %></span>
                    </div>
                <% } %>

                <form action="${pageContext.request.contextPath}/auth/login" method="POST" class="space-y-6">
                    <div class="space-y-2">
                        <label class="block text-gray-700 font-semibold">Username</label>
                        <input type="text" name="username" required
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 hover:border-blue-500">
                    </div>

                    <div class="space-y-2">
                        <label class="block text-gray-700 font-semibold">Password</label>
                        <input type="password" name="password" required
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 hover:border-blue-500">
                    </div>

                    <button type="submit" 
                            class="w-full py-4 bg-gradient-to-r from-blue-500 to-blue-600 text-white font-bold rounded-lg hover:from-blue-600 hover:to-blue-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">
                        Let's Get Moving! 🏃‍♂️
                    </button>
                </form>

                <div class="mt-6 text-center">
                    <p class="text-gray-600">
                        New to Fitness Center? 
                        <a href="${pageContext.request.contextPath}/auth/signup" class="text-blue-600 hover:text-blue-700 font-medium">
                            Join our fitness family
                        </a>
                    </p>
                </div>
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
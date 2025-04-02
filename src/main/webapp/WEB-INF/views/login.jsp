<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #FF6B6B 0%, #4ECDC4 100%);
        }
        @keyframes pulse-border {
            0% { border-color: #4ECDC4; }
            50% { border-color: #FF6B6B; }
            100% { border-color: #4ECDC4; }
        }
        .animate-pulse-border {
            animation: pulse-border 3s infinite;
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        .float-animation {
            animation: float 3s ease-in-out infinite;
        }
        .gym-pattern {
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%234ECDC4' fill-opacity='0.1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-900 to-gray-800 min-h-screen gym-pattern">
    <!-- Floating Dumbbells -->
    <div class="fixed top-0 left-0 w-full h-full pointer-events-none z-0 overflow-hidden">
        <div class="absolute top-20 left-10 text-5xl float-animation" style="animation-delay: 0s;">🏋️‍♂️</div>
        <div class="absolute top-40 right-20 text-5xl float-animation" style="animation-delay: 1s;">💪</div>
        <div class="absolute bottom-20 left-1/4 text-5xl float-animation" style="animation-delay: 2s;">🎯</div>
    </div>

    <div class="container mx-auto p-4 relative z-10">
        <div class="max-w-md mx-auto bg-white bg-opacity-95 rounded-lg shadow-2xl overflow-hidden transform hover:scale-[1.02] transition-all duration-300">
            <div class="p-8">
                <h1 class="text-3xl font-bold text-center mb-6 text-gray-800">
                    Welcome Back! 💪
                </h1>
                
                <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-6">
                    <div class="space-y-2">
                        <label class="block text-gray-700 font-semibold">Username</label>
                        <input type="text" name="username" 
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 hover:border-blue-500"
                               required>
                    </div>
                    
                    <div class="space-y-2">
                        <label class="block text-gray-700 font-semibold">Password</label>
                        <input type="password" name="password" 
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 hover:border-blue-500"
                               required>
                    </div>

                    <button type="submit" 
                            class="w-full py-4 bg-gradient-to-r from-blue-500 to-blue-600 text-white font-bold rounded-lg hover:from-blue-600 hover:to-blue-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">
                        Let's Get Moving! 🏃‍♂️
                    </button>
                </form>

                <% if (request.getAttribute("error") != null) { %>
                    <p class="mt-4 text-red-500 text-center"><%= request.getAttribute("error") %></p>
                <% } %>

                <div class="mt-6 text-center">
                    <a href="${pageContext.request.contextPath}/signup" 
                       class="text-blue-500 hover:text-blue-600 transition-colors duration-300">
                        New here? Join our fitness family!
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Back to Home Button -->
    <div class="fixed bottom-6 right-6">
        <a href="${pageContext.request.contextPath}/" 
           class="bg-white p-4 rounded-full shadow-lg hover:shadow-xl transform hover:scale-110 transition-all duration-300 inline-block">
            🏠
        </a>
    </div>
</body>
</html> 
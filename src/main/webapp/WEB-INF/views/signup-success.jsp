<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup Success - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #FF6B6B 0%, #4ECDC4 100%);
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
        @keyframes success-checkmark {
            0% { transform: scale(0); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }
        .success-animation {
            animation: success-checkmark 1s ease-in-out forwards;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-900 to-gray-800 min-h-screen gym-pattern">
    <!-- Floating Emojis -->
    <div class="fixed top-0 left-0 w-full h-full pointer-events-none z-0 overflow-hidden">
        <div class="absolute top-20 left-10 text-5xl float-animation" style="animation-delay: 0s;">🎉</div>
        <div class="absolute top-40 right-20 text-5xl float-animation" style="animation-delay: 1s;">💪</div>
        <div class="absolute bottom-20 left-1/4 text-5xl float-animation" style="animation-delay: 2s;">⭐</div>
    </div>

    <div class="container mx-auto p-4 relative z-10">
        <div class="max-w-md mx-auto bg-white bg-opacity-95 rounded-lg shadow-2xl overflow-hidden transform hover:scale-[1.02] transition-all duration-300">
            <div class="p-8 text-center">
                <div class="text-7xl mb-6 success-animation">✅</div>
                <h1 class="text-3xl font-bold mb-4 text-gray-800">
                    Welcome to the Family!
                </h1>
                <p class="text-gray-600 mb-8">
                    Your account has been successfully created. Ready to start your fitness journey?
                </p>
                <div class="space-y-4">
                    <a href="${pageContext.request.contextPath}/login" 
                       class="block w-full py-4 bg-gradient-to-r from-blue-500 to-blue-600 text-white font-bold rounded-lg hover:from-blue-600 hover:to-blue-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">
                        Login Now 🚀
                    </a>
                    <a href="${pageContext.request.contextPath}/" 
                       class="block w-full py-4 bg-white text-blue-600 font-bold rounded-lg hover:bg-gray-50 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl border-2 border-blue-600">
                        Back to Home
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 
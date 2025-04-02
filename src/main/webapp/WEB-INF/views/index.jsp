<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fitness Center - Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        .float-animation {
            animation: float 3s ease-in-out infinite;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-blue-100 min-h-screen">
    <div class="container mx-auto px-4 py-12">
        <!-- Hero Section -->
        <div class="text-center mb-16">
            <h1 class="text-5xl font-bold mb-6 text-gray-800 hover:text-blue-600 transition-colors duration-300">
                Welcome to Fitness Center
            </h1>
            <p class="text-xl text-gray-600 mb-8 hover:text-gray-800 transition-colors duration-300">
                Transform Your Life Through Fitness
            </p>
        </div>

        <!-- Features Grid -->
        <div class="grid md:grid-cols-3 gap-8 mb-16">
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-blue-500 text-4xl mb-4">🏋️‍♂️</div>
                <h3 class="text-xl font-semibold mb-2">Expert Trainers</h3>
                <p class="text-gray-600">Professional guidance for your fitness journey</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-green-500 text-4xl mb-4">💪</div>
                <h3 class="text-xl font-semibold mb-2">Modern Equipment</h3>
                <p class="text-gray-600">State-of-the-art facilities for optimal training</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-purple-500 text-4xl mb-4">🎯</div>
                <h3 class="text-xl font-semibold mb-2">Custom Programs</h3>
                <p class="text-gray-600">Personalized workout plans for your goals</p>
            </div>
        </div>

        <!-- CTA Buttons -->
        <div class="text-center space-x-4">
            <a href="${pageContext.request.contextPath}/signup" 
               class="inline-block px-8 py-4 bg-blue-600 text-white font-bold rounded-full hover:bg-blue-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">
                Sign Up Now
            </a>
            <a href="${pageContext.request.contextPath}/login" 
               class="inline-block px-8 py-4 bg-white text-blue-600 font-bold rounded-full hover:bg-gray-100 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl border-2 border-blue-600">
                Login
            </a>
        </div>

        <!-- Floating Shapes -->
        <div class="fixed top-0 left-0 w-full h-full pointer-events-none z-0 overflow-hidden">
            <div class="absolute top-20 left-10 w-20 h-20 bg-blue-200 rounded-full opacity-50 float-animation" style="animation-delay: 0s;"></div>
            <div class="absolute top-40 right-20 w-32 h-32 bg-green-200 rounded-full opacity-50 float-animation" style="animation-delay: 1s;"></div>
            <div class="absolute bottom-20 left-1/4 w-24 h-24 bg-purple-200 rounded-full opacity-50 float-animation" style="animation-delay: 2s;"></div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="fixed bottom-0 w-full bg-white bg-opacity-90 shadow-lg">
        <div class="container mx-auto px-4 py-4 text-center text-gray-600">
            <p>© 2024 Fitness Center. All rights reserved.</p>
        </div>
    </footer>
</body>
</html> 
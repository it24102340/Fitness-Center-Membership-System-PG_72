<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up - Fitness Center</title>
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
        .nav-link {
            position: relative;
        }
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: #3b82f6;
            transition: width 0.3s ease;
        }
        .nav-link:hover::after {
            width: 100%;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-900 to-gray-800 min-h-screen gym-pattern">
    <!-- Navigation Dashboard -->
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
                    <a href="${pageContext.request.contextPath}/" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Home</a>
                    <a href="${pageContext.request.contextPath}/courses" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Courses</a>
                    <a href="${pageContext.request.contextPath}/auth/login" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Login</a>
                    <a href="${pageContext.request.contextPath}/auth/signup" class="bg-blue-600 text-white px-4 py-2 rounded-full hover:bg-blue-700 transition-colors duration-300">Sign Up</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Floating Dumbbells -->
    <div class="fixed top-0 left-0 w-full h-full pointer-events-none z-0 overflow-hidden">
        <div class="absolute top-20 left-10 text-5xl float-animation" style="animation-delay: 0s;">💪</div>
        <div class="absolute top-40 right-20 text-5xl float-animation" style="animation-delay: 1s;">🏋️‍♂️</div>
        <div class="absolute bottom-20 left-1/4 text-5xl float-animation" style="animation-delay: 2s;">🎯</div>
    </div>

    <div class="container mx-auto p-4 relative z-10 mt-20">
        <div class="max-w-md mx-auto bg-white bg-opacity-95 rounded-lg shadow-2xl overflow-hidden transform hover:scale-[1.02] transition-all duration-300">
            <div class="p-8">
                <h1 class="text-3xl font-bold text-center mb-6 text-gray-800">
                    Join Our Fitness Family 💪
                </h1>
                
                <% if (request.getAttribute("error") != null) { %>
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline"><%= request.getAttribute("error") %></span>
                    </div>
                <% } %>

                <form action="${pageContext.request.contextPath}/auth/signup" method="POST" class="space-y-6">
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
                    
                    <div class="space-y-2">
                        <label class="block text-gray-700 font-semibold">Email</label>
                        <input type="email" name="email" 
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 hover:border-blue-500"
                               required>
                    </div>
                    
                    <div class="space-y-2">
                        <label class="block text-gray-700 font-semibold">Role</label>
                        <select name="role" 
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 hover:border-blue-500">
                            <option value="MEMBER">Member</option>
                            <option value="TRAINER">Trainer</option>
                            <option value="ADMIN">Admin</option>
                        </select>
                    </div>

                    <button type="submit" 
                            class="w-full py-4 bg-gradient-to-r from-blue-500 to-blue-600 text-white font-bold rounded-lg hover:from-blue-600 hover:to-blue-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">
                        Start Your Fitness Journey
                    </button>
                </form>

                <div class="mt-6 text-center">
                    <a href="${pageContext.request.contextPath}/auth/login" class="text-blue-600 hover:text-blue-700 font-medium">
                        Already a member? Login here
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-white bg-opacity-90 shadow-lg mt-16">
        <div class="container mx-auto px-4 py-6">
            <div class="grid md:grid-cols-3 gap-8">
                <div>
                    <h3 class="text-lg font-semibold mb-4">Contact Us</h3>
                    <p class="text-gray-600">📞 0111234567</p>
                    <p class="text-gray-600">📧 info@fitnesscenter.com</p>
                </div>
                <div>
                    <h3 class="text-lg font-semibold mb-4">Location</h3>
                    <p class="text-gray-600">🏢 235/6/1, Kandy Road</p>
                    <p class="text-gray-600">📍 Malabe</p>
                </div>
                <div>
                    <h3 class="text-lg font-semibold mb-4">Hours</h3>
                    <p class="text-gray-600">Mon-Fri: 5:00 AM - 11:00 PM</p>
                    <p class="text-gray-600">Sat-Sun: 6:00 AM - 10:00 PM</p>
                </div>
            </div>
            <div class="text-center mt-8 text-gray-600">
                <p>© 2024 Fitness Center. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html> 
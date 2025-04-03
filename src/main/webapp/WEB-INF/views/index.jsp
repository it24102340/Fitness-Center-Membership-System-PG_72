<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .login-btn {
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        .login-btn::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, rgba(255,255,255,0.13) 0%, rgba(255,255,255,0) 100%);
            transform: rotate(45deg);
            transition: all 0.3s ease;
        }
        .login-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .login-btn:hover::after {
            left: 100%;
        }
        .admin-btn {
            background: linear-gradient(135deg, #4f46e5 0%, #3730a3 100%);
        }
        .trainer-btn {
            background: linear-gradient(135deg, #059669 0%, #047857 100%);
        }
        .member-btn {
            background: linear-gradient(135deg, #dc2626 0%, #991b1b 100%);
        }
        .admin-login:hover {
            box-shadow: 0 0 15px rgba(147, 51, 234, 0.5);
        }
        
        .trainer-login:hover {
            box-shadow: 0 0 15px rgba(22, 163, 74, 0.5);
        }
        
        .member-signup:hover {
            box-shadow: 0 0 15px rgba(59, 130, 246, 0.5);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-blue-100 min-h-screen">
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
                <div class="flex items-center space-x-6">
                    <a href="${pageContext.request.contextPath}/" 
                       class="nav-link text-gray-600 hover:text-blue-600 transition-all duration-300">Home</a>
                    <a href="#features" 
                       class="nav-link text-gray-600 hover:text-blue-600 transition-all duration-300">Features</a>
                    <a href="#programs" 
                       class="nav-link text-gray-600 hover:text-blue-600 transition-all duration-300">Programs</a>
                    
                    <% if (session != null && session.getAttribute("username") != null) { %>
                        <!-- Logged in navigation -->
                        <a href="${pageContext.request.contextPath}/courses" 
                           class="nav-link text-gray-600 hover:text-blue-600 transition-all duration-300">Courses</a>
                        <% String role = (String) session.getAttribute("role");
                           if (role != null) {
                               switch(role) {
                                   case "ADMIN": %>
                                       <a href="${pageContext.request.contextPath}/admin-dashboard" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Dashboard</a>
                                       <% break;
                                   case "TRAINER": %>
                                       <a href="${pageContext.request.contextPath}/trainer-dashboard" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Dashboard</a>
                                       <% break;
                                   case "MEMBER": %>
                                       <a href="${pageContext.request.contextPath}/member-dashboard" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Dashboard</a>
                                       <% break;
                               }
                           } %>
                        <span class="text-gray-600">Welcome, <%= session.getAttribute("username") %></span>
                        <a href="${pageContext.request.contextPath}/logout" 
                           class="bg-red-600 text-white px-6 py-2 rounded-lg hover:bg-red-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">Logout</a>
                    <% } else { %>
                        <!-- Not logged in navigation -->
                        <div class="flex items-center space-x-4">
                            <a href="admin-login.jsp" class="login-btn admin-btn text-white px-6 py-2 rounded-lg">
                                👑 Admin Login
                            </a>
                            <a href="trainer-login.jsp" class="login-btn trainer-btn text-white px-6 py-2 rounded-lg">
                                🏋️ Trainer Login
                            </a>
                            <a href="signup.jsp" class="login-btn member-btn text-white px-6 py-2 rounded-lg">
                                💪 Member Signup
                            </a>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-4 py-12 mt-16">
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
        <div id="features" class="grid md:grid-cols-3 gap-8 mb-16">
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

        <!-- Programs Section -->
        <div id="programs" class="mb-16">
            <h2 class="text-3xl font-bold text-center mb-8">Our Programs</h2>
            <div class="grid md:grid-cols-4 gap-6">
                <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                    <div class="text-4xl mb-4">🏃‍♂️</div>
                    <h3 class="text-xl font-semibold mb-2">Cardio Blast</h3>
                    <p class="text-gray-600">High-intensity cardio workouts</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                    <div class="text-4xl mb-4">🏋️</div>
                    <h3 class="text-xl font-semibold mb-2">Strength Training</h3>
                    <p class="text-gray-600">Build muscle and strength</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                    <div class="text-4xl mb-4">🧘‍♀️</div>
                    <h3 class="text-xl font-semibold mb-2">Yoga & Flexibility</h3>
                    <p class="text-gray-600">Improve flexibility and balance</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                    <div class="text-4xl mb-4">👥</div>
                    <h3 class="text-xl font-semibold mb-2">Group Classes</h3>
                    <p class="text-gray-600">Fun and motivating group sessions</p>
                </div>
            </div>
        </div>

        <!-- CTA Buttons -->
        <div class="text-center space-x-4">
            <% if (session == null || session.getAttribute("username") == null) { %>
                <a href="${pageContext.request.contextPath}/auth/signup" 
                   class="inline-block px-8 py-4 bg-blue-600 text-white font-bold rounded-full hover:bg-blue-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">
                    Start Your Journey Now
                </a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/courses" 
                   class="inline-block px-8 py-4 bg-blue-600 text-white font-bold rounded-full hover:bg-blue-700 transform hover:scale-105 transition-all duration-300 shadow-lg hover:shadow-xl">
                    View Our Courses
                </a>
            <% } %>
        </div>

        <!-- Floating Shapes -->
        <div class="fixed top-0 left-0 w-full h-full pointer-events-none z-0 overflow-hidden">
            <div class="absolute top-20 left-10 w-20 h-20 bg-blue-200 rounded-full opacity-50 float-animation" style="animation-delay: 0s;"></div>
            <div class="absolute top-40 right-20 w-32 h-32 bg-green-200 rounded-full opacity-50 float-animation" style="animation-delay: 1s;"></div>
            <div class="absolute bottom-20 left-1/4 w-24 h-24 bg-purple-200 rounded-full opacity-50 float-animation" style="animation-delay: 2s;"></div>
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
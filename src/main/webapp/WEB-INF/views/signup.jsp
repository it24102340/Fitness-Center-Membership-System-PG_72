<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-blue-100 min-h-screen">
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
                    <a href="${pageContext.request.contextPath}/" class="text-gray-600 hover:text-blue-600">Home</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-4 h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-xl w-full max-w-md relative overflow-hidden">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-gray-800 mb-2">Join Our Fitness Family 💪</h1>
                <p class="text-gray-600">Start your fitness journey today!</p>
            </div>

            <!-- Signup Form -->
            <form action="${pageContext.request.contextPath}/auth/signup" method="post" class="space-y-6">
                <!-- Username -->
                <div>
                    <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                    <input type="text" id="username" name="username" required
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Email -->
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" required
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Password -->
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <input type="hidden" name="role" value="MEMBER">

                <!-- Error Message Display -->
                <% if (request.getAttribute("error") != null) { %>
                    <div class="text-red-500 text-sm">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <!-- Submit Button -->
                <button type="submit"
                        class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                    Start Your Fitness Journey
                </button>
            </form>

            <!-- Login Link -->
            <div class="text-center mt-4">
                <p class="text-sm text-gray-600">
                    Already a member? 
                    <a href="${pageContext.request.contextPath}/auth/login" class="font-medium text-blue-600 hover:text-blue-500">
                        Login here
                    </a>
                </p>
            </div>
        </div>
    </div>
</body>
</html> 
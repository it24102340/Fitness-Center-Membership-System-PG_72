<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4 text-center">
        <h1 class="text-3xl font-bold text-red-500 mb-4">Oops! Something went wrong</h1>
        <p class="mb-4">We're sorry, but there was an error processing your request.</p>
        <a href="${pageContext.request.contextPath}/" class="text-blue-500 hover:underline">Return to Home Page</a>
    </div>
</body>
</html> 
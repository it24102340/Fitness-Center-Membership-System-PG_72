<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Membership Plans - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-5">
        <h1 class="text-center mb-5">Membership Plans</h1>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach items="${plans}" var="plan">
                <div class="col">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">${plan.name}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${plan.duration} Months</h6>
                            <p class="card-text">${plan.description}</p>
                            <h3 class="text-primary">$${plan.price}</h3>
                        </div>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/membership/register?planId=${plan.id}" class="btn btn-primary w-100">Select Plan</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary mt-4">Back to Home</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
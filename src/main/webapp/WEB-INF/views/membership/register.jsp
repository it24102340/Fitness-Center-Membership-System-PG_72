<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register for Membership</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f9f9f9 0%, #e0ffe8 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .register-card {
            max-width: 480px;
            margin: 40px auto;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(67,185,127,0.10);
            overflow: hidden;
            background: #fff;
        }
        .register-header {
            background: linear-gradient(90deg, #43b97f 0%, #f9d423 100%);
            color: #fff;
            text-align: center;
            padding: 1.5rem 1rem 1rem 1rem;
            position: relative;
        }
        .register-header .fa-dumbbell, .register-header .fa-star, .register-header .fa-crown, .register-header .fa-medal {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
        }
        .register-header-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 0.2rem;
        }
        .register-section {
            padding: 1.5rem 2rem 1rem 2rem;
            background: #fff;
        }
        .plan-name {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 0.2rem;
        }
        .plan-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff !important;
            text-shadow: 0 1px 4px rgba(0,0,0,0.12);
            margin-bottom: 0.5rem;
        }
        .btn-register {
            background: linear-gradient(90deg, #43b97f 0%, #36d1c4 100%);
            color: #fff;
            border: none;
            font-weight: 600;
            border-radius: 8px;
            padding: 0.6rem 1.5rem;
            box-shadow: 0 4px 15px rgba(67,185,127,0.13);
            transition: background 0.2s;
        }
        .btn-register:hover {
            background: #2e8b57;
            color: #fff;
        }
        .btn-back {
            background: #b0bec5;
            color: #fff;
            border-radius: 8px;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            margin-top: 0.5rem;
        }
        .btn-back:hover {
            background: #78909c;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="register-card">
        <div class="register-header">
            <div class="register-header-title">Register for Membership</div>
            <c:if test="${not empty plan}">
                <span class="plan-icon">
                    <c:choose>
                        <c:when test="${plan.planType == 'BASIC'}">
                            <i class="fas fa-dumbbell plan-basic"></i>
                        </c:when>
                        <c:when test="${plan.planType == 'STANDARD'}">
                            <i class="fas fa-star plan-standard"></i>
                        </c:when>
                        <c:when test="${plan.planType == 'PREMIUM'}">
                            <i class="fas fa-crown plan-premium"></i>
                        </c:when>
                        <c:otherwise>
                            <i class="fas fa-medal"></i>
                        </c:otherwise>
                    </c:choose>
                </span>
                <div class="plan-name">${plan.name}</div>
                <div>${plan.durationInMonths} Month<c:if test="${plan.durationInMonths > 1}">s</c:if> - ${plan.description}</div>
                <div class="plan-price">$${plan.price}</div>
            </c:if>
        </div>
        <div class="register-section">
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">${error}</div>
            </c:if>
            <c:if test="${not empty plan}">
                <form method="post" action="${pageContext.request.contextPath}/membership/register">
                    <input type="hidden" name="planId" value="${plan.id}" />
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required>
                    </div>
                    <button type="submit" class="btn btn-register w-100">Register</button>
                    <a href="${pageContext.request.contextPath}/membership-plans" class="btn btn-back w-100">Back to Plans</a>
                </form>
            </c:if>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
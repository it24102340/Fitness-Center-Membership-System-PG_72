<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Membership Plans - Fitness Center</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            --accent: #43b97f;
            --accent-gradient: linear-gradient(135deg, #43b97f 0%, #f9d423 100%);
            --accent-hover: #2e8b57;
            --navbar-bg: #fff;
            --footer-bg: #fff;
            --footer-text: #222;
        }
        
        body {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }
        
        .navbar {
            background: var(--navbar-bg) !important;
            box-shadow: 0 4px 20px rgba(44, 62, 80, 0.06);
            padding: 1rem 0;
        }
        
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .nav-link {
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            border-radius: 8px;
            transition: all 0.3s ease;
            color: #222 !important;
        }
        
        .nav-link.active, .nav-link:focus {
            color: var(--accent) !important;
            font-weight: 700;
            background: #f3f4f6;
        }
        
        .nav-link:hover {
            background: #f3f4f6;
            color: var(--accent) !important;
            transform: translateY(-1px);
        }
        
        .hero-banner {
            width: 100%;
            height: 300px;
            background: url('https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=1200&q=80') center center/cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0 0 40px 40px;
            box-shadow: 0 8px 32px rgba(44, 62, 80, 0.08);
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
        }
        
        .hero-overlay {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(255,255,255,0.65);
            border-radius: 0 0 40px 40px;
        }
        
        .hero-content {
            position: relative;
            z-index: 2;
            color: #fff;
            text-align: center;
            padding: 0 1rem;
        }
        
        .hero-content h1 {
            font-size: 3rem;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 1rem;
            color: #222;
            text-shadow: 0 2px 12px rgba(255,255,255,0.2);
        }
        
        .hero-content p {
            font-size: 1.25rem;
            font-weight: 400;
            letter-spacing: 0.5px;
            margin-bottom: 0;
            color: #444;
            opacity: 0.85;
        }
        
        .plans-section {
            margin-top: -3rem;
            padding: 0 1rem;
        }
        
        .plans-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }
        
        .plan-card {
            width: 360px;
            border-radius: 24px;
            box-shadow: 0 10px 30px rgba(44, 62, 80, 0.08);
            padding: 2.5rem 2rem;
            text-align: center;
            background: #fff;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            border: none;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .plan-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: var(--accent-gradient);
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .plan-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 20px 40px rgba(44, 62, 80, 0.13);
        }
        
        .plan-card:hover::before {
            opacity: 1;
        }
        
        .plan-img {
            width: 80px;
            height: 80px;
            margin-bottom: 1.5rem;
            border-radius: 50%;
            box-shadow: 0 4px 12px rgba(44, 62, 80, 0.10);
            object-fit: cover;
            border: 3px solid #fff;
            transition: transform 0.3s ease;
        }
        
        .plan-card:hover .plan-img {
            transform: scale(1.1);
        }
        
        .plan-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            display: block;
            color: var(--accent);
            text-shadow: 0 2px 8px rgba(67, 185, 127, 0.12);
        }
        
        .plan-name {
            font-size: 1.75rem;
            font-weight: 600;
            color: #1e293b;
            letter-spacing: 0.5px;
            margin-bottom: 0.75rem;
        }
        
        .plan-duration {
            font-size: 1.1rem;
            color: #64748b;
            margin-bottom: 0.75rem;
            font-weight: 500;
        }
        
        .plan-desc {
            font-size: 1rem;
            color: #64748b;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
        
        .plan-features {
            text-align: left;
            margin: 0 auto 1.5rem auto;
            max-width: 280px;
            padding: 0;
        }
        
        .plan-features li {
            font-size: 1rem;
            color: #475569;
            margin-bottom: 0.75rem;
            list-style: none;
            position: relative;
            padding-left: 1.75em;
            line-height: 1.5;
        }
        
        .plan-features li:before {
            content: '\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            color: var(--accent);
            position: absolute;
            left: 0;
            top: 0.1em;
            font-size: 1em;
        }
        
        .plan-price {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--accent);
            margin: 1rem 0 1.5rem 0;
            text-shadow: 0 2px 8px rgba(67, 185, 127, 0.08);
        }
        
        .btn-select {
            background: var(--accent-gradient);
            border: none;
            border-radius: 12px;
            padding: 1rem 2.5rem;
            font-size: 1.1rem;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(67, 185, 127, 0.13);
            width: 100%;
            max-width: 280px;
        }
        
        .btn-select:hover {
            background: var(--accent-hover);
            box-shadow: 0 8px 25px rgba(67, 185, 127, 0.18);
            transform: translateY(-2px);
            color: white;
        }
        
        .footer {
            background: var(--footer-bg);
            color: var(--footer-text);
            padding: 2.5rem 0;
            text-align: center;
            margin-top: 4rem;
            border-radius: 40px 40px 0 0;
            box-shadow: 0 -4px 20px rgba(44, 62, 80, 0.06);
        }
        
        .alert {
            border-radius: 12px;
            padding: 1rem 1.5rem;
            margin: 1rem auto;
            max-width: 800px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        
        @media (max-width: 1200px) {
            .plans-row { gap: 1.5rem; }
            .plan-card { width: 320px; }
        }
        
        @media (max-width: 768px) {
            .hero-banner { height: 240px; }
            .hero-content h1 { font-size: 2.25rem; }
            .hero-content p { font-size: 1.1rem; }
            .plan-card { width: 100%; max-width: 360px; }
        }
        
        @media (max-width: 480px) {
            .hero-banner { height: 200px; border-radius: 0 0 30px 30px; }
            .hero-content h1 { font-size: 1.75rem; }
            .hero-content p { font-size: 1rem; }
            .plan-card { padding: 2rem 1.5rem; }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img src="https://cdn-icons-png.flaticon.com/512/1048/1048953.png" alt="Logo" width="40" class="me-2 align-text-top" />
                Fitness Center
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/membership-plans">
                            <i class="fas fa-dumbbell me-2"></i>Plans
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/membership/status">
                            <i class="fas fa-id-card me-2"></i>Check Status
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="hero-banner">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <i class="fas fa-dumbbell fa-3x mb-3"></i>
            <h1>Transform Your Fitness Journey</h1>
            <p>Choose the perfect plan to achieve your fitness goals</p>
        </div>
    </div>

    <div class="container plans-section">
        <div class="plans-row">
            <c:forEach var="plan" items="${plans}" varStatus="status">
                <div class="plan-card">
                    <img class="plan-img" src="<c:choose>
                        <c:when test='${plan.planType == "BASIC"}'>https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80</c:when>
                        <c:when test='${plan.planType == "STANDARD"}'>https://images.unsplash.com/photo-1517960413843-0aee8e2d471c?auto=format&fit=crop&w=400&q=80</c:when>
                        <c:when test='${plan.planType == "PREMIUM"}'>https://images.unsplash.com/photo-1504439468489-c8920d796a29?auto=format&fit=crop&w=400&q=80</c:when>
                        <c:otherwise>https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=400&q=80</c:otherwise>
                    </c:choose>" alt="Plan Image" />
                    <div class="plan-icon">
                        <c:choose>
                            <c:when test="${plan.planType == 'BASIC'}">
                                <i class="fas fa-dumbbell"></i>
                            </c:when>
                            <c:when test="${plan.planType == 'STANDARD'}">
                                <i class="fas fa-running"></i>
                            </c:when>
                            <c:when test="${plan.planType == 'PREMIUM'}">
                                <i class="fas fa-crown"></i>
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-medal"></i>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="plan-name">${plan.name}</div>
                    <div class="plan-duration">
                        <c:choose>
                            <c:when test="${not empty plan.durationInMonths}">
                                ${plan.durationInMonths} Month<c:if test="${plan.durationInMonths > 1}">s</c:if>
                            </c:when>
                            <c:otherwise>
                                ${plan.duration} Month<c:if test="${plan.duration > 1}">s</c:if>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="plan-desc">${plan.description}</div>
                    <c:choose>
                        <c:when test="${not empty plan.features}">
                            <ul class="plan-features">
                                <c:forEach var="feature" items="${fn:split(plan.features, ';')}">
                                    <li>${feature}</li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="plan-features">
                                <c:choose>
                                    <c:when test="${plan.planType == 'BASIC'}">
                                        <li>Gym access</li>
                                        <li>Locker room</li>
                                        <li>Group classes</li>
                                    </c:when>
                                    <c:when test="${plan.planType == 'STANDARD'}">
                                        <li>All Basic features</li>
                                        <li>Pool access</li>
                                        <li>Spa access</li>
                                        <li>Personal trainer consultation</li>
                                    </c:when>
                                    <c:when test="${plan.planType == 'PREMIUM'}">
                                        <li>All Standard features</li>
                                        <li>Private training sessions</li>
                                        <li>Nutrition consultation</li>
                                        <li>Priority booking</li>
                                    </c:when>
                                    <c:when test="${plan.planType == 'ELITE'}">
                                        <li>All Premium features</li>
                                        <li>Unlimited guest passes</li>
                                        <li>VIP lounge</li>
                                        <li>Free merchandise</li>
                                    </c:when>
                                </c:choose>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                    <div class="plan-price">$${plan.price}</div>
                    <a href="${pageContext.request.contextPath}/membership/register?planId=${plan.id}" class="btn btn-select">
                        <i class="fas fa-arrow-right me-2"></i>Select Plan
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p class="mb-0">&copy; 2024 Fitness Center. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

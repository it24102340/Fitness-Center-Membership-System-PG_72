<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upgrade Membership - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(67,185,127,0.10), rgba(249,212,35,0.10)), 
                url('https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=1200&q=80') center center/cover no-repeat;
            min-height: 100vh;
        }
        .upgrade-hero {
            text-align: center;
            margin-top: 3rem;
            margin-bottom: 2.5rem;
        }
        .upgrade-hero-icon {
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 4px 16px rgba(67,185,127,0.13);
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.2rem auto;
        }
        .upgrade-hero-icon i {
            font-size: 2.5rem;
            color: #43b97f;
        }
        .card {
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(67,185,127,0.10);
            animation: fadeInUp 0.8s;
        }
        .card-header {
            background: linear-gradient(90deg, #43b97f 0%, #f9d423 100%);
            color: #fff;
            border-radius: 20px 20px 0 0;
            text-align: center;
        }
        .badge-plan {
            font-size: 1rem;
            padding: 0.4em 0.8em;
            border-radius: 8px;
            font-weight: 600;
        }
        .btn-primary {
            background: linear-gradient(90deg, #43b97f 0%, #36d1c4 100%);
            border: none;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(67,185,127,0.13);
            transition: background 0.2s;
        }
        .btn-primary:hover {
            background: #2e8b57;
        }
        .btn-secondary {
            border-radius: 10px;
            font-weight: 600;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="upgrade-hero">
        <div class="upgrade-hero-icon">
            <i class="fas fa-arrow-up"></i>
        </div>
        <div class="status-hero-title" style="font-size:2rem;font-weight:700;color:#222;margin-bottom:0.5rem;">Upgrade Your Membership</div>
        <div class="status-hero-desc" style="color:#555;font-size:1.1rem;margin-bottom:0;">Choose a new plan and unlock more benefits!</div>
    </div>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center"><i class="fas fa-exchange-alt me-2"></i>Upgrade/Change Membership Plan</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        <div class="mb-4">
                            <h4>Current Plan Details</h4>
                            <ul class="list-unstyled mb-4">
                                <li><strong>Member:</strong> <span class="text-primary">${member.firstName} ${member.lastName}</span></li>
                                <li>
                                    <strong>Current Plan:</strong>
                                    <span class="badge badge-plan bg-success">
                                        <i class="fas fa-dumbbell me-1"></i>
                                        <c:choose>
                                            <c:when test="${member.currentPlan != null}">
                                                ${member.currentPlan.name}
                                            </c:when>
                                            <c:otherwise>
                                                N/A
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </li>
                                <li><strong>End Date:</strong> <span class="text-danger">${member.membershipEndDate}</span></li>
                            </ul>
                        </div>
                        <form action="<c:url value='/membership/upgrade/${member.id}'/>" method="post">
                            <div class="mb-4">
                                <h4>Select New Plan</h4>
                                <div class="row">
                                    <c:forEach items="${availablePlans}" var="plan">
                                        <div class="col-md-6 mb-3">
                                            <div class="card h-100">
                                                <div class="card-body">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="newPlanId" id="plan${plan.id}" value="${plan.id}" required>
                                                        <label class="form-check-label w-100" for="plan${plan.id}">
                                                            <h5 class="card-title">
                                                                <i class="fas fa-dumbbell me-1"></i> ${plan.name}
                                                            </h5>
                                                            <p class="card-text">${plan.description}</p>
                                                            <p class="card-text">
                                                                <strong>Price:</strong> $${plan.price} / ${plan.durationInMonths} months
                                                            </p>
                                                            <ul class="list-unstyled">
                                                                <c:forEach items="${plan.features}" var="feature">
                                                                    <li><i class="fas fa-check-circle text-success me-1"></i> ${feature}</li>
                                                                </c:forEach>
                                                            </ul>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Confirm Upgrade</button>
                                <a href="<c:url value='/membership/status?email=${member.email}'/>" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
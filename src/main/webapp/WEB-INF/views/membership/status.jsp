<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Membership Status - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f9f9f9 0%, #e0ffe8 100%);
            min-height: 100vh;
        }
        .status-card {
            max-width: 480px;
            margin: 40px auto;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(67,185,127,0.10);
            overflow: hidden;
        }
        .status-header {
            background: linear-gradient(90deg, #43b97f 0%, #f9d423 100%);
            color: #fff;
            text-align: center;
            padding: 1.5rem 1rem 1rem 1rem;
            position: relative;
        }
        .status-header .fa-crown {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
        }
        .status-header-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 0.2rem;
        }
        .status-section {
            padding: 1.5rem 2rem 1rem 2rem;
            background: #fff;
        }
        .status-section h6 {
            font-weight: 600;
            margin-bottom: 0.7rem;
        }
        .status-label {
            font-weight: 600;
            color: #555;
        }
        .status-value {
            color: #222;
        }
        .status-btns {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin: 1.5rem 0 1rem 0;
        }
        .btn-custom {
            background: linear-gradient(90deg, #43b97f 0%, #36d1c4 100%);
            color: #fff;
            border: none;
            font-weight: 600;
            border-radius: 8px;
            padding: 0.6rem 1.5rem;
            box-shadow: 0 4px 15px rgba(67,185,127,0.13);
            transition: background 0.2s;
        }
        .btn-custom:hover {
            background: #2e8b57;
            color: #fff;
        }
        .btn-danger {
            border-radius: 8px;
            font-weight: 600;
        }
        .btn-secondary {
            border-radius: 8px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:if test="${not empty error}">
            <div class="alert alert-danger mt-4">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="alert alert-success mt-4">${success}</div>
        </c:if>
        <c:if test="${not empty member}">
            <div class="status-card">
                <div class="status-header">
                    <i class="fas fa-crown"></i>
                    <div class="status-header-title">Membership Status</div>
                    <div style="font-size:0.95rem; font-weight:400;">See your current membership details and plan status below.</div>
                </div>
                <div class="status-section">
                    <h6>Member Information</h6>
                    <div class="row mb-2">
                        <div class="col-5 status-label">Name:</div>
                        <div class="col-7 status-value">${member.firstName} ${member.lastName}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 status-label">Email:</div>
                        <div class="col-7 status-value">${member.email}</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-5 status-label">Phone:</div>
                        <div class="col-7 status-value">${member.phone}</div>
                    </div>
                    <h6 class="mt-4">Membership Details</h6>
                    <div class="row mb-2">
                        <div class="col-5 status-label">Current Plan:</div>
                        <div class="col-7 status-value">
                            <c:choose>
                                <c:when test="${member.currentPlan != null}">
                                    ${member.currentPlan.name}
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 status-label">Join Date:</div>
                        <div class="col-7 status-value">${member.membershipStartDate}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 status-label">Expiry Date:</div>
                        <div class="col-7 status-value">${member.membershipEndDate}</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-5 status-label">Status:</div>
                        <div class="col-7 status-value">
                            <span class="badge ${member.status == 'ACTIVE' ? 'bg-success' : member.status == 'EXPIRED' ? 'bg-danger' : 'bg-warning'}">${member.status}</span>
                        </div>
                    </div>
                    <div class="status-btns">
                        <c:if test="${member.status == 'ACTIVE'}">
                            <a href="${pageContext.request.contextPath}/membership/upgrade/${member.id}" class="btn btn-custom">Upgrade Plan</a>
                            <form action="${pageContext.request.contextPath}/membership/cancel/${member.id}" method="post" style="display:inline-block;">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to cancel your membership?');">Cancel Membership</button>
                            </form>
                        </c:if>
                    </div>
                    <div class="text-center mb-2">
                        <a href="${pageContext.request.contextPath}/membership-plans" class="btn btn-secondary">Back to Plans</a>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty member}">
            <div class="alert alert-warning text-center mt-5">No member found with that email.</div>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
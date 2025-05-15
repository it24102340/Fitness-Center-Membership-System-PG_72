<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upgrade Your Membership</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #f8fff8 0%, #e6fff3 100%);
            font-family: 'Poppins', Arial, sans-serif;
        }
        .upgrade-card {
            max-width: 600px;
            margin: 3rem auto;
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(60,180,120,0.13);
            padding: 0;
        }
        .upgrade-header {
            background: linear-gradient(90deg, #3ecb7b 0%, #ffe259 100%);
            border-radius: 24px 24px 0 0;
            padding: 28px 0 18px 0;
            color: #fff;
            font-size: 1.4rem;
            font-weight: 700;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .upgrade-header i {
            font-size: 2rem;
            margin-bottom: 8px;
        }
        .plan-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.2rem;
            margin: 1.5rem 0 2rem 0;
        }
        .plan-option {
            background: #f8fafc;
            border-radius: 16px;
            box-shadow: 0 4px 16px rgba(67,185,127,0.08);
            padding: 1.2rem 1.5rem;
            min-width: 180px;
            min-height: 120px;
            text-align: left;
            border: 2px solid #eee;
            transition: border 0.2s, box-shadow 0.2s;
            cursor: pointer;
            position: relative;
        }
        .plan-option input[type=radio] {
            margin-right: 8px;
        }
        .plan-option .badge {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 0.9em;
        }
        .plan-option .plan-title {
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 0.3rem;
        }
        .plan-option .plan-price {
            color: #43b97f;
            font-weight: 700;
            font-size: 1.1rem;
        }
        .plan-option .plan-duration {
            font-size: 0.95rem;
            color: #888;
        }
        .upgrade-btns {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            justify-content: center;
        }
        .upgrade-btns .btn {
            min-width: 160px;
            font-size: 1.1rem;
            font-weight: 600;
        }
        .current-plan-badge {
            background: #43b97f;
            color: #fff;
            font-size: 0.9em;
            border-radius: 8px;
            padding: 2px 10px;
            margin-left: 8px;
        }
    </style>
</head>
<body>
<div class="upgrade-card">
    <div class="upgrade-header">
        <i class="fas fa-arrow-up"></i>
        Upgrade/Change Membership Plan
    </div>
    <div style="text-align:center; color:#888; margin-bottom:1.5rem; margin-top:0.5rem;">
        Choose a new plan and unlock more benefits!
    </div>
    <div class="p-4">
        <h5 class="mb-3">Current Plan Details</h5>
        <div class="mb-3">
            <b>Member:</b> <span>${member.firstName} ${member.lastName}</span><br>
            <b>Current Plan:</b>
            <c:choose>
              <c:when test="${not empty currentPlan}">
                <span class="current-plan-badge">${currentPlan.name}</span>
              </c:when>
              <c:otherwise>
                <span class="current-plan-badge bg-secondary">None</span>
              </c:otherwise>
            </c:choose><br>
            <b>End Date:</b> <span>${member.expiryDate}</span>
        </div>
        <h6 class="mb-3">Select New Plan</h6>
        <form method="post" action="${pageContext.request.contextPath}/membership/upgrade">
            <input type="hidden" name="email" value="${member.email}" />
            <div class="plan-grid">
                <c:forEach var="plan" items="${plans}">
                    <div class="plan-option" style="border: 2px solid <c:out value='${currentPlan != null && currentPlan.id == plan.id ? "#43b97f" : "#eee"}'/>;">
                        <input type="radio" id="plan${plan.id}" name="planId" value="${plan.id}" <c:if test='${currentPlan != null && currentPlan.id == plan.id}'>checked</c:if> style="margin-right:8px;" />
                        <label for="plan${plan.id}" style="width:100%;display:block;cursor:pointer;">
                            <span class="plan-title" style="font-weight:600;">
                                <i class="fas fa-dumbbell"></i> ${plan.name}
                                <c:if test="${currentPlan != null && currentPlan.id == plan.id}">
                                    <span class="badge bg-success">Current</span>
                                </c:if>
                            </span>
                            <div style="font-size:0.95em; color:#888;">${plan.description}</div>
                            <div class="plan-price" style="font-weight:700; color:#43b97f;">Price: $${plan.price}</div>
                            <div class="plan-duration" style="font-size:0.95em;">${plan.durationInMonths} months</div>
                        </label>
                    </div>
                </c:forEach>
            </div>
            <div class="upgrade-btns">
                <button type="submit" class="btn btn-success">Confirm Upgrade</button>
                <a href="${pageContext.request.contextPath}/membership/status?email=${member.email}" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
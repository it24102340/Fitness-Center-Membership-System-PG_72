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
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(rgba(67,185,127,0.10), rgba(249,212,35,0.10)), #f3fff7;
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
        .plan-card {
            transition: transform 0.3s;
            cursor: pointer;
        }
        .plan-card:hover {
            transform: translateY(-5px);
        }
        .selected {
            border: 2px solid #0d6efd;
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
                        <h3 class="card-title"><i class="fas fa-exchange-alt me-2"></i>Upgrade/Change Membership Plan</h3>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${empty member || empty plans}">
                                <div class="alert alert-danger text-center">Required data is missing. Please check your membership status again.</div>
                            </c:when>
                            <c:otherwise>
                                <div class="mb-4">
                                    <h5>Current Plan Details:</h5>
                                    <ul class="list-unstyled mb-4">
                                        <li><strong>Member:</strong> <span class="text-primary"><c:out value="${member.firstName} ${member.lastName}"/></span></li>
                                        <li><strong>Current Plan:</strong> <span class="badge badge-plan bg-success"><i class="fas fa-dumbbell me-1"></i>
                                          <c:choose>
                                            <c:when test="${currentPlan != null}">
                                              <c:out value="${currentPlan.name}"/>
                                            </c:when>
                                            <c:otherwise>
                                              N/A
                                            </c:otherwise>
                                          </c:choose>
                                        </span></li>
                                        <li><strong>End Date:</strong> <span class="text-danger"><c:out value="${member.expiryDate}"/></span></li>
                                    </ul>
                                </div>
                                <form action="${pageContext.request.contextPath}/membership/upgrade" method="post" id="upgradeForm">
                                    <input type="hidden" name="email" value="${member.email}" />
                                    <div class="mb-4">
                                        <h4>Select New Plan</h4>
                                        <div class="row">
                                            <c:forEach var="plan" items="${plans}">
                                                <c:if test="${currentPlan == null || plan.id != currentPlan.id}">
                                                    <div class="col-md-6 mb-3">
                                                        <div class="card h-100 plan-card" onclick="selectPlan(this, '${plan.id}')">
                                                            <div class="card-body">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="radio" name="planId" id="plan${plan.id}" value="${plan.id}" required>
                                                                    <label class="form-check-label w-100" for="plan${plan.id}">
                                                                        <h5 class="card-title"><i class="fas fa-dumbbell me-1"></i> <c:out value="${plan.name}"/></h5>
                                                                        <p class="card-text"><c:out value="${plan.description}"/></p>
                                                                        <p class="card-text"><strong>Price:</strong> $<c:out value="${plan.price}"/> / <c:out value="${plan.durationInMonths}"/> months</p>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-primary" id="upgradeButton" disabled>Confirm Upgrade</button>
                                        <a href="${pageContext.request.contextPath}/membership/status?email=${member.email}" class="btn btn-secondary">Cancel</a>
                                    </div>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectPlan(card, planId) {
            // Remove selected class from all cards
            document.querySelectorAll('.plan-card').forEach(function(c) { c.classList.remove('selected'); });
            // Add selected class to clicked card
            card.classList.add('selected');
            // Select the radio button
            document.getElementById('plan' + planId).checked = true;
            // Enable the upgrade button
            document.getElementById('upgradeButton').disabled = false;
        }
    </script>
</body>
</html> 
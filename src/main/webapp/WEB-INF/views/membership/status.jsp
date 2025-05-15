<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Membership Status - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body style="min-height:100vh; margin:0; background:linear-gradient(135deg, #f8fff8 0%, #e6fff3 100%); font-family:'Poppins', Arial, sans-serif;">
  <div style="display:flex; align-items:center; justify-content:center; min-height:100vh;">
    <div class="center-card" style="max-width:420px; margin:0 auto; background:#fff; border-radius:24px; box-shadow:0 8px 32px rgba(60,180,120,0.13); padding:0; text-align:center;">
      <div class="card-header" style="background:linear-gradient(90deg, #3ecb7b 0%, #ffe259 100%); border-radius:24px 24px 0 0; padding:28px 0 18px 0; color:#fff; font-size:1.4rem; font-weight:700; margin:0; display:flex; flex-direction:column; align-items:center;">
        <span style="display:flex; align-items:center; justify-content:center; gap:10px;">
          <i class="fas fa-crown"></i>
          <span>Membership Status</span>
        </span>
        <span style="font-size:1rem; font-weight:400; margin-top:8px;">See your current membership details and plan status below.</span>
      </div>
      <div style="padding:24px;">
        <c:if test="${not empty sessionScope.success}">
          <div class="alert alert-success" style="margin-bottom:18px;">${sessionScope.success}</div>
          <c:remove var="success" scope="session"/>
        </c:if>
        <c:if test="${not empty error}">
          <div class="alert alert-danger" style="margin-bottom:18px;">${error}</div>
        </c:if>
        <form method="get" action="${pageContext.request.contextPath}/membership/status" style="max-width:400px;margin:2rem auto 1.5rem auto;">
            <div class="input-group">
                <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                <button type="submit" class="btn btn-success">Check Status</button>
            </div>
        </form>
        <c:if test="${not empty member}">
          <div style="text-align:left;">
            <h6 class="mb-2" style="font-weight:600;">Member Information</h6>
            <div><b>Name:</b> ${member.firstName} ${member.lastName}</div>
            <div><b>Email:</b> ${member.email}</div>
            <div><b>Phone:</b> ${member.phone}</div>
            <hr>
            <h6 class="mb-2" style="font-weight:600;">Membership Details</h6>
            <div><b>Current Plan:</b> ${currentPlan.name}</div>
            <div><b>Join Date:</b> ${member.joinDate}</div>
            <div><b>Expiry Date:</b> ${member.expiryDate}</div>
            <div><b>Status:</b> 
              <c:choose>
                <c:when test="${member.status eq 'ACTIVE'}">
                  <span class="badge bg-success" style="font-size:1em;">ACTIVE</span>
                </c:when>
                <c:when test="${member.status eq 'EXPIRED'}">
                  <span class="badge bg-warning text-dark" style="font-size:1em;">EXPIRED</span>
                </c:when>
                <c:when test="${member.status eq 'CANCELLED'}">
                  <span class="badge bg-danger" style="font-size:1em;">CANCELLED</span>
                </c:when>
                <c:otherwise>
                  <span class="badge bg-secondary" style="font-size:1em;">${member.status}</span>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="d-flex gap-2 mt-4 mb-2">
            <form action="${pageContext.request.contextPath}/membership/upgrade" method="get" style="flex:1;">
              <input type="hidden" name="memberId" value="${member.id}">
              <button class="btn btn-success w-100" type="submit">Upgrade Plan</button>
            </form>
            <form action="${pageContext.request.contextPath}/membership/cancel" method="post" style="flex:1;">
              <input type="hidden" name="memberId" value="${member.id}">
              <button class="btn btn-danger w-100" type="submit">Cancel Membership</button>
            </form>
          </div>
          <a href="${pageContext.request.contextPath}/membership/plans" class="btn btn-secondary w-100">Back to Plans</a>
        </c:if>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
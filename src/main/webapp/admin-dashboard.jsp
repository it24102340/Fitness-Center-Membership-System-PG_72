<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - ZACSON</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background: #f3f4f6;
            font-family: 'Poppins', sans-serif;
        }
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        .member-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .member-card:hover {
            transform: translateY(-2px);
        }
        .sort-button {
            background: #ff0000;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .sort-button:hover {
            background: #cc0000;
        }
        .status-badge {
            padding: 0.25rem 0.5rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 500;
        }
        .status-active {
            background-color: #dcfce7;
            color: #166534;
        }
        .status-inactive {
            background-color: #fee2e2;
            color: #991b1b;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-3xl font-bold text-gray-800">Admin Dashboard</h1>
            <a href="index.jsp" class="back-to-home">← BACK TO HOME</a>
            <button onclick="sortByLastRenewal()">
                Sort by Last Renewal
            </button>
        </div>

        <div id="membersList" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Member cards will be dynamically inserted here -->
             <c:forEach items="${members}" var="member">
                <div class="member-card p-6">
                    <h3 class="text-xl font-semibold mb-2">${member.name}</h3>
                    <p class="text-gray-600 mb-1">ID: ${member.id}</p>
                    <p class="text-gray-600 mb-1">Username: ${member.username}</p>
                    <p class="text-gray-600 mb-1">Email: ${member.email}</p>
                    <p class="text-gray-600 mb-1">Phone: ${member.phone}</p>
                    <p class="text-gray-600 mb-1">Join Date: <fmt:formatDate value="${member.joinDate}" pattern="MMM dd, yyyy"/></p>
                    <p class="text-gray-600 mb-1">Last Renewal: <fmt:formatDate value="${member.lastRenewalDate}" pattern="MMM dd, yyyy"/></p>
                    <p class="text-gray-600 mb-2">Membership Type: ${member.membershipType}</p>
                    <span class="status-badge ${member.active ? 'status-active' : 'status-inactive'}">
                        ${member.active ? 'Active' : 'Inactive'}
                    </span>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        // This client-side sorting is a fallback/example.
        // Ideally, sorting should be done server-side in the servlet.
        function sortByLastRenewal() {
            const membersContainer = document.getElementById('membersList');
            const memberCards = Array.from(membersContainer.querySelectorAll('.member-card'));

            memberCards.sort((a, b) => {
                const dateA = new Date(a.querySelector('p:nth-child(7)').textContent.replace('Last Renewal: ', ''));
                const dateB = new Date(b.querySelector('p:nth-child(7)').textContent.replace('Last Renewal: ', ''));
                // Sort in ascending order (earliest first)
                return dateA - dateB;
            });

            // Re-append sorted cards
            membersContainer.innerHTML = '';
            memberCards.forEach(card => membersContainer.appendChild(card));
        }

        // Initial display (data is provided by the servlet)
        // The servlet should add the members list as a request attribute named "members"

    </script>
</body>
</html> 
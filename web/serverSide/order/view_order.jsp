<%-- 
    Document   : view_order
    Created on : Oct 24, 2025, 11:05:35 AM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.OrderDao,com.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/components/header/import.jsp"/>
    <style>
        td a i { font-size: 24px !important; }
        td a i:hover { opacity: 0.5; }
    </style>
</head>
<body>
        <!--nav-->
    <jsp:include page="/components/navbar/navbar_emp.jsp"/>
    <!-------->
    <div class="box">
    <h1 class="mb-3 text-center">Order List</h1>

    <%
        List<Order> list = OrderDao.getAllRecords();
        request.setAttribute("list", list);
    %>

        <!-- ✅ ส่วนเลือกสถานะ -->
    <div class="mb-4 d-flex align-items-center gap-3">
        <label for="statusSelect" class="form-label mb-0 fw-semibold text-secondary">
            <i class="fa-solid fa-filter me-1 text-primary"></i> กรองสถานะ:
        </label>
        <select id="statusSelect" class="form-select shadow-sm px-3 py-2" style="max-width: 150px;" onchange="filterStatus()">
            <option value="all">ทั้งหมด</option>
            <option value="received">received</option>
            <option value="delivering">delivering</option>
            <option value="delivered">delivered</option>
        </select>
    </div>

    <table class="table table-hover table-bordered align-middle">
        <thead>
            <tr class="table-info">
                <th>Id</th>
                <th>Email</th>
                <th>Order date</th>
                <th>Total amount</th>
                <th>Order status</th>
                <th>Order list</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>

        <tbody id="orderTableBody">
            <c:forEach items="${list}" var="o">
                <tr>
                    <td>${o.orderId}</td>
                    <td>${o.userEmail}</td>
                    <td>${o.orderDate}</td>
                    <td>${o.totalAmount}</td>
                    <td>${o.orderStatus}</td>
                    <td class="text-center">
                        <a href="view_orderItems.jsp?order_id=${o.orderId}">
                            <i class="bi bi-eye-fill"></i>
                        </a>
                    </td>
                    <td class="text-center">
                        <a href="edit_form_order.jsp?order_id=${o.orderId}">
                            <i class="bi bi-pencil-fill"></i>
                        </a>
                    </td>
                    <td class="text-center">
                        <a href="delete_order.jsp?order_id=${o.orderId}"
                           onclick="return confirm('⚠️ คุณแน่ใจหรือไม่ที่จะลบข้อมูลนี้?')">
                            <i class="bi bi-trash3-fill"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    
    <!-- Footer Info -->
    <jsp:include page="/components/footer/footer_emp.jsp"/>
    
    <script>
        function filterStatus() {
            var status = document.getElementById("statusSelect").value;
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // นำ HTML จาก fetch_status.jsp มาแสดงในตาราง
                    document.getElementById("orderTableBody").innerHTML = xhr.responseText;
                }
            };

            xhr.open("GET", "fetch_status.jsp?status=" + encodeURIComponent(status), true);
            xhr.send();
        }
    </script>
</body>
</html>


<%-- 
    Document   : view_order
    Created on : Oct 24, 2025, 11:05:35 AM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.OrderItemDao,com.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <jsp:include page="/components/header/import.jsp"/>
    </head>
    <body>
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->

        <%
            int id = Integer.parseInt(request.getParameter("order_id"));
            List<OrderItem> list = OrderItemDao.getRecordById(id);
            request.setAttribute("list", list);
        %>
        
        <div class="box">
            <h1 class="mb-3 text-center">
                <a href="view_order.jsp?order_id=<%=id%>">
                    Order List Id: <%=id%>
                </a>
            </h1>
            <table class="table table-hover table-bordered align-middle">
                <thead>
                    <tr class="table-info">
                        <!--                <th>Order Item Id</th>
                                        <th>Order Id</th>-->
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${list}" var="oi">
                        <tr>
        <!--                    <td>${oi.orderItemId}</td>
                            <td>${oi.orderId}</td>-->
                            <td>${oi.productName}</td>
                            <td>${oi.quantity}</td>
                            <td>${oi.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
        </div>
    </body>
</html>


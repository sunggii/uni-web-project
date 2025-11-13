<%-- 
    Document   : fetch_status
    Created on : Oct 25, 2025, 7:38:16 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.OrderDao,com.bean.*,java.util.*"%>

<%
    String status = request.getParameter("status");
    String orderId = request.getParameter("order_id");
    if (status == null) status = "all";

    List<Order> list;
    if (status.equals("all")) {
        list = OrderDao.getAllRecords();
    } else {
        list = OrderDao.getOrdersByStatus(status);
    }

    if (list == null || list.isEmpty()) {
        out.print("<tr><td colspan='8' style='text-align:center;color:gray;'>ไม่มีข้อมูล</td></tr>");
    } else {
        for (Order o : list) {
%>
<tr>
    <td><%=o.getOrderId()%></td>
    <td><%=o.getUserEmail()%></td>
    <td><%=o.getOrderDate()%></td>
    <td><%=o.getTotalAmount()%></td>
    <td><%=o.getOrderStatus()%></td>
    <td class="text-center">
        <a href="view_orderItems.jsp?order_id=<%=o.getOrderId()%>">
            <i class="bi bi-eye-fill"></i>
        </a>
    </td>
    <td class="text-center">
        <a href="edit_form_order.jsp?order_id=<%=o.getOrderId()%>">
            <i class="bi bi-pencil-fill"></i>
        </a>
    </td>
    <td class="text-center">
        <a href="delete_order.jsp?order_id=<%=o.getOrderId()%>">
            <i class="bi bi-trash3-fill"></i>
        </a>
    </td>
    </tr>
<%
        }
    }
%>


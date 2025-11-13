<%-- 
    Document   : delete-order
    Created on : Oct 24, 2025, 12:50:01 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.OrderDao"%>
<jsp:useBean id="o" class="com.bean.Order"></jsp:useBean>
<jsp:setProperty property="orderId" name="o" param="order_id"/>

<%
    int i =OrderDao.delete(o);
    //out.println("Update result: " + i);
    response.sendRedirect("view_order.jsp");
%>

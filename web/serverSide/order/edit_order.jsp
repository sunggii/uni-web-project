<%-- 
    Document   : edit_order
    Created on : Oct 24, 2025, 2:20:05 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.OrderDao"%>
<jsp:useBean id="o" class="com.bean.Order"></jsp:useBean>
<jsp:setProperty property="*" name="o"/>
<%
     int i = OrderDao.update(o);
     //out.println("Update result: " + i);
    response.sendRedirect("view_order.jsp");
%>



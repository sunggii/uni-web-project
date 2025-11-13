<%-- 
    Document   : delete_user
    Created on : Oct 23, 2025, 5:42:42?PM
    Author     : nur
--%>

<%@page import="com.dao.UserDao"%>
<jsp:useBean id="u" class="com.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
UserDao.delete(u);
    response.sendRedirect("view_user.jsp");
%>

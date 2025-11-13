<%-- 
    Document   : login
    Created on : Oct 22, 2025, 7:17:42 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.UserDao,com.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Users List</h1>

    <%
        List<User> list=UserDao.getAllRecords();
        request.setAttribute("list",list);
    %>

    <table border="1" width="90%">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Password</th>
            <th>Role</th>
            <th>Profile</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td>${u.surname}</td>
                    <td>${u.email}</td>
                    <td>${u.password}</td>
                    <td>${u.role}</td>
                    <td><img src="data:image/jpeg;base64,${u.profileBase64}" alt="Profile Image" width="100" height="100" /></td>
                    <td><a href="editform.jsp?id=${u.id}">Edit</a></td>
                    <td><a href="delete_user.jsp?id=${u.id}">Delete</a></td>
                </tr>
        </c:forEach>
            
    </table>
        <br/><a href="adduserform.jsp">Add New User</a>
    </body>
</html>

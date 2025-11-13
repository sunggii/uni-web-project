<%-- 
    Document   : navbar_user
    Created on : Sep 24, 2025, 7:51:44 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
    </head>
    <style>
        .nav-link{
            cursor: pointer;
        }
    </style>
    <body>
        <%
            String email = (String) session.getAttribute("email");
             Integer itemCount = (Integer) session.getAttribute("itemCount");
            if (itemCount == null) itemCount = 0;
        %>
        <!--nav-->
        <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
            <div class="container-fluid">
                <div class="nav-logo">
                    <img src="<c:url value='/img/logo.svg?v=1'/>" alt="logo" id="logo">
                    <a class="navbar-brand" href="<c:url value='/index.jsp'/>">เพื่อนเขียน</a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left side menu -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                สินค้าทั้งหมด
                            </a>
                            <ul class="dropdown-menu custom-navbar">
                               <li><a href="<c:url value='/type_pen.jsp'/>" class="dropdown-item custom-dropdown">ปากกาดินสอ</a></li>
                                <li><a href="<c:url value='/type_note.jsp'/>" class="dropdown-item custom-dropdown">สมุด & กระดาษ</a></li>
                                <li><a href="<c:url value='/type_color.jsp'/>" class="dropdown-item custom-dropdown">อุปกรณ์วาดภาพระบายสี</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a href="<c:url value='/type_brand.jsp'/>" class="dropdown-item custom-dropdown">สินค้าแบรนด์เพื่อนเขียน🛒</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link position-relative" href="<c:url value='/clientSide/cart/viewCart.jsp'/>">
                                <i class="fa-solid fa-cart-shopping"></i>
                                <%-- render badge when itemCount > 0 --%>
                                <% if (itemCount != null && itemCount > 0) { %>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                        <%= itemCount %>
                                        <span class="visually-hidden">items in cart</span>
                                    </span>
                                <% } %>
                            </a>
                        </li>
                    </ul>

                    <!-- Right side menu - Login/Logout -->
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/clientSide/login/login_form.jsp'/>">
                                <i class="fa-solid fa-user"></i>
                                <% if (email != null) {%>
                                <span><%= email%></span>
                                <% } else { %>
                                <span>เข้าสู่ระบบ</span>
                                <% }%>
                            </a>
                        </li>

                        <li class="nav-item" id="logoutItem" >
                            <a class="nav-link" href="<c:url value='/clientSide/login/logout.jsp'/>" >
                                <i class="fa-solid fa-right-from-bracket"></i>
                                Logout
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <!----------->
    </body>
</html>

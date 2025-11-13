<%-- 
    Document   : navbar_emp
    Created on : Oct 26, 2025, 3:49:24 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/components/header/import.jsp"/>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
                crossorigin="anonymous">
        </script>

        <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
            <div class="container-fluid">
                <div class="nav-logo ">
                    <img src="<c:url value='/img/logo.svg?v=1'/>" alt="logo" id="logo">
                    <a class="navbar-brand" href="<c:url value='/serverSide/home.jsp'/>">เพื่อนเขียน</a>
                    
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"> 
                            <a class="nav-link" href="#"> 
                                <%=session.getAttribute("email")%>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/clientSide/login/logout.jsp'/>">logout
                                <i class="fa-solid fa-right-from-bracket"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>

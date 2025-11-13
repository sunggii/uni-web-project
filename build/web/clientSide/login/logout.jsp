<%-- 
    Document   : logout
    Created on : Sep 22, 2025, 3:57:46 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
               session = request.getSession();
                   Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
                   if (loggedIn != null && loggedIn) {
                       session.setAttribute("email", null);
                        session.invalidate();
                        out.println("<script>alert('📤 logout สำเร็จ'); window.location='../../index.jsp';</script>");
                       return;
                   } else {
                   out.println("<script>alert('📥️ คุณยังไม่ได้ login'); window.location='login_form.jsp';</script>");
            }
        %>
    </body>
</html>

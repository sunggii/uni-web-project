<%-- 
    Document   : login.jsp
    Created on : Sep 22, 2025, 2:34:13 PM
    Author     : nur
--%>

<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
<%
    session = request.getSession();
    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
    if (loggedIn != null && loggedIn) {
        response.sendRedirect("../../index.jsp");
        return;
    }

    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String remember = request.getParameter("remember");

    email = email.trim();
    password = password.trim();
    if (email.isEmpty() || password.isEmpty()) {
        out.println("<script>alert('กรุณากรอกข้อมูลให้ครบถ้วน'); window.location='login_form.jsp';</script>");
        return;
    }

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/my_project?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "root", "17905apy");

        String query = "SELECT email, user_type FROM register WHERE email = ? AND password = ?";
        pst = con.prepareStatement(query);
        pst.setString(1, email);
        pst.setString(2, password);

        rs = pst.executeQuery();

        if (rs.next()) {
            String userType = rs.getString("user_type");
            session.setAttribute("email", email);
            session.setAttribute("user_type", userType);
            session.setAttribute("loggedIn", Boolean.TRUE);

            if (remember != null) {
                // จดจำ 30 วัน
                session.setMaxInactiveInterval(60 * 60 * 24 * 30);
            } else {
                // ค่าเริ่มต้น 30 นาที
                session.setMaxInactiveInterval(30 * 60);
            }

            if ("emp".equals(userType)) {
                out.println("<script>alert('✅ เข้าสู่ระบบสำเร็จ! (พนักงาน)'); window.location='../../serverSide/home.jsp';</script>");
            } else {
                out.println("<script>alert('✅ เข้าสู่ระบบสำเร็จ!'); window.location='../../index.jsp';</script>");
            }
        } else {
            out.println("<script>alert('⚠️ เข้าสู่ระบบไม่สำเร็จ กรุณาตรวจสอบ email หรือ password'); window.location='login_form.jsp';</script>");
        }

    } catch (Exception e) {
        out.println("<script>alert('เกิดข้อผิดพลาดในระบบ'); window.location='login_form.jsp';</script>");
    } finally {
        try { if (rs != null) rs.close(); if (pst != null) pst.close(); if (con != null) con.close(); } catch (Exception ex) { }
    }
%>
</body>
</html>

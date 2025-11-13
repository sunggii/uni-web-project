<%-- 
    Document   : c-register
    Created on : Sep 16, 2025, 12:00:20 PM
    Author     : nur
--%>

<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>จัดการบัญชี</title>
        <link rel="icon" type="image/png" href="../../img/logo.png?v=1">
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            Connection conn = null;
            Statement s = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost/my_project?autoReconnect=true&useSSL=false", "root", "17905apy");

                s = conn.createStatement();

                String Name = request.getParameter("name");
                String Surname = request.getParameter("surname");
                String Address = request.getParameter("address");
                String Email = request.getParameter("email");
                String Password = request.getParameter("password");

                String sql = "INSERT INTO register (name, surname, address, email, password) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, Name); //(colที่, ตัวแปรที่ getParameter)
                pstmt.setString(2, Surname);
                pstmt.setString(3, Address);
                pstmt.setString(4, Email);
                pstmt.setString(5, Password);

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    response.getWriter().println(
                            "<script>alert('✅ signup successfully!'); window.location='../../clientSide/login/login_form.jsp';</script>"
                    );

                } else {
                    response.getWriter().println(
                            "<script>alert('❌ signup failed');</script>"
                    );
                }

                out.println(sql);
                s.execute(sql);

            } catch (Exception e) {
                // TODO Auto-generated catch block
                out.println(e.getMessage());
                e.printStackTrace();
            }

            try {
                if (s != null) {
                    s.close();
                    conn.close();
                }
            } catch (SQLException e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>

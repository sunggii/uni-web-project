<%-- 
    Document   : r-regis-table
    Created on : Sep 12, 2025, 7:35:47 PM
    Author     : nur
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/components/header/import.jsp"/>

        <style>
            .product_pic {
                width: 250px;      /* ขนาด cell */
                height: 150px;     /* ความสูง cell */
            }
            .product_pic img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* ครอบรูปเต็ม cell */
            }

            td a i{
                font-size: 24px;
                padding-left: 1.2rem !important;
            }

            td a i:hover{
                opacity: 0.5;
            }

        </style>

    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous">
        </script>
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->

        <!-Read-->
        <div class="box">
            <h1 class="header-title">จัดการบัญชี</h1>

            <table class="table table-hover table-bordered align-middle ">
                <thead>
                    <tr class="table-info">
                        <th scope="col" class="align-center">id</th>
                        <th scope="col" class="align-center">name</th>
                        <th scope="col" class="align-center">surname</th>
                        <th scope="col" class="align-center">address</th>
                        <th scope="col" class="align-center">email</th>
                        <th scope="col" class="align-center">password</th>
                        <th scope="col" class="align-center">type</th>
                        <th scope="col" class="align-center">edit</th>
                        <th scope="col" class="align-center">delete</th>
                    </tr>
                </thead>

                <tbody class="table-group-divider">
                    <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                            } catch (Exception e) {
                            }
                            try {
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/my_project?allowPublicKeyRetrieval=true&useSSL=false", "root", "17905apy");
                                Statement s = c.createStatement();
                                ResultSet r = s.executeQuery("Select * from my_project.register");
                                //out.print("**********************************************************<br>");
                                //out.print("     ID        Product name          category        brand      price       <br>");
                                //out.print("**********************************************************<br>");
                                java.util.Base64.Encoder encoder = java.util.Base64.getEncoder(); //ใช้รูป Base64
                                while (r.next()) {
                    %>
                    <tr>
                        <td scope="row"><%=r.getString("id_register")%></td>
                        <td scope="row"><%=r.getString("name")%></td>
                        <td scope="row"><%=r.getString("surname")%></td>
                        <td scope="row"><%=r.getString("address")%></td>
                        <td scope="row"><%=r.getString("email")%></td>
                        <td scope="row"><%=r.getString("password")%></td>
                        <!-- id= id_register idเป็นแค่ตัวแปรมาเก็บค่า id_register -->
                        <td scope="row"><%=r.getString("user_type")%></td>
                        <td scope="row"> 
                            <a href="u-register-form.jsp?id=<%=r.getString("id_register")%> #update" >
                                <i class="bi bi-pencil-fill"></i>
                            </a>
                        </td>
                        <td scope="row">
                            <a href="d-register.jsp?id=<%=r.getString("id_register")%>" 
                               onclick="return confirm('⚠️ คุณแน่ใจหรือไม่ที่จะลบข้อมูลนี้?')">
                                <i class="bi bi-trash3-fill"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                                }
                                s.close();
                                r.close();
                            } catch (SQLException e) {
                                out.print(e);
                            }
                    %>
                </tbody>
            </table>
        </div>
        <!------------->

        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>

    </body>
</html>

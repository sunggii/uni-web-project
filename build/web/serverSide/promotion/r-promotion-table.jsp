<%-- 
    Document   : r-promotion-table
    Created on : Sep 18, 2025, 1:45:25 PM
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
                margin-left: 4.5rem !important;
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

        <!-Read-->
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->

        <div class="box">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="text-center flex-grow-1  m-0">
                    ข้อมูลโปรโมชั่น
                </h1>
                <a href="cu-promotion-form.jsp?id=1" 
                   class="btn btn-sm btn-dark rounded-pill shadow-sm d-flex align-items-center gap-2 ms-3" 
                   title="เพิ่มโปรโมชั่น">
                    <i class="bi bi-plus-circle-fill"></i>
                    <span>เพิ่มโปรโมชั่น</span>
                </a>
            </div>
            <table class="table table-hover table-bordered align-middle ">
                <thead>
                    <tr class="table-info">
                        <th scope="col" class="align-center">promotion_id</th>
                        <th scope="col" class="align-center">promotion_date</th>
                        <th scope="col" class="align-center">promotion_name</th>
                        <th scope="col" class="align-center">discount</th>
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
                                ResultSet r = s.executeQuery("Select * from my_project.promotion");
                                //out.print("**********************************************************<br>");
                                //out.print("     ID        Product name          category        brand      price       <br>");
                                //out.print("**********************************************************<br>");
                                java.util.Base64.Encoder encoder = java.util.Base64.getEncoder(); //ใช้รูป Base64
                                while (r.next()) {
                    %>
                    <tr>
                        <td scope="row"><%=r.getString("promotion_id")%></td>
                        <td scope="row"><%=r.getString("promotion_date")%></td>
                        <td scope="row"><%=r.getString("promotion_name")%></td>
                        <td scope="row"><%=r.getString("discount")%></td>
                        <!-- id= id_register idเป็นแค่ตัวแปรมาเก็บค่า id_register -->
                        <td scope="row"> 
                            <a href="cu-promotion-form.jsp?id=<%=r.getString("promotion_id")%> #update" >
                                <i class="bi bi-pencil-fill"></i>
                            </a>
                        </td>
                        <td scope="row">
                            <a href="d-promotion.jsp?id=<%=r.getString("promotion_id")%>" 
                               onclick="return confirm('⚠️ คุณแน่ใจหรือไม่ที่จะลบข้อมูลนี้?')">
                                <i class="bi bi-trash3-fill"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                                }
                                s.close();
                                r.close();
                                c.close();
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

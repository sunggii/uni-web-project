<%-- 
    Document   : showDataDB
    Created on : Sep 5, 2024, 1:09:03 PM
    Author     : chouv
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
            <h1 class="header-title">ข้อมูลสินค้าในสต็อก</h1>
            <table class="table table-hover table-bordered align-middle ">
                <thead>
                    <tr class="table-info">
                        <th scope="col" class="align-center">product_id</th>
                        <th scope="col" class="align-center">product_name</th>
                        <th scope="col" class="align-center">product_category</th>
                        <th scope="col" class="align-center">product_category</th>
                        <th scope="col" class="align-center">price</th>
                        <th scope="col" class="align-center">picture</th>
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
                            ResultSet r = s.executeQuery("Select * from my_project.stock");
                            //out.print("**********************************************************<br>");
                            //out.print("     ID        Product name          category        brand      price       <br>");
                            //out.print("**********************************************************<br>");
                            java.util.Base64.Encoder encoder = java.util.Base64.getEncoder(); //ใช้รูป Base64
                            while (r.next()) {
                    %>
                    <tr>
                        <td scope="row"><%=r.getString("product_id")%></td>
                        <td scope="row"><%=r.getString("product_name")%></td>
                        <td scope="row"><%=r.getString("product_category")%></td>
                        <td scope="row"><%=r.getString("product_brand")%></td>
                        <td scope="row"><%=r.getString("price")%></td>

                        <td scope="row" class="product_pic">
                            <%
                                byte[] imgData = r.getBytes("picture");
                                String base64Image = encoder.encodeToString(imgData);
                            %>
                            <img src="data:image/jpeg;base64,<%= base64Image%>" alt="Porduct Image" >
                        </td>    
                        <td scope="row"> <a href="u-stock-form.jsp?product_id=<%=r.getString("product_id")%> #update"><i class="bi bi-pencil-fill"></i></a></td>
                        <td scope="row"> 
                            <a href="d-stock.jsp?product_id=<%= r.getString("product_id")%>" 
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

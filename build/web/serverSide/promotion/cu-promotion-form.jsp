<%-- 
    Document   : u-promotion-form
    Created on : Sep 18, 2025, 1:56:55 PM
    Author     : nur
--%>

<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/components/header/import.jsp"/>

        <style>
            .item-box {
                width: 60%;
                margin-left: 20%;
            }

            .button-insert {
                background-color: lightgreen;
                border: none;
            }

            .button-update {
                background: lightskyblue;
                border: none;
            }

            .button-delete {
                background: lightcoral;
                border: none;
            }


        </style>
    </head>
    <body>
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->

        <div class="box">
            <h1 class="header-title">
                จัดการโปรโมชั่น
            </h1>

        </div>

        <!-- create -->
        <div class="box">
            <div class="item-box" id="cerate">
                <div class="frame-bg">
                    <h1>Insert</h1>
                    <form action="c-promotion.jsp" method="post" >

                        date:
                        <input class="form-control" type="date" id="promotion_date" name="date" required>

                        name:
                        <input class="form-control" type="text" name="name" placeholder="Default input"
                               aria-label="default input example"
                               oninput="this.value = this.value.replace(/[0-9]/g, '')">

                        discount:
                        <input class="form-control" type="text" name="discount" placeholder="Default input"
                               aria-label="default input example">

                        <div class="box-button">
                            <button type="submit" class="button button-insert">
                                <span>เพิ่มโปรโมชั่น</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!------------->

        <!---update--->
        <%
            //response.setContentType("text/xml;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            Connection connect = null;
            Statement s = null;
            //    try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/my_project?autoReconnect=true&useSSL=false", "root", "17905apy");
            s = connect.createStatement();
            String sql = "SELECT * FROM  promotion WHERE promotion_id= '" + request.getParameter("id") + "'  ";
            ResultSet rec = s.executeQuery(sql);

            if (rec != null) {
                rec.next();
        %>

        <div class="box">
            <div class="item-box" id="update">
                <div class="frame-bg">
                    <h1>Edit</h1>
                    <!--<form action="new-stock.jsp?product_id= %=rec.getString("product_id")%" method="post" enctype="multipart/form-data" >-->

                    <form action="u-promotion.jsp" method="post">
                        id:
                        <input class="form-control" type="number" name="id" 
                               value="<%=rec.getString("promotion_id")%>"
                               aria-label="default input example" readonly>

                        date:
                        <input class="form-control" type="date" id="promotion_date" name="date" required
                               value="<%=rec.getString("promotion_date")%>">

                        name:
                        <input class="form-control" type="text" name="name" placeholder="Default input"
                               value="<%=rec.getString("promotion_name")%>"
                               aria-label="default input example">

                        discount:
                        <input class="form-control" type="text" name="discount" placeholder="Default input"
                               value="<%=rec.getString("discount")%>"
                               aria-label="default input example">

                        <div class="box-button">
                            <button type="submit" class="button button-update">
                                <span>แก้ไขโปรโมชั่น</span>
                                <i class="bi bi-bag-dash-fill"></i>
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!------------->

        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>

        <% } %>

        <% /*  } catch (Exception e) {
              // TODO Auto-generated catch block
              out.println(e.getMessage());
              e.printStackTrace();
          }

          try {
              if (s != null) {
                  s.close();
                  connect.close();
              }
          } catch (SQLException e) {
              // TODO Auto-generated catch block
              out.println(e.getMessage());
              e.printStackTrace();
          }*/
        %>

        <!------------->
    </body>
</html>

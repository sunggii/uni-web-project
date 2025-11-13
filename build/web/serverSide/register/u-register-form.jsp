<%-- 
    Document   : register
    Created on : Sep 7, 2025, 3:24:49 PM
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

            /*update*/
            .product_pic {
                width: 600px;      /* ขนาด cell */
                height: 150px;     /* ความสูง cell */
            }
            .product_pic img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* ครอบรูปเต็ม cell */
            }
            /*-------*/
        </style>
    </head>
    <body>
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->

        <div class="box">
            <h1 class="header-title">
                จัดการบัญชี
            </h1>

        </div>

        <!-- update -->
        <%
            //response.setContentType("text/xml;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            Connection connect = null;
            Statement s = null;
            //    try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/my_project?autoReconnect=true&useSSL=false", "root", "17905apy");
            s = connect.createStatement();
            String sql = "SELECT * FROM  register WHERE id_register= '" + request.getParameter("id") + "'  ";
            //request.getParameter("id")  "id" คือตัวแปรที่แสดงอยู่ตรง Url
            //ซึ่งมันจะต้องตรงกับตอนที่เราลิ้งมาหน้านี้ ตัวแปรที่เก็บค่า id_register ชื่อว่าอะไร
            ResultSet rec = s.executeQuery(sql);

            if (rec != null) {
                rec.next();
        %>

        <div class="box">
            <div class="item-box" id="update">
                <div class="frame-bg">
                    <h1>Edit</h1>
                    <form action="u-register.jsp?id_register=<%=rec.getString("id_register")%>" method="post" >
                        id:
                        <input class="form-control" type="number" name="id" 
                               value="<%=rec.getString("id_register")%>"
                               aria-label="default input example" readonly>

                        name:
                        <input class="form-control" type="text" name="name" 
                               value="<%=rec.getString("name")%>" required
                               aria-label="default input example"
                               oninput="this.value = this.value.replace(/[0-9]/g, '')">

                        surname:
                        <input class="form-control" type="text" name="surname"
                               value="<%=rec.getString("surname")%>"
                               aria-label="default input example"
                               oninput="this.value = this.value.replace(/[0-9]/g, '')">

                        address:
                        <input class="form-control" type="text" name="address"
                               value="<%=rec.getString("address")%>"
                               aria-label="default input example">

                        email:
                        <input class="form-control" type="text" name="email" 
                               value="<%=rec.getString("email")%>"
                               aria-label="default input example">

                        password:
                        <input class="form-control" type="text" name="password" 
                               value="<%=rec.getString("password")%>"
                               aria-label="default input example">

                        type:
                        <select id="mySelect" name="type" class="form-select form-select-sm" aria-label="Small select example">
                            <option value="user">User</option>
                            <option value="emp">Employee</option>
                        </select>

                        <div class="box-button">
                            <button type="submit" class="button button-update">
                                <span>แก้ไขบัญชี</span>
                                <i class="bi bi-bag-dash-fill"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!------------->

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

        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>

    </body>
</html>

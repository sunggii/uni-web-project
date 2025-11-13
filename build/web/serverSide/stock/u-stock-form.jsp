<%-- 
    Document   : register
    Created on : Sep 7, 2025, 3:24:49 PM
    Author     : nur
--%>

<%@page import="java.util.Base64"%>
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
                จัดการสต็อกสินค้า
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
    String sql = "SELECT * FROM  stock WHERE product_id= '" + request.getParameter("product_id") + "'  ";
    ResultSet rec = s.executeQuery(sql);
    Base64.Encoder encoder = Base64.getEncoder() ;
    
    if (rec != null) {
       rec.next();
    %>
  
                <div class="box">
            <div class="item-box" id="update">
                <div class="frame-bg">
                    <h1>Edit</h1>
<!--                    <form action="new-stock.jsp?product_id= %=rec.getString("product_id")%" method="post" enctype="multipart/form-data" >-->

                        <form action="/my_project/Update_stock" method="post" enctype="multipart/form-data">
                        id:
                        <input class="form-control" type="number" name="id" 
                               value="<%=rec.getString("product_id")%>"
                               aria-label="default input example" readonly>
                        
                        name:
                        <input class="form-control" type="text" name="name" 
                               value="<%=rec.getString("product_name")%>" required
                               aria-label="default input example">
                        
                         category:
                        <input class="form-control" type="text" name="category"
                               value="<%=rec.getString("product_category")%>"
                               aria-label="default input example">

                        brand:
                        <input class="form-control" type="text" name="brand"
                               value="<%=rec.getString("product_brand")%>"
                               aria-label="default input example">

                        price:
                        <input class="form-control" type="text" name="price" 
                               value="<%=rec.getString("price")%>"
                               aria-label="default input example">
                        
                        <div class="mb-3">
                            <label for="formFile" class="form-label"></label>
                            <input class="form-control" type="file" id="formFile" name="photo">
                        </div>
                        
                        <div class="box-button">
                            <button type="submit" class="button button-update">
                                <span>แก้ไขสินค้า</span>
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

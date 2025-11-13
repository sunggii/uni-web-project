<%-- 
    Document   : u-payment-form
    Created on : Sep 18, 2025, 7:14:29 AM
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
                จัดการชำระเงิน
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
            String sql = "SELECT * FROM  payment WHERE payment_id= '" + request.getParameter("id") + "'  ";
            ResultSet rec = s.executeQuery(sql);

            if (rec != null) {
                rec.next();
        %>

        <div class="box">
            <div class="item-box" id="update">
                <div class="frame-bg">
                    <h1>Edit</h1>
                    <form action="u-payment.jsp" method="post">
                        id:
                        <input class="form-control" type="number" name="id" 
                               value="<%=rec.getString("payment_id")%>"
                               aria-label="default input example" readonly>

                        date:
                        <input class="form-control" type="text" name="date" 
                               value="<%=rec.getString("payment_date")%>" 
                               aria-label="default input example" readonly>

                        status:
                        <select id="mySelect" name="status" class="form-select form-select-sm" aria-label="Small select example">
                            <option value="pending">Pending</option>
                            <option value="completed">Completed</option>
                        </select>

                        amount:
                        <input class="form-control" type="text" name="amount"
                               value="<%=rec.getString("amount")%>"
                               aria-label="default input example" readonly>

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
        
        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>
        
        <% } %>
    </body>
</html>

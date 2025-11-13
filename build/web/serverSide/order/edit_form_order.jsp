<%-- 
    Document   : edit_form
    Created on : Oct 24, 2025, 2:19:38 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.OrderDao,com.bean.Order"%>
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


        <%
            String id = request.getParameter("order_id");
            Order o = OrderDao.getRecordById(Integer.parseInt(id));
        %>
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->
        
        <div class="box">
            <h1 class="header-title">
            จัดการ Order
        </h1>
            
            <div class="item-box" id="update">
                <div class="frame-bg">
                    <h1>Edit</h1>
                    <form action="edit_order.jsp" method="post">
                        <label for="orderId">Id:</label>
                        <input id="orderId" class="form-control" type="text" name="orderId" value="<%= o.getOrderId()%>" readonly/>

                        <label for="userEmail" class="mt-2">Email:</label>
                        <input id="userEmail" class="form-control" type="email" name="userEmail" value="<%= o.getUserEmail()%>" readonly/>

                        <label for="totalAmount" class="mt-2">Total Amount:</label>
                        <input id="totalAmount" class="form-control" type="text" name="totalAmount" value="<%= o.getTotalAmount()%>" readonly/>

                        <label for="orderStatus" class="mt-2">Order Status:</label>
                        <select id="orderStatus" name="orderStatus" class="form-select form-select-sm">
                            <option value="received" <%= o.getOrderStatus().equals("received") ? "selected" : ""%>>Received</option>
                            <option value="delivering" <%= o.getOrderStatus().equals("delivering") ? "selected" : ""%>>Delivering</option>
                            <option value="delivered" <%= o.getOrderStatus().equals("delivered") ? "selected" : ""%>>Delivered</option>
                        </select>

                        <div class="box-button mt-3">
                            <button type="submit" class="button button-update">
                                <span>แก้ไข Order</span>
                                <i class="bi bi-pencil-fill"></i>
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>                
    </body>
</html>

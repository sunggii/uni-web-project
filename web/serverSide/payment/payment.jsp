<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bean.CartItem" %>
<%
    // ตรวจสอบว่ามาจาก AJAX หรือไม่ (fetch/XHR จะตั้ง header X-Requested-With)
    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
%>

<% if (!isAjax) { %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/components/header/import.jsp"/>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
                crossorigin="anonymous">
        </script>

        <!----Navbar---->
        <jsp:include page="/components/navbar/navbar_user.jsp"/>
<% } %>

        <div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-body text-center">
            <%
                double total = (Double) session.getAttribute("grandTotal");
                
                String promptpayID = "0941485700"; // เบอร์พร้อมเพย์

                // เข้ารหัสลิงก์สำหรับสร้าง QR
                String qrURL = "https://promptpay.io/" + promptpayID + "/" + total;
            %>     

            <h2 class="mb-3 text-success">ขอบคุณสำหรับการสั่งซื้อ!</h2>
            <p class="mb-4">ระบบได้บันทึกรายการสั่งซื้อของคุณเรียบร้อยแล้ว</p>

            <h4 class="mb-3">ราคารวมทั้งหมด: 
                <span class="text-primary"><%= total %></span> บาท
            </h4>

            <form action="../../serverSide/payment/c-payment.jsp" method="post" class="text-center">
                <input name="amount" type="hidden" value="<%= total %>">

                <%
                    // กำหนดวันที่ชำระเป็นวันที่ปัจจุบัน (server-side) ในรูปแบบ ISO (YYYY-MM-DD)
                    String paymentDate = java.time.LocalDate.now().toString();
                %>

                <!-- ซ่อนฟิลด์วันที่: ระบบจะใส่วันที่ปัจจุบันให้โดยอัตโนมัติ -->
                <input type="hidden" name="date" value="<%= paymentDate %>">

                <!-- แสดงข้อความสั้น ๆ ให้ผู้ใช้ทราบวันที่ที่ระบบจะบันทึก -->
                <div class="mb-3">
                    <p class="mb-0 text-muted">วันที่ชำระ (ระบบกำหนด): <strong><%= paymentDate %></strong></p>
                </div>

                <div class="my-4">
<!--                    <img src="../../img/qr-code-pay.jpg" class="img-fluid rounded shadow-sm" 
                         alt="QR Code สำหรับชำระเงิน" style="max-width: 300px;">-->
                         <img src="<%= qrURL %>" 
                            class="img-fluid rounded shadow-sm" 
                            alt="QR Code สำหรับชำระเงิน" 
                            style="max-width: 300px;"
                        >
                </div>

                <button type="submit" class="btn btn-success w-100">ยืนยันชำระเงิน</button>
            </form>
        </div>
    </div>
</div>

        <br>
        <% if (!isAjax) { %>
            <jsp:include page="/components/footer/footer_user.jsp"/>  
        </body>
        </html>
        <% } %>
<%-- 
    Document   : viewCart
    Created on : Oct 23, 2025, 7:31:19 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bean.CartItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/components/header/import.jsp"/>
    </head>

    <body class="bg-light">
        <!----Navbar---->
        <jsp:include page="/components/navbar/navbar_user.jsp"/>

        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h2 class="mb-0">🛒 ตะกร้าสินค้าของคุณ</h2>
                        </div>
                        <div class="card-body">
                            <%
                                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                                if (cart == null || cart.isEmpty()) {

                                    // ป้องกันการเข้าถึงหน้านี้ถ้ายังไม่ได้ login
                                    String email = (String) session.getAttribute("email");
                                    if (email == null) {
                                        // เปลี่ยนไปหน้า login (context-rooted)
                                        out.println("<script>alert('📥️ คุณยังไม่ได้ login'); window.location='../login/login_form.jsp';</script>");
                                        return;
                                    }
                            %>
                            <div class="alert alert-info text-center" role="alert">
                                <h5>ยังไม่มีสินค้าในตะกร้า</h5>
                                <p class="mb-0">เริ่มเลือกซื้อสินค้าได้เลย!</p>
                            </div>
                            <% } else { %>
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead class="table-dark">
                                        <tr>
                                            <th class="text-center">ลำดับ</th>
                                            <th>สินค้า</th>
                                            <th class="text-end">ราคา/ชิ้น</th>
                                            <th class="text-center">จำนวน</th>
                                            <th class="text-end">ราคารวม</th>
                                            <th class="text-center">การทำงาน</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            double grandTotal = 0;
                                            for (int i = 0; i < cart.size(); i++) {
                                                CartItem item = cart.get(i);
                                                grandTotal += item.getTotal();
                                        %>
                                        <tr>
                                            <td class="text-center">
                                                <%= i + 1%>
                                            </td>
                                            <td>
                                                <strong><%= item.getProductName()%></strong>
                                            </td>
                                            <td class="text-end">
                                                ฿<%= String.format("%,.2f", item.getPrice())%>
                                            </td>
                                            <td class="text-center">
                                                <span class="badge bg-secondary"><%= item.getQuantity()%></span>
                                            </td>
                                            <td class="text-end text-primary">
                                                <strong>฿<%= String.format("%,.2f", item.getTotal())%></strong>
                                            </td>
                                            <td class="text-center">
                                                <form action="<c:url value='/removeFromCart'/>" method="post" style="display:inline;">
                                                    <!-- ส่ง index ที่จะลบ ( i ) -->
                                                    <input type="hidden" name="index" value="<%= i%>">
                                                    <button type="submit" class="btn btn-danger btn-sm">
                                                        🗑️ ลบ
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                    <tfoot>
                                        <tr class="table-light">
                                            <td colspan="4" class="text-end"><h5 class="mb-0">ราคารวมทั้งหมด:</h5></td>
                                            <td class="text-end">
                                                <h4 class="mb-0 text-success">฿<%= String.format("%,.2f", grandTotal)%></h4>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                            <% session.setAttribute("grandTotal", grandTotal); %>

                            <div class="d-flex justify-content-between mt-4">
                                <a href="../../index.jsp" class="btn btn-outline-secondary">
                                    ← กลับไปเลือกสินค้า
                                </a>
                                <form id="checkoutForm" action="<c:url value='/checkout'/>" method="post">
                                    <button type="submit" class="btn btn-success btn-lg">
                                        💳 ชำระเงิน
                                    </button>
                                </form>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
        <br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br>
        
        <!-- Modal สำหรับแสดงหน้า payment เป็น popup -->
        <div class="modal fade" id="paymentModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">การชำระเงิน</h5>
                        <!-- ปิดปุ่มปิดไว้ เพื่อป้องกันการปิด modal ก่อนกดยืนยันชำระ -->
                    </div>
                    <div class="modal-body" id="paymentModalBody">
                        <!-- เนื้อหาจะถูกเติมด้วย AJAX (payment.jsp fragment) -->
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/components/footer/footer_user.jsp"/>  
        <!-- Bootstrap 5 JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

       <script>
            document.addEventListener('DOMContentLoaded', function () {
                var form = document.getElementById('checkoutForm');

                form.addEventListener('submit', async function (e) {
                    e.preventDefault();
                    var url = form.getAttribute('action'); //อ่าน URL ที่ฟอร์มจะส่งไป (เช่น "/checkout")
                    var fd = new FormData(form);

                    try {
                        var resp = await fetch(url, {
                            method: 'POST',
                            headers: { 'X-Requested-With': 'XMLHttpRequest' },
                            body: fd
                        });

                        if (resp.ok) {
                            var html = await resp.text(); //เอาค่าที่ fetch มาใส่ตัวแปร
                            document.getElementById('paymentModalBody').innerHTML = html; //เอาค่าจกตัวแปรมาใส่ที่ ModalBody
                            var modalEl = document.getElementById('paymentModal');
                            // สร้าง modal แบบไม่สามารถปิดได้ด้วย backdrop หรือปุ่ม ESC
                            var modal = new bootstrap.Modal(modalEl, { backdrop: 'static', keyboard: false });
                            modal.show(); //เด้ง Modal
                        } else {
                            // ถ้าไม่สำเร็จ ให้ fallback ไปที่หน้า /checkout แบบปกติ (redirect)
                            window.location = url;
                        }
                    } catch (err) {
                        console.error(err);
                        window.location = url;
                    }
                });
            });
        </script>
    </body>
</html>

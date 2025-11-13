<%-- 
    Document   : home
    Created on : Sep 22, 2025, 3:39:35 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <jsp:include page="/components/header/import.jsp"/>
    <style>
        .header-title {
            font-size: 2.5rem;
            font-weight: 600;
            margin-bottom: 10px;
            text-align: center;
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }

        .menu-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 2rem;
            color: white;
            position: relative;
            transition: all 0.3s ease;
        }
        
        .color-icon {
               background: lightskyblue;
        }

        .menu-card:hover .menu-icon {
            transform: scale(1.1);
        }

        .menu-title {
            font-size: 1.4rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 15px;
        }

        .menu-description {
            color: #6c757d;
            text-align: center;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 0;
        }

 
        @media (max-width: 768px) {
            .header-title {
                font-size: 2rem;
            }

            .menu-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .menu-card {
                padding: 25px 20px;
            }
        }
    </style>
    
    </head>
    <body>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous">
        </script>
        
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->

    <div class="box">
        <!-- Header Section -->
        <div>
            <h1 class="header-title">
                ระบบจัดการร้าน Back Office
            </h1>
        </div>

        <!-- Stock -->
        <div class="menu-grid">
            <!-- Stock Management Card -->
            <a href="stock/r-stock-table.jsp"  class="frame-bg">
                <div class="menu-icon color-icon">
                    <i class="bi bi-boxes"></i>
                </div>
                <h3 class="menu-title">สินค้าในสต็อก</h3>
                <p class="menu-description">
                    ดูแลและจัดการข้อมูลสินค้า edit delete
                  
                </p>
            </a>

            <!-- Form Management Card -->
            <a href="stock/c-stock-form.jsp"  class="frame-bg">
                <div class="menu-icon color-icon">
                   <i class="bi bi-plus-circle"></i>
                </div>
                <h3 class="menu-title">เพิ่มสินค้าในสต็อก</h3>
                <p class="menu-description">
                     ดูแลและจัดการเพิ่มสินค้าในสต็อก
                </p>
            </a>
        </div>

        <!-- Order, Payment, Promotion-->
        <div class="menu-grid">
            <!-- Order -->
            <a href="order/view_order.jsp"  class="frame-bg">
                <div class="menu-icon color-icon">
                    <i class="bi bi-cart-fill"></i>
                </div>
                <h3 class="menu-title">จัดการการสั่งซื้อ (Order)</h3>
                <p class="menu-description">
                   ดูแลและจัดการข้อมูลการสั่งซื้อ
                </p>
            </a>

            <!-- Payment -->
            <a href="payment/r-payment-table.jsp"  class="frame-bg">
                <div class="menu-icon color-icon">
                    <i class="bi bi-credit-card-fill"></i>
                </div>
                <h3 class="menu-title">จัดการการชำระเงิน (Payment)</h3>
                <p class="menu-description">
                   ดูแลและจัดการข้อมูลการชำระเงิน
                </p>
            </a>

            <!-- Promotion-->
            <a href="promotion/r-promotion-table.jsp"  class="frame-bg">
                <div class="menu-icon color-icon">
                    <i class="bi bi-ticket-perforated-fill"></i>
                </div>
                <h3 class="menu-title">จัดการข้อมูลโปรโมชั่น (Promotion)</h3>
                <p class="menu-description">
                    ดูแลและจัดการข้อมูล Promotion
                </p>
            </a>
            
            
        </div>

         <!-- Register -->
        <div class="menu-grid">
            <!-- Form Management Card -->
            <a href="register/r-register-table.jsp"  class="frame-bg">
                <div class="menu-icon color-icon">
                   <i class="bi bi-people-fill"></i>
                </div>
                <h3 class="menu-title">จัดการบัญชี (Register)</h3>
                <p class="menu-description">
                    CRUD ดูแลและจัดการข้อมูลบัญชีของลูกค้าและพนักงาน
                </p>
            </a>
        </div>
                
        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>
    </div>
 
    </body>
</html>

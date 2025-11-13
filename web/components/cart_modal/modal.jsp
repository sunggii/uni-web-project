<%-- 
    Document   : modal
    Created on : Oct 27, 2025, 6:09:34 AM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* ซ่อนขอบของ input ทั้งหมด */
            .form-control.cart{
                border: none !important;
                box-shadow: none !important;
                outline: none !important;
                background: transparent;
                padding-left: 0;
            }
            .star{
                width: 100%;
                margin-top: 10px;
            }
            .star i{
                font-size: 20px;
            }
            #category{
                color: lightslategrey;
            }
            #name{
                font-size: 24px;
            }
            #price{
                font-size: 24px;
                font-weight: bold;
                width: 100%;
                padding-left: 120px;
            }
            .decrementBtn ,.incrementBtn{
                cursor: pointer;
                padding: 0 10px;
            }
            span.count-btn{
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

        </style>
    </head>
    <body>
        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_1" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/pen_pencil/1.jpg'/>" alt="ปากกาเพื่อนเขียน">
                                </div>

                                <div class="modal-text">
                                    <div class="card-body">
                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="ปากกาดินสอ"
                                               value="ปากกาดินสอ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="ปากกาเพื่อนเขียน"
                                               value="ปากกาเพื่อนเขียน"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>

                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="39.00"
                                                   value="39.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">

                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number" > 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป addTocart -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>
        
        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_2" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/pen_pencil/2.jpg'/>" alt="ดินสอเพื่อนเขียน">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="ปากกาดินสอ"
                                               value="ปากกาดินสอ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="ดินสอเพื่อนเขียน"
                                               value="ดินสอเพื่อนเขียน"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="12.00"
                                                   value="12.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">

                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="2">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_3" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/paper_notebook/1.jpg'/>" alt="กระดาษ note">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="สมุด & กระดาษ"
                                               value="สมุด & กระดาษ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="กระดาษ note"
                                               value="กระดาษ note"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="20.00"
                                                   value="20.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_4" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/paper_notebook/4.jpg'/>" alt="กระดาษ note">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="สมุด & กระดาษ"
                                               value="สมุด & กระดาษ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="กระดาษสี"
                                               value="กระดาษสี"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="10.00"
                                                   value="10.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_5" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/paper_notebook/3.jpg'/>" alt="กระดาษ A1">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="สมุด & กระดาษ"
                                               value="สมุด & กระดาษ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="กระดาษ A1"
                                               value="กระดาษ A1"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="22.00"
                                                   value="22.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_6" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/pen_pencil/4.jpg'/>" alt="กระเป๋าดินสอน้องหมี">
                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="ปากกาดินสอ"
                                               value="ปากกาดินสอ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="กระเป๋าดินสอน้องหมี"
                                               value="กระเป๋าดินสอน้องหมี"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="59.00"
                                                   value="59.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_7" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/pen_pencil/3.jpg'/>" alt="ดินสอไม้">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="ปากกาดินสอ"
                                               value="ปากกาดินสอ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="ดินสอไม้"
                                               value="ดินสอไม้"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="6.00"
                                                   value="6.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_8" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/paper_notebook/2.jpg'/>" alt="สมุดเพื่อนเขียน">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="สมุด & กระดาษ"
                                               value="สมุด & กระดาษ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="สมุดเพื่อนเขียน"
                                               value="สมุดเพื่อนเขียน"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="43.00"
                                                   value="43.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_9" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/color/1.jpg'/>" alt="สีไม้">
                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="วาดภาพระบายสี"
                                               value="วาดภาพระบายสี"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="สีไม้"
                                               value="สีไม้"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="59.00"
                                                   value="12.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>
        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_10" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/color/2.jpg'/>" alt="สีไม้เพื่อนเขียน">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="วาดภาพระบายสี"
                                               value="วาดภาพระบายสี"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="สีไม้เพื่อนเขียน"
                                               value="สีไม้เพื่อนเขียน"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="10.00"
                                                   value="69.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_11" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/pen_pencil/5.jpg'/>" alt="ดินสอกด">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="ปากกาดินสอ"
                                               value="ปากกาดินสอ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="ดินสอกด"
                                               value="ดินสอกด"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="22.00"
                                                   value="12.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_12" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/color/3.jpg'/>" alt="สีเทียน">
                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="วาดภาพระบายสี"
                                               value="วาดภาพระบายสี"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="สีเทียน"
                                               value="สีเทียน"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="59.00"
                                                   value="39.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_13" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/color/4.jpg'/>" alt="สีเมจิค">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="วาดภาพระบายสี"
                                               value="วาดภาพระบายสี"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="สีเมจิค"
                                               value="สีเมจิค"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="10.00"
                                                   value="35.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_14" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/pen_pencil/6.jpg'/>" alt="กระดาษ ปากกาลูกลื่น">

                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="ปากกาดินสอ"
                                               value="ปากกาดินสอ"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="ปากกาลูกลื่น"
                                               value="ปากกาลูกลื่น"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="22.00"
                                                   value="20.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <form action="addToCart" method="post" >
            <div class="modal fade" id="productModal_15" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">รายละเอียดสินค้า</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="ปิด"></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-box">
                                <div class="modal-img">
                                    <!-- แสดงรูปภาพ -->
                                    <img src="<c:url value='/img/color/5.jpg'/>" alt="สีน้ำแบบแห้ง">
                                </div>

                                <div class="modal-text">
                                    <div class="card-body">

                                        <input id="category" class="form-control cart" type="text" name="category" placeholder="วาดภาพระบายสี"
                                               value="วาดภาพระบายสี"
                                               aria-label="default input example">

                                        <input id="name" class="form-control cart" type="text" name="productName" placeholder="สีน้ำแบบแห้ง"
                                               value="สีน้ำแบบแห้ง"
                                               aria-label="default input example">

                                        <div class="card-text">
                                            <div class="star">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                            </div>


                                            <input id="price" class="form-control cart" type="text" name="price" placeholder="59.00"
                                                   value="55.00" aria-label="price input" readonly>
                                        </div>
                                        <br>

                                        <div class="box-count-button">
                                            <span class="button count-btn">
                                                <span class="decrementBtn"> - </span>
                                                <div class="number"> 1 </div>
                                                <span class="incrementBtn"> + </span>
                                            </span>
                                            <!-- ช่องซ่อนเพื่อส่งค่าไป database -->
                                            <input type="hidden" class="numberInput" name="quantity" value="1">
                                            <input type="hidden" name="product_id" value="3">

                                            <button type="submit" class="button">
                                                <span>Add to cart</span>
                                                <i class="bi bi-bag-plus-fill"></i>
                                            </button>
                                        </div>

                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <!------------------------>

        <script>
            // support multiple copies of this modal on the same page
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.box-count-button').forEach(function (container) {
                    const decrementBtn = container.querySelector('.decrementBtn');
                    const incrementBtn = container.querySelector('.incrementBtn');
                    const numberDisplay = container.querySelector('.number');
                    const numberInput = container.querySelector('.numberInput');

                    if (!decrementBtn || !incrementBtn || !numberDisplay || !numberInput) return;

                    // per-instance value
                    let value = parseInt(numberDisplay.textContent.trim(), 10) || 1;
                    const MIN = 1;
                    const MAX = parseInt(numberInput.getAttribute('max'), 10) || 9999;

                    function render() {
                        numberDisplay.textContent = ' ' + value + ' ';
                        numberInput.value = value;
                    }

                    function change(delta) {
                        const next = value + delta;
                        if (next < MIN || next > MAX) return;
                        value = next;
                        render();
                    }

                    // click handlers
                    decrementBtn.addEventListener('click', function (e) { e.preventDefault(); change(-1); });
                    incrementBtn.addEventListener('click', function (e) { e.preventDefault(); change(1); });

                    // keyboard support
                    [decrementBtn, incrementBtn].forEach(function (el) {
                        el.setAttribute('tabindex', '0');
                        el.addEventListener('keydown', function (ev) {
                            if (ev.key === 'Enter' || ev.key === ' ') {
                                ev.preventDefault();
                                el.click();
                            }
                        });
                    });

                    numberDisplay.addEventListener('mousedown', function (e) { e.preventDefault(); });

                    render();
                });
            });
        </script>
    </body>
</html>

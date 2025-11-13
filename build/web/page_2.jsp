<%-- 
    Document   : page_2
    Created on : Oct 26, 2025, 2:13:41 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/components/header/import.jsp"/>
    </head>
    <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous">
        </script>

    <!----Product Modal---->
    <jsp:include page="/components/cart_modal/modal.jsp"/>

    <!----Navbar---->
    <jsp:include page="/components/navbar/navbar_user.jsp"/>
    
    <!-----สินค้าทั้งหมด------>
    <div class="box">
        <div class="box-head">
            <h3>
                สินค้าทั้งหมด
            </h3>
        </div>

        <!--coppy-->
        <div class="box-card">
            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_7"> 
                    <img src="img/pen_pencil/3.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">ปากกาดินสอ</span>
                    <h5>ดินสอไม้</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                        </div>

                        <h4>6.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_8"> 
                    <img src="img/paper_notebook/2.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">สมุด & กระดาษ</span>
                    <h5>สมุดเพื่อนเขียน</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                        </div>

                        <h4>43.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_9"> 
                    <img src="img/color/1.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">วาดภาพระบายสี</span>
                    <h5>สีไม้</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>12.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

        </div>

        <div class="box-card">
            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_10"> 
                    <img src="img/color/2.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">วาดภาพระบายสี</span>
                    <h5>สีไม้เพื่อนเขียน</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>69.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_11"> 
                    <img src="img/pen_pencil/5.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">ปากกาดินสอ</span>
                    <h5>ดินสอกด</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>12.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_12"> 
                    <img src="img/color/3.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">วาดภาพระบายสี</span>
                    <h5>สีเทียน</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>39.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

        </div>

        <div class="box-card">
            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_13"> 
                    <img src="img/color/4.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">วาดภาพระบายสี</span>
                    <h5>สีเมจิค</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>35.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_14"> 
                    <img src="img/pen_pencil/6.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">ปากกาดินสอ</span>
                    <h5>ปากกาลูกลื่น</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>20.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_15"> 
                    <img src="img/color/5.jpg"
                    class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">วาดภาพระบายสี</span>
                    <h5>สีน้ำแบบแห้ง</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>55.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <a href="#" class="button">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </div>
    </div>
    <!--------------------->

    <!-----page------>
    <div class="box">
        <div class="box-page">
            <div class="left">
                <a href="<c:url value='/index.jsp'/>">
                    <i class="bi bi-arrow-left-square-fill"></i>
                </a>
            </div>

            <div class="box-page-num">
                <a href="<c:url value='/index.jsp'/>">
                    <i class="bi bi-1-square-fill"></i>
                </a>
                <a onclick="goToPage_2()">
                    <i class="bi bi-2-square-fill"></i>
                </a>
            </div>

            <div class="right">
                <a href="<c:url value='/index.jsp'/>">
                    <i class="bi bi-arrow-right-square-fill"></i>
                </a>
            </div>
        </div>
    </div>
    <!--------------->

    <jsp:include page="/components/footer/footer_user.jsp"/>  
    
    <!-- Script -->
   <script src="index.js"></script>
    </body>
</html>

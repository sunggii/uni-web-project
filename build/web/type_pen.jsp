<%-- 
    Document   : type_pen
    Created on : Oct 26, 2025, 2:22:30 PM
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

        <!--nav-->
        <jsp:include page="/components/navbar/navbar_user.jsp"/>

        <!-- content -->
        <div class="box">
            <h2>
                <i class="bi bi-caret-right-fill"></i>
                ปากกาดินสอ
            </h2>
            <div class="box-item frame">
                <div class="box-item-img">
                    <img src="<c:url value='/img/pen_pencil/1.jpg'/>" alt="ปากกาเพื่อนเขียน">
                </div>

                <div class="box-item-text">
                    <span class="type">ปากกาดินสอ</span>
                    <h4>ปากกาเพื่อนเขียน</h4>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h2>39.00฿</h2>
                    </div>


                    <div class="box-count-button-typy">
                        <a href="#" class="button" id="count-btn">
                            <span id="count-btn"> - </span>
                            <div id="count"> 1 </div>
                            <span id="count-btn"> + </span>
                        </a>

                        <a href="#" class="button" data-bs-toggle="modal" data-bs-target="#productModal_1">
                            <span>Add to cart</span>
                            <i class="bi bi-bag-plus-fill"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
        <!-------->

        <div class="box">
            <!--coppy-->
            <div class="box-card">
                <div class="card" style="width: 20rem;">
                    <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_2">
                        <img src="<c:url value='/img/pen_pencil/2.jpg'/>" class="card-img-top" alt="..." title="click for more">
                    </a>

                    <div class="card-body">
                        <span class="type">ปากกาดินสอ</span>
                        <h5>ดินสอเพื่อนเขียน</h5>
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
                    <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_7">
                        <img src="<c:url value='/img/pen_pencil/3.jpg'/>" class="card-img-top" alt="..." title="click for more">
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
                    <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_6">
                        <img src="<c:url value='/img/pen_pencil/4.jpg'/>" class="card-img-top" alt="..." title="click for more">
                    </a>
                    <div class="card-body">
                        <span class="type">ปากกาดินสอ</span>
                        <h5>กระเป๋าดินสอน้องหมี</h5>
                        <div class="card-text">
                            <div class="star">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>

                            <h4>59.00฿</h4>
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

            <div class="box-card-2">
                <div class="card" style="width: 20rem;">
                    <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_11">
                        <img src="<c:url value='/img/pen_pencil/5.jpg'/>" class="card-img-top" alt="..." title="click for more">
                    </a>
                    <div class="card-body">
                        <span class="type">ปากกาดินสอ</span>
                        <h5>ดินสอกด</h5>
                        <div class="card-text">
                            <div class="star">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                            </div>

                            <h4>15.00฿</h4>
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
                        <img src="<c:url value='/img/pen_pencil/6.jpg'/>" class="card-img-top" alt="..." title="click for more">
                    </a>
                    <div class="card-body">
                        <span class="type">ปากกาดินสอ</span>
                        <h5>ปากกาเจล</h5>
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

            </div>
        </div>
        <!--------------------->

        <jsp:include page="/components/footer/footer_user.jsp"/>

        <!-- Script -->
        <script src="index.js"></script>

    </body>
</html>

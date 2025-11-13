<%-- 
    Document   : index.jsp
    Created on : Sep 23, 2025, 6:50:56 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- SEO -->
        <meta name="keywords" content="shopping, online store, discounts, เครื่องเขียน ออนไลน์, อุปกรณ์เครื่องเขียน, สมุด, ปากกา, ดินสอ, กระดาษ">        
        <jsp:include page="/components/header/import.jsp"/>

        <%-- ตรวจสถานะการล็อกอินเพื่อควบคุมปุ่ม Add to cart --%>
        <%
            boolean loggedIn = session.getAttribute("email") != null;
        %>
        
        <style>
            #decrementBtn, #incrementBtn{
                font-size: 18px;
                padding: 0px 10px;
            }

            #decrementBtn, #incrementBtn, #view:hover{
                cursor: pointer;
            }
        </style>

    </head>
    <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
        crossorigin="anonymous">
    </script>
<!--    <a href="serverSide/home.jsp">test</a>-->
    <!----Product Modal---->
    <jsp:include page="/components/cart_modal/modal.jsp"/>

    <!-- Modal ส่วนลด -->
    <jsp:include page="/components/modal/modal_ticket.jsp"/>
    
    <!----Navbar---->
    <jsp:include page="/components/navbar/navbar_user.jsp"/>

    <!----Carousel---->
    <div id="carouselExampleCaptions" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/color/1.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Welcome 🙋‍♀️</h5>
                    <h3 id="loadCount"></h3> <!-- นับคนเข้าเว็บ-->
                    <p>เลือกซื้อสินค้าคุณภาพมากมาย ราคาเป็นมิตรได้แล้วตอนนี้ !</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/paper_notebook/2.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>🔊 ส่วนลด 10% </h5>
                    <p>คูปองเฉพาะคุณเท่านั้น สำหรับการซื้อของครั้งแรกรับส่วนลด 10% ตอนนี้
                        <button type="button" class="btn btn-primary" 
                                data-bs-toggle="modal" data-bs-target="#promotion">
                                เก็บคูปอง
                        </button>
                    </p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/paper_notebook/3.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Online shopping🛒</h5>
                    <p>เพลิดเพลินไปกับการเลือกซื้ออุปกรณ์เครื่องเขียนแบบอนนไลน์ สะดวก ปลอดภัย คุ้มราคา</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <!---------------->

    <!-----สินค้าแนะนำ------>
    <div class="box">
        <div class="box-recoment">
            <div class="box-text">
                <h2>สินค้าแนะนำ</h2>
                <p>สินค้าแนะนำจะเป็นสินค้าจากแบรนด์ เพื่อนเขียน ซึ่งเป็นแบรรด์ของทางร้าน
                    รับประกันคุณภาพ ✅
                    สามารถเลือกดูสินค้าจาดแบรนด์เพื่อนเขียนเพิ่มเติมได้ที่ สินค้าทั้งหมด > สินค้าแบรนด์เพื่อนเขียน
                </p>

                <br>
                <ol class="list-group list-group-numbered">
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <a href="#">
                                <div class="fw-bold">ปากกาดินสอ</div>
                                สินค้าทั้งหมด 2 รายการ
                            </a>
                        </div>
                        <a href="#"><span class="badge text-bg-primary rounded-pill">2</span></a>
                    </li>

                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <a href="#">
                                <div class="fw-bold">สมุด & กระดาษ</div>
                                สินค้าทั้งหมด 1 รายการ
                            </a>
                        </div>
                        <a href="#"><span class="badge text-bg-primary rounded-pill">1</span></a>
                    </li>

                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <a href="#">
                                <div class="fw-bold">อุปกรณ์วาดภาพระบายสี</div>
                                สินค้าทั้งหมด 1 รายการ
                            </a>
                        </div>
                        <a href="#"><span class="badge text-bg-primary rounded-pill">1</span></a>
                    </li>
                </ol>
            </div>

            <div class="box-product">
                <div class="box-card">
                    <div class="card" style="width: 20rem;">
                        
                        <!-- เชื่อม modal -->
                        <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_1"> 
                            <img src="https://cdn.pixabay.com/photo/2014/02/21/00/02/fountain-pen-270974_1280.jpg"
                                class="card-img-top" alt="ปากกาเพื่อนเขียน" title="click for more">
                        </a>

                        <div class="card-body">
                            <span class="type">ปากกาดินสอ</span>
                            <h5>ปากกาเพื่อนเขียน</h5>
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
                                <% if (loggedIn) { %>
                                    <a href="#" class="button" data-bs-toggle="modal" data-bs-target="#productModal_1">
                                        <span>Add to cart</span>
                                        <i class="bi bi-bag-plus-fill"></i>
                                    </a>
                                <% } else { %>
                                    <button type="button" class="button btn btn-secondary" 
                                            onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                        <span>Add to cart</span>
                                        <i class="bi bi-bag-plus-fill"></i>
                                    </button>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <div class="card" style="width: 20rem;">
                        <a href="#"  data-bs-toggle="modal" data-bs-target="#productModal_2">
                            <img src="https://cdn.pixabay.com/photo/2024/01/04/14/27/write-8487618_1280.jpg"
                                class="card-img-top" alt="ดินสอเพื่อนเขียน" title="click for more">
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
                                <% if (loggedIn) { %>
                                    <a href="#" class="button" data-bs-toggle="modal" data-bs-target="#productModal_2">
                                        <span>Add to cart</span>
                                        <i class="bi bi-bag-plus-fill"></i>
                                    </a>
                                <% } else { %>
                                    <button type="button" class="button btn btn-secondary" 
                                            onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                        <span>Add to cart</span>
                                        <i class="bi bi-bag-plus-fill"></i>
                                    </button>
                                <% } %>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <!-------------------->

    <!-----สินค้าทั้งหมด------>
    <div class="box">
        <div class="box-head">
            <h2>
                สินค้าทั้งหมด
            </h2>
        </div>

        <!--coppy-->
        <div class="box-card">
            <div class="card" style="width: 20rem;">
                <a href="#"  data-bs-toggle="modal" data-bs-target="#productModal_1">
                    <img src="img/pen_pencil/1.jpg" class="card-img-top" alt="..." title="click for more">
                </a>

                <div class="card-body">
                    <span class="type">ปากกาดินสอ</span>
                    <h5>ปากกาเพื่อนเขียน</h5>
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
                        <% if (loggedIn) { %>
                            <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_1" class="button">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </a>
                        <% } else { %>
                            <button type="button" class="button btn btn-secondary" 
                                    onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        <% } %>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_3">
                    <img src="img/paper_notebook/1.jpg" class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">สมุด & กระดาษ</span>
                    <h5>กระดาษ note</h5>
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
                        <% if (loggedIn) { %>
                            <a href="#" class="button" data-bs-toggle="modal" data-bs-target="#productModal_3">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </a>
                        <% } else { %>
                            <button type="button" class="button btn btn-secondary" 
                                    onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        <% } %>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#"  data-bs-toggle="modal" data-bs-target="#productModal_2">
                    <img src="img/pen_pencil/2.jpg" class="card-img-top" alt="..." title="click for more">
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
                        <% if (loggedIn) { %>
                            <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_2" class="button">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </a>
                        <% } else { %>
                            <button type="button" class="button btn btn-secondary" 
                                    onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="box-card">
            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_4">
                    <img src="img/paper_notebook/4.jpg" class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">สมุด & กระดาษ</span>
                    <h5>กระดาษสี</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>10.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <% if (loggedIn) { %>
                            <a href="#" class="button" data-bs-toggle="modal" data-bs-target="#productModal_4">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </a>
                        <% } else { %>
                            <button type="button" class="button btn btn-secondary" 
                                    onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        <% } %>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_5"> 
                    <img src="img/paper_notebook/3.jpg" class="card-img-top" alt="..." title="click for more">
                </a>
                <div class="card-body">
                    <span class="type">สมุด & กระดาษ</span>
                    <h5>กระดาษ A1</h5>
                    <div class="card-text">
                        <div class="star">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>

                        <h4>22.00฿</h4>
                    </div>
                    <br>
                    <div class="box-button">
                        <% if (loggedIn) { %>
                            <a href="#" class="button" data-bs-toggle="modal" data-bs-target="#productModal_5">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </a>
                        <% } else { %>
                            <button type="button" class="button btn btn-secondary" 
                                    onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        <% } %>
                    </div>

                </div>
            </div>

            <div class="card" style="width: 20rem;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#productModal_6"> 
                    <img src="img/pen_pencil/4.jpg" class="card-img-top" alt="..." title="click for more">
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
                        <% if (loggedIn) { %>
                            <a href="#" class="button" data-bs-toggle="modal" data-bs-target="#productModal_6">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </a>
                        <% } else { %>
                            <button type="button" class="button btn btn-secondary" 
                                    onclick="window.location='<%= request.getContextPath() %>/clientSide/login/login_form.jsp'">
                                <span>Add to cart</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        <% } %>
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
                <a href="<c:url value='/page_2.jsp'/>">
                    <i class="bi bi-2-square-fill"></i>
                </a>
            </div>

            <div class="right">
                <a href="<c:url value='/page_2.jsp'/>">
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

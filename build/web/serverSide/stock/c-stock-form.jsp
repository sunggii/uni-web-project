<%-- 
    Document   : c-stock-form
    Created on : Sep 12, 2025, 4:37:25 PM
    Author     : nur
--%>

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

        </style>
    </head>
    <body>
        <!--nav-->
        <jsp:include page="/components/navbar/navbar_emp.jsp"/>
        <!-------->

        <div class="box">
            <h1 class="header-title">
                เพิ่มสินค้า
            </h1>
        </div>

        <!-- create -->
        <div class="box">
            <div class="item-box" id="cerate">
                <div class="frame-bg">
                    <h1>Insert</h1>
                    <form action="/my_project/Create_stock" method="post" enctype="multipart/form-data">

                        name:
                        <input class="form-control" type="text" name="name" placeholder="Default input"
                               aria-label="default input example"
                               oninput="this.value = this.value.replace(/[0-9]/g, '')">

                        category:
                        <input class="form-control" type="text" name="category" placeholder="Default input"
                               aria-label="default input example"
                               oninput="this.value = this.value.replace(/[0-9]/g, '')">

                        brand:
                        <input class="form-control" type="text" name="brand" placeholder="Default input"
                               aria-label="default input example"
                               oninput="this.value = this.value.replace(/[0-9]/g, '')">

                        price:
                        <input class="form-control" type="text" name="price" placeholder="Default input"
                               aria-label="default input example">

                        <div class="mb-3">
                            <label for="formFile" class="form-label"></label>
                            <input class="form-control" type="file" id="formFile" name="photo">
                        </div>

                        <div class="box-button">
                            <button type="submit" class="button button-insert">
                                <span>เพิ่มสินค้า</span>
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!------------->

        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>
    </body>
</html>

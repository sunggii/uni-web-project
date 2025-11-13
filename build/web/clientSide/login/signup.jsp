<%-- 
    Document   : signup
    Created on : Oct 26, 2025, 2:45:49 PM
    Author     : nur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/components/header/import.jsp"/>
        
            <style>
        body {
            background-color: lightskyblue;
        }

        h3 {
            margin-left: 38%;

        }

        .box-login {
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .box-login-item {
            width: 50%;
        }

        .box-login-item a:hover {
            color: rgb(80, 157, 251);
        }

        .login-signup {
            margin-left: 40%;
            margin-top: 4px;
        }

        .frame-login {
            margin: 20px 0;
            padding: 40px;
            background: #fff;
            border-radius: 15px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(111, 111, 111, 0.497);
        }
    </style>
    
    </head>
    <body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous">
        </script>
        
        <div class="box">
            <div class="box-login">
                <div class="box-login-item frame-login" >
                    <form action="../../serverSide/register/c-register.jsp">
                        <h3>ลงทะเบียน</h3>
                        <br>
                        <div class="mb-3 row">
                            <label for="inputPassword" class="form-label">Name</label>
                            <div class="col-sm">
                                <input 
                                    type="text" 
                                    class="form-control"  
                                    name="name"
                                    oninput="this.value = this.value.replace(/[0-9]/g, '')"
                                >
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="inputPassword" class="form-label">Surname</label>
                            <div class="col-sm">
                                <input 
                                    type="text" 
                                    class="form-control"  
                                    name="surname"
                                    oninput="this.value = this.value.replace(/[0-9]/g, '')"
                                >
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="inputPassword" class="form-label">Address</label>
                            <div class="col-sm">
                                <input type="text" class="form-control"  name="address">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Email address</label>
                            <div class="col-sm">
                                <input type="email" class="form-control" id="exampleFormControlInput1"
                                       placeholder="name@example.com" name="email">
                            </div>
                        </div>
                        
                        <div class="mb-3 row">
                            <label for="inputPassword" class="form-label">Password</label>
                            <div class="col-sm">
                                <input type="password" class="form-control" id="inputPassword" name="password">
                            </div>
                        </div>
                        
                        <div class="box-button">
                            <button type="submit" class="button ">
                                <span>ลงทะเบียน</span>
                                <i class="bi-box-arrow-in-down"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

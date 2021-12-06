<%--
  Created by IntelliJ IDEA.
  User: MacWolfstarr
  Date: 5/14/2021
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TR Education</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css"/>
    <script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
    <script src="dist-assets/scripts/Main.js"></script>
    <script src="dist-assets/scripts/Month.js"></script>
    <script src="dist-assets/scripts/Classes.js"></script>
    <script src="dist-assets/scripts/Institute.js"></script>
    <script src="dist-assets/scripts/Student.js"></script>
    <script src="dist-assets/scripts/Cookies.js"></script>
    <script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
    <script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>

</head>
<div class="auth-layout-wrap" style="background-image: url(dist-assets/images/Login_Home.jpg);" >
    <div class="auth-content">
        <div class="row">
            <div class="col-lg-3 col-1">
            </div>
            <div class="col-lg-6 col-10" style="padding: unset">
                <div class="card o-hidden">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="p-4">
                                <div class="auth-logo text-center "><img src="dist-assets/images/logo.jpg" style="width:160px; height: auto"  alt=""></div>
                                <h1 class="mb-3 text-18" style="text-align: center;">You Have Registered Successfully</h1>


                                    <div class="form-group" style="text-align: center">
                                        <span class="badge badge-pill badge-outline-success p-2 m-1" >Your Student ID Is : <span id="CreatedStudentId"></span></span>
                                    </div>
                                    <div class="form-group">
<%--                                        <div class="col-md-12 col-12" style="text-align: center">--%>
<%--                                            <% if(request.getAttribute("ErrorMessage")!= null){%>--%>
<%--                                            <span id="ErrorMessage" style="color: red"><%=request.getAttribute("ErrorMessage")%></span>--%>
<%--                                            <%}%>--%>
<%--                                            <% if(request.getAttribute("SuccessMessag")!= null){%>--%>
<%--                                            <span id="SuccessMessage" style="color: green"><%=request.getAttribute("SuccessMessage")%></span>--%>
<%--                                            <%}%>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="form-group">
                                        <label for="Password">Enter A Password</label>
                                        <input class="form-control form-control-rounded" id="Password" name="Password" type="text" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="RePassword">Re Enter Your Password</label>
                                        <input class="form-control form-control-rounded" id="RePassword" name="RePassword" type="password" required>
                                    </div>
                                    <button class="btn btn-success btn-rounded btn-block mt-3" onclick="SetPassword()">Submit</button>

                                <div class="mt-2 text-center"><a class="text-muted" href="login.jsp">
                                    <u>Already Registered?</u></a></div>
                                <div class="mt-3 text-center"><span>
                                    Creative Education | © 2021 All Rights Reserved</span></div>


                            </div>
                            <%--                                <div class="auth-logo text-center "><img src="dist-assets/images/LogoMobiOs.png" style="width: auto; height: auto"  alt=""></div>--%>

                        </div>
                    </div>

                </div>

            </div>
        </div>
        <div class="col-lg-3">

        </div>

    </div>

</div>
</div>
<script>
    let StudentId = getCookie("StudentId");
    document.getElementById("CreatedStudentId").innerHTML =  StudentId ;
</script>
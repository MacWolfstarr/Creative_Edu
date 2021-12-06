<%--
  Created by IntelliJ IDEA.
  User: MacWolfstarr
  Date: 5/14/2021
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    session.removeAttribute("User");
    session.invalidate();
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Creative Education</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">

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
                                <h1 class="mb-3 text-18" style="text-align: center;">TR Education Student Management System</h1>
                                <%if(request.getAttribute("errorMessage") != null){ %>
                                <div id="errDisplay" style="text-align: center; color:red">
                                    <p><%=request.getAttribute("errorMessage") %></p>
                                </div>
                                <%} %>
                                <%if(request.getAttribute("SuccessMessage") != null){ %>
                                <div id="errDisplay" style="text-align: center; color:green">
                                    <p><%=request.getAttribute("SuccessMessage") %></p>
                                </div>
                                <%} %>
                                <form action="Login" method="post">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input class="form-control form-control form-control-rounded" id="Username" name="Username" type="text" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input class="form-control form-control form-control-rounded" id="Password" name="Password" type="password" required>
                                    </div>
                                    <button class="btn btn-success btn-rounded btn-block mt-3" data-toggle="tooltip" data-placement="right" title="" data-original-title="Tooltip on right">Login</button>
                                </form>
                                <div class="mt-2 text-center"><a class="text-muted" href="RegisterStudent.jsp" >
                                    <u>Register Student</u></a></div>
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
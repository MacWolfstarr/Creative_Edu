<%@ page import="com.example.Creative_Institute.QueryController.Student" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="">
    <%
      if (session.getAttribute("Student") != null) {

    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

%>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Creative Education</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/datatables.min.css"/>
    <style>
        .text-white {
            color: #000000 !important;
            font-weight: bold;
        }
    </style>
    <script src="dist-assets/scripts/Main.js"></script>
    <script src="dist-assets/scripts/Cookies.js"></script>
    <script src="dist-assets/scripts/Month.js"></script>
    <script src="dist-assets/scripts/Classes.js"></script>
    <script src="dist-assets/scripts/Institute.js"></script>
    <script src="dist-assets/scripts/Student.js"></script>
    <script src="dist-assets/scripts/CreateClassId.js"></script>
    <script>
        setCookie("StudentId", '<%=session.getAttribute("Student")%>');
    </script>
</head>

<body class="text-left">
<div class="app-admin-wrap layout-sidebar-large">
    <div class="main-header">
        <div class="logo">
            <img src="dist-assets/images/d_logo.png" style="width: auto;" alt="">
        </div>
        <div class="menu-toggle">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <div class="d-flex align-items-center">
            <!-- Mega menu -->

            <!-- / Mega menu -->

        </div>
        <div style="margin: auto"></div>
        <div class="header-part-right">
            <!-- Full screen toggle -->
            <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen></i>
            <!-- Grid menu Dropdown -->

            <!-- Notificaiton -->

            <!-- Notificaiton End -->
            <!-- User avatar dropdown -->
            <div class="dropdown">
                <div class="user col align-self-end">
                    <img src="dist-assets/images/faces/1.jpg" id="userDropdown" alt="" data-toggle="dropdown"
                         aria-haspopup="true" aria-expanded="false">
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <div class="dropdown-header">
                            <i class="i-Lock-User mr-1"></i><%=session.getAttribute("Student")%>
                            <%--                            <span id="LoggedUser" hidden><%=request.getAttribute("Student")%></span>--%>
                        </div>
                        <a class="dropdown-item" href="login.jsp">Sign out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="side-content-wrap">
        <%@include file="StudentHeader.jsp" %>
    </div>
    <!-- =============== Left side End ================-->
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <!-- ============ Body content start ============= -->
        <div class="main-content">
            <div class="breadcrumb">
                <h1 class="mr-2">My Classes</h1>
                <ul>
                    <li><a href="">Dashboard</a></li>
                    <li>Creative Education</li>
                </ul>
            </div>
            <div class="separator-breadcrumb border-top"></div>

            <%@include file="StudentMainCards.jsp" %>

            <!-- end of main-content -->
        </div><!-- Footer Start -->
        <div class="flex-grow-1"></div>
        <div class="app-footer">
            <%@include file="footer.jsp" %>
        </div>
        <!-- fotter end -->
    </div>
</div><!-- ============ Search UI Start ============= -->


<div class="modal fade" id="UploadZoomLink" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle-2">Upload Payment Slip</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12">

                    <form id="contactForm1" method="post">
                        <div class="form-group row">
                            <div class="col-lg-6 mt-2">
                                <input id="singleFileUploadInput" type="file" name="file" class="file-input" required/>
                            </div>
                            <div class="col-lg-6 mt-2">
                                <input class="btn btn-primary" type="submit" value="Upload" required/>
                            </div>
                        </div>

                        <input id="UniqueClassId" type="text" name="UniqueClassId" required hidden/>
                        <input id="StudentId" type="text" name="StudentId" required hidden/>

                    </form>
                </div>

            </div>


        </div>
    </div>
</div>

<!-- ============ Search UI End ============= -->
<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/echarts.min.js"></script>
<script src="dist-assets/js/scripts/echart.options.min.js"></script>
<script src="dist-assets/js/scripts/dashboard.v1.script.min.js"></script>
<script src="dist-assets/js/scripts/customizer.script.min.js"></script>
<script src="dist-assets/js/plugins/datatables.min.js"></script>
<script src="dist-assets/js/scripts/datatables.script.min.js"></script>
<script src="dist-assets/js/plugins/apexcharts.min.js"></script>
<script src="dist-assets/js/plugins/apexcharts.dataseries.js"></script>
<script src="dist-assets/js/scripts/apexPieDonutChart.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>


<script>
    $(document).ready(function () {
        GetStudentClasses();
    });
</script>
<script type="text/javascript">
    $('#contactForm1').submit(function (event) {
        var formElement = this;
        // You can directly create form data from the form element
        // (Or you could get the files from input element and append them to FormData as we did in vanilla javascript)
        var formData = new FormData(formElement);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: _BaseUrl + 'uploadFile',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response === "success") {
                    swal({
                        type: 'success',
                        title: 'Success',
                        text: 'Payment Slip Has Been Uploaded. Your Teacher Will Verified It ASAP',
                        buttonsStyling: false,
                        confirmButtonText: 'OK',
                        confirmButtonClass: 'btn btn-lg btn-success'
                    })
                } else {
                    swal({
                        type: 'error',
                        title: 'Error',
                        text: 'Something Went Wrong! Please Try Again!',
                        buttonsStyling: false,
                        confirmButtonText: 'OK',
                        confirmButtonClass: 'btn btn-lg btn-danger'
                    })
                }
            },
            error: function (error) {
                console.log(error);
                // process error
            }
        });

        event.preventDefault();
    });
</script>
<script>
    function Alert() {
        swal({
            imageUrl: 'dist-assets/images/404.png',
            title: 'Sorry!',
            text: 'This Function Not Available Yet',
            buttonsStyling: false,
            confirmButtonText: 'OK',
            confirmButtonClass: 'btn btn-lg btn-warning'
        })
    }
</script>
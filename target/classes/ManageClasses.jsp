<%@ page import="com.example.Creative_Institute.QueryController.Analytics" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="">
<%
    if (session.getAttribute("Teacher") != null) {

    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>TR Education</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css"/>
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/datatables.min.css"/>
<style>
    .text-white{
        color: #000000 !important;
        font-weight: bold;
    }

</style>
    <script src="dist-assets/scripts/Main.js"></script>
    <script src="dist-assets/scripts/Month.js"></script>
    <script src="dist-assets/scripts/Classes.js"></script>
    <script src="dist-assets/scripts/Institute.js"></script>
    <script src="dist-assets/scripts/Meetings.js"></script>
    <script src="dist-assets/scripts/CreateClassId.js"></script>
</head>

<body class="text-left" >
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
                            <i class="i-Lock-User mr-1"></i>Admin
                        </div>
                        <a class="dropdown-item" href="login.jsp">Sign out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="side-content-wrap">

        <%@include file="TeacherHeader.jsp" %>

        <div class="sidebar-overlay"></div>
    </div>
    <!-- =============== Left side End ================-->
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <!-- ============ Body content start ============= -->
        <div class="main-content">
            <div class="breadcrumb">
                <h1 class="mr-2">Manage Classes</h1>
                <ul>
                    <li><a href="">Dashboard</a></li>
                    <li>Creative Institute</li>
                </ul>
            </div>
            <div class="separator-breadcrumb border-top"></div>
            <div class="row">
                <!-- ICON BG-->
                <%@include file="MainCards.jsp" %>
            </div>

            <div class="row ">

                <div class="col-md-9 order-md-1">
                    <div class="separator-breadcrumb border-top"></div>
                    <div class="row" id="MyClassesCards">

                    </div>
                </div>
                <div class="col-md-3 order-md-2">
                    <div class="row">

                        <div class="col-lg-12 col-sm-12">
                            <div class="card mb-4 o-hidden"><img class="card-img-top"
                                                                 src="dist-assets/images/add_class.jpg" alt="">
                                <div class="card-body">
                                    <button class="btn btn-success btn-icon m-1" type="button" data-toggle="modal"
                                            data-target="#CreateNewClass"><span class="ul-btn__icon"
                                                                                onclick="GetInstituteInfo()">Add New Class</span>
                                    </button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- end of main-content -->
        </div><!-- Footer Start -->
        <div class="flex-grow-1"></div>
        <div class="app-footer">
            <%@include file="footer.jsp" %>
        </div>
        <!-- fotter end -->
    </div>
</div><!-- ============ Search UI Start ============= -->

<div class="customizer">
    <div class="handle"><i class="i-Bell1 spin"></i></div>
    <div class="customizer-body" data-perfect-scrollbar="" data-suppress-scroll-x="true">
        <div class="accordion" id="accordionCustomizer">
            <div class="card">
                <div class="card-header" id="headingOne">
                    <p class="mb-0">Today's Classes</p>
                </div>
                <div class="col-lg-12 col-sm-12">
                    <div class="ul-widget__body">
                        <div class="tab-content">
                            <div class="tab-pane active show" id="__g-widget4-tab1-content">
                                <div class="ul-widget1" id="TodayMyClasses">

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <!-- <p class="mb-0">RTL</p> -->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="UploadZoomLink" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle-3">Edit Your Class | <a data-toggle="modal" data-target="#SaveRecordsLink" style="color: #1f3295; cursor: pointer" class="text-10" onclick="GetMeetingRecordsInfo()">Add Records Links</a></h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="form-group row">

                        <div class="col-md-8 col-8">
                            <input class="form-control" type="text" placeholder="Enter Student Id" id="AddCustomStudent">
                        </div>
                        <div class="col-md-4 col-4" style="padding-left: unset">
                            <label class="col-form-label" for="AddCustomStudent">&nbsp;</label>
                            <button class="btn btn-info btn-icon" type="button" onclick="EnterCustomStudentToClass()"><span class="ul-btn__icon"><i class="i-Add-User"></i></span></button>
                        </div>

                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="UpdateClassName">Class Name</label>
                            <input type="text" class="form-control" id="UpdateClassName" name="UpdateClassName"
                                   readonly/>
                        </div>
                        <div class="col-sm-6" hidden>
                            <input type="text" class="form-control" id="UpdateClassId" name="UpdateClassId" readonly/>
                        </div>
                        <div class="col-sm-6" hidden>
                            <input type="text" class="form-control" id="UpdateUniqueClassId" name="UpdateUniqueClassId"
                                   readonly/>
                        </div>
                        <div class="col-sm-6">
                            <label class="col-form-label" for="UpdateInstitute">Institute</label>
                            <input type="text" class="form-control" id="UpdateInstitute" name="UpdateInstitute"
                                   readonly/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="UpdateTimeFrom">From</label>
                            <input type="time" class="form-control" id="UpdateTimeFrom" name="UpdateTimeFrom" required/>
                        </div>
                        <div class="col-sm-6">
                            <label class="col-form-label" for="UpdateTimeTo">To :</label>
                            <input type="time" class="form-control" id="UpdateTimeTo" name="UpdateTimeTo" required/>
                        </div>

                    </div>
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label class="col-form-label" for="UpdateZoomMeetingLink">Zoom Meeting Link</label>
                            <input type="text" class="form-control" id="UpdateZoomMeetingLink"
                                   name="UpdateZoomMeetingLink" placeholder="Can be submited later" required/>
                        </div>
                    </div>

                    <div class="modal-footer row">
                        <%--                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>--%>
                        <button class="btn btn-danger" type="button" onclick="DeleteClass()">Delete</button>
                        <button class="btn btn-warning" type="button" onclick="UpdateCLassInfo()">Update</button>
                    </div>


                </div>

            </div>


        </div>
    </div>
</div>
<div class="modal fade" id="CreateNewClass" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle-2">Add New Class</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12">

                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="InstituteName">Institute</label>
                            <select id="InstituteName" name="InstituteName" class="form-control" onchange="GetCourses()"
                                    required>

                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label class="col-form-label" for="ClassId">Class Name</label>

                            <select id="ClassId" name="ClassId" class="form-control" required>

                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="Month">Month</label>
                            <select id="Month" name="Month" class="form-control" required>
                                <option selected value=''>--Select Month--</option>
                                <option value='1'>Janaury</option>
                                <option value='2'>February</option>
                                <option value='3'>March</option>
                                <option value='4'>April</option>
                                <option value='5'>May</option>
                                <option value='6'>June</option>
                                <option value='7'>July</option>
                                <option value='8'>August</option>
                                <option value='9'>September</option>
                                <option value='10'>October</option>
                                <option value='11'>November</option>
                                <option value='12'>December</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label class="col-form-label" for="ClassDay">Day</label>
                            <select id="ClassDay" name="ClassDay" class="form-control" required>
                                <option selected value=''>--Select Day--</option>
                                <option value="Sunday">Sunday</option>
                                <option value="Monday">Monday</option>
                                <option value="Tuesday">Tuesday</option>
                                <option value="Wednesday">Wednesday</option>
                                <option value="Thursday">Thursday</option>
                                <option value="Friday">Friday</option>
                                <option value="Saturday">Saturday</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="NewClassTimeFrom">From</label>
                            <input type="time" class="form-control" id="NewClassTimeFrom" name="NewClassTimeFrom"
                                   required/>
                        </div>
                        <div class="col-sm-6">
                            <label class="col-form-label" for="NewClassTimeTo">To :</label>
                            <input type="time" class="form-control" id="NewClassTimeTo" name="NewClassTimeTo" required/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label class="col-form-label" for="NewClassZoomMeetingLink">Zoom Meeting Link</label>
                            <input type="text" class="form-control" id="NewClassZoomMeetingLink"
                                   name="NewClassZoomMeetingLink" placeholder="Can be submitted later"/>
                        </div>

                    </div>
                    <div class="modal-footer row">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                        <button class="btn btn-success" type="button" onclick="CreateClass()">Create</button>

                    </div>


                </div>

            </div>


        </div>
    </div>
</div>
<div class="modal fade" id="SaveRecordsLink" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle-4">Save Meeting Records</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="RecordsClassId">Class Name</label>
                            <input type="text" class="form-control" id="RecordsClassId" name="RecordsClassId"
                                   readonly/>

                            <input type="text" class="form-control" id="RecordsUniqueClassId" name="RecordsUniqueClassId"
                                   hidden/>
                            <input type="text" class="form-control" id="RecordsTeacherId" name="RecordsTeacherId" value="TEC001"
                                   hidden/>
                            <input type="text" class="form-control" id="RecordsCommonClassId" name="RecordsCommonClassId"
                                   hidden/>
                        </div>
                        <div class="col-sm-6">
                            <label class="col-form-label" for="RecordsDate">Date :</label>
                            <input type="date" class="form-control RecordsData" id="RecordsDate" name="RecordsDate" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="RecordsInstitute">Institute</label>
                            <input type="text" class="form-control RecordsData" id="RecordsInstitute" name="RecordsInstitute"
                                   readonly/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label class="col-form-label" for="RecordsLink">From</label>
                            <input type="time" class="form-control RecordsData" id="RecordsTimeFrom"
                                   name="RecordsTimeFrom" />
                        </div>
                        <div class="col-sm-6">
                            <label class="col-form-label" for="RecordsLink">To</label>
                            <input type="time" class="form-control RecordsData" id="RecordsTimeTo"
                                   name="RecordsTimeTo" />
                        </div>

                    </div>

                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label class="col-form-label" for="RecordsLink">Meeting Record's Link</label>
                            <input type="text" class="form-control RecordsData" id="RecordsLink"
                                   name="RecordsLink" placeholder="Insert The Link" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label class="col-form-label" for="RecordsRemarks">Remarks</label>
                            <input type="text" class="form-control " id="RecordsRemarks" name="RecordsRemarks"
                                   />
                        </div>
                    </div>
                    <div class="modal-footer row">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                        <button class="btn btn-info" type="button" onclick="SaveMeetingRecord()">Save</button>

                    </div>


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
        GetClasses();
        GetCourses();
        GetTodayClasses();
    });
</script>

</body>

</html>
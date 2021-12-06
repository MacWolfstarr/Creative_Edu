<%@ page import="com.example.Creative_Institute.Model.ApexChart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Creative_Institute.QueryController.Analytics" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.Creative_Institute.Database.DBHandler" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="">
<%
    if (session.getAttribute("Teacher") != null) {

    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    ArrayList<ApexChart> Response = Analytics.RegisteredStudentsDaily();

    int[] Count = new int[10];
    String[] Date = new String[10];
    for (int i = 0; i < Response.size(); i++) {

        Count[i] = Response.get(i).getCount();
        Date[i] = Response.get(i).getDate();
    }
%>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Creative Education</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet" />
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/datatables.min.css" />
    <link href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/buttons/2.0.0/css/buttons.dataTables.min.css" rel="stylesheet"/>
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
    <script src="dist-assets/scripts/Student.js"></script>
</head>

<body class="text-left" >
<div class="app-admin-wrap layout-sidebar-large">
    <div class="main-header">
        <div class="logo">
            <img src="dist-assets/images/d_logo.png" style="width: auto;"  alt="">
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
                <h1 class="mr-2">My Students</h1>
                <ul>
                    <li><a href="">Dashboard</a></li>
                    <li>Creative Institute</li>
                </ul>
            </div>
            <div class="separator-breadcrumb border-top"></div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="card-title">Registered Students Count | Last 10 Days</div>
                            <div id="basicLine" style="height: 300px;"></div>
                        </div>
                    </div>
                    </div>

            </div>
            <div class="row">

                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card text-left">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">My Students</h4>

                                    <table class="display table table-striped table-bordered"
                                           id="PendingStudents" style="width:100%">
                                        <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th style="text-align: left">Student Id</th>
                                            <th style="text-align: center">First Name</th>
                                            <th style="text-align: center">Last Name</th>
                                            <th style="text-align: center">Age</th>
                                            <th style="text-align: center">Gender</th>
                                            <th style="text-align: center">Grade</th>
                                            <th style="text-align: center">Address</th>
                                            <th style="text-align: center">School</th>
                                            <th style="text-align: center">Guardian</th>
                                            <th style="text-align: center">Contact</th>
                                            <th style="text-align: center">Class Name</th>
                                            <th style="text-align: center">Institute</th>
                                            <th style="text-align: center">Date & Time</th>
                                            <th style="text-align: center">Status</th>
                                            <th style="text-align: center">Action</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            Connection connection = null;
                                            try {
                                                connection = DBHandler.createDBConnection();
                                                try {
                                                    connection = DBHandler.createDBConnection();
                                                    ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM student inner join teacher_has_class on student.ClassId = teacher_has_class.ClassId WHERE BlockStatus = '2'");
                                                    while (resultSet.next()) {
                                        %>

                                        <tr>
                                            <td></td>
                                            <td style="text-align: left"><%=resultSet.getString("StudentId") %>
                                            </td>

                                            <% if (resultSet.getString("FirstName") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center;max-width:100px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis"><%=resultSet.getString("FirstName") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("LastName") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("LastName") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("Age") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("Age") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("Gender") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("Gender") %>
                                            </td>
                                            <%}%>


                                            <% if (resultSet.getString("Grade") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("Grade") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("Address") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center;max-width:100px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis">
                                                <%=resultSet.getString("Address")%>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("School") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center;max-width:100px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis"><%=resultSet.getString("School") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("Guardian") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("Guardian") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("Contact") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("Contact") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("ClassName") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("ClassName") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("Institute") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("Institute") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getString("DateTime") == null) {%>
                                            <td style="text-align: center"></td>
                                            <%} else { %>
                                            <td style="text-align: center"><%=resultSet.getString("DateTime") %>
                                            </td>
                                            <%}%>

                                            <% if (resultSet.getInt("BlockStatus") == 2) {%>
                                            <td style="text-align: center" hidden>Pending</td>
                                            <%} else { %>
                                            <td style="text-align: center" hidden>Unknown
                                            </td>
                                            <%}%>

                                            <td style="text-align: center">


                                                <button class="btn btn-success" data-toggle="modal"
                                                        data-target="#ShowPendingStudent"
                                                        data-whatever="@mdo" type="button" onclick="ShowPendingStudentInfo('<%=resultSet.getString("StudentId").replaceAll("\\s+$", "") %>')">
                                                    <i class="nav-icon i-Pen-2"></i></button>

                                            </td>
                                        </tr>
                                        <%
                                                    }
                                                } catch (Exception Ex) {
                                                    Ex.printStackTrace();
                                                }
                                            } finally {
                                                if (connection != null) {
                                                    try {
                                                        connection.close();
                                                    } catch (SQLException throwables) {
                                                        throwables.printStackTrace();
                                                    }
                                                }
                                            }
                                        %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <form action="RegisterStudent" method="post">
                                        <div class="row">
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="InstituteName" >Institute</label>
                                                <select id="InstituteName" name="InstituteName" class="form-control" onchange="GetCourses()"
                                                        required>

                                                </select>
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="ClassName" >Class</label>
                                                <select id="ClassName" name="ClassName" class="form-control" required>
                                                </select>
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="FirstName">First name</label>
                                                <input class="form-control" id="FirstName" name="FirstName"  type="text" placeholder="Enter your first name">
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="LastName">Last name</label>
                                                <input class="form-control" id="LastName" name="LastName"type="text" placeholder="Enter your last name">
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="BirthDay">Birth Date</label>
                                                <input class="form-control" id="BirthDay"  name="BirthDay"  type="date">
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="MobileNumber">Mobile</label>
                                                <input class="form-control" id="MobileNumber" name="MobileNumber"  type="number" placeholder="Enter mobile number" maxlength="10">
                                            </div>
                                            <div class="col-md-12 form-group mb-3">
                                                <label for="Address">Address</label>
                                                <input class="form-control" id="Address" name="Address" placeholder="Enter your address">
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="Age">Age</label>
                                                <input class="form-control" id="Age" name="Age" type="number" placeholder="Enter phone" maxlength="2">
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="Gender" >Gender</label>
                                                <select class="form-control" id="Gender" name="Gender">
                                                    <option selected value="0">--Please Select--</option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="Guardian">Guardian</label>
                                                <input class="form-control" id="Guardian" name="Guardian" placeholder="Card">
                                            </div>
                                            <div class="col-md-6 form-group mb-3">
                                                <label for="School">School</label>
                                                <input class="form-control" id="School" name="School" placeholder="Your School">
                                            </div>

                                            <div class="col-md-12" style="text-align: right">
                                                <input type="submit" class="btn btn-primary" value="Submit">
                                                <button class="btn btn-warning">Clear</button>
                                            </div>
                                        </div>

                                    </form>

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
<div class="modal fade" id="ShowPendingStudent" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle-4">Student Info | <span id="PendingStudentStatus"></span></h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">X</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 col-12">
                                <div class="card-profile-1">
                                    <div class="card-body text-center" style="padding: unset">
                                        <div class="avatar box-shadow-2 mb-3"><img src="dist-assets/images/faces/16.jpg" alt=""></div>
                                        <h5 class="m-0" id="PendingFirstName"></h5>
                                        <p class="mt-0" id="PendingLastName"></p>
                                    </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-4">
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-Checked-User text-16 mr-1"></i>Student Id</p><span id="PendingStudentId"></span>
                            </div>
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-MaleFemale text-16 mr-1"></i>Gender</p><span id="PendingGender"></span>
                            </div>
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-MaleFemale text-16 mr-1"></i>Age</p><span id="PendingAge"></span>
                            </div>
                        </div>
                        <div class="col-md-4 col-4">
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-Map-Marker text-16 mr-1"></i>Address</p><span id="PendingAddress"></span>
                            </div>
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-Home-2 text-16 mr-1"></i>School</p><span id="PendingSchool"></span>
                            </div>
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-Teacher text-16 mr-1"></i>Guardian</p><span id="PendingGuardian"></span>
                            </div>
                        </div>
                        <div class="col-md-4 col-4">
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-Telephone text-16 mr-1"></i>Contact</p><span id="PendingMobileNumber"></span>
                            </div>
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-Book text-16 mr-1"></i> Class</p><span id="PendingClassId"></span>
                            </div>
                            <div class="mb-4">
                                <p class="text-primary mb-1"><i class="i-Building   text-16 mr-1"></i> Institute</p><span id="PendingInstitute"></span>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer row">
                        <button class="btn btn-info"  onclick="ApproveRequest()" id="PendingStudentButton"></button>
                        <button class="btn btn-danger" onclick="DeleteStudent(document.getElementById('PendingStudentId').innerHTML.trim())">Reject</button>
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
<script src="dist-assets/js/scripts/echarts.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>
<script src="dist-assets/js/plugins/datatables.min.js"></script>
<script src="dist-assets/js/scripts/datatables.script.min.js"></script>
<script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script>
<script>
    $(document).ready(function () {
        GetInstituteInfo();
        $('#PendingStudents').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            responsive: {
                details: {
                    type: 'column',
                    target: 'tr'
                }
            },
            columnDefs: [{
                className: 'control',
                orderable: false,
                targets: 0
            }],
            order: [1, 'asc']
        });


    });
</script>
<script>
    $(document).ready(function () {
        var Count = [];
        var Date = [];

        <%
    for(int i=0; i<Count.length ; i++)
         {
        %>
        parseInt(Count.push('<%= Count[i]%>'));
        Date.push('<%= Date[i]%>');
        <%}%>

    var basicLineElem = document.getElementById('basicLine');

    if (basicLineElem) {
        var basicLine = echarts.init(basicLineElem);
        basicLine.setOption({
            tooltip: {
                show: true,
                trigger: 'axis',
                axisPointer: {
                    type: 'line',
                    animation: true
                }
            },
            grid: {
                top: '10%',
                left: '40',
                right: '40',
                bottom: '40'
            },
            xAxis: {
                type: 'category',
                data: Date.reverse(),
                axisLine: {
                    show: false
                },
                axisLabel: {
                    show: true
                },
                axisTick: {
                    show: false
                }
            },
            yAxis: {
                type: 'value',
                axisLine: {
                    show: false
                },
                axisLabel: {
                    show: true
                },
                axisTick: {
                    show: false
                },
                splitLine: {
                    show: true
                }
            },
            series: [{
                data: Count.reverse(),
                type: 'line',
                showSymbol: true,
                smooth: true,
                color: '#639',
                lineStyle: {
                    opacity: 1,
                    width: 2
                }
            }]
        });
        $(window).on('resize', function () {
            setTimeout(function () {
                basicLine.resize();
            }, 500);
        });
    }
    });
</script>
</body>

</html>
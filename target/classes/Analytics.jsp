<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.Creative_Institute.Database.DBHandler" %>
<%@ page import="com.example.Creative_Institute.QueryController.Analytics" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en" dir="">
<%
    if (session.getAttribute("Teacher") != null) {

    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>TR Education</title>
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
    <script src="dist-assets/scripts/CreateClassId.js"></script>
    <script src="dist-assets/scripts/Student.js"></script>
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
                <h1 class="mr-2">My Analytics</h1>
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
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="card text-left">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">My Students</h4>

                                    <table class="display table table-striped table-bordered"
                                           id="CustomerTable" style="width:100%">
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
                                            <th style="text-align: center">Status</th>
                                            <th style="text-align: center">Edit</th>
                                            <th style="text-align: center">Delete</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            Connection connection = null;
                                            try {
                                                connection = DBHandler.createDBConnection();
                                                try {
                                                     connection = DBHandler.createDBConnection();
                                                    ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM student  inner join teacher_has_class on student.ClassId = teacher_has_class.ClassId WHERE BlockStatus= '0' OR BlockStatus= '1' ");
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

                                            <% if (resultSet.getInt("BlockStatus") == 1) {%>
                                            <td style="text-align: center">Blocked</td>
                                            <%} else { %>
                                            <td style="text-align: center">Active
                                            </td>
                                            <%}%>

                                            <td style="text-align: center">


                                                <button class="btn btn-success" data-toggle="modal"
                                                        data-target="#ShowStudentInfo"
                                                        data-whatever="@mdo" type="button" onclick="ShowStudentInfo('<%=resultSet.getString("StudentId").replaceAll("\\s+$", "") %>')">
                                                    <i class="nav-icon i-Pen-2"></i></button>

                                            </td>

                                            <td style="text-align: center">


                                                <button class="btn btn-danger" data-toggle="modal"
                                                        data-target="#UpdatePaymentStatus"
                                                        data-whatever="@mdo" type="button" onclick="DeleteStudent('<%=resultSet.getString("StudentId") %>')">
                                                    <i class="nav-icon i-Delete-File"></i></button>

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
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">

                        <div class="col-lg-12 col-sm-12">
                            <div class="card mt-4">
                                <div class="card-body">
                                    <span id="Male" hidden><%=Gender[0]%></span>
                                           <span id="Female" hidden><%=Gender[1]%></span>
                                    <div class="card-title">Analytics</div>
                                    <div id="simpleDonut"></div>
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

<div class="modal fade" id="ShowStudentInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle-4">Student Info | <span id="StudentStatus"></span></h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">X</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6 form-group mb-3">
                            <label for="ShowStudentId">Student Id</label>
                            <input class="form-control ShowStudent" id="ShowStudentId" name="ShowStudentId" type="text"  readonly>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="InstituteName" >Institute</label>
                            <select id="InstituteName" name="InstituteName" class="form-control  ShowStudent"
                                    required>
                            </select>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="ClassId" >Class</label>
                            <select id="ClassId" name="ClassId" class="form-control  ShowStudent" required>

                            </select>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="ShowFirstName">First name</label>
                            <input class="form-control  ShowStudent" id="ShowFirstName" name="ShowFirstName"  type="text" placeholder="Enter your first name" required>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="ShowLastName">Last name</label>
                            <input class="form-control ShowStudent" id="ShowLastName" name="ShowLastName" type="text" placeholder="Enter your last name" required>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="ShowDateOfBirth">Birth Date</label>
                            <input class="form-control  ShowStudent" id="ShowDateOfBirth"  name="ShowDateOfBirth"  type="date" required>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="ShowMobileNumber">Mobile</label>
                            <input class="form-control  ShowStudent" id="ShowMobileNumber" name="ShowMobileNumber"  type="number" placeholder="Enter mobile number"  required>
                        </div>
                        <div class="col-md-12 form-group mb-3">
                            <label for="ShowAddress">Address</label>
                            <input class="form-control  ShowStudent" id="ShowAddress" name="ShowAddress" placeholder="Enter your address" required>
                        </div>
                        <div class="col-md-4 form-group mb-3">
                            <label for="ShowAge">Age</label>
                            <input class="form-control  ShowStudent" id="ShowAge" name="ShowAge" type="number" placeholder="Enter age" min="10" max="99" required>
                        </div>
                        <div class="col-md-4 form-group mb-3">
                            <label for="ShowGrade" >Grade</label>
                            <select class="form-control  ShowStudent" id="ShowGrade" name="ShowGrade" required>
                                <option selected value="0">--Please Select--</option>
                                <option value="Grade 6">Grade 6</option>
                                <option value="Grade 7">Grade 7</option>
                                <option value="Grade 8">Grade 8</option>
                                <option value="Grade 9">Grade 9</option>
                                <option value="Grade 10">Grade 10</option>
                                <option value="Grade 11">Grade 11</option>
                            </select>
                        </div>
                        <div class="col-md-4 form-group mb-3">
                            <label for="ShowGender" >Gender</label>
                            <select class="form-control  ShowStudent" id="ShowGender" name="ShowGender" required>
                                <option selected value="0">--Please Select--</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="ShowGuardian">Guardian</label>
                            <input class="form-control  ShowStudent" id="ShowGuardian" name="ShowGuardian" placeholder="Enter Guardian Name" required>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label for="ShowSchool">School</label>
                            <input class="form-control  ShowStudent" id="ShowSchool" name="ShowSchool" placeholder="Your School" required>
                        </div>

                    </div>
                    <div class="modal-footer row">
                        <button class="btn btn-warning"  onclick="UpdateStudentInfo()">Update</button>
                        <button class="btn btn-info"  onclick="BlockStudent()" id="BlockStudent"></button>
                        <%--             <input type="submit" value="submit" class="btn btn-primary btn-rounded">--%>
                        <button class="btn btn-danger " onclick="ClearForm()">Clear</button>
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
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>
<script src="dist-assets/js/scripts/dashboard.v1.script.min.js"></script>
<script src="dist-assets/js/scripts/customizer.script.min.js"></script>
<script src="dist-assets/js/plugins/datatables.min.js"></script>
<script src="dist-assets/js/scripts/datatables.script.min.js"></script>
<script src="dist-assets/js/plugins/apexcharts.min.js"></script>
<script src="dist-assets/js/plugins/apexcharts.dataseries.js"></script>
<script src="dist-assets/js/scripts/apexPieDonutChart.script.min.js"></script>
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
        $('#CustomerTable').DataTable({
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

</body>

</html>
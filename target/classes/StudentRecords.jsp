<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.Creative_Institute.Database.DBHandler" %>
<%@ page import="java.sql.ResultSet" %>
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
  <title>TR Education</title>
  <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
  <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css"/>
  <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet"/>
  <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet"/>
  <link href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css" rel="stylesheet"/>
  <link href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css" rel="stylesheet"/>
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
  <script src="dist-assets/scripts/Meetings.js"></script>
  <script src="dist-assets/scripts/CreateClassId.js"></script>
  <script>
    setCookie("StudentId",'<%=session.getAttribute("Student")%>');
  </script>
</head>

<body class="text-left">
<div class="app-admin-wrap layout-sidebar-large">
  <div class="main-header" >
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
              <i class="i-Lock-User mr-1"></i><%=request.getAttribute("Student")%>
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
        <h1 class="mr-2">Class Video Records</h1>
        <ul>
          <li><a href="">Dashboard</a></li>
          <li>TR Education</li>
        </ul>
      </div>
      <div class="separator-breadcrumb border-top"></div>

      <div class="row">
        <div class="col-lg-12 col-md-12">
          <div class="card text-left">
            <div class="card-body">
              <table  id="StudentMeetingRecordsTable" style="width:100%">
                <thead>
                <tr>
                  <th>&nbsp;</th>
                  <th style="text-align: left">Class Name</th>
                  <th style="text-align: center">Institute</th>
                  <th style="text-align: center">Date</th>
                  <th style="text-align: center">From</th>
                  <th style="text-align: center">To</th>
                  <th style="text-align: center">Remarks</th>
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
                      ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM meeting_records where ClassId = '"+session.getAttribute("ClassId")+"'");
                      while (resultSet.next()) {
                %>

                <tr>
                  <td></td>
                  <td style="text-align: left"><%=resultSet.getString("ClassName") %>
                  </td>

                  <% if (resultSet.getString("Institute") == null) {%>
                  <td style="text-align: center"></td>
                  <%} else { %>
                  <td style="text-align: center;max-width:100px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis"><%=resultSet.getString("Institute") %>
                  </td>
                  <%}%>

                  <% if (resultSet.getString("Date") == null) {%>
                  <td style="text-align: center"></td>
                  <%} else { %>
                  <td style="text-align: center"><%=resultSet.getString("Date") %>
                  </td>
                  <%}%>

                  <% if (resultSet.getString("TimeFrom") == null) {%>
                  <td style="text-align: center"></td>
                  <%} else { %>
                  <td style="text-align: center"><%=resultSet.getString("TimeFrom") %>
                  </td>
                  <%}%>

                  <% if (resultSet.getString("TimeTo") == null) {%>
                  <td style="text-align: center"></td>
                  <%} else { %>
                  <td style="text-align: center"><%=resultSet.getString("TimeTo") %>
                  </td>
                  <%}%>



                  <% if (resultSet.getString("Remarks") == null) {%>
                  <td style="text-align: center">No Remarks</td>
                  <%} else { %>
                  <td style="text-align: center;max-width:100px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis">
                    <%=resultSet.getString("Remarks")%>
                  </td>
                  <%}%>


                  <td style="text-align: center">


                    <button class="btn btn-danger" type="button" onclick="RedirectToRecordLink('<%=resultSet.getString("UniqueClassId") %>','<%=resultSet.getString("RecordLink")%>')">
                      <i class="nav-icon i-Eye"></i></button>

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
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>
<script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script>
  $(document).ready(function () {
    $('#StudentMeetingRecordsTable').DataTable({
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
  function Alert(){
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
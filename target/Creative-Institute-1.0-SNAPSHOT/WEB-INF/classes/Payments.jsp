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

  <script src="dist-assets/scripts/Main.js"></script>
  <script src="dist-assets/scripts/Month.js"></script>
  <script src="dist-assets/scripts/Classes.js"></script>
  <script src="dist-assets/scripts/Institute.js"></script>
  <script src="dist-assets/scripts/Student.js"></script>
  <script src="dist-assets/scripts/Cookies.js"></script>
  <style>
    .text-white{
      color: #000000 !important;
      font-weight: bold;
    }
  </style>
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
                  <h4 class="card-title mb-3">Check Payments</h4>

                  <table class="display table table-striped table-bordered"
                         id="PaymentsTable" style="width:100%">
                    <thead>
                    <tr>
                      <th>&nbsp;</th>
                      <th style="text-align: left">Student Id</th>
                      <th style="text-align: center">First Name</th>
                      <th style="text-align: center">Class Name</th>
                      <th style="text-align: center">Institute</th>
                      <th style="text-align: center">Month</th>
                      <th style="text-align: center">Day</th>
                      <th style="text-align: center">Time From</th>
                      <th style="text-align: center">Time To</th>
                      <th style="text-align: center">Paid Status</th>
                      <th style="text-align: center">Payments</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                      Connection connection = null;
                      try {
                        connection = DBHandler.createDBConnection();
                        try {
                           connection = DBHandler.createDBConnection();
                          ResultSet resultSet = connection.createStatement().executeQuery("SELECT class_has_student.StudentId, student.FirstName,class.ClassName,class.Institute,class.UniqueClassId,class.Month,class.Day,class.TimeFrom,class.TimeTo,class_has_student.PaidStatus,class_has_student.slip_name  FROM class_has_student inner join class on class_has_student.UniqueClassId = class.UniqueClassId inner join  student on class_has_student.StudentId= student.StudentId;");
                          while (resultSet.next()) {
                    %>
                    <tr>
                      <td></td>
                      <td style="text-align: left"><%=resultSet.getString("StudentId") %>
                      </td>
                      <% if (resultSet.getString("FirstName") == null) {%>

                      <td style="text-align: center"></td>
                      <%} else { %>
                      <td style="text-align: center"><%=resultSet.getString("FirstName") %>
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

                      <% if (resultSet.getString("Month") == null) {%>
                      <td style="text-align: center"></td>
                      <%} else { %>
                      <td style="text-align: center"><%=resultSet.getString("Month") %>
                      </td>
                      <%}%>


                      <% if (resultSet.getString("Day") == null) {%>
                      <td style="text-align: center"></td>
                      <%} else { %>
                      <td style="text-align: center"><%=resultSet.getString("Day") %>
                      </td>
                      <%}%>

                      <% if (resultSet.getString("TimeFrom") == null) {%>
                      <td style="text-align: center"></td>
                      <%} else { %>
                      <td style="text-align: center;max-width:100px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis">
                        <%=resultSet.getString("TimeFrom")%>
                      </td>
                      <%}%>

                      <% if (resultSet.getString("TimeTo") == null) {%>
                      <td style="text-align: center"></td>
                      <%} else { %>
                      <td style="text-align: center"><%=resultSet.getString("TimeTo") %>
                      </td>
                      <%}%>

                      <% if (resultSet.getString("PaidStatus") == null) {%>
                      <td style="text-align: center"></td>
                      <%} else { %>
                      <td style="text-align: center"><%=resultSet.getString("PaidStatus") %>
                      </td>
                      <%}%>

                      <td style="text-align: center">


                        <button class="btn btn-success" data-toggle="modal"
                                data-target="#UpdatePaymentStatus"
                                data-whatever="@mdo" type="button" onclick="GetSlipData('<%=resultSet.getString("slip_name") %>','<%=resultSet.getString("StudentId") %>','<%=resultSet.getString("UniqueClassId") %>','<%=resultSet.getString("PaidStatus") %>')">
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
          </div>
        </div>
        <div class="col-lg-4">
          <div class="row">

            <div class="col-lg-12 col-sm-12">
              <div class="card mt-4">
                <div class="card-body">
                  <div class="card-title">Paid Analytics</div>
                  <div id="PaidUnpaid"></div>
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
<div class="modal fade" id="UpdatePaymentStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2"
     aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle-3">Update Payment Status</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">X</span></button>
      </div>
      <div class="modal-body">
        <div class="col-md-12">
          <div class="form-group row">
            <div class="col-sm-6" hidden>
              <input type="text" class="form-control" id="UpdateUniqueClassId" name="UpdateUniqueClassId"
                     readonly hidden/>
            </div>
            <div class="col-sm-6" hidden>
              <input type="text" class="form-control" id="UpdateStudentId" name="UpdateStudentId"
                     readonly hidden/>
            </div>

          </div>
          <div class="form-group row">
            <div class="col-sm-12" id="PaymentSlip">

            </div>

          </div>




          <div class="modal-footer row">
            <%--                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>--%>
            <button class="btn btn-warning" type="button" id="PaymentStatusButton" onclick="SetStudentPaymentStatus()"></button>
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

    $('#PaymentsTable').DataTable({
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
    const Paid = parseInt(document.getElementById("Paid").innerHTML);
    const Unpaid = parseInt(document.getElementById("Unpaid").innerHTML);

    var options = {
      chart: {
        type: 'donut',
        width: '100%'
      },
      labels: ['Paid', 'Unpaid'],
      series: [Paid, Unpaid],
      legend: {
        position: 'bottom'
      },
      responsive: [{
        breakpoint: 480,
        options: {
          chart: {
            width: 310
          },
          legend: {
            position: 'bottom'
          }
        }
      }]
    };
    var chart = new ApexCharts(document.querySelector("#PaidUnpaid"), options);
    chart.render();

  });
</script>
<script>
  function GetSlipData(SlipName, StudentId, UniqueClassId, PaidStatus){
    document.getElementById("UpdateUniqueClassId").value = UniqueClassId;
    document.getElementById("UpdateStudentId").value = StudentId;
    if(PaidStatus === "1"){
      document.getElementById("PaymentStatusButton").innerText = "Unverified";
    }else{
      document.getElementById("PaymentStatusButton").innerText = "Verified";
    }

    $("#PaymentSlip").html("");

    if(SlipName === "null"){
      {
        $('#PaymentSlip').append('<div class="card"><img class="d-block w-100 rounded rounded" src="dist-assets/images/no-data.jpg" alt="First slide">\n' +
                '                                <div class="card-body">\n' +
                '                                </div>\n' +
                '                            </div>');
      }
    }else{
      {
        $('#PaymentSlip').append('<div class="card"><img class="d-block w-100 rounded rounded" src="http://194.163.168.129/Edu_Institute/downloadFile/'+SlipName+'" alt="First slide">\n' +
                '                                <div class="card-body">\n' +
                '                                </div>\n' +
                '                            </div>');
      }
    }

  }

</script>
<script>

  function SetStudentPaymentStatus(){

    $.ajax({
      url: _BaseUrl +'Class/SetPaymentStatus',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({
        "uniqueClassId": document.getElementById("UpdateUniqueClassId").value,
        "studentId": document.getElementById("UpdateStudentId").value,
      }),
      processData: false,
      success: function (response, textStatus, jQxhr) {
        if(response.Data === "1"){
          swal({
            type: 'success',
            title: 'Success',
            text: 'Student Payment Verified Successfully!',
            buttonsStyling: false,
            confirmButtonText: 'OK',
            confirmButtonClass: 'btn btn-lg btn-success'
          }).then(function () {

            location.reload();
          });
        }else if (response.Data === "0"){
          swal({
            type: 'warning',
            title: 'Done',
            text: 'Payment Status Unverified Successfully!!',
            buttonsStyling: false,
            confirmButtonText: 'OK',
            confirmButtonClass: 'btn btn-lg btn-warning'
          }).then(function () {

            location.reload();
          });
        }else{
          swal({
            type: 'error',
            title: 'Oops!',
            text: 'Something Went Wrong!',
            buttonsStyling: false,
            confirmButtonText: 'OK',
            confirmButtonClass: 'btn btn-lg btn-danger'
          })
        }

      },
      error: function (jqXhr, textStatus, errorThrown) {
        console.log(errorThrown);
      }
    });


  }
</script>
</body>

</html>
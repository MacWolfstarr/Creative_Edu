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
</head>
<div class="auth-layout-wrap" style="background-image: url(dist-assets/images/Login_Home.jpg);" >
    <div class="auth-content">
        <div class="row">
            <div class=col-lg-1>
            </div>
            <div class="col-lg-10" style="padding: unset">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="auth-logo text-center "><img src="dist-assets/images/logo.jpg" style="width: auto;" style="width:170px; height: auto"  alt=""></div>
                                    <h1 class="mb-3 text-18 mt-1" style="text-align: center;">Creative Education | Student Registration</h1>




     <div class="row">
         <div class="col-md-6 form-group mb-3">
             <label for="InstituteName" >Institute</label>
             <select id="InstituteName" name="InstituteName" class="form-control form-control-rounded StudentRegister" onchange="GetCourses()"
                     required>

             </select>
         </div>
         <div class="col-md-6 form-group mb-3">
             <label for="ClassId" >Class</label>
             <select id="ClassId" name="ClassId" class="form-control form-control-rounded StudentRegister" required>

             </select>
         </div>
         <div class="col-md-6 form-group mb-3">
             <label for="FirstName">First name</label>
             <input class="form-control form-control-rounded StudentRegister" id="FirstName" name="FirstName"  type="text" placeholder="Enter your first name" required>
         </div>
         <div class="col-md-6 form-group mb-3">
             <label for="LastName">Last name</label>
             <input class="form-control form-control-rounded StudentRegister" id="LastName" name="LastName" type="text" placeholder="Enter your last name" required>
         </div>
         <div class="col-md-6 form-group mb-3">
             <label for="dateOfBirth">Birth Date</label>
             <input class="form-control form-control-rounded StudentRegister" id="DateOfBirth"  name="DateOfBirth"  type="date" required>
         </div>
         <div class="col-md-6 form-group mb-3">
             <label for="MobileNumber">Mobile</label>
             <input class="form-control form-control-rounded StudentRegister" id="MobileNumber" name="MobileNumber"  type="number" placeholder="Enter mobile number" maxlength="10" required>
         </div>
         <div class="col-md-12 form-group mb-3">
             <label for="Address">Address</label>
             <input class="form-control form-control-rounded StudentRegister" id="Address" name="Address" placeholder="Enter your address" required>
         </div>
         <div class="col-md-4 form-group mb-3">
             <label for="Age">Age</label>
             <input class="form-control form-control-rounded StudentRegister" id="Age" name="Age" type="number" placeholder="Enter age" min="10" max="99" required>
         </div>
         <div class="col-md-4 form-group mb-3">
             <label for="Grade" >Grade</label>
             <select class="form-control form-control-rounded StudentRegister" id="Grade" name="Grade" required>
                 <option selected value="">--Please Select--</option>
                 <option value="Grade 6">Grade 6</option>
                 <option value="Grade 7">Grade 7</option>
                 <option value="Grade 8">Grade 8</option>
                 <option value="Grade 9">Grade 9</option>
                 <option value="Grade 10">Grade 10</option>
                 <option value="Grade 11">Grade 11</option>
             </select>
         </div>
         <div class="col-md-4 form-group mb-3">
             <label for="Gender" >Gender</label>
             <select class="form-control form-control-rounded StudentRegister" id="Gender" name="Gender" required>
                 <option selected value="">--Please Select--</option>
                 <option value="Male">Male</option>
                 <option value="Female">Female</option>
             </select>
         </div>
         <div class="col-md-6 form-group mb-3">
             <label for="Guardian">Guardian</label>
             <input class="form-control form-control-rounded StudentRegister" id="Guardian" name="Guardian" placeholder="Enter Guardian Name" required>
         </div>
         <div class="col-md-6 form-group mb-3">
             <label for="School">School</label>
             <input class="form-control form-control-rounded StudentRegister" id="School" name="School" placeholder="Your School" required>
         </div>

         <div class="col-md-12" style="text-align: right">
             <button class="btn btn-primary btn-rounded" onclick="StudentRegister()">Submit</button>
<%--             <input type="submit" value="submit" class="btn btn-primary btn-rounded">--%>
             <button class="btn btn-warning btn-rounded" onclick="ClearForm()">Clear</button>
         </div>
     </div>




                                </div>
                            </div>
                        </div>
                    </div>



            </div>
        </div>
        <div class=col-lg-1>

        </div>

    </div>

</div>
</div>

<script src="dist-assets/scripts/Cookies.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>
<script>
    $(document).ready(function () {
        GetInstituteInfo();
        GetCourses();
    });
</script>
<script>
    function ClearFormData(){
        document.getElementById("StudentRegistration").reset();
    }

</script>

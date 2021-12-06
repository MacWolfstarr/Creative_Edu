<%@ page import="com.example.Creative_Institute.QueryController.Analytics" %>
<%
    int TotalStudents = Analytics.GetAllStudent();
    int TotalClasses = Analytics.GetAllClasses();
    int[] PaidStatus = Analytics.GetPaidStudents();
    int [] Gender = Analytics.StudentGenderCount();
%>


<div class="col-lg-3 col-md-6 col-sm-6" >

                                    <span style="cursor: pointer;">
                                        <div class="card bg-dark2 text-white o-hidden mt-2 mb-3" style="border-radius: 23px;"><img class="card-img" src="./dist-assets/images/1.jpg" alt="Card image">
  <div class="card-img-overlay" style="background: unset">
                            <h5 class="card-title text-white" style="margin-bottom: unset;color: #717786!important">Total Students</h5>
                            <p class="card-text" style="font-size: 40px;color: #717786!important"><%=TotalStudents%></p>

                        </div>
                                        </div>

                                    </span>

</div>
<div class="col-lg-3 col-md-6 col-sm-6">

                                    <span style="cursor: pointer;">
                                        <div class="card bg-dark2 text-white o-hidden mt-2 mb-3" style="border-radius: 23px;"><img class="card-img" src="./dist-assets/images/sss.jpeg" alt="Card image">
  <div class="card-img-overlay" style="background: unset">
                            <h5 class="card-title text-white" style="margin-bottom: unset;color: #717786!important">Total Classes</h5>
                            <p class="card-text" style="font-size: 40px;color: #717786!important"><%=TotalClasses%></p>

                        </div>
                                        </div>

                                    </span>

</div>
<div class="col-lg-3 col-md-6 col-sm-6">

                                    <span style="cursor: pointer;">
                                        <div class="card bg-dark2 text-white o-hidden mt-2 mb-3" style="border-radius: 23px;"><img class="card-img" src="./dist-assets/images/2.jpg" alt="Card image">
  <div class="card-img-overlay" style="background: unset">
                            <h5 class="card-title text-white" style="margin-bottom: unset;color: #717786!important">Total Paid</h5>
                            <p class="card-text" id="Paid" style="font-size: 40px;color: #717786!important"><%=PaidStatus[0]%></p>

                        </div>
                                        </div>

                                    </span>

</div>
<div class="col-lg-3 col-md-6 col-sm-6">

                                    <span style="cursor: pointer;">
                                        <div class="card bg-dark2 text-white o-hidden mt-2 mb-3" style="border-radius: 23px;"><img class="card-img" src="./dist-assets/images/3.jpg" alt="Card image">
 <div class="card-img-overlay" style="background: unset">
                            <h5 class="card-title text-white" style="margin-bottom: unset;color: #717786!important">Total Unpaid</h5>
                            <p class="card-text" id="Unpaid" style="font-size: 40px;color: #717786!important"><%=PaidStatus[1]%></p>

                        </div>
                                        </div>

                                    </span>

</div>
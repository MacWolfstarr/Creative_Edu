
<%
    int [] Count = Student.GetStudentData((String) session.getAttribute("Student"));
%>


<div class="row">
    <div class="col-lg-9">
        <div class="row">
            <!-- ICON BG-->
            <div class="col-lg-4 col-md-6 col-sm-6">

                                    <span style="cursor: pointer;">
                                        <div class="card bg-dark2 text-white o-hidden mt-2 mb-3"
                                             style="border-radius: 23px;"><img class="card-img"
                                                                               src="./dist-assets/images/1.jpg"
                                                                               alt="Card image">
  <div class="card-img-overlay" style="background: unset">
                            <h5 class="card-title text-white" style="margin-bottom: unset;
    color: #717786!important;">Total Classes</h5>
                            <p class="card-text" style="    font-size: 40px;
    color: #717786!important;"><%=Count[0]%></p>

                        </div>
                                        </div>

                                    </span>

            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">

                                    <span style="cursor: pointer;">
                                        <div class="card bg-dark2 text-white o-hidden mt-2 mb-3"
                                             style="border-radius: 23px;"><img class="card-img"
                                                                               src="./dist-assets/images/2.jpg"
                                                                               alt="Card image">
  <div class="card-img-overlay" style="background: unset">
                            <h5 class="card-title text-white" style="margin-bottom: unset;
    color: #717786!important;">Paid Classes</h5>
                            <p class="card-text" id="Paid" style="    font-size: 40px;
    color: #717786!important;"><%=Count[2]%></p>

                        </div>
                                        </div>

                                    </span>

            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">

                                    <span style="cursor: pointer;">
                                        <div class="card bg-dark2 text-white o-hidden mt-2 mb-3"
                                             style="border-radius: 23px;"><img class="card-img"
                                                                               src="./dist-assets/images/sss.jpeg"
                                                                               alt="Card image">
 <div class="card-img-overlay" style="background: unset">
                            <h5 class="card-title text-white" style="margin-bottom: unset;
    color: #717786!important;">Unpaid Classes</h5>
                            <p class="card-text" id="Unpaid" style="    font-size: 40px;
    color: #717786!important;"><%=Count[1]%></p>

                        </div>
                                        </div>

                                    </span>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">

                <div class="separator-breadcrumb border-top"></div>
                <div class="row" id="MyClassesCardsStudent">

                </div>

            </div>
        </div>

    </div>
    <div class="col-lg-3">
        <div class="row">
            <div class="col-lg-12 col-md-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title" style="font-weight: bold; color: #00c2c1">Time Table</div>
                        <div class="ul-widget-app__recent-messages">
                            <div class="ul-widget-app__row-comments border-bottom-gray-200 mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/class/9.jpg" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 6</h6>
                                        <p class="mb-2">Thursday 2:30 PM - 4:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments border-bottom-gray-200 mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/class/9.jpg" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 7 | Group 1</h6>
                                        <p class="mb-2">Saturday 1:30 PM - 3:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments border-bottom-gray-200 mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/class/9.jpg" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 7 | Group 2</h6>
                                        <p class="mb-2">Wednesday 3:30 PM - 5:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments border-bottom-gray-200 mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/tr.JPG" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 8 | Group 1</h6>
                                        <p class="mb-2">Saturday 3:30 PM - 5:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/tr.JPG" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 8 | Group 2</h6>
                                        <p class="mb-2">Friday 5:30 PM - 7:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/tr.JPG" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 9</h6>
                                        <p class="mb-2">Monday 5:30 PM - 7:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/tr.JPG" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 10 | Group 1</h6>
                                        <p class="mb-2">Saturday 10:00 PM - 12:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/tr.JPG" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 10 | Group 2</h6>
                                        <p class="mb-2">Sunday 04:00 PM - 06:30 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/tr.JPG" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 11 | Group 1</h6>
                                        <p class="mb-2">Saturday 07:30 PM - 10:00 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                            <div class="ul-widget-app__row-comments mb-0">
                                <div class="ul-widget-app__profile-pic mr-3"><img
                                        class="profile-picture avatar-md mb-2 rounded-circle img-fluid"
                                        src="dist-assets/images/tr.JPG" alt="alt"></div>
                                <div class="ul-widget-app__comment">
                                    <div class="ul-widget-app__profile-title">
                                        <h6 class="heading">Grade 11 | Group 2</h6>
                                        <p class="mb-2">Sunday 01:30 PM - 04:00 PM</p>
                                    </div>
                                    <div class="ul-widget-app__profile-status"><small class="text-mute">Isuru Manawadu</small></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>

function GetTodayClasses() {

    let Year = GetToday(2);
    let Month = GetToday(1);
    let Day = GetToday(0);

    $.ajax({
        url: _BaseUrl +  'Class/GetTodayClass',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"teacherId": "CITEC001", "year": Year, "month": Month, "day": Day}),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            $("#TodayMyClasses").html("");
            for (i = 0; i < response.Data.length; i++) {
                $('#TodayMyClasses').append('     <div class="ul-widget4__item ul-widget4__users" style="padding-top: unset;">\n' +
                    '                                        <div ><i class="i-Pen-4"></i></div>\n' +
                    '                                        <div class="ul-widget2__info ul-widget4__users-info"><a\n' +
                    '                                                class="ul-widget2__title" href="#">' + response.Data[i].className + '</a><span class="ul-widget2__username"\n' +
                    '                                                                 href="#">' + SetTime(response.Data[i].timeFrom) + ' - ' + SetTime(response.Data[i].timeTo) + '</span></div>\n' +
                    '                                        <div class="ul-widget4__actions">\n' +
                    '                                            <button class="btn btn-outline-danger m-1"\n' +
                    '                                                    type="button">Enroll</button>\n' +
                    '                                        </div>\n' +
                    '                                    </div>');
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

function GetClasses() {

    $.ajax({
        url: _BaseUrl +  'Class/GetAllClassInfo',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"teacherId": "CITEC001"}),
        processData: false,
        success: function (response, textStatus, jQxhr) {

            $("#MyClassesCards").html("");
            for (var i = 0; i < response.Data.length; i++) {

                $('#MyClassesCards').append(' <div class="col-md-3 col-12">\n' +
                    '                            <div class="card bg-dark text-white o-hidden mb-4"><img class="card-img" src="./dist-assets/images/Techer_Class_Shedule.jpg" alt="Card image">\n' +
                    '                                <div class="card-img-overlay">\n' +
                    '                                    <label class="switch pr-5 switch-warning mr-3"><span id="AccessLabel"></span>\n' +
                    '                                        <input type="checkbox" checked="checked" id="AccessCheckButton' + [i] + '" onclick="SetAccess(\'' + response.Data[i].uniqueClassId + '\',' + [i] + ')"><span class="slider"></span>\n' +
                    '                                    </label>\n' +
                    '                                    <div class="text-center pt-4">\n' +
                    '                                        <h5 class="card-title mb-2 text-white" id="MyClassName">' + response.Data[i].className + '</h5>\n' +
                    '                                        <div class="separator border-top mb-2"></div>\n' +
                    '                                        <p class="text-small font-italic">' + response.Data[i].institute + '</p>\n' +
                    '                                    </div>\n' +
                    '                                    <div class="ul-widget-card__body">\n' +
                    '                                        <div class="ul-widget-card__weather-info"><span style="font-size: 14px">Total Students</span><span style="font-size: 14px">'+response.Data[i].totalStudents+'</span></div>\n' +
                    '                                        <div class="ul-widget-card__weather-info"><span  style="font-size: 14px">Paid</span><span style="font-size: 14px">10</span></div>\n' +
                    '                                        <div class="ul-widget-card__weather-info"><span  style="font-size: 14px">To Be Paid</span><span style="font-size: 14px">40</span></div>\n' +
                    '                                    </div>\n' +
                    '                                    <div class="p-1 text-left card-footer font-weight-light d-flex"><span class="d-flex align-items-center">\n' +
                    '                                            <span class="d-flex align-items-center"><i class="i-Calendar-4 mr-2"></i>' + SetTime(response.Data[i].timeFrom) + ' To ' + SetTime(response.Data[i].timeTo) + ' </span>' +
                    '                                            <button class="btn btn-success btn-icon m-1" type="button" data-toggle="modal" data-target="#UploadZoomLink" onclick="EditClassInfo(\'' + response.Data[i].className + '\',\'' + response.Data[i].institute + '\',\'' + response.Data[i].timeFrom + '\',\'' + response.Data[i].timeTo + '\',\'' + response.Data[i].classId + '\',\'' + response.Data[i].zoomLink + '\',\'' + response.Data[i].uniqueClassId + '\')"><span class="ul-btn__icon" >Edit Info</span></button>\n' +
                    '                                    </span>\n' +
                    '                                    </div>\n' +
                    '                                </div>\n' +
                    '                            </div>\n' +
                    '                        </div>');
                if (response.Data[i].access === "1") {
                    document.getElementById('AccessCheckButton' + [i] + '').checked = true;

                } else if (response.Data[i].access === "0") {
                    document.getElementById('AccessCheckButton' + [i] + '').checked = false;

                }
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

function GetCourses() {

    $.ajax({
        url: _BaseUrl +  'Course/GetAllCoursesInfo',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"teacherId": "CITEC001", "instituteId": document.getElementById("InstituteName").value}),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            $("#ClassId").html("");
            for (i = 0; i < response.Data.length; i++) {
                $('#ClassId').append('<option  value=' + response.Data[i].classId + '>' + response.Data[i].className + '</option>');
            }

        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });


}

function CreateClass() {
    let Year = GetToday(2);
    const UniqueClassId = CreateClassId() + "-" + document.getElementById("Month").value + "-" + document.getElementById("ClassId").value;
    const ClassId = document.getElementById("ClassId").value;
    $.ajax({
        url: _BaseUrl +  'Class/SetClassInfo',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "className": document.getElementById("ClassId").options[document.getElementById("ClassId").selectedIndex].text,
            "institute": document.getElementById("InstituteName").options[document.getElementById("InstituteName").selectedIndex].text,
            "teacherId": "CITEC001",
            "uniqueClassId": UniqueClassId,
            "classId": ClassId,
            "year": Year,
            "month": document.getElementById("Month").options[document.getElementById("Month").selectedIndex].text,
            "day": document.getElementById("ClassDay").value,
            "timeFrom": document.getElementById("NewClassTimeFrom").value,
            "timeTo": document.getElementById("NewClassTimeTo").value,
            "zoomLink": document.getElementById("NewClassZoomMeetingLink").value,
            "access": "1"
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {

            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'Your Class Has Been Created Successfully!',
                    buttonsStyling: false,
                    confirmButtonText: 'Ok',
                    confirmButtonClass: 'btn btn-lg btn-success',
                }).then(function () {
                    if(document.getElementById("ClassId").value === "GWBPAP10/11MATH"){
                        EnrollStudentsToTheClass("GWBGRD10MATH", UniqueClassId);
                        EnrollStudentsToTheClass("GWBGRD11MATH", UniqueClassId);
                    }else if(document.getElementById("ClassId").value === "SBPAP10/11MATH"){
                        EnrollStudentsToTheClass("SBGRD10MATH", UniqueClassId);
                        EnrollStudentsToTheClass("SBGRD11MATH", UniqueClassId);
                    }else{
                        EnrollStudentsToTheClass(ClassId, UniqueClassId);
                    }


                    location.reload();
                });
            } else if (response.Message === "Failure") {
                swal({
                    type: 'error',
                    title: 'Error',
                    text: 'You Have Already Created This Class',
                    buttonsStyling: false,
                    confirmButtonText: 'Dismiss',
                    confirmButtonClass: 'btn btn-lg btn-danger'
                }).then(function () {
                    location.reload();
                });

            }

        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });

}

function EditClassInfo(Class, Institute, TimeFrom, TimeTo, ClassId, ZoomLink, UniqueClassId) {

    document.getElementById("UpdateClassName").value = Class;
    document.getElementById("UpdateInstitute").value = Institute;
    document.getElementById("UpdateTimeTo").value = TimeTo;
    document.getElementById("UpdateTimeFrom").value = TimeFrom;
    document.getElementById("UpdateClassId").value = ClassId;
    document.getElementById("UpdateZoomMeetingLink").value = ZoomLink;
    document.getElementById("UpdateUniqueClassId").value = UniqueClassId;

}

function UpdateCLassInfo() {


    $.ajax({
        url: _BaseUrl +  'Class/UpdateClassInfo',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "teacherId": "CITEC001",
            "className": document.getElementById("UpdateClassName").value,
            "classId": document.getElementById("UpdateClassId").value,
            "uniqueClassId": document.getElementById("UpdateUniqueClassId").value,
            "day": document.getElementById("ClassDay").value,
            "timeFrom": document.getElementById("UpdateTimeFrom").value,
            "timeTo": document.getElementById("UpdateTimeTo").value,
            "zoomLink": document.getElementById("UpdateZoomMeetingLink").value
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'Your Class Have Been Successfully Updated!',
                    buttonsStyling: false,
                    confirmButtonText: 'Ok',
                    confirmButtonClass: 'btn btn-lg btn-success',
                }).then(function () {
                    location.reload();
                });
            } else if (response.Message === "Failure") {
                swal({
                    type: 'error',
                    title: 'Error',
                    text: 'Something Went Wrong!',
                    buttonsStyling: false,
                    confirmButtonText: 'Dismiss',
                    confirmButtonClass: 'btn btn-lg btn-danger'
                }).then(function () {
                    location.reload();
                });
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });

}

function AccessLabel() {
    if (document.getElementById("AccessCheckButton").checked === true) {
        document.getElementById("AccessLabel").innerHTML = "Allow For All";
    } else if (document.getElementById("AccessCheckButton").checked === false) {
        document.getElementById("AccessLabel").innerHTML = "Block Unpaid Students";
    }

}

function SetAccess(UniqueClassId, j) {

    let Access;
    if (document.getElementById("AccessCheckButton" + j).checked === true) {

        Access = 1;
        swal({
            type: 'warning',
            title: 'Warning',
            text: 'This Will Granted Access To All Students (Both Paid & Non-Paid)!',
            buttonsStyling: false,
            confirmButtonText: 'Ok',
            confirmButtonClass: 'btn btn-lg btn-warning'
        });
    } else if (document.getElementById("AccessCheckButton" + j).checked === false) {
        swal({
            type: 'warning',
            title: 'Warning',
            text: 'This Will Block Access To All Non-Paid Students!',
            buttonsStyling: false,
            confirmButtonText: 'Ok',
            confirmButtonClass: 'btn btn-lg btn-warning'
        });
        Access = 0;
    }

    $.ajax({
        url: _BaseUrl +  'Class/SetAccess',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "teacherId": "CITEC001",
            "uniqueClassId": UniqueClassId,
            "access": Access
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {

        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });

}

function EnrollStudentsToTheClass(ClassId, UniqueClassId) {

    $.ajax({
        url: _BaseUrl +  'Class/EnrollStudentsForClass',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"classId": ClassId, "uniqueClassId": UniqueClassId}),
        processData: false,
        success: function (response, textStatus, jQxhr) {
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });


}

function DeleteClass() {

    $.ajax({
        url: _BaseUrl +  'Class/DeleteClass',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"uniqueClassId": document.getElementById("UpdateUniqueClassId").value}),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'Your Class Has Been Successfully Deleted!',
                    buttonsStyling: false,
                    confirmButtonText: 'Ok',
                    confirmButtonClass: 'btn btn-lg btn-success',
                }).then(function () {
                    location.reload();
                });
            } else if (response.Message === "Failure") {
                swal({
                    type: 'error',
                    title: 'Error',
                    text: 'Something Went Wrong!',
                    buttonsStyling: false,
                    confirmButtonText: 'Dismiss',
                    confirmButtonClass: 'btn btn-lg btn-danger'
                }).then(function () {
                    location.reload();
                });
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });


}

function EnterCustomStudentToClass() {

    $.ajax({
        url: _BaseUrl +  'Class/CustomEnrollStudentsForClass',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"studentId": document.getElementById("AddCustomStudent").value,
            "uniqueClassId": document.getElementById("UpdateUniqueClassId").value,
            "classId": document.getElementById("UpdateClassId").value}),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'New Student '+document.getElementById("AddCustomStudent").value+' Has Been Added Successfully',
                    buttonsStyling: false,
                    confirmButtonText: 'Ok',
                    confirmButtonClass: 'btn btn-lg btn-success',
                }).then(function () {
                    document.getElementById("AddCustomStudent").value = "";
                });
            } else if (response.Message === "Failure") {
                swal({
                    type: 'error',
                    title: 'Error',
                    text: 'Cannot Find A Student Under '+document.getElementById("AddCustomStudent").value+'ID',
                    buttonsStyling: false,
                    confirmButtonText: 'Dismiss',
                    confirmButtonClass: 'btn btn-lg btn-danger'
                })
            }else if (response.Message === "Exist") {
                swal({
                    type: 'warning',
                    title: 'Error',
                    text: 'Student Has Already Registered To This Class',
                    buttonsStyling: false,
                    confirmButtonText: 'Dismiss',
                    confirmButtonClass: 'btn btn-lg btn-warning'
                })
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });


}




function ValidateFields() {
    let Fields = document.querySelectorAll(".StudentRegister");
    for (let i = 0; i < Fields.length; i++) {
        if (Fields[i].value === "" || Fields.value === null || Fields.value === " ")
            return false;
    }
    return true;
}

function StudentRegister() {
    if (ValidateFields() === true) {
        $.ajax({
            url: _BaseUrl + 'Student/AddStudent',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                "firstName": document.getElementById("FirstName").value,
                "lastName": document.getElementById("LastName").value,
                "grade": document.getElementById("Grade").value,
                "gender": document.getElementById("Gender").value,
                "dateOfBirth": document.getElementById("DateOfBirth").value,
                "age": document.getElementById("Age").value,
                "address": document.getElementById("Address").value,
                "school": document.getElementById("School").value,
                "guardian": document.getElementById("Guardian").value,
                "contact": document.getElementById("MobileNumber").value,
                "institute": document.getElementById("InstituteName").value,
                "classId": document.getElementById("ClassId").value,
            }),
            processData: false,
            success: function (response, textStatus, jQxhr) {
                if (response.Message === "Success") {
                    swal({
                        type: 'success',
                        title: 'Success',
                        text: 'You Have Successfully Registered! To Enter The Passwords Please Click Next',
                        buttonsStyling: false,
                        confirmButtonText: 'Next',
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function () {
                        setCookie("StudentId", response.Data);
                        window.location.href = 'RegisterSuccess.jsp';
                    });
                } else if (response.Message === "Exist") {
                    swal({
                        type: 'error',
                        title: 'Warning!',
                        text: 'Sorry You Have Already Registered!',
                        buttonsStyling: false,
                        confirmButtonText: 'OK',
                        confirmButtonClass: 'btn btn-lg btn-success'
                    })
                }

            },
            error: function (jqXhr, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    } else if (ValidateFields() === false) {
        swal({
            type: 'warning',
            title: 'Oops!!',
            text: 'Please Fill All The Required Fields! ',
            buttonsStyling: false,
            confirmButtonText: 'OK',
            confirmButtonClass: 'btn btn-lg btn-warning'
        })
    }
}

function SetPassword() {
    let Password = document.getElementById("Password").value;
    let RePassword = document.getElementById("RePassword").value;
    if (Password === RePassword) {
        $.ajax({
            url: _BaseUrl + 'Student/SetPassword',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                "password": document.getElementById("Password").value,
                "studentId": StudentId,
            }),
            processData: false,
            success: function (response, textStatus, jQxhr) {
                if (response.Message === "Success") {
                    swal({
                        type: 'success',
                        title: 'Success',
                        text: 'Great! Registration Process Has Been Completed! Our Team Will Be Reviewed Your Account And Once We Accept Your request, You Can Login!',
                        buttonsStyling: false,
                        confirmButtonText: 'OK',
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function () {
                        window.location.href = 'login.jsp';
                    });
                } else if (response.Message === "Failure") {
                    swal({
                        type: 'error',
                        title: 'Oops!',
                        text: 'Something Went Wrong!',
                        buttonsStyling: false,
                        confirmButtonText: 'OK',
                        confirmButtonClass: 'btn btn-lg btn-success'
                    })
                }

            },
            error: function (jqXhr, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    } else {
        swal({
            type: 'warning',
            title: 'Oops!!',
            text: 'Passwords Do Not Match!',
            buttonsStyling: false,
            confirmButtonText: 'OK',
            confirmButtonClass: 'btn btn-lg btn-warning'
        })
    }

}

function GetStudentClasses() {
    $.ajax({
        url: _BaseUrl + 'Class/GetMyClass',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"studentId": getCookie("StudentId"), "month": GetToday(1), "year": GetToday(2)}),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            $("#MyClassesCardsStudent").html("");
            for (let i = 0; i < response.Data.length; i++) {
                $('#MyClassesCardsStudent').append(' <div class="col-md-3 col-12">\n' +
                    '                            <div class="card bg-dark text-white o-hidden mb-4"><img class="card-img" src="./dist-assets/images/student_class.jpg" alt="Card image">\n' +
                    '                                <div class="card-img-overlay">\n' +
                    '                                    <div class="text-center pt-4">\n' +
                    '                                        <h5 class="card-title mb-2 text-white" id="MyClassName">' + response.Data[i].className + '</h5>\n' +
                    '                                        <div class="separator border-top mb-2"></div>\n' +
                    '                                        <p class="text-small font-italic">' + response.Data[i].institute + '</p>\n' +
                    '                                    </div>\n' +
                    '                                    <div class="ul-widget-card__body">\n' +
                    '                                            <span class="d-flex align-items-center"><i class="i-Calendar-2 mr-2"></i>' + response.Data[i].month + ' </span>' +
                    '                                            <span class="d-flex align-items-center"><i class="i-Calendar-3  mr-2"></i>' + response.Data[i].day + ' </span>' +
                    '                                            <span class="d-flex align-items-center"><i class="i-Calendar-4 mr-2"></i>' + SetTime(response.Data[i].timeFrom) + ' To ' + SetTime(response.Data[i].timeTo) + ' </span>' +
                    '                                    </div>\n' +
                    '                                    <div class="p-1 text-left card-footer font-weight-light d-flex"><span class="d-flex align-items-center">\n' +
                    '                                            <button class="btn btn-success btn-icon m-1" type="button" data-toggle="modal" data-target="#UploadZoomLink" onclick="UploadPaymentSlip(\'' + response.Data[i].uniqueClassId + '\',\'' + response.Data[i].studentId + '\')"><span class="ul-btn__icon" >Payments</span></button>\n' +
                    '                                            <button class="btn btn-primary btn-icon m-1" type="button" onclick="CheckStudentAccess(\'' + response.Data[i].uniqueClassId + '\',\'' + response.Data[i].studentId + '\',\'' + response.Data[i].zoomLink + '\')"><span class="ul-btn__icon" >Enroll</span></button>\n' +
                    '                                    </span>\n' +
                    '                                    </div>\n' +
                    '                                </div>\n' +
                    '                            </div>\n' +
                    '                        </div>');
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

function UploadPaymentSlip(UniqueClassId, StudentId) {

    document.getElementById("StudentId").value = StudentId;
    document.getElementById("UniqueClassId").value = UniqueClassId;

}

function CheckStudentAccess(UniqueClassId, StudentId, ZoomLink) {
    $.ajax({
        url: _BaseUrl + 'Class/CheckAccess',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "studentId": StudentId,
            "uniqueClassId": UniqueClassId,
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {

            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Loading...',
                    text: 'You Will Be Redirect To The Zoom Application',
                    buttonsStyling: false,
                    confirmButtonText: 'Take Me To Zoom',
                    confirmButtonClass: 'btn btn-lg btn-success'
                }).then(function () {
                    window.open(ZoomLink, '_blank');
                });
            } else if (response.Message === "Failure") {
                swal({
                    type: 'warning',
                    title: 'Sorry!',
                    text: 'You Are Not Payed For This Class Yet! Please Do The Payments And Try To Re-Join',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    confirmButtonClass: 'btn btn-lg btn-warning'
                })
            }

        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

function ClearForm() {

    let Fields = document.querySelectorAll(".StudentRegister");

    for (let i = 0; i < Fields.length; i++) {
        Fields[i].value = "";
    }

}

function ShowStudentInfo(StudentId) {


    $.ajax({
        url: _BaseUrl + 'Student/GetStudentInfo',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "studentId": StudentId,
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                if (response.Data.blockStatus === "1") {
                    document.getElementById("StudentStatus").innerHTML = "This Student Has Been Blocked";
                    document.getElementById("StudentStatus").style.color = "#ff0000";
                    document.getElementById("BlockStudent").innerText = "Unblock";
                } else {
                    document.getElementById("StudentStatus").innerHTML = "Active";
                    document.getElementById("StudentStatus").style.color = "#09aa09";
                    document.getElementById("BlockStudent").innerText = "Block";
                }
                document.getElementById("ShowStudentId").value = response.Data.studentId;
                document.getElementById("ShowFirstName").value = response.Data.firstName;
                document.getElementById("ShowAge").value = response.Data.age;
                document.getElementById("ShowLastName").value = response.Data.lastName;
                document.getElementById("ShowGender").value = response.Data.gender;
                document.getElementById("ShowGrade").value = response.Data.grade;
                document.getElementById("ShowAddress").value = response.Data.address;
                document.getElementById("ShowSchool").value = response.Data.school;
                document.getElementById("ShowGuardian").value = response.Data.guardian;
                document.getElementById("ShowMobileNumber").value = response.Data.contact;
                document.getElementById("InstituteName").value = response.Data.institute;
                GetCourses();
                setTimeout(function () {
                    document.getElementById("ClassId").value = response.Data.classId;
                }, 1000);
                document.getElementById("ShowDateOfBirth").value = response.Data.birthDay;
                ;
            } else if (response.Message === "Exist") {
                swal({
                    type: 'error',
                    title: 'Warning!',
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

function UpdateStudentInfo() {
    alert(document.getElementById("ShowGender").value);
    $.ajax({
        url: _BaseUrl + 'Student/UpdateStudentInfo',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "studentId": document.getElementById("ShowStudentId").value,
            "firstName": document.getElementById("ShowFirstName").value,
            "lastName": document.getElementById("ShowLastName").value,
            "grade": document.getElementById("ShowGrade").value,
            "gender": document.getElementById("ShowGender").value,
            "dateOfBirth": document.getElementById("ShowDateOfBirth").value,
            "age": document.getElementById("ShowAge").value,
            "address": document.getElementById("ShowAddress").value,
            "school": document.getElementById("ShowSchool").value,
            "guardian": document.getElementById("ShowGuardian").value,
            "contact": document.getElementById("ShowMobileNumber").value,
            "institute": document.getElementById("InstituteName").value,
            "classId": document.getElementById("ClassId").value,
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'Student Info Has Been Updated Successfully',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    confirmButtonClass: 'btn btn-lg btn-success'
                }).then(function () {
                    location.reload();
                });
            } else if (response.Message === "Failure") {
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

function DeleteStudent(StudentId) {

    swal({
        title: 'Are you sure?',
        text: "If You Delete This Student, You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#0CC27E',
        cancelButtonColor: '#FF586B',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!',
        confirmButtonClass: 'btn btn-success mr-5',
        cancelButtonClass: 'btn btn-danger',
        buttonsStyling: false
    }).then(function () {
        $.ajax({
            url: _BaseUrl + 'Student/DeleteStudent',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                "studentId": StudentId,
            }),
            processData: false,
            success: function (response, textStatus, jQxhr) {
                if (response.Message === "Success") {
                    swal({
                        type: 'success',
                        title: 'Success',
                        text: 'Student  Has Been Deleted Successfully',
                        buttonsStyling: false,
                        confirmButtonText: 'OK',
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function () {
                        location.reload();
                    });
                } else if (response.Message === "Failure") {
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
    }, function (dismiss) {
        // dismiss can be 'overlay', 'cancel', 'close', 'esc', 'timer'
        if (dismiss === 'cancel') {
            // swal('Cancelled', 'Your imaginary file is safe :)', 'error');
        }
    });

}

function BlockStudent() {
    $.ajax({
        url: _BaseUrl + 'Student/BlockStudent',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "studentId": document.getElementById("ShowStudentId").value,
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {

            if (response.Data === "1") {
                swal({
                    type: 'warning',
                    title: 'Blocked',
                    text: 'Student Have Been Blocked!',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    confirmButtonClass: 'btn btn-lg btn-warning'
                }).then(function () {
                    location.reload();
                });
            } else if (response.Data === "0") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'Student Have Been Unblocked!',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    confirmButtonClass: 'btn btn-lg btn-success'
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

function ShowPendingStudentInfo(StudentId) {

    $.ajax({
        url: _BaseUrl + 'Student/GetStudentInfo',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "studentId": StudentId,
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                if (response.Data.blockStatus === "2") {
                    document.getElementById("PendingStudentStatus").innerHTML = "Pending";
                    document.getElementById("PendingStudentStatus").style.color = "#09aa09";
                    document.getElementById("PendingStudentButton").innerText = "Approve";
                } else {
                    document.getElementById("PendingStudentStatus").innerHTML = "Unknown Status";
                    document.getElementById("PendingStudentStatus").style.color = "#ff0000";
                    document.getElementById("PendingStudentButton").innerText = "Unblock";
                }
                document.getElementById("PendingStudentId").innerHTML = response.Data.studentId;
                document.getElementById("PendingFirstName").innerHTML = response.Data.firstName;
                document.getElementById("PendingAge").innerHTML = response.Data.age;
                document.getElementById("PendingLastName").innerHTML = response.Data.lastName;
                document.getElementById("PendingGender").innerHTML = response.Data.gender;
                // document.getElementById("ShowGrade").innerHTML = response.Data.grade;
                document.getElementById("PendingAddress").innerHTML = response.Data.address;
                document.getElementById("PendingSchool").innerHTML = response.Data.school;
                document.getElementById("PendingGuardian").innerHTML = response.Data.guardian;
                document.getElementById("PendingMobileNumber").innerHTML = response.Data.contact;
                document.getElementById("PendingInstitute").innerHTML = response.Data.institute;
                document.getElementById("PendingClassId").innerHTML = response.Data.classId;

            } else if (response.Message === "Failed") {
                swal({
                    type: 'error',
                    title: 'Warning!',
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

function ApproveRequest() {

    $.ajax({
        url: _BaseUrl + 'Student/ApproveRequest',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "studentId": document.getElementById("PendingStudentId").innerHTML.trim(),
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {

            if (response.Data === "Success") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'Request Has Been Successfully Accepted!',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    confirmButtonClass: 'btn btn-lg btn-success'
                }).then(function () {
                    location.reload();
                });
            } else if (response.Data === "Failed" ) {
                swal({
                    type: 'warning',
                    title: 'Error',
                    text: 'Something Went Wrong!',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
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
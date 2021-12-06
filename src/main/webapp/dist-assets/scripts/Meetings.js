function GetMeetingRecordsInfo() {
    document.getElementById("RecordsClassId").value = document.getElementById("UpdateClassName").value;
    document.getElementById("RecordsTimeFrom").value = document.getElementById("UpdateTimeFrom").value;
    document.getElementById("RecordsTimeTo").value = document.getElementById("UpdateTimeTo").value;
    document.getElementById("RecordsInstitute").value = document.getElementById("UpdateInstitute").value;
    document.getElementById("RecordsUniqueClassId").value = document.getElementById("UpdateUniqueClassId").value;
    document.getElementById("RecordsCommonClassId").value = document.getElementById("UpdateClassId").value;
}

function SaveMeetingRecord() {
    if (ValidateFields("RecordsData") === true) {
        $.ajax({
            url: _BaseUrl + 'Meetings/SaveMeetingRecords',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                "teacherId": document.getElementById("RecordsTeacherId").value,
                "uniqueClassId": document.getElementById("RecordsUniqueClassId").value,
                "className": document.getElementById("RecordsClassId").value,
                "institute": document.getElementById("RecordsInstitute").value,
                "date": document.getElementById("RecordsDate").value,
                "timeFrom": document.getElementById("RecordsTimeFrom").value,
                "timeTo": document.getElementById("RecordsTimeTo").value,
                "recordLink": document.getElementById("RecordsLink").value,
                "remarks": document.getElementById("RecordsRemarks").value,
                "classId": document.getElementById("RecordsCommonClassId").value,
            }),
            processData: false,
            success: function (response, textStatus, jQxhr) {
                if (response.Message === "Success") {
                    swal({
                        type: 'success',
                        title: 'Success',
                        text: 'Link Has Been Saved Successfully! Please Go To The Records Tab To See The Results',
                        buttonsStyling: false,
                        confirmButtonText: 'Ok',
                        confirmButtonClass: 'btn btn-lg btn-success'
                    })
                } else if (response.Message === "Exist") {
                    swal({
                        type: 'error',
                        title: 'Warning!',
                        text: 'Sorry You Have Already Saved This Link Under This Class Id. Please Go To The Records Tab To See The Previous Records',
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
    }else {
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

function DeleteMeetingRecord(UniqueClassId, RecordLink) {
    $.ajax({
        url: _BaseUrl + 'Meetings/DeleteMeetingRecords',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "uniqueClassId": UniqueClassId,
            "recordLink": RecordLink,
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Success',
                    text: 'Link Has Been Deleted Successfully!',
                    buttonsStyling: false,
                    confirmButtonText: 'Ok',
                    confirmButtonClass: 'btn btn-lg btn-success'
                }).then(function () {
                    location.reload();
                });
            } else if (response.Message === "Failure") {
                swal({
                    type: 'error',
                    title: 'Error!',
                    text: 'Something Went Wrong! Please Try Again',
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

function ValidateFields(ClassName) {
    let Fields = document.querySelectorAll("."+ClassName);
    for (let i = 0; i < Fields.length; i++) {
        if (Fields[i].value === "" || Fields.value === null || Fields.value === " " )
            return false;
    }
    return true;
}

function RedirectToRecordLink(UniqueClassId, RecordLink){
    $.ajax({
        url: _BaseUrl + 'Meetings/GetMeetingRecords',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            "studentId": getCookie("StudentId"),
            "uniqueClassId": UniqueClassId,
        }),
        processData: false,
        success: function (response, textStatus, jQxhr) {
            if (response.Message === "Success") {
                swal({
                    type: 'success',
                    title: 'Loading...',
                    text: 'You Will Be Redirect To The Zoom Records',
                    buttonsStyling: false,
                    confirmButtonText: 'Take Me To Zoom Record',
                    confirmButtonClass: 'btn btn-lg btn-success'
                }).then(function () {
                    window.open(RecordLink, '_blank');
                });

            } else if (response.Message === "Failure") {
                swal({
                    type: 'warning',
                    title: 'Warning!',
                    text: 'You Are Not Able To Access The Records Until You Paid The Class!',
                    buttonsStyling: false,
                    confirmButtonText: 'OK',
                    confirmButtonClass: 'btn btn-lg btn-warning'
                });
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}


function GetInstituteInfo(){

        $.ajax({
            url:  _BaseUrl + 'Institute/GetAllInstitute',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({"instituteId": ""}),
            processData: false,
            success: function (response, textStatus, jQxhr) {
                $("#InstituteName").html("");
                $('#InstituteName').append('<option  selected value="">--Select Institute--</option>');
                for (i=0; i<response.Data.length; i++){
                    $('#InstituteName').append('<option  value='+response.Data[i].instituteId+'>'+response.Data[i].instituteName+'</option>');
                }
            },
            error: function (jqXhr, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
        
}
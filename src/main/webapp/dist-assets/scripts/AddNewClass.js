function CreatClass(){
    $.ajax({
        // url: 'http://localhost:8084/DietSrilanka_war_exploded/GetDataNew',
        url: 'http://213.136.77.176:8080/DietSrilanka2/GetDataNew',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({"CaloriesCount": Count}),
        processData: false,
        success: function (response, textStatus, jQxhr) {


        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

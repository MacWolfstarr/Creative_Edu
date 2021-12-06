function CreateClassId() {
    var dateObj = new Date();
  //  var month = dateObj.getUTCMonth() + 1; //months from 1-12
   // var day = dateObj.getUTCDate();
    var year = dateObj.getUTCFullYear();

    newdate = year ;
    return newdate;

}

function GetCurrentYear(){
    let d = new Date();
    var Year = d.getFullYear();
    return Year;
}
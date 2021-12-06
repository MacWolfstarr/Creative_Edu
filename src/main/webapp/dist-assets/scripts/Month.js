function GetMonth(id) {
    var Month;
    if (id === "1") {
        Month = "January";
    } else if (id === "2") {
        Month = "February";
    } else if (id === "3") {
        Month = "March";
    } else if (id === "4") {
        Month = "April";
    } else if (id === "5") {
        Month = "May";
    } else if (id === "6") {
        Month = "June";
    } else if (id === "7") {
        Month = "July";
    } else if (id === "8") {
        Month = "August";
    } else if (id === "9") {
        Month = "September";
    } else if (id === "10") {
        Month = "October";
    } else if (id === "11") {
        Month = "November";
    } else if (id === "12") {
        Month = "December";
    }

    return Month;
}

function GetDate(Day) {

    var Today;
    if (Day === "1") {
        Today = "Sunday";
    } else if (Day === "2") {
        Today = "Monday";
    } else if (Day === "3") {
        Today = "Tuesday";
    } else if (Day === "4") {
        Today = "Wednesday";
    } else if (Day === "5") {
        Today = "Thursday";
    } else if (Day === "6") {
        Today = "Friday";
    } else if (Day === "7") {
        Today = "Saturday";
    }

    return Today;

}

function GetToday(id) {
    var ReturnValue;
    var weekdays = new Array(7);
    weekdays[0] = "Sunday";
    weekdays[1] = "Monday";
    weekdays[2] = "Tuesday";
    weekdays[3] = "Wednesday";
    weekdays[4] = "Thursday";
    weekdays[5] = "Friday";
    weekdays[6] = "Saturday";
    var current_date = new Date();
    weekday_value = current_date.getDay();

    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];
    const Today = new Date();

    var Year = Today.getFullYear();

    if (id === 0) {
        ReturnValue = weekdays[weekday_value];
    }
    if (id === 1) {
        ReturnValue = monthNames[Today.getMonth()];
    }
    if (id === 2) {
        ReturnValue = Year;
    }
    return ReturnValue;

}

function SetTime(Time){

    var timeString = Time;
    var H = +timeString.substr(0, 2);
    var h = H % 12 || 12;
    var ampm = (H < 12 || H === 24) ? "AM" : "PM";
    timeString = h + timeString.substr(2, 3) + " "+ampm;

    return timeString;
}
function tableCreator() {
    var scheduleTable = document.getElementById("scheduleTable");

    var data = JSON.stringify({
    });

    var xhr = new XMLHttpRequest();
    xhr.withCredentials = true;

    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === 4) {
            var response = JSON.parse(this.responseText);
            var schedules = response.data;
        }
    });

    xhr.open("POST", "http://localhost:8080/schedule/list/weekly");
    var token = getCookie("access_token");
    xhr.setRequestHeader("authorization", "Bearer " + token);
    xhr.setRequestHeader("content-type", "application/json");

    xhr.send(data);
    
}


/**
 * 新增schedule
 */
function addSchedule() {
    var date;
    var start;
    var end;
    var content;
    var venue;

    var data = JSON.stringify({
        "date": date,
        "start": start,
        "end": end,
        "content": content,
        "venue": venue
    });

    var xhr = new XMLHttpRequest();
    xhr.withCredentials = true;

    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === 4) {
            console.log(this.responseText);
        }
    });

    xhr.open("POST", "http://localhost:8080/schedule");
    var token = getCookie("access_token");
    xhr.setRequestHeader("authorization", "Bearer " + token);

    xhr.send(data);
}

/**
 * 更新schedule
 */
function updateSchedule() {
    var date;
    var start;
    var end;
    var content;
    var venue;
    var uid;

    var data = JSON.stringify({
        "uid": uid,
        "date": date,
        "start": start,
        "end": end,
        "content": content,
        "venue": venue
    });

    var xhr = new XMLHttpRequest();
    xhr.withCredentials = true;

    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === 4) {
            console.log(this.responseText);
        }
    });

    xhr.open("PUT", "http://localhost:8080/schedule");
    var token = getCookie("access_token");
    xhr.setRequestHeader("authorization", "Bearer " + token);

    xhr.send(data);
}
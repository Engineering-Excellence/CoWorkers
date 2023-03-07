// 소켓 전역변수 선언
var socket = null;
console.log("소켓 연결", socket);
// 한번만 메시지 알림을 위해 alarmCount 변수 설정
var alarmCount = 0;
$(function () {
    connectWs();
    setTimeout(() => {
        // 시작후 0.3초후 알림데이터 가져오기
        sock.send("${loginId}");
    }, 300);
    // 5초마다 알림데이터 가져오기
    setInterval("autoScript()", 5000);
});

function autoScript() {
    sock.send("${loginId}");
}

function connectWs() {
    console.log("연결됨: " + getContextPath());
    sock = new SockJS(getContextPath() + '/alarm');
    socket = sock;
    sock.onopen = function () {
        console.log('open');
    };


    sock.onmessage = function (evt) {
        var data = evt.data;
        console.log("ReceivMessage : " + data + "\n");
        if (data != "null") {
            const obj = JSON.parse(data);
            alarmData(obj);
            console.log("alarmData: ", parseInt(obj.countInform));
            console.log("alarmData: ", obj.subject);
        } else {
            $("#alarm-span").hide();
            $("#no-alarm").show();
        }
    };


    sock.onclose = function () {
        console.log('connect close');
    };

    sock.onerror = function (err) {
        console.log('Errors : ', err);
    };
}

function alarmListMove() {
    location.href = "new";
}

function getContextPath() {
    var hostIndex = location.href.indexOf(location.host) + location.host.length;
    return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
};


function alarmData(obj) {
    $("#alarm-span").hide();
    $("#no-alarm").show();

    if (obj.important > 0 && location.href.indexOf("important") == -1 && location.href.indexOf("new") == -1 && location.href.indexOf("memo") == -1) {
        $("#newB").show();
        $("#alarm-span").show();
        $("#no-alarm").hide();
        $("#alarm-span").text(obj.countInform);
        alert(obj.userName + "님으로부터 중요 쪽지(" + obj.subject + ")가 도착했습니다.")
        window.location = "important"
    }
    else if (obj.countInform > 0) {
        $("#alarm-span").show();
        $("#no-alarm").hide();
        $("#alarm-span-count").text(obj.countInform);
    } else {
        $("#alarm-span").hide();
        $("#no-alarm").show();
    }
}
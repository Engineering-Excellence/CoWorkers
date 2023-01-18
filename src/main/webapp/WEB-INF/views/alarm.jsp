<%-- 조우철 --%>

<%--
<div class="toast align-items-center fade" role="alert" id='alert-toast' aria-live="assertive" aria-atomic="true"
     style="color: white;background: #dc5151; position: absolute;
    top: 78px;right: 0px;">
    <div class="d-flex">
        <div class="toast-body">
        </div>
        <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
</div>
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>

    //소켓 전역변수 선언
    var socket = null;
    console.log("소켓 연결", socket);
    //한번만 메시지 알림을 위해 alarmCount 변수 설정
    var alarmCount = 0;
    $(function () {
        connectWs();

        setTimeout(() => {
            //시작후 0.3초후 알림데이터 가져오기
            sock.send("${loginId}");
        }, 300);

        //10초마다 알림데이터 가져오기
        setInterval("autoScript()", 10000);
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
        //알람 보이기
        if (obj.important > 0) {

            // if now page is not ("important" "new" "memo")
            if (location.href.indexOf("important") == -1 && location.href.indexOf("new") == -1 && location.href.indexOf("memo") == -1) {
                $("#alarm-span").show();
                $("#alarm-span").text(obj.important);
                alert(obj.userName + "님으로부터 중요 쪽지("+obj.subject+")가 도착했습니다.")
                window.location = "important"
            }

        }
        if (parseInt(obj.countInform) > 0) {
            $("#alarm-span-count").text(obj.countInform);
            $("#alarm-span").show();

            //토스트 메시지 보이기
/*
            if (alarmCount === 0) {
                var html = '<a style="color:#fff; text-decoration: none;"  href="${pageContext.request.contextPath}/alarmLinkMove?type=fbdetail&postId=' + obj.relatedId + '&informid=' + obj.informId + '">' + obj.informContent + '</a>';
                $("#alert-toast .toast-body").html(html);
                $("#alert-toast").addClass("show");
                $("#alert-toast .d-flex").css("display", "block");


                setTimeout(() => {
                    $("#alert-toast").removeClass("show");
                    $("#alert-toast .d-flex").css("display", "none");
                }, 5000);
            }

            alarmCount++;
            */
        } else {
            $("#alarm-span").hide();
        }




    }
</script>
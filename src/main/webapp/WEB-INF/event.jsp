<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Date" %>
<%@page import="com.silvertier.dto.WorkDTO" %>
<%@page import="java.util.List" %>
<%@page import="com.silvertier.dto.EventDTO" %>
<%@page import="com.silvertier.calendar.MyCalendar" %>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="icon" href="./images/doker.ico">
    <title>Event</title>

    <link href="./css/event.css" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <link href="./css/coWorkers.css" rel="stylesheet">
    <link href="./css/event.css" rel="stylesheet">

</head>
<body>

<!-- 상단 네비게이션 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="mainView.sil">coWorkers</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">프로필</a></li>
                <li><a href="#">환경설정</a></li>
                <li><a href="logout.sil">로그아웃</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<!-- 좌측 사이드 -->
<div class="container-fluid">
    <div class="row">
        <!-- 좌측 사이드 -->
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="board.sil">게시글</a></li>
                <li><a href="work.sil">업무관리</a></li>
                <li><a href="event.sil">일정관리</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">일정 관리</h1>

            <!-- 캘린더 -->
            <%
                Calendar calendar = Calendar.getInstance();
                int year = calendar.get(Calendar.YEAR);
                int month = calendar.get(Calendar.MONTH) + 1;
                try {
                    year = request.getParameter("year") == null ? calendar.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year"));
                    month = request.getParameter("month") == null ? calendar.get(Calendar.MONTH) + 1 : Integer.parseInt(request.getParameter("month"));
                    if (month == 13) {
                        year++;
                        month = 1;
                    } else if (month == 0) {
                        year--;
                        month = 12;
                    }
                } catch (NumberFormatException e) {
                }
//   out.println(year + "년 " + month + "월");
            %>
            <div class="table-reponsive">
                <div style="display: inline;">
                    <a title="지난달" href="event.sil?year=<%=year%>&month=<%=month-1%>"><img width="30px" alt="지난달"
                                                                                           src="./images/arrow_left.png"></a>
                </div>
                <div style="display: inline; font-size: 30px">
                    &nbsp;&nbsp;<%=year%>년 <%=month%>월&nbsp;&nbsp;
                </div>
                <div style="display: inline;">
                    <a title="지난달" href="event.sil?year=<%=year%>&month=<%=month+1%>"><img width="30px" alt="다음달"
                                                                                           src="./images/arrow_right.png"></a>
                </div>
                <div style="float: right ">
                    <!-- 모달 실행 버튼 -->
                    <%-- <button type="button" class="btn btn-default" onclick="showWork(${wDTO})">긴급업무</button>
                    <button type="button" class="btn btn-default" onclick="showEvent(${eDTO})">일정</button> --%>
                    <button type="button" class="btn btn-default" onclick="location.href='event.sil'">오늘</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">일정추가
                    </button>
                    <button type="button" class="btn btn-default" onclick="location.href='eventList.sil'">리스트보기</button>
                </div>
            </div>
            <br/>

            <div class="table-responsive">
                <table class="table table-striped">
                    <tr>
                        <th id="sunday" width="100" height="40"><span
                                style="font-weight: bold; font-size: 15px;">일</span></th>
                        <th width="100px"><span style="font-weight: bold; font-size: 15px;">월</span></th>
                        <th width="100px"><span style="font-weight: bold; font-size: 15px;">화</span></th>
                        <th width="100px"><span style="font-weight: bold; font-size: 15px;">수</span></th>
                        <th width="100px"><span style="font-weight: bold; font-size: 15px;">목</span></th>
                        <th width="100px"><span style="font-weight: bold; font-size: 15px;">금</span></th>
                        <th width="100px" id="saturday" style="font-weight: bold;"><span>토</span></th>
                    </tr>

                    <!-- 달력에 날짜를 출력한다. -->
                    <tr>

                        <%
                            //   달력을 출력할 달 1일의 요일을 계산해둔다.
                            int week = MyCalendar.weekDay(year, month, 1);

                            //   빈 칸에 출력할 전달 날짜의 시작일을 계산한다.
                            int start = 0;
                            if (month == 1) {
                                start = MyCalendar.lastDay(year - 1, 12) - week; // 1월
                            } else {
                                start = MyCalendar.lastDay(year, month - 1) - week; // 2 ~ 12월
                            }

                            //   1일이 출력될 위치(요일)을 맞추기 위해 달력을 출력할 달 1일의 요일만큼 반복하며 전달 날짜를 출력한다.
                            for (int i = 0; i < MyCalendar.weekDay(year, month, 1); i++) {
                                if (i == 0) {
                                    out.println("<td class='beforesun' id='" + year + "-" + (month == 1 ? 12 : month - 1) + "-" + ++start + "' style='padding: 0px; vertical-align:top; height:100px; color : darkgray;' >" + (month == 1 ? 12 : month - 1) + "/" + start + "</td>");
                                } else {
                                    out.println("<td class='before' id='" + year + "-" + (month == 1 ? 12 : month - 1) + "-" + ++start + "' style='padding: 0px; vertical-align:top; height:100px; color : darkgray;'>" + (month == 1 ? 12 : month - 1) + "/" + start + "</td>");
                                }
                            }

                            //   1일부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력한다.
                            for (int i = 1; i <= MyCalendar.lastDay(year, month); i++) {
                                // <td> 태그에 요일에 따른 class 속성을 지정한다.
                                switch (MyCalendar.weekDay(year, month, i)) {
                                    case 0: // 일요일
                                        out.println("<td class='sun' id='" + year + "-" + month + "-" + (i >= 10 ? i : '0' + Integer.toString(i)) + "' style='padding: 0px; margin: 100px; vertical-align:top; height:100px' >" + i + "</td>");
                                        break;
                                    case 6: // 토요일
                                        out.println("<td class='sat' id='" + year + "-" + month + "-" + (i >= 10 ? i : '0' + Integer.toString(i)) + "' style='padding: 0px; margin: 100px; vertical-align:top; height:100px'>" + i + "</td>");
                                        break;
                                    default:
                                        out.println("<td id='" + year + "-" + month + "-" + (i >= 10 ? i : '0' + Integer.toString(i)) + "' style='padding: 0px; margin: 100px; vertical-align:top; height:100px'>" + i + "</td>");
                                        break;
                                }

                                // 출력한 날짜가 토요일이고 그 달의 마지막 날짜가 아니면 줄을 바꾼다.
                                if (MyCalendar.weekDay(year, month, i) == 6 && i != MyCalendar.lastDay(year, month)) {
                                    out.println("</tr><tr>");
                                }
                            }

                            //   다음달 1일의 요일을 계산한다.
                            if (month == 12) {
                                week = MyCalendar.weekDay(year + 1, 1, 1); // 12월
                            } else {
                                week = MyCalendar.weekDay(year, month + 1, 1); // 1 ~ 11월
                            }

                            //   다음달 1일이 일요일이면 다음달 날짜를 출력할 필요없다.
                            if (week != 0) {
                                // 날짜를 다 출력하고 남은 빈 칸에 다음달 날짜를 다음달 1일의 요일부터 토요일까지 반복하며 출력
                                start = 0;
                                for (int i = week; i <= 6; i++) {
                                    if (i == 6) {
                                        out.println("<td class='aftersat' id='" + (month == 12 ? 1 : month + 1) + "/" + ++start + "' style='padding: 0px; vertical-align:top; height:100px; color : darkgray;'>" + (month == 12 ? 1 : month + 1) + "/" + start + "</td>");
                                    } else {
                                        out.println("<td class='after' id='" + (month == 12 ? 1 : month + 1) + "/" + ++start + "' style='padding: 0px; vertical-align:top; height:100px; color : darkgray;'>" + (month == 12 ? 1 : month + 1) + "/" + start + "</td>");
                                    }
                                }
                            }
                        %>

                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<br/><br/>


<!-- Modal_insert -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form action="eventInsertOK.sil" method="post">
                    <table class="table">
                        <tr class="table-primary">
                            <th colspan="3" style="font-size: 30px; text-align: center;">일정 작성</th>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <input id="subject" type="text"
                                       class="form-control"
                                       width="80%"
                                       name="subject" autocomplete="none"
                                       placeholder="제목을 입력하세요."/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" name="userName" value="${userInfo.get(0).getUserName()}" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark" width="30px">
                                <label for="eventColor">색상</label>
                            </th>
                            <td class="align-middle" colspan="2">
                                <select id="eventColor" name="eventColor"
                                        onchange="selectBoxChgColor(value);">
                                    <option value="#E1E1E0">
                                        낮음<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png" width="15px">
                                    </option>
                                    <option value="#CDFFBE">
                                        보통<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png" width="15px">
                                    </option>
                                    <option value="#FAFFCD">
                                        높음<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png"
                                               width="15px">
                                    </option>
                                    <option value="#FFCDCD">
                                        긴급<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
                                    </option>
                                </select>

                                <img alt="gray" src="./images/gray_E1E1E0.png" width="15px">
                                <img alt="green" src="./images/green_CDFFBE.png" width="15px">
                                <img alt="yellow" src="./images/yellow_FAFFCD.png" width="15px">
                                <img alt="red" src="./images/red_FFCDCD.png" width="15px">
                                <!-- <input class="form-check-input"
                                        type="checkbox"
                                        name="isAllDay"
                                        value="yes"
                                /> -->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="form-check-input"
                                       type="date"
                                       name="startDate"
                                       min="2000-01-01"
                                       max="2050-12-31"
                                       id="startDate"
                                />
                                <!-- <input type="button" onclick="starDateChk()"> -->
                            </td>
                            <td>
                                <input id="endDate"
                                       type="date"
                                       name="endDate"
                                       min="2000-01-01"
                                       max="2050-12-31"
                                />
                                &nbsp;&nbsp;&nbsp;
                                종일 <input class="form-check-input"
                                          type="checkbox"
                                          name="allDay"
                                          value="true"
                                          id="allDay"
                            />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="3">
                     <textarea
                             id="content"
                             class="form-control form-control-sm"
                             rows="10"
                             name="content"
                             style="resize: none;"
                             placeholder="내용을 입력하세요."
                     ></textarea>
                                <!-- <input type="button" onclick="checkConent()"> -->
                            </td>

                        </tr>
                        <tr class="table-secondary">
                            <td colspan="3" align="center">
                                <input
                                        class="btn btn-outline-primary btn-sm"
                                        type="submit"
                                        value="등록하기"
                                        style="font-size: 13px;"
                                />
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
                    <input type="hidden" name="userID" value="${userInfo.get(0).getUserID()}"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="./js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(() => {
        now = new Date();
        now = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
        $('#' + now).css({'background-color': '#E8E8E8', 'font-weight': 'bold'})
    })
</script>
<script>
    var eDTO = new Array();
    var wDTO = new Array();

    <c:forEach items="${eList}" var="eDTO">
    eDTO.push("${eDTO.eventID}");
    eDTO.push("${eDTO.startDate}");
    eDTO.push("${eDTO.endDate}");
    eDTO.push("${eDTO.subject}");
    eDTO.push("${eDTO.eventColor}");
    eDTO.push('${eDTO.writeDate}')
    </c:forEach>

    <c:set var = "eDeleteDate" value="${eDTO.deleteDate}"/>
    <c:set var = "wDeleteDate" value="${wDTO.deleteDate}"/>

    <c:forEach items="${wList}" var="wDTO">
    wDTO.push("${wDTO.workID}");  //[0] startDate
    wDTO.push("${wDTO.startDate}");  //[0] startDate
    wDTO.push("${wDTO.deadline}"); //[1]
    wDTO.push("${wDTO.subject}"); //2
    wDTO.push("${wDTO.priority}"); //3 //priority 1, 2, 3, 4 => 긴급, 높음, 보통, 낮음
    wDTO.push('${wDTO.writeDate}') //4
    </c:forEach>
    let wArr = new Array();
    let eArr = new Array();
    wArr = wDTO;
    eArr = eDTO;


    /*
       // work의 긴급 업무 목록을 캘린더에 표시한다.
       console.log(wDTO, typeof(wDTO))
       for(var i=(wDTO.length-1); i<wDTO.length; i--){
           wArr = wDTO.splice(0, 6);
          switch(wArr[4]){
             case '1': wArr[4] = '#DC143C'; break;
             case '2': wArr[4] = '#EE82EE'; break;
             case '3': wArr[4] = '#32CD32'; break;
             default: wArr[4] = '#A9A9A9'; break;
             }

          //console.log('wArr: ' + wArr)
          if(wArr[4] == '#DC143C' && wArr[1] != wArr[2]){ //연속일정 표시
             //console.log(BetweenDates(wArr[1], wArr[2]));
             btDates = BetweenDates(wArr[1], wArr[2]);
             console.log(btDates)
             var startdate = '<a  href="workView.sil?workID=' + wArr[0] + '&currentPage=1"><div class="startdate work" style="background-color: ' + wArr[4] + ' ;" >'+ wArr[3] +'&nbsp;</div></a>'
             $('#' + btDates[0]).append(startdate);
             var deadline = '<a  href="workView.sil?workID=' + wArr[0] + '&currentPage=1"><div class="deadline work" style="background-color: ' + wArr[4] + ' ;" >&nbsp;</div></a>'
             $('#' + btDates[btDates.length-1]).append(deadline);
             var btween = '<a  href="workView.sil?workID=' + wArr[0] + '&currentPage=1"><div class="btween work" style="background-color: ' + wArr[4] + ' ;" >&nbsp;</div></a>'
             for(var i=1; i<btDates.length-1; i++){
                $('#' + btDates[i]).append(btween);
             }
          }
       }


       // event의 일정 목록을 캘린더에 표시한다.
       if(eDeleteDate != null){
          for(var i=(eDTO.length-1); i<eDTO.length; i--){
             eArr = eDTO.splice(0, 6);
             if(eArr[4] == '#DC143C' && eArr[1] != eArr[2]){ //연속일정 표시
                //console.log(BetweenDates(eArr[1], eArr[2]));
                btDates = BetweenDates(eArr[1], eArr[2]);
                console.log(btDates)
                var startdate = '<a  href="eventView.sil?eventID=' + eArr[0] + '"><div class="event startdate work" style="background-color: ' + eArr[4] + ' ;" >'+ eArr[3] +'&nbsp;</div></a>'
                $('#' + btDates[0]).append(startdate);
                var deadline = '<a  href="eventView.sil?eventID=' + eArr[0] + '"><div class="event deadline work" style="background-color: ' + eArr[4] + ' ;" >&nbsp;</div></a>'
                $('#' + btDates[btDates.length-1]).append(deadline);
                var btween = '<a  href="eventView.sil?eventID=' + eArr[0] + '"><div class="event btween work" style="background-color: ' + eArr[4] + ' ;" >&nbsp;</div></a>'
                for(var i=1; i<btDates.length-1; i++){
                   $('#' + btDates[i]).append(btween);
                }
             } else {
                let EveOne = '<a href="eventView.sil?eventID='+ eArr[0] +'"><div class="event eveOne" style="background-color: ' + eArr[4] + ' ;" >'+ eArr[3] +'&nbsp;</div></a>'
                $('#' + eArr[1]).append(EveOne);
             }
          }
       }



       // 사이 날짜 배열로 반환 함수
       function BetweenDates( startDate, endDate ) {
          let result = [];
          let btdate = new Date(startDate);
          while(btdate <= new Date(endDate)){
             result.push(btdate.toISOString().split("T")[0]);
             btdate.setDate(btdate.getDate() + 1);
             //console.log(result);
          }
          return result
       } */


</script>
</body>
</html>
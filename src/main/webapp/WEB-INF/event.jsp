<%@page import="com.silvertier.calendar.MyCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<title>Event</title>

	<link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/dashboard.css" rel="stylesheet">
	<script type="text/javascript" src="./js/event/event.js"></script>

</head>
<body>

	<!-- 상단 네비게이션 -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
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
			<div class="col-sm-3 col-md-2 sidebar">
	          <ul class="nav nav-sidebar">
	            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
	            <li><a href="#">보고서</a></li>
	            <li><a href="#">분석자료</a></li>
	            <li><a href="#">수출입현황</a></li>
	          </ul>
	          <ul class="nav nav-sidebar">
	            <li><a href="board.sil">게시글</a></li>
	            <li><a href="work.sil">업무관리</a></li>
	            <li><a href="file.sil">파일관리</a></li>
	            <li><a href="event.sil">일정관리</a></li>
	          </ul>
	          <ul class="nav nav-sidebar">
	            <li><a href="">Nav item again</a></li>
	            <li><a href="">One more nav</a></li>
	            <li><a href="">Another nav item</a></li>
	          </ul>
        	</div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         		<h1 class="page-header">일정</h1>

	<!-- 캘린더 -->
<!-- <table id="fc-content-skeleton" width="1000" align="center" border="1" cellpadding="5"	cellspacing="0">
	테이블 내용 반복문으로 생성 (칸생성_background for a day)
	class="fc-day-top date-date
	a태그 안에 날짜 생성
</table>	 -->
<%
	Calendar calendar = Calendar.getInstance();
	int year = calendar.get(Calendar.YEAR);
	int month = calendar.get(Calendar.MONTH) + 1;
//	out.println(year + "년 " + month + "월");
%>
			<div class="row placeholders">
				<div class="row placeholders">
					<table width="700px" border="1" align="center" cellpadding="5" cellspacing="0">
						<tr>
							<td colspan="1" width="70px">
								<button type="button">지난달</button>
							</td>
							
							<td colspan="1" width="70px">
								<button type="button">다음달</button>
							</td>
							<th id="title" width="360px">
								<%=year%>년 <%=month%>월
							</th>
							
							<td colspan="2" width="200px">
								<!-- 모달 실행 버튼 -->
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">일정추가</button>
								<button type="button" onclick="location.href='eventList.sil'">리스트보기</button>
								<button type="button" onclick="">오늘</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		
			<div class="table-responsive">
				<table width="700px" border="1" align="center" cellpadding="5" cellspacing="0">
					<tr>
						<th id="sunday" width="100" height="40"><sapn>일</sapn></th>
						<th width="100px"><span>월</span></th>
						<th width="100px"><span>화</span></th>
						<th width="100px"><span>수</span></th>
						<th width="100px"><span>목</span></th>
						<th width="100px"><span>금</span></th>
						<th width="100px" id="saturday" ><span>토</span></th>
					</tr>
				
					<!-- 달력에 날짜를 출력한다. -->
					<tr>
		
		<%
		//	달력을 출력할 달 1일의 요일을 계산해둔다.
			int week = MyCalendar.weekDay(year, month, 1);
		
		//	빈 칸에 출력할 전달 날짜의 시작일을 계산한다.
			int start = 0;
			if (month == 1) {
				start = MyCalendar.lastDay(year - 1, 12) - week; // 1월
			} else {
				start = MyCalendar.lastDay(year, month - 1) - week; // 2 ~ 12월
			}
		
		//	1일이 출력될 위치(요일)을 맞추기 위해 달력을 출력할 달 1일의 요일만큼 반복하며 전달 날짜를 출력한다.
			for (int i=0; i<MyCalendar.weekDay(year, month, 1); i++) {
				if (i == 0) {
					out.println("<td  id='beforesun' style='vertical-align:top; height:100px' >" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
				} else {
					out.println("<td class='before' style='vertical-align:top; height:100px'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
				}
			}
		
		//	1일부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력한다.
			for (int i=1; i<=MyCalendar.lastDay(year, month); i++) {
				// <td> 태그에 요일에 따른 class 속성을 지정한다.
				switch (MyCalendar.weekDay(year, month, i)) {
					case 0: // 일요일
						out.println("<td class='sun' style='vertical-align:top; height:100px' >" + i + "</td>");
						break;
					case 6: // 토요일
						out.println("<td class='sat' style='vertical-align:top; height:100px'>" + i + "</td>");
						break;
					default:
						out.println("<td style='vertical-align:top; height:100px'>" + i + "</td>");
						break;
				}
				
				// 출력한 날짜가 토요일이고 그 달의 마지막 날짜가 아니면 줄을 바꾼다.
				if (MyCalendar.weekDay(year, month, i) == 6 && i != MyCalendar.lastDay(year, month)) {
					out.println("</tr><tr>");
				}
			}
		
		//	다음달 1일의 요일을 계산한다.
			if (month == 12) {
				week = MyCalendar.weekDay(year + 1, 1, 1); // 12월
			} else {
				week = MyCalendar.weekDay(year, month + 1, 1); // 1 ~ 11월
			}
		
		//	다음달 1일이 일요일이면 다음달 날짜를 출력할 필요없다.
			if (week != 0) {
				// 날짜를 다 출력하고 남은 빈 칸에 다음달 날짜를 다음달 1일의 요일부터 토요일까지 반복하며 출력
				start = 0;
				for (int i=week; i<=6; i++) {
					if (i == 6) {
						out.println("<td id='aftersat' style='vertical-align:top; height:100px'>" + (month == 12 ? 1 : month + 1) + "/" + ++start + "</td>");
					} else {
						out.println("<td class='after' style='vertical-align:top; height:100px'>" + (month == 12 ? 1 : month + 1) + "/" + ++start + "</td>");
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
<!-- <table width="700" border="1" align="center" cellpadding="5" cellspacing="0"> -->
<br/><br/>




<!-- 모달창 내용(insert) -->

<form action="eventInsertOK.sil" method="post">
	<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
		<tr class="table-primary">
			<th colspan="3" style="font-size: 30px; text-align: center;">일정 작성</th>
		</tr>
		
		<tr>
			<td width="700" colspan="2">
				<input id="subject" type="text" 
					class="form-control"
					name="subject" autocomplete="none" 
					placeholder="제목을 입력하세요."/>
			</td>
			<td colspan="1">
			</td>
		</tr>
		<tr>
			<th class="align-middle table-dark" width="50px">
				<label for="eventColor">색상</label>
			</th>
			<td class="align-middle" width="550px" colspan="2">
				<select id="eventColor" name="eventColor" 
					width="200"
					onchange="selectBoxChgColor(value);">
					<option value="#E1E1E0">
						gray<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png" width="15px">
					</option>
					<option value="#CDFFBE">
						green<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png" width="15px">
					</option>
					<option value="#FFCDCD">
						red<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
					</option>
					<option value="#FAFFCD">
						yellow<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png" width="15px">
					</option>
				</select>
			
					<img alt="gray" src="./images/gray_E1E1E0.png" width="15px">
					<img alt="green" src="./images/green_CDFFBE.png" width="15px">
					<img alt="red" src="./images/red_FFCDCD.png" width="15px">
					<img alt="yellow" src="./images/yellow_FAFFCD.png" width="15px">
				<!-- <input class="form-check-input" 
						type="checkbox" 
						name="isAllDay" 
						value="yes"
				/> -->
			</td>
		</tr>
		<tr>
			<td >
				<input	class="form-check-input" 
					width="500"
					type="date" 
					name="startDate"
					min="2000-01-01"
					max="2050-12-31"
					id = "startDate"
				/>
				<!-- <input type="button" onclick="starDateChk()"> -->
			</td>
			<td >
				<input id="endDate" 
					type="date" 
					name="endDate"
					min="2000-01-01"
					max="2050-12-31"
				/>
			</td>
			<th class="align-middle" width="100">
				종일 <input class="form-check-input" 
						type="checkbox" 
						name="allDay" 
						value="true"
						id="allDay"
					/>
			</th>
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
				<input 
					class="btn btn-outline-warning btn-sm" 
					type="button" 
					value="돌아가기" 
					style="font-size: 13px;" onclick=""
				/>
			</td>
		</tr>
	</table>
	<!-- 접속자 ip 주소는 hidden으로 insertOK.jsp로 넘긴다. -->
	<%-- ${pageContext.request.remoteAddr} => EL을 사용해서 접속자 ip 주소를 받는다. --%>
	<input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
</form>


</body>
</html>
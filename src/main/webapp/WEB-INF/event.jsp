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
<script type="text/javascript" src="./js/event/myCalendar.js"></script>
<title>Event</title>
</head>
<body>

	<div>
		<button><span>&lt;</span></button>
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a hh:mm(E)"/>
		<fmt:formatDate value="${now}" pattern="yyyy" var ="year"/>
		<fmt:formatDate value="${now}" pattern="MM" var="month" />
		<fmt:formatDate value="${now}" pattern="E" var="day" />
		<%-- ${now} --%>
		${day}
		<h2 id="thisMonth" name="thisMonth">${year}년 ${month}월</h2>
		<button><span>&gt;</span></button>
	</div>
						
	<table width="1000" align="center" border="1" cellpadding="5"	cellspacing="0">
		<thead>
			<tr>
				<th class="fc-day-header">
					<span>일</span>
				</th>
				<th class="fc-day-header">
					<span>월</span>
				</th>
				<th class="fc-day-header">
					<span>화</span>
				</th>
				<th class="fc-day-header">
					<span>수</span>
				</th>
				<th class="fc-day-header">
					<span>목</span>
				</th>
				<th class="fc-day-header">
					<span>금</span>
				</th>
				<th class="fc-day-header">
					<span>토</span>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<jsp:useBean id="mycal" class="com.silvertier.calendar.MyCalendar"/>
				<c:set var="week" value="${mycal.weekDay(year, month, 1)}"/>
				${week}
	
				<c:if test="${month}==1">
					<c:set var="start" value="${mycal.lastDay(year - 1, 12) - week}" />
				</c:if>
				
				<c:if test="${month}!=1">
					<c:set var="start" value="${mycal.lastDay(year, month - 1) - week}" />
				</c:if>
				
					<!-- 1일이 출력될 위치(요일)을 맞추기 위해 달력을 출력할 달 1일의 요일만큼 반복하며 전달 날짜를 출력한다. -->
					<c:forEach var="i" begin="0" end="${week}" step="1">
						<c:if test="i==0">
							<td id="beforesun">
								${(month == 1 ? 12 : month - 1)}. ${start+1}
							</td>
						</c:if>
						<c:if test="i!=0">
							<td class="before">
								${(month == 1 ? 12 : month - 1)}. ${start+1}
							</td>
						</c:if>
					</c:forEach>
				
				<!-- 1일부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력한다. -->
				<c:forEach var="i" begin="1" end="${mycal.lastDay(year, month)}" step="1">
					<c:if test="${week}==0"> <!-- 일요일 -->
						<td class="sun"> 
							${i}
						</td>
					</c:if>
					<c:if test="${week}==6"> <!-- 토요일 -->
						<td class="sat"> 
							${i}
						</td>
					</c:if>
					<c:if test="${week}!=6 && ${week}!=0"> <!-- 평일 -->
						<td> 
							${i}
						</td>
					</c:if>
					
					<!-- 출력한 날짜가 토요일이고 그 달의 마지막 날짜가 아니면 줄을 바꾼다. -->
					<c:if test="${mycal.weekDay(year, month, i)} == 6 && ${i} !=${ mycal.lastDay(year, month)}">
						</tr>
						<tr>
					</c:if>
				</c:forEach>
				
				<!-- 다음달 1일의 요일을 계산한다. -->
				
			</tr>
		</tbody>							
	</table>
						
					

										
										
	


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

<table width="700" border="1" align="center" cellpadding="5" cellspacing="0">

	<tr>
		<th id="sunday"><sapn>일</sapn></th>
		<th><span>월</span></th>
		<th><span>화</span></th>
		<th><span>수</span></th>
		<th><span>목</span></th>
		<th><span>금</span></th>
		<th id="saturday"><span>토</span></th>
	</tr>

	<!-- 달력에 날짜를 출력한다. -->
	<tr>

<%
//	달력을 출력할 달 1일의 요일을 계산해둔다.
	int week = MyCalendar.weekDay(year, month, 1);

//	1일이 출력될 위치(요일)을 맞추기 위해 달력을 출력할 달 1일의 요일만큼 반복하며 빈 칸을 출력한다.
//	for (int i=0; i<week; i++) {
//		out.println("<td></td>");
//	}

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
			out.println("<td id='beforesun'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
		} else {
			out.println("<td class='before'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
		}
	}

//	1일부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력한다.
	for (int i=1; i<=MyCalendar.lastDay(year, month); i++) {
		// <td> 태그에 요일에 따른 class 속성을 지정한다.
		/*
		if (MyCalendar.weekDay(year, month, i) == 0) { // 일요일
			out.println("<td class='sun'>" + i + "</td>");
		} else if (MyCalendar.weekDay(year, month, i) == 6) { // 토요일
			out.println("<td class='sat'>" + i + "</td>");
		} else { // 평일
			out.println("<td>" + i + "</td>");
		}
		*/
		switch (MyCalendar.weekDay(year, month, i)) {
			case 0: // 일요일
				out.println("<td class='sun'>" + i + "</td>");
				break;
			case 6: // 토요일
				out.println("<td class='sat'>" + i + "</td>");
				break;
			default:
				out.println("<td>" + i + "</td>");
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
		// 날짜를 다 출력하고 남은 빈 칸에 다음달 날짜를 다음달 1일의 요일부터 토요일까지 반복하며 
		// 출력한다.
		start = 0;
		for (int i=week; i<=6; i++) {
			if (i == 6) {
				out.println("<td id='aftersat'>" + (month == 12 ? 1 : month + 1) + "/" + ++start + "</td>");
			} else {
				out.println("<td class='after'>" + (month == 12 ? 1 : month + 1) + "/" + ++start + "</td>");
			}
		}
	}
%>	

</body>
</html>
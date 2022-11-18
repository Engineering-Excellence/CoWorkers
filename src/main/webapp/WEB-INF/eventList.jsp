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
	<link rel="icon" href="../../favicon.ico">

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
          <a class="navbar-brand" href="#">coWorkers</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">대시보드</a></li>
            <li><a href="#">세팅</a></li>
            <li><a href="#">프로필</a></li>
            <li><a href="#">도움말</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>
    
	<div class="container-fluid">
		<div class="row">
		    <!-- 좌측 사이드 -->
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
			
			
			
			<!-- 리스트 제목 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">일정리스트</h1>
				<!-- 리스트 -->
				<h2 class="sub-header"></h2>
		          <div class="table-responsive">
		            <table class="table table-striped">
		              <thead>
		                <tr>
		                  <th align="center">제목</th>
		                  <th align="center">색상</th>
		                  <th align="center">작성자</th>
		                  <th align="center">#</th>
		                  <th align="center">시작일</th>
		                  <th align="center">종료일</th>
		                  <th align="center">작성일</th>
		                </tr>
		              </thead>
		              <tbody>
		                
						<!-- 테이블이 비어있는 경우 -->
		                <c:if test="${wList.size() == 0}">
		                <tr>
		                	<td colspan="7">
		                		<marquee>일정이 없습니다.</marquee>
		                	</td>
		                </tr>
		                </c:if>
		                
		                
		                <!-- 업무 글 출력. -->
		                <c:if test="${wList.size() != 0}">
		                <jsp:useBean id="today" class="java.util.Date"/>
		                
		                <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"  var="now"/>
		                <fmt:formatDate value="${wDTO.deadline}" pattern="yyyy-MM-dd" var="deadline"/>
						<c:forEach var="wDTO" items="${wList}">
		                <c:if test="${wDTO.priority == 1}">
						
							<tr>
							<td>
							<c:set var="wSubject" value="${fn:replace(wDTO.subject, '<', '&lt;')}" />
							<c:set var="wSubject" value="${fn:replace(wSubject, '>', '&gt;')}" />
								${wSubject}
							</td>
							<td align="center">
							<c:if test="${wDTO.priority == 1}">
								<span style="color: tomato">[긴급]</span><img name="#E0573E" alt="red" src="./images/impt_E0573E.png" width="15px">
							</c:if>
							<c:if test="${wDTO.priority == 2}">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png" width="15px">
							</c:if>
							<c:if test="${wDTO.priority == 3}">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="#CDFFBE" alt="green" src="./imag
								es/green_CDFFBE.png" width="15px">
							</c:if>
							<c:if test="${wDTO.priority == 4}">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png" width="15px">
							</c:if>
							</td>
			                  	
		                  	<td align="center">
		                  		<c:set var="userName" value="${fn:replace(wDTO.userName, '<', '&lt;')}" />
								<c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}" />
								${userName}
		                  	</td>
							<td align="center">
							<c:if test="${wDTO.priority == 1}">
								업무
							</c:if>
							</td>
							<td align="center">
							<fmt:formatDate value="${wDTO.startDate}"	pattern="MM.dd(E)" />
								${startDate}
							</td>
							<td align="center">
							<fmt:formatDate value="${wDTO.deadline}"	pattern="MM.dd(E)" />
								${deadline}
							</td>
		                  	<td align="center">
								<fmt:formatDate value="${wDTO.writeDate}"	pattern="yyyy.MM.dd(E)" />
							</td>
			                </tr>
		                	</c:if>
		                	</c:forEach>
							
							<!-- 일정 글 출력. -->
							
							<c:forEach var="eDTO" items="${eList}">
							<tr>
								<td>
								<c:set var="eSubject" value="${fn:replace(eDTO.subject, '<', '&lt;')}" />
								<c:set var="eSubject" value="${fn:replace(eSubject, '>', '&gt;')}" />
									${eSubject}
								</td>
								<td align="center">
								<c:if test="${eDTO.eventColor.equals('#E1E1E0')}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png" width="15px">
								</c:if>
								<c:if test="${eDTO.eventColor.equals('#CDFFBE')}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png" width="15px">
								</c:if>
								<c:if test="${eDTO.eventColor.equals('#FFCDCD')}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
								</c:if>
								<c:if test="${eDTO.eventColor.equals('#FAFFCD')}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png" width="15px">
								</c:if>
								</td>
	              	
								<td align="center">
								<c:set var="userName" value="${fn:replace(eDTO.userName, '<', '&lt;')}" />
								<c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}" />
									${userName}
								</td>
								<td>
								<c:if test="${ eDTO.allDay == 'true'}">
									종일
								</c:if>
								</td>
	
								<td align="center">
								<fmt:formatDate value="${eDTO.startDate}"	pattern="MM.dd(E)" />
									${startDate}
								</td>
								<td align="center">
								<fmt:formatDate value="${eDTO.endDate}"	pattern="MM.dd(E)" />
									${endDate}
								</td>
								<td align="center">
									<fmt:formatDate value="${eDTO.writeDate}"	pattern="yyyy.MM.dd(E)" />
								</td>
							</tr>
							</c:forEach>
		                	</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>
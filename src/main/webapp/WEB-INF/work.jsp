<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 곽규창(Kyle) --%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>CoWorkers</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/coWorkers.css" rel="stylesheet">

</head>

<body>

<fmt:requestEncoding value="UTF-8"/>
<jsp:useBean id="date" class="java.util.Date"/>
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
            <a class="navbar-brand" href="#">CoWorkers</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">일정1<span class="sr-only">(current)</span></a></li>
                <li><a href="#">일정2</a></li>
                <li><a href="#">일정3</a></li>
                <li><a href="#">일정4</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">업무1</a></li>
                <li><a href="">업무2</a></li>
                <li><a href="">업무3</a></li>
                <li><a href="">업무4</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">게시판1</a></li>
                <li><a href="">게시판2</a></li>
                <li><a href="">게시판3</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">
                <table class="table table-striped">
                    <%--<table class="table" width="1000" align="center" border="1" cellpadding="5" cellspacing="0">--%>
                    <thead>
                    <tr class="table-warning">
                        <th style="width: 200px; text-align: center;"><a href="#">홈</a></th>
                        <th style="width: 200px; text-align: center;"><a href="#">업무</a></th>
                        <th style="width: 200px; text-align: center;"><a href="#">캘린더</a></th>
                    </tr>
                </table>
                <table class="table" style="width: 1500px; margin-left: auto; margin-right: auto;">
                    <tr class="table-primary">
                        <th colspan="10" style="font-size: 30px; text-align: center;">업무</th>
                    </tr>
                    <tr class="table-success">
                        <th style="width: 100px; text-align: center;">우선순위</th>
                        <th style="width: 500px; text-align: center;">업무명</th>
                        <th style="width: 100px; text-align: center;">상태</th>
                        <th style="width: 200px; text-align: center;">담당자(직급)</th>
                        <th style="width: 200px; text-align: center;">진척도</th>
                        <th style="width: 200px; text-align: center;">작성일</th>
                        <th style="width: 200px; text-align: center;">시작일</th>
                        <th style="width: 200px; text-align: center;">마감일</th>
                    </tr>
                    </thead>

                    <tbody>

                    <!-- 공지글이 있으면 출력한다. -->
                    <c:if test="${currentPage==1}">
                        <c:forEach var="emergency" items="${priority}">
                            <tr class="bg-primary">
                                <td align="center">${emergency.priority}</td>
                                <td>
                                    <c:set var="subject" value="${fn:replace(emergency.subject, '<', '&lt;')}"/>
                                    <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                        ${subject}
                                </td>
                                <td align="center">
                                        ${emergency.currentProgress}
                                </td>
                                </td>
                                <td align="center">
                                    <c:set var="userName" value="${fn:replace(emergency.userName, '<', '&lt;')}"/>
                                    <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                                        ${userName}
                                </td>
                                <td align="center">
                                        ${emergency.workProgress}
                                </td>
                                <td align="center">
                                    <c:if test="${emergency.writeDate.year==date.year&&emergency.writeDate.month==date.month&&emergency.writeDate.date==date.date}">
                                        <fmt:formatDate value="${emergency.writeDate}" pattern="a h:mm:ss"/>
                                    </c:if>
                                    <c:if test="${emergency.writeDate.year!=date.year||emergency.writeDate.month!=date.month||emergency.writeDate.date!=date.date}">
                                        <fmt:formatDate value="${emergency.writeDate}" pattern="MM/dd"/>
                                    </c:if>
                                </td>
                                <td align="center">
                                    <fmt:formatDate value="${emergency.startDate}" pattern="yyyy.MM.dd.(E)"/>
                                </td>
                                <td align="center">
                                    <fmt:formatDate value="${emergency.deadline}" pattern="yyyy.MM.dd.(E)"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <!-- 글을 출력한다. -->
                    <c:set var="list" value="${workList.list}"/>
                    <c:if test="${list.size() == 0}">
                        <tr>
                            <td colspan="10">
                                <marquee>저장된 글이 없습니다.</marquee>
                            </td>
                        </tr>
                    </c:if>
                    <c:set var="list" value="${workList.list}"/>
                    <c:if test="${list.size() == 0}">
                        <tr>
                            <td colspan="10" align="center">
                                <img style="width: 350px" src="images/thief.jpg">
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${list.size() != 0}">
                        <c:forEach var="dto" items="${list}">
                            <tr>
                                <td align="center">${dto.priority}</td>
                                <td>
                                    <c:set var="subject" value="${fn:replace(dto.subject, '<', '&lt;')}"/>
                                    <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                        ${subject}
                                </td>
                                <td align="center">
                                        ${dto.currentProgress}
                                </td>
                                </td>
                                <td align="center">
                                    <c:set var="userName" value="${fn:replace(dto.userName, '<', '&lt;')}"/>
                                    <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                                        ${userName}
                                </td>
                                <td align="center">
                                        ${dto.workProgress}
                                </td>
                                <td align="center">
                                    <c:if test="${dto.writeDate.year==date.year&&dto.writeDate.month==date.month&&dto.writeDate.date==date.date}">
                                        <fmt:formatDate value="${dto.writeDate}" pattern="a h:mm:ss"/>
                                    </c:if>
                                    <c:if test="${dto.writeDate.year!=date.year||dto.writeDate.month!=date.month||dto.writeDate.date!=date.date}">
                                        <fmt:formatDate value="${dto.writeDate}" pattern="MM/dd"/>
                                    </c:if>
                                </td>
                                <td align="center">
                                    <fmt:formatDate value="${dto.startDate}" pattern="yyyy.MM.dd.(E)"/>
                                </td>
                                <td align="center">
                                    <fmt:formatDate value="${dto.deadline}" pattern="yyyy.MM.dd.(E)"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>


                    <!-- 페이지 이동 버튼 -->
                    <tr>
                        <td colspan="9" align="center">
                            <%--처음으로--%>

                            <c:if test="${workList.currentPage>1}">
                                <input type="button" class="button" value="◀◀◀" title="첫 페이지로"
                                       onclick="location.href='?currentPage=1'">
                            </c:if>
                            <c:if test="${workList.currentPage<=1}">
                                <input type="button" class="button2" disabled value="◀◀◀" title="현재 첫 페이지 입니다.">
                            </c:if>


                            <c:if test="${workList.startPage>1}">
                                <input type="button" class="button" value="◀◀" title="이전 10 페이지로"
                                       onclick="location.href='?currentPage=${workList.currentPage-10}'">
                            </c:if>
                            <c:if test="${workList.startPage<=1}">
                                <input type="button" class="button2" disabled value="◀◀" title="현재 첫 10 페이지 입니다.">
                            </c:if>


                            <c:if test="${workList.currentPage>1}">
                                <input type="button" class="button" value="◀" title="이전 페이지로"
                                       onclick="location.href='?currentPage=${workList.currentPage-1}'">
                            </c:if>
                            <c:if test="${workList.currentPage<=1}">
                                <input type="button" class="button2" disabled value="◀" title="현재 첫 페이지 입니다.">
                            </c:if>


                            <c:forEach var="i" begin="${workList.startPage}" end="${workList.endPage}" step="1">
                                <c:if test="${i==workList.currentPage}">
                                    <ruby>
                                        <b>[${i}]</b>
                                        <rt>▼</rt>
                                    </ruby>
                                </c:if>
                                <c:if test="${i!=workList.currentPage}">
                                    <a href="?currentPage=${i}">[${i}]</a>
                                </c:if>
                            </c:forEach>


                            <c:if test="${workList.currentPage<workList.totalPage}">
                                <input type="button" class="button" value="▶" title="다음 페이지로"
                                       onclick="location.href='?currentPage=${workList.currentPage+1}'">
                            </c:if>
                            <c:if test="${workList.currentPage>=workList.totalPage}">
                                <input type="button" class="button2" disabled value="▶" title="현재 마지막 페이지 입니다.">
                            </c:if>


                            <c:if test="${workList.endPage<workList.totalPage}">
                                <input type="button" class="button" value="▶▶" title="다음 10페이지로"
                                       onclick="location.href='?currentPage=${workList.startPage+10}'">
                            </c:if>
                            <c:if test="${workList.endPage>=workList.totalPage}">
                                <input type="button" class="button2" disabled value="▶▶" title="현재 마지막 10 페이지 입니다.">
                            </c:if>


                            <c:if test="${workList.currentPage<workList.totalPage}">
                                <input type="button" class="button" value="▶▶▶" title="마지막 페이지로"
                                       onclick="location.href='?currentPage=${workList.totalPage}'">
                            </c:if>
                            <c:if test="${workList.currentPage>=workList.totalPage}">
                                <input type="button" class="button2" disabled value="▶▶▶" title="현재 마지막 페이지 입니다.">
                            </c:if>
                        </td>
                    <tr>
                        <td align="right" colspan="10">
                            <input type="button" class="btn btn-outline-primary btn-sm" value="글쓰기"
                                   onclick="location.href='workInsert.sil'">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="../js/jquery-3.6.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>

</html>
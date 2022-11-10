<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
            <h1 class="page-header">게시판</h1>

            <div class="table-responsive">
                <table class="table table-striped">
                    <%--<table class="table" width="1000" align="center" border="1" cellpadding="5" cellspacing="0">--%>
                    <thead>
                    <tr class="table-primary">
                        <th colspan="5">게시판 보기</th>
                    </tr>
                    <tr>
                        <td colspan="5" align="right">
                            ${boardList.totalCount}개 (${boardList.currentPage} / ${boardList.totalPage} 페이지)
                        </td>
                    </tr>
                    <tr>
                        <th width="70" style="text-align: center">글번호</th>
                        <th width="620" style="text-align: center">제목</th>
                        <th width="120" style="text-align: center">이름</th>
                        <th width="120" style="text-align: center">작성일</th>
                        <th width="70" style="text-align: center">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 글을 출력한다. -->
                    <c:set var="list" value="${boardList.list}"/>
                    <c:if test="${list.size() == 0}">
                        <tr>
                            <td colspan="5">
                                <marquee>저장된 글이 없습니다.</marquee>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${list.size() != 0}">
                        <c:forEach var="vo" items="${list}">
                            <tr>
                                <td align="center">${vo.idx}</td>
                                <td>
                                    <!-- 글 레벨에 따른 들여쓰기 -->
                                    <c:if test="${vo.lev > 0}">
                                        <c:forEach var="i" begin="1" end="${vo.lev}" step="1">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:forEach>
                                        Re.
                                    </c:if>
                                    <c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
                                    <c:set var="subject" value="${fn:replace(vo.subject, '>', '&gt;')}"/>
                                    <a href="increment.nhn?idx=${vo.idx}&currentPage=${boardList.currentPage}">
                                            ${subject}
                                    </a>
                                </td>
                                <td align="center">
                                    <c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/>
                                    <c:set var="name" value="${fn:replace(vo.name, '>', '&gt;')}"/>
                                        ${name}
                                </td>
                                <td align="center">
                                    <jsp:useBean id="date" class="java.util.Date"/>
                                    <c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
						date.date == vo.writeDate.date}">
                                        <fmt:formatDate value="${vo.writeDate}" pattern="a h:mm"/>
                                    </c:if>
                                    <c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month ||
						date.date != vo.writeDate.date}">
                                        <fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd.(E)"/>
                                    </c:if>
                                </td>
                                <td align="center">
                                        ${vo.hit}
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <!-- 페이지 이동 버튼 -->
                    <tr>
                        <td colspan="5" align="center">
                            <%--처음으로--%>

                            <c:if test="${boardList.currentPage>1}">
                                <input type="button" class="button" value="◀◀◀" title="첫 페이지로"
                                       onclick="location.href='?currentPage=1'">
                            </c:if>
                            <c:if test="${boardList.currentPage<=1}">
                                <input type="button" class="button2" disabled value="◀◀◀" title="현재 첫 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.startPage>1}">
                                <input type="button" class="button" value="◀◀" title="이전 10 페이지로"
                                       onclick="location.href='?currentPage=${boardList.currentPage-1}'">
                            </c:if>
                            <c:if test="${boardList.startPage<=1}">
                                <input type="button" class="button2" disabled value="◀◀" title="현재 첫 10 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.currentPage>1}">
                                <input type="button" class="button" value="◀" title="이전 페이지로"
                                       onclick="location.href='?currentPage=${boardList.currentPage-1}'">
                            </c:if>
                            <c:if test="${boardList.currentPage<=1}">
                                <input type="button" class="button2" disabled value="◀" title="현재 첫 페이지 입니다.">
                            </c:if>


                            <c:forEach var="i" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
                                <c:if test="${i==boardList.currentPage}">
                                    <ruby>
                                        <b>[${i}]</b>
                                        <rt>▼</rt>
                                    </ruby>
                                </c:if>
                                <c:if test="${i!=boardList.currentPage}">
                                    <a href="?currentPage=${i}">[${i}]</a>
                                </c:if>
                            </c:forEach>


                            <c:if test="${boardList.currentPage<boardList.totalPage}">
                                <input type="button" class="button" value="▶" title="다음 페이지로"
                                       onclick="location.href='?currentPage=${boardList.currentPage+1}'">
                            </c:if>
                            <c:if test="${boardList.currentPage>=boardList.totalPage}">
                                <input type="button" class="button2" disabled value="▶" title="현재 마지막 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.endPage<boardList.totalPage}">
                                <input type="button" class="button" value="▶▶" title="다음 10페이지로"
                                       onclick="location.href='?currentPage=${boardList.startPage+10}'">
                            </c:if>
                            <c:if test="${boardList.endPage>=boardList.totalPage}">
                                <input type="button" class="button2" disabled value="▶▶" title="현재 마지막 10 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.currentPage<boardList.totalPage}">
                                <input type="button" class="button" value="▶▶▶" title="마지막 페이지로"
                                       onclick="location.href='?currentPage=${boardList.totalPage}'">
                            </c:if>
                            <c:if test="${boardList.currentPage>=boardList.totalPage}">
                                <input type="button" class="button2" disabled value="▶▶▶" title="현재 마지막 페이지 입니다.">
                            </c:if>
                        </td>
                    </tr>

                    <!-- 글쓰기 버튼 -->
                    <tr>
                        <td colspan="5" align="right">
                            <input type="button" class="btn btn-outline-primary btn-sm" value="글쓰기"
                                   onclick="location.href='insert.nhn'">
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
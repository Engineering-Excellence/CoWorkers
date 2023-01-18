<%-- 조우철 --%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>CoWorkers</title>

    <link rel="icon" href="images/favicon_16.png">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/coWorkers.css" rel="stylesheet">
    <!-- sockJS -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>

    </script>
</head>

<body>
<fmt:requestEncoding value="UTF-8"/>
    <%
    System.out.println(pageContext.findAttribute("boardDTO"));

    Map<String, String[]> map = request.getParameterMap();
    Iterator<Map.Entry<String, String[]>> itr = map.entrySet().iterator();
    while (itr.hasNext()) {
        Map.Entry<String, String[]> entry = itr.next();
        System.out.println(String.format("%s : %s", entry.getKey(), String.join(", ", entry.getValue())));
    }

%>
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
            <a class="navbar-brand" href="mainView">coWorkers</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                    <li><a href="new"><img width="45" src="../resources/images/M"></a></li>
                <li><a href="#">프로필</a></li>
                <li><a href="logout">로그아웃</a></li>
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
                <li><a href="board">게시글</a></li>
                <li><a href="work">업무관리</a></li>
                <li><a href="event">일정관리</a></li>
                <div class="menu_box">
                    <ul class="menu_box">
                        <li class="menu_under">
                            <div class="menu">
                                <a>쪽지</a>
                            </div>
                            <ul class="menuSub">
                                <li><a href="memoInsert">쪽지쓰기</a></li>
                                <li><a href="memo">전체 쪽지함</a></li>
                                <li><a href="new">신규 쪽지함</a></li>
                                <li><a href="new">신규 쪽지함</a></li>
                                <li><a href="important">중요 쪽지함</a></li>
                                <li><a href="marked">관심 쪽지함</a></li>
                                <li><a href="trash">휴지통</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </ul>
        </div>
        <button type="button" onclick="alarmListMove()"
                class="btn btn-sm btn-#3c3c3c; position-relative">
            <i class="bi bi-bell-fill" style="font-size: 1.8rem; color: white"></i><span id="alarm-span"
                                                                                         class="position-absoluteposition-absolute top-0 end-0 translate-middle badge border border-light rounded-circle bg-danger p-2"><span
                class="" id="alarm-span-count"></span></span>
        </button>



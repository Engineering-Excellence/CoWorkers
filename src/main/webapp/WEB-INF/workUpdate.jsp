<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.silvertier.dto.WorkDTO" %>
<%@ page import="com.silvertier.dto.WorkList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--조우철--%>
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
<%
    System.out.println(pageContext.findAttribute("dto"));

    Map<String, String[]> map = request.getParameterMap();
    Iterator<Map.Entry<String, String[]>> itr = map.entrySet().iterator();
    while (itr.hasNext()) {
        Map.Entry<String, String[]> entry = itr.next();
        System.out.println(String.format("%s : %s", entry.getKey(), String.join(", ", entry.getValue())));
    }
%>
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
                <li><a href="workList.sil">게시판<span class="sr-only"></span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="work.sil">업무</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">캘린더</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">

                <form class="m-" action="workUpdateOK.sil" method="post">
                    <table class="table" style="width:1500px; margin-left: auto; margin-right: auto;">
                        <tr class="table-primary">
                            <th colspan="15" style="font-size: 30px; text-align: center;">업무 수정</th>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">제목
                            </th>
                            <td colspan="2">
                                <input id="subject" type="text" class="form-control form-control-sm"
                                       value="${dto.subject}" name="subject"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">내용
                            </th>
                            <td colspan="2">
                <textarea id="content" class="form-control form-control-sm" rows="10" name="content"
                          style="resize: none">${dto.content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">우선순위
                            </th>
                            <td colspan="2">
                                <c:if test="${dto.priority == 1}">
                                    <input name="priority" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>긴급
                                    <input name="priority" type="radio" value="2"/>높음
                                    <input name="priority" type="radio" value="3"/>보통
                                    <input name="priority" type="radio" value="4"/>낮음
                                </c:if>
                                <c:if test="${dto.priority == 2}">
                                    <input name="priority" type="radio" value="1"/>긴급
                                    <input name="priority" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>높음
                                    <input name="priority" type="radio" value="3"/>보통
                                    <input name="priority" type="radio" value="4"/>낮읍
                                </c:if>
                                <c:if test="${dto.priority == 3}">
                                    <input name="priority" type="radio" value="1"/>긴급
                                    <input name="priority" type="radio" value="2"/>높음
                                    <input name="priority" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>보통
                                    <input name="priority" type="radio" value="4"/>낮음
                                </c:if>
                                <c:if test="${dto.priority == 4}">
                                    <input name="priority" type="radio" value="1"/>긴급
                                    <input name="priority" type="radio" value="2"/>높음
                                    <input name="priority" type="radio" value="3"/>보통
                                    <input name="priority" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>낮음
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">업무상태${dto.currentProgress}
                            </th>
                            <td colspan="2">
                                <c:if test="${dto.currentProgress == 1}">
                                    <input name="currentProgress" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>요청
                                    <input name="currentProgress" type="radio" value="2"/>진행
                                    <input name="currentProgress" type="radio" value="3"/>완료
                                </c:if>
                                <c:if test="${dto.currentProgress == 2}">
                                    <input name="currentProgress" type="radio" value="1"/>요청
                                    <input name="currentProgress" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>진행
                                    <input name="currentProgress" type="radio" value="3"/>완료
                                </c:if>
                                <c:if test="${dto.currentProgress == 3}">
                                    <input name="currentProgress" type="radio" value="1"/>요청
                                    <input name="currentProgress" type="radio" value="2"/>진행
                                    <input name="currentProgress" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>완료
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">업무진척도${dto.workProgress}
                            </th>
                            <td colspan="2">
                                <select id="workProgress" class="form-control form-control-sm" name="workProgress"
                                        size="1">
                                    <option value="${dto.workProgress}">${dto.workProgress*10}%</option>
                                    <option value="0">0%</option>
                                    <option value="1">10%</option>
                                    <option value="2">20%</option>
                                    <option value="3">30%</option>
                                    <option value="4">40%</option>
                                    <option value="5">50%</option>
                                    <option value="6">60%</option>
                                    <option value="7">70%</option>
                                    <option value="8">80%</option>
                                    <option value="9">90%</option>
                                    <option value="10">100%</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">시작일
                            </th>
                            <td colspan="2">
                                <input id="startDate" type="date" class="form-control form-control-sm" name="startDate"
                                       value="${dto.startDate}"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">마감일
                            </th>
                            <td colspan="2">
                                <input id="deadline" type="date" class="form-control form-control-sm" name="deadline"
                                       value="${dto.deadline}"/>
                            </td>
                        </tr>
                        <tr class="table-secondary">
                            <td colspan="3" align="center">
                                <input class="btn btn-primary btn-sm" type="submit" value="저장하기"
                                       style="font-size: 13px"/>
                                <input class="btn btn-danger btn-sm" type="reset" value="다시쓰기" style="font-size: 13px"/>
                                <input class="btn btn-info btn-sm" type="button" value="돌아가기" style="font-size: 13px"
                                       onclick="history.back()"/>
                            </td>
                        </tr>
                    </table>
                    <td>
                        <input type="hidden" name="workID" value="${dto.workID}"/>
                        <input type="hidden" name="currentPage" value="${currentPage}"/>
                        <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
                    </td>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="../js/jquery-3.6.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>

</html>
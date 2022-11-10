<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>업무</title>

    <script src="../js/jquery-3.6.1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>

<body>
<fmt:requestEncoding value="UTF-8"/>
<div class="m-3">
    <table class="table" style="width: 1000px; margin-left: auto; margin-right: auto;">
        <tr class="table-primary">
            <th colspan="3" style="font-size: 30px; text-align: center;">CoWorker</th>
        </tr>
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
        <jsp:useBean id="date" class="java.util.Date"/>

        <c:if test="${currentPage==1}">
            <c:forEach var="dto" items="${priority==1}">
                <tr class="bg-primary">
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
                </tr>
            </c:forEach>
        </c:if>
        <c:set var="list" value="${workList.list}"/>
        <c:if test="${list.size() == 0}">
            <tr>
                <td colspan="5" align="center">
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
    </table>
</div>

</body>
</html>

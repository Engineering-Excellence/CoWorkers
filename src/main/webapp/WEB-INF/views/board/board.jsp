<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">게시판</h1>

            <div class="table-responsive">

                <table class="table table-striped">
                    <%--<table class="table" width="1000" align="center" border="1" cellpadding="5" cellspacing="0">--%>

                    <thead>
                    <%--<tr class="table-primary">
                        <th colspan="5">게시판</th>
                    </tr>--%>
                    <tr>
                        <td colspan="5" align="right">
                            ${boardList.totalCount}개 (${boardList.currentPage} / ${boardList.totalPage} 페이지)
                        </td>
                    </tr>
                    <tr>
                        <th width="150" style="text-align: center">글번호</th>
                        <th width="500" style="text-align: center">제목</th>
                        <th width="150" style="text-align: center">이름</th>
                        <th width="150" style="text-align: center">작성일</th>
                        <th width="150" style="text-align: center">조회수</th>
                    </tr>
                    </thead>

                    <tbody>

                    <!-- 공지글이 있으면 출력한다. -->
                    <%--<c:if test="${currentPage == 1}">--%>
                    <c:forEach var="boardDTO" items="${notice}">
                        <tr class="table-warning">
                            <td align="center"><i class="bi bi-bell"></i></td>
                            <td>
                                <c:if test="${boardDTO.deleteDate == null}">
                                    <c:set var="subject" value="${fn:replace(boardDTO.subject, '<', '&lt;')}"/>
                                    <c:set var="subject" value="${fn:replace(boardDTO.subject, '>', '&gt;')}"/>
                                    <a href="boardHit?postID=${boardDTO.postID}&currentPage=${boardList.currentPage}">
                                            ${subject}
                                        <c:if test="${boardDTO.commentCount > 0}">(${boardDTO.commentCount})</c:if>
                                    </a>
                                </c:if>
                                <c:if test="${boardDTO.deleteDate != null}">
                                    삭제된 글입니다.
                                </c:if>
                            </td>
                            <td align="center">
                                <c:set var="name" value="${fn:replace(boardDTO.userName, '<', '&lt;')}"/>
                                <c:set var="name" value="${fn:replace(boardDTO.userName, '>', '&gt;')}"/>
                                    ${name}
                            </td>
                            <td align="center">
                                <jsp:useBean id="date" class="java.util.Date"/>
                                <c:if test="${date.year == boardDTO.writeDate.year && date.month == boardDTO.writeDate.month &&
						date.date == boardDTO.writeDate.date}">
                                    <fmt:formatDate value="${boardDTO.writeDate}" pattern="a h:mm"/>
                                </c:if>
                                <c:if test="${date.year != boardDTO.writeDate.year || date.month != boardDTO.writeDate.month ||
						date.date != boardDTO.writeDate.date}">
                                    <fmt:formatDate value="${boardDTO.writeDate}" pattern="yyyy.MM.dd.(E)"/>
                                </c:if>
                            </td>
                            <td align="center">
                                    ${boardDTO.hit}
                            </td>
                        </tr>
                    </c:forEach>
                    <%--</c:if>--%>

                    <!-- 글을 출력한다. -->
                    <c:set var="list" value="${boardList.list}"/>
                    <c:if test="${list.size() == 0}">
                        <tr>
                            <td colspan="5">
                                <p>저장된 글이 없습니다.</p>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${list.size() != 0}">
                        <c:forEach var="boardDTO" items="${list}">
                            <tr>
                                    <%--<c:if test="${boardDTO.notice == 'false'}">--%>
                                <td align="center">${boardDTO.postID}</td>
                                <td>
                                    <c:if test="${boardDTO.deleteDate == null}">
                                        <c:set var="subject" value="${fn:replace(boardDTO.subject, '<', '&lt;')}"/>
                                        <c:set var="subject" value="${fn:replace(boardDTO.subject, '>', '&gt;')}"/>
                                        <a href="boardHit?postID=${boardDTO.postID}&currentPage=${boardList.currentPage}">
                                                ${subject}
                                            <c:if test="${boardDTO.commentCount > 0}">(${boardDTO.commentCount})</c:if>
                                        </a>
                                    </c:if>
                                    <c:if test="${boardDTO.deleteDate != null}">
                                        삭제된 글입니다.
                                    </c:if>
                                </td>
                                <td align="center">
                                    <c:set var="name" value="${fn:replace(boardDTO.userName, '<', '&lt;')}"/>
                                    <c:set var="name" value="${fn:replace(boardDTO.userName, '>', '&gt;')}"/>
                                        ${name}
                                </td>
                                <td align="center">
                                        <%--<jsp:useBean id="date" class="java.util.Date"/>--%>
                                    <c:if test="${date.year == boardDTO.writeDate.year && date.month == boardDTO.writeDate.month &&
						date.date == boardDTO.writeDate.date}">
                                        <fmt:formatDate value="${boardDTO.writeDate}" pattern="a h:mm"/>
                                    </c:if>
                                    <c:if test="${date.year != boardDTO.writeDate.year || date.month != boardDTO.writeDate.month ||
						date.date != boardDTO.writeDate.date}">
                                        <fmt:formatDate value="${boardDTO.writeDate}" pattern="yyyy.MM.dd.(E)"/>
                                    </c:if>

                                </td>
                                <td align="center">
                                        ${boardDTO.hit}
                                </td>
                                    <%--</c:if>--%>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <!-- 페이지 이동 버튼 -->
                    <tr>
                        <td colspan="5" align="center">
                            <%--처음으로--%>

                            <c:if test="${boardList.currentPage > 1}">
                                <input type="button" class="button" value="◀◀◀" title="첫 페이지로"
                                       onclick="location.href='?currentPage=1'">
                            </c:if>
                            <c:if test="${boardList.currentPage <= 1}">
                                <input type="button" class="button2" disabled value="◀◀◀" title="현재 첫 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.startPage > 1}">
                                <input type="button" class="button" value="◀◀" title="이전 10 페이지로"
                                       onclick="location.href='?currentPage=${boardList.currentPage - 1}'">
                            </c:if>
                            <c:if test="${boardList.startPage <= 1}">
                                <input type="button" class="button2" disabled value="◀◀" title="현재 첫 10 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.currentPage > 1}">
                                <input type="button" class="button" value="◀" title="이전 페이지로"
                                       onclick="location.href='?currentPage=${boardList.currentPage-1}'">
                            </c:if>
                            <c:if test="${boardList.currentPage <= 1}">
                                <input type="button" class="button2" disabled value="◀" title="현재 첫 페이지 입니다.">
                            </c:if>


                            <c:forEach var="i" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
                                <c:if test="${i == boardList.currentPage}">
                                    <ruby>
                                        <b>[${i}]</b>
                                        <rt>▼</rt>
                                    </ruby>
                                </c:if>
                                <c:if test="${i != boardList.currentPage}">
                                    <a href="?currentPage=${i}">[${i}]</a>
                                </c:if>
                            </c:forEach>


                            <c:if test="${boardList.currentPage < boardList.totalPage}">
                                <input type="button" class="button" value="▶" title="다음 페이지로"
                                       onclick="location.href='?currentPage=${boardList.currentPage+1}'">
                            </c:if>
                            <c:if test="${boardList.currentPage >= boardList.totalPage}">
                                <input type="button" class="button2" disabled value="▶" title="현재 마지막 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.endPage < boardList.totalPage}">
                                <input type="button" class="button" value="▶▶" title="다음 10페이지로"
                                       onclick="location.href='?currentPage=${boardList.startPage+10}'">
                            </c:if>
                            <c:if test="${boardList.endPage >= boardList.totalPage}">
                                <input type="button" class="button2" disabled value="▶▶" title="현재 마지막 10 페이지 입니다.">
                            </c:if>


                            <c:if test="${boardList.currentPage < boardList.totalPage}">
                                <input type="button" class="button" value="▶▶▶" title="마지막 페이지로"
                                       onclick="location.href='?currentPage=${boardList.totalPage}'">
                            </c:if>
                            <c:if test="${boardList.currentPage >= boardList.totalPage}">
                                <input type="button" class="button2" disabled value="▶▶▶" title="현재 마지막 페이지 입니다.">
                            </c:if>
                        </td>
                    </tr>

                    <!-- 글쓰기 버튼 -->
                    <tr>
                        <td colspan="5" align="right">
                            <input type="button" class="btn btn-primary btn-sm" value="글쓰기"
                                   onclick="location.href='boardInsert'">
                        </td>
                    </tr>
                    </tbody>

                </table>

            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="css/board.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

<%@include file="/WEB-INF/views/scripts.jsp"%>

</body>

<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
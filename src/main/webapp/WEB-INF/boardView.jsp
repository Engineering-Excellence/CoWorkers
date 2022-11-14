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

<div class="m-3">
    <table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
        <tr class="table-primary">
            <th colspan="4" style="font-size: 30px; text-align: center;">게시글 보기</th>
        </tr>
        <tr class="table-dark">
            <th style="width: 100px; text-align: center;">글번호</th>
            <th style="width: 350px; text-align: center;">이름</th>
            <th style="width: 150px; text-align: center;">작성일</th>
            <th style="width: 100px; text-align: center;">조회수</th>
        </tr>
        <tr>
            <td align="center">
                ${boardDTO.postID}
            </td>
            <td align="center">
                <c:set var="userName" value="${fn:replace(boardDTO.userName, '<', '&lt;')}"/>
                <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                ${userName}
            </td>
            <td align="center">
                <jsp:useBean id="date" class="java.util.Date"/>
                <c:if test="${date.year == boardDTO.writeDate.year && date.month == boardDTO.writeDate.month &&
						date.date == boardDTO.writeDate.date}">
                    <fmt:formatDate value="${boardDTO.writeDate}" pattern="a h:mm:ss"/>
                </c:if>
                <c:if test="${date.year != boardDTO.writeDate.year || date.month != boardDTO.writeDate.month ||
						date.date != boardDTO.writeDate.date}">
                    <fmt:formatDate value="${boardDTO.writeDate}" pattern="yyyy.MM.dd(E)"/>
                </c:if>
            </td>
            <td align="center">
                ${boardDTO.hit}
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">
                <c:set var="subject" value="${fn:replace(boardDTO.subject, '<', '&lt;')}"/>
                <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                ${subject}
            </td>
        </tr>
        <tr>
            <th class="align-middle">내용</th>
            <td colspan="3">
                <c:set var="content" value="${fn:replace(boardDTO.content, '<', '&lt;')}"/>
                <c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
                <c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
                ${content}
            </td>
        </tr>
        <tr class="table-secondary" >
            <td colspan="4" align="center">
                <input
                        class="btn btn-outline-primary btn-sm"
                        type="button"
                        value="수정하기"
                        style="font-size: 13px;"
                        onclick="location.href='selectByPostID.sil?postID=${boardDTO.postID}&currentPage=${currentPage}&job=update'"/>
                <input
                        class="btn btn-outline-danger btn-sm"
                        type="button"
                        value="삭제하기"
                        style="font-size: 13px;"
                        onclick="location.href='selectByPostID.sil?postID=${boardDTO.postID}&currentPage=${currentPage}&job=delete'"/>
                <!-- 
                    history.back(), history.go(-1)을 사용하면 단순히 전 화면으로 돌아가서 증가된 조회수가
                    반영되지 않는다. 
                -->
                <input
                        class="btn btn-outline-warning btn-sm"
                        type="button"
                        value="돌아가기"
                        style="font-size: 13px;"
                        onclick="location.href='boardList.sil?currentPage=${currentPage}'"
                />
            </td>
        </tr>
    </table>
</div>

<hr style="color: red; width: 700px; margin-left: auto; margin-right: auto;"/>

<!-- 댓글 폼 -->
<form class="m-3" action="boardCommentOK.sil" method="post" name="commentForm">
    <table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
        <tr class="table-success">
            <th colspan="4" style="font-size: 30px; text-align: center;">댓글 보기</th>
        </tr>

        <!-- 이 줄은 원래 보이면 안되는 줄로 작업이 완료되면 화면에 표시되지 않게 한다. -->
        <!-- <tr style="display: none;"> -->
        <tr>
            <td colspan="4">
                <!-- 수정 또는 삭제할 댓글의 글번호를 넘겨준다. -->
                postID: <input type="text" name="postID" value="${boardDTO.postID}" size="1"/>
                <!-- 현재 댓글이 어떤 메인글의 댓글인가 넘겨준다. -->
                gup: <input type="text" name="gup" value="${boardDTO.postID}" size="1"/>
                <!-- 작업 모드, 1 => 댓글 저장, 2 => 댓글 수정, 3 => 댓글 삭제 -->
                mode:  <input type="text" name="mode" value="1" size="1"/>
                <!-- 메인글이 표시되던 페이지 번호를 넘겨준다. -->
                currentPage:  <input type="text" name="currentPage" value="${currentPage}" size="1"/>
                <!-- 댓글 작성자의 ip 주소를 넘겨준다. -->
                ip:  <input type="text" name="ip" value="${pageContext.request.remoteAddr}" size="10"/>
            </td>
        </tr>

        <!-- 이 줄 부터 댓글 입력, 수정, 삭제에 사용된다. -->
        <tr>
            <th class="align-middle" style="width: 100px; text-align: center;">
                <label for="userName">이름</label>
            </th>
            <th style="width: 250px;">
                <input id="userName" class="form-control form-control-sm" type="text" name="userName"/>
            </th>
            <th class="align-middle" style="width: 100px; text-align: center;">
                <label for="password">비밀번호</label>
            </th>
            <th style="width: 250px;">
                <input id="password" class="form-control form-control-sm" type="password" name="password"/>
            </th>
        </tr>
        <tr>
            <th class="align-middle" style="width: 100px; text-align: center;">
                <label for="content">내용</label>
            </th>
            <th colspan="3" style="width: 600px;">
					<textarea
                            id="content"
                            class="form-control form-control-sm"
                            rows="3"
                            name="content"
                            style="resize: none;"
                    ></textarea>
            </th>
        </tr>
        <tr class="table-info">
            <td colspan="4" align="center">
                <input
                        class="btn btn-outline-primary btn-sm"
                        type="submit"
                        value="댓글저장"
                        style="font-size: 13px;"
                        name="commentBtn"
                />
                <input
                        class="btn btn-outline-danger btn-sm"
                        type="button"
                        value="다시쓰기"
                        style="font-size: 13px;"
                        onclick="setting(0, 1, '댓글저장', '', '')"
                />
            </td>
        </tr>

        <!-- 댓글을 출력한다. -->
        <c:set var="comment" value="${boardCommentList.list}"></c:set>

        <!-- 댓글이 없는 경우 -->
        <c:if test="${comment.size() == 0}">
            <tr>
                <td colspan="4">
                    <marquee>댓글이 하나도 없네요~~~~~</marquee>
                </td>
            </tr>
        </c:if>

        <!-- 댓글이 있는 경우 -->
        <c:if test="${comment.size() != 0}">
            <c:forEach var="commentDTO" items="${comment}">
                <tr class="table-dark">
                    <td colspan="4">
                            ${commentDTO.commentID}.
                        <c:set var="userName" value="${fn:replace(commentDTO.userName, '<', '&lt;')}"/>
                        <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                            ${userName} 님이
                        <fmt:formatDate value="${commentDTO.writeDate}" pattern="yyyy.MM.dd(E) HH:mm:ss"/>에 남긴글<br/>
                        <c:set var="content" value="${fn:replace(commentDTO.content, '<', '&lt;')}"/>
                        <c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
                        <c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
                            ${content}<br/>
                        <div align="right">
                            <input
                                    class="btn btn-outline-primary btn-sm"
                                    type="button"
                                    value="수정"
                                    style="font-size: 13px;"
                                    onclick="setting(${commentDTO.commentID}, 2, '댓글수정', '${userName}', '${content}')"
                            />
                            <input
                                    class="btn btn-outline-danger btn-sm"
                                    type="button"
                                    value="삭제"
                                    style="font-size: 13px;"
                                    onclick="setting(${commentDTO.commentID}, 3, '댓글삭제', '${userName}', '${content}')"
                            />
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </c:if>

    </table>
</form>

<script src="../js/jquery-3.6.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>

</html>
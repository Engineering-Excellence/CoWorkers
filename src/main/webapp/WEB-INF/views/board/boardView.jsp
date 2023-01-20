<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/alarm.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">게시판</h1>

            <div class="table table-responsive">
                <table class="table table-striped" style="width: 100%; margin-left: auto; margin-right: auto;">
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
						date.date == boardDTO.writeDate.date && boardDTO.deleteDate == null && boardDTO.updateDate == null}">
                                <fmt:formatDate value="${boardDTO.writeDate}" pattern="a h:mm"/>
                            </c:if>
                            <c:if test="${date.year != boardDTO.writeDate.year || date.month != boardDTO.writeDate.month ||
						date.date != boardDTO.writeDate.date && boardDTO.deleteDate == null && boardDTO.updateDate == null}">
                                <fmt:formatDate value="${boardDTO.writeDate}" pattern="yyyy.MM.dd(E)"/>
                            </c:if>
                        </td>
                        <td align="center">
                            ${boardDTO.hit}
                        </td>
                    </tr>
                    <tr>
                        <th style="text-align: center">제목</th>
                        <td colspan="3">
                            <c:if test="${boardDTO.deleteDate == null}">
                                <c:set var="subject" value="${fn:replace(boardDTO.subject, '<', '&lt;')}"/>
                                <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                ${subject}
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th class="align-middle" style="text-align: center; height: 200px;">내용</th>
                        <td colspan="3">
                            <c:if test="${boardDTO.deleteDate == null}">
                                <c:set var="content" value="${fn:replace(boardDTO.content, '<', '&lt;')}"/>
                                <c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
                                <c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
                                ${content}
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th class="align-middle" style="text-align: center;">파일</th>
<%--                        <td colspan="3">
                            <div class="uploadResult">
                                <ul>
                                </ul>
                            </div>
                        </td>--%>
                        <td colspan="3" class="uploadResult">
                            <c:if test="${boardDTO.deleteDate == null}">
                                <ul>

                                </ul>
                            </c:if>
                        </td>
                    </tr>
                    <tr class="table-secondary">
                        <td colspan="4" align="center">
                            <c:if test="${userInfo.get(0).getUserID() == boardDTO.userID}">
                                <input
                                        class="btn btn btn-primary btn-sm btn-sm"
                                        type="button"
                                        value="수정하기"
                                        style="font-size: 13px;"
                                        onclick="location.href=('boardUpdate?postID=${boardDTO.postID}&currentPage=${currentPage}')"/>
                                <input
                                        class="btn btn-danger btn-sm"
                                        type="button"
                                        value="삭제하기"
                                        style="font-size: 13px;"
                                        onclick="deleteCheck('boardDelete?postID=${boardDTO.postID}&currentPage=${currentPage}&userID=${userInfo.get(0).getUserID()}')"/>
                            </c:if>
                            <input
                                    class="btn btn-info btn-sm"
                                    type="button"
                                    value="돌아가기"
                                    style="font-size: 13px;"
                                    onclick="location.href='board?currentPage=${currentPage}'"
                            />
                        </td>
                    </tr>
                </table>
            </div>

            <hr style="margin-left: auto; margin-right: auto;"/>

            <!-- 댓글 폼 -->
            <form class="m-3" action="boardCommentOK" method="post" name="commentForm">
                <%--<form class="m-3" action="javascript:action()" method="post" name="commentForm">--%>
                <table class="table table-striped" style="width: 100%; margin-left: auto; margin-right: auto;">
                    <tr class="table-success">
                        <th colspan="4" style="font-size: 30px; text-align: center;">댓글 보기(${boardDTO.commentCount}개)
                        </th>
                    </tr>

                    <!-- 이 줄은 원래 보이면 안되는 줄로 작업이 완료되면 화면에 표시되지 않게 한다. -->
                    <tr style="display: none;">
                        <td colspan="4">
                            <!-- 수정 또는 삭제할 댓글의 글번호를 넘겨준다. -->
                            commentID: <input type="text" name="commentID" value="0" size="4"/>
                            <!-- 현재 댓글이 어떤 메인글의 댓글인가 넘겨준다. -->
                            postID: <input type="text" name="postID" value="${boardDTO.postID}" size="4"/>
                            <!-- 작업 모드, 1 => 댓글 저장, 2 => 댓글 수정 -->
                            mode: <input type="text" name="mode" value="insert" size="1"/>
                            <!-- 메인글이 표시되던 페이지 번호를 넘겨준다. -->
                            currentPage: <input type="text" name="currentPage" value="${currentPage}" size="4"/>
                            <!-- 댓글 작성자의 ip 주소를 넘겨준다. -->
                            ip: <input type="text" name="ip" value="${pageContext.request.remoteAddr}" size="10"/>
                        </td>
                    </tr>

                    <!-- 이 줄 부터 댓글 입력, 수정, 삭제에 사용된다. -->
                    <tr>
                        <th class="align-middle" style="width: 100px; text-align: center;">
                            <label for="userName">이름</label>
                        </th>
                        <th style="width: 250px;">
                            <input autocomplete="off" id="userName" class="form-control form-control-sm" type="text"
                                   value="${userInfo.get(0).getUserName()}"
                                   name="userName" readonly/>
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
                                    class="btn btn-primary btn-sm"
                                    type="submit"
                                    value="댓글 작성"
                                    style="font-size: 13px;"
                                    name="commentBtn"
                            />
                            <input
                                    class="btn btn-danger btn-sm"
                                    type="button"
                                    value="다시쓰기"
                                    style="font-size: 13px;"
                                    onclick="setting(0, 'insert', '댓글 작성', '${userInfo.get(0).getUserName()}', '')"
                            />
                        </td>
                    </tr>

                    <!-- 댓글을 출력한다. -->
                    <c:set var="boardCommentList" value="${boardCommentList.list}"/>

                    <!-- 댓글이 없는 경우 -->
                    <c:if test="${boardCommentList.size() == 0}">
                        <tr>
                            <td colspan="4" height="85" style="vertical-align: middle">
                                <p align="center">댓글이 존재하지 않습니다.</p>
                            </td>
                        </tr>
                    </c:if>

                    <!-- 댓글이 있는 경우 -->
                    <c:if test="${boardCommentList.size() != 0}">
                        <c:forEach var="boardCommentDTO" items="${boardCommentList}">
                            <tr class="table-dark">
                                <c:if test="${boardCommentDTO.deleteDate == null}">
                                    <td colspan="4" style="vertical-align: middle">
                                            <%--${boardCommentDTO.commentID}.--%>
                                        <c:set var="userName"
                                               value="${fn:replace(boardCommentDTO.userName, '<', '&lt;')}"/>
                                        <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                                                <strong>${userName}</strong>님이
                                        <fmt:formatDate value="${boardCommentDTO.writeDate}"
                                                        pattern="yyyy.MM.dd(E) HH:mm:ss"/>에
                                        남긴 댓글:<br/>
                                        <c:set var="content"
                                               value="${fn:replace(boardCommentDTO.content, '<', '&lt;')}"/>
                                        <c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
                                        <c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
                                            ${content}<br/>
                                        <div align="right">
                                            <c:if test="${userInfo.get(0).getUserID() == boardCommentDTO.userID}">
                                                <input
                                                        class="btn btn-primary btn-sm"
                                                        type="button"
                                                        value="수정"
                                                        style="font-size: 13px;"
                                                        onclick="setting(${boardCommentDTO.commentID}, 'update', '댓글 수정', '${boardCommentDTO.userName}', '${boardCommentDTO.content}')"
                                                />
                                                <input
                                                        class="btn btn-danger btn-sm"
                                                        type="button"
                                                        value="삭제"
                                                        style="font-size: 13px;"
                                                        onclick="deleteCheck('boardCommentDelete?commentID=${boardCommentDTO.commentID}&postID=${boardDTO.postID}&currentPage=${currentPage}&userID=${userInfo.get(0).getUserID()}')"
                                                />
                                            </c:if>
                                        </div>
                                    </td>
                                </c:if>
                                <c:if test="${boardCommentDTO.deleteDate != null}">
                                    <td colspan="4" height="60" style="vertical-align: middle">
                                        <p>삭제된 댓글입니다.</p>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </c:if>

                </table>
                <input type="hidden" id="userID" name="userID" value="${userInfo.get(0).getUserID()}">
            </form>
        </div>
    </div>
</div>

<!-- 이미지 원본 보기 -->
<div class="bigPictureWrapper">
    <div class="bigPicture">
    </div>
</div>

<link rel="stylesheet" href="/css/board.css">
<script type="text/javascript" src="/js/board.js"></script>

<!-- 첨부파일 -->
<script>
    'use strict'

    $(() => {

        // 첨부파일 보기
        (() => {
            let postID = '<c:out value="${boardDTO.postID}"/>'

            $.getJSON("/boardSelectAttachList", {postID: postID}, arr => {

                console.log(arr)

                let str = ''

                $(arr).each((i, attach) => {

                    // 이미지
                    if (attach.fileType) {
                        let fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName)

                        str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid
                            + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>"
                            + "<img src='/display?fileName=" + fileCallPath + "' />" + "</div></li>"
                    } else {

                        str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid
                            + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>"
                            + "<span>" + attach.fileName + "</span><br/>"
                            + "<img src='/resources/images/doker.ico'>"
                            + "</div></li>"
                    }
                })

                $('.uploadResult ul').html(str)
            })  // end getJSON
        })()

        // 첨부 이미지 원본 보기 & 파일 다운로드
        $('.uploadResult').on('click', 'li', function () {

            console.log('이미지 보기')

            let liObj = $(this)
            // console.log(this)

            let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"))

            if (liObj.data("type")) {
                showImage(path.replace(new RegExp(/\\/g), "/"))
            } else {
                // 다운로드
                self.location = "/download?fileName=" + path
            }
        })

        // 이미지 원본 보기
        function showImage(fileCallPath) {

            // alert(fileCallPath)

            $('.bigPictureWrapper').css('display', 'flex').show()

            $('.bigPicture')
                .html("<img src='/display?fileName=" + fileCallPath + "'>")
                .animate({width: '100%', height: '100%'}, 1000)
        }

        // 원본 이미지 닫기
        $(".bigPictureWrapper").on("click", () => {
            $(".bigPicture").animate({width: '0%', height: '0%'}, 1000)
            setTimeout(() => {
                $(".bigPictureWrapper").hide()
            }, 1000)
        })
    })
</script>

<%@include file="/WEB-INF/views/scripts.jsp" %>
</body>
<%@include file="/WEB-INF/views/footer.jsp" %>
</html>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">게시판</h1>

    <div class="table-responsive">

        <!-- 글 작성 부분 -->
        <form id="formObj" class="m-" action="boardInsertOK" method="post" onsubmit="return boardCheck(this)">
            <table class="table table-striped" style="width:1500px; margin-left: auto; margin-right: auto;">
                <tr class="table-primary">
                    <th colspan="15" style="font-size: 30px; text-align: center;">글 작성</th>
                </tr>

                <tr>
                    <th class="align-middle table-dark">제목
                    </th>
                    <td colspan="2">
                        <input id="subject" type="text" class="form-control form-control-sm" name="subject"/>
                    </td>
                </tr>

                <tr>
                    <th class="align-middle table-dark">이름
                    </th>
                    <td>
                        <input id="userName" type="text" class="form-control form-control-sm" name="userName"
                               style="width: 50%;" value="${userInfo.get(0).getUserName()}" readonly/>
                    </td>

                    <!-- 공지글 여부 -->
                    <th class="align-left table-dark">
                        공지글 <input id="notice" class="form-check-input" type="checkbox" name="notice"
                                   value="true">
                    </th>
                </tr>

                <tr>
                    <th class="align-middle table-dark">내용
                    </th>
                    <td colspan="2">
                <textarea id="content" class="form-control form-control-sm" rows="10" name="content"
                          style="resize: none"></textarea>
                    </td>
                </tr>

                <tr>
                    <th class="align-middle table-dark">파일첨부</th>
                    <td colspan="2" class="uploadTd">
                        <input type="file" name="uploadFile" multiple/>
                    </td>
                    <%--<td>
                        <button id="uploadBtn">업로드</button>
                    </td>--%>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2" class="uploadResult">
                        <ul>

                        </ul>
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

            <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
            <input type="hidden" name="userID" value="${userInfo.get(0).getUserID()}">
        </form>
    </div>
</div>
</div>
</div>

<div class="bigPictureWrapper">
    <div class="bigPicture">
    </div>
</div>

<link rel="stylesheet" href="css/board.css">
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<%@include file="/WEB-INF/views/scripts.jsp" %>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/boardInsert.js"></script>

</body>
<!-- body 끝 -->

<%@include file="/WEB-INF/views/footer.jsp" %>
</html>
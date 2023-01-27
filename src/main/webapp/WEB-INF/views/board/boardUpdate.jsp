<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/alarm.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">게시판</h1>

            <div class="table-responsive">

                <form class="m-" action="boardUpdateOK" method="post">
                    <table class="table table-striped" style="width:1500px; margin-left: auto; margin-right: auto;">

                        <tr class="table-primary">
                            <th colspan="15" style="font-size: 30px; text-align: center;">글 수정</th>
                        </tr>

                        <tr>
                            <th class="align-middle table-dark">제목
                            </th>
                            <td colspan="2">
                                <input id="subject" type="text" class="form-control form-control-sm" name="subject"
                                       value="${boardDTO.subject}" autocomplete="off"/>
                            </td>
                        </tr>

                        <tr>
                            <th class="align-middle table-dark">성명
                            </th>
                            <td>
                                <input id="userName" type="text" class="form-control form-control-sm" name="userName"
                                       value="${boardDTO.userName}" readonly="readonly"/>
                            </td>

                            <!-- 공지글 여부 -->
                            <th class="align-middle table-dark">
                                <c:if test="${boardDTO.notice == 'true'}">
                                    공지글 <input class="form-check-input" type="checkbox" name="notice" value="true"
                                               checked="checked">
                                </c:if>
                                <c:if test="${boardDTO.notice != 'true'}">
                                    공지글 <input class="form-check-input" type="checkbox" name="notice" value="true">
                                </c:if>
                            </th>
                        </tr>


                        <tr>
                            <th class="align-middle table-dark">내용
                            </th>
                            <td colspan="2">
                <textarea id="content" class="form-control form-control-sm" rows="10" name="content"
                          style="resize: none">${boardDTO.content}</textarea>
                            </td>
                        </tr>

                        <tr class="table-secondary">
                            <td colspan="3" align="center">
                                <input class="btn btn-primary btn-sm" type="submit" value="수정하기"
                                       style="font-size: 13px"/>
                                <input class="btn btn-danger btn-sm" type="reset" value="다시쓰기" style="font-size: 13px"/>
                                <input class="btn btn-info btn-sm" type="button" value="돌아가기" style="font-size: 13px"
                                       onclick="history.back()"/>
                            </td>
                        </tr>
                    </table>

                    <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
                    <input type="hidden" name="postID" value="${boardDTO.postID}"/>
                    <input type="hidden" name="currentPage" value="${currentPage}"/>
                </form>
            </div>
        </div>
    </div>
</div>


<%@include file="/WEB-INF/views/scripts.jsp"%>
<link rel="stylesheet" href="css/board.css" />
<script type="text/javascript" src="/js/board.js"></script>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
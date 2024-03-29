<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.crunch.domain.UserInfoDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 조우철 --%>
<%@include file="/WEB-INF/views/header.jsp"%>
<input name="accountList" type="hidden" value="${allAccountID}">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">

                <form class="m-" action="memoInsertOK" method="post" onsubmit="return memoCheck(this)">
                    <table class="table" style="width:1500px; margin-left: auto; margin-right: auto;">
                        <tr class="table-primary">
                            <th colspan="10" style="font-size: 30px; text-align: center;">쪽지쓰기</th>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark" style="width: 10%">제목
                            </th>
                            <td colspan="1">
                                <input  type="text" class="form-control form-control-sm" name="subject"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">받는이
                            </th>
                            <td>
                                <input type="text" class="form-control form-control-sm" name="accountID"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">보낸이
                            </th>
                            <td>
                                <input type="text" class="form-control form-control-sm" name="userName"
                                       value="${userInfo.get(0).getUserName()}" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">내용
                            </th>
                            <td>
                                <textarea class="form-control form-control-sm" rows="10" name="content"
                                          style="resize: none"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">강조
                            </th>
                            <td>
                                <input name="important" type="radio" value="1"/><b style="color: crimson">중요</b>
                                <input name="important" type="radio" value="0" checked/><b style="color: black">일반</b>
                            </td>
                        </tr>
                        <tr class="table-secondary">
                            <td colspan="2" style="text-align: center;">
                                <input type="submit" class="btn btn-primary btn-sm" value="보내기" style="font-size: 13px"/>
                                <input type="reset" class="btn btn-danger btn-sm" value="다시쓰기" style="font-size: 13px"/>
                                <input type="button" class="btn btn-info btn-sm" value="돌아가기" style="font-size: 13px"
                                       onclick="history.back()"/>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="userID" value="${userInfo.get(0).getUserID()}"/>
                    <input type="hidden" name="senderID" value="${userInfo.get(0).getAccountID()}"/>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/scripts.jsp"%>
<script src="js/workInsert.js"></script>
<script type="text/javascript" src="js/check.js"></script>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
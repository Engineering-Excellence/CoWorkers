<%@ page import="com.crunch.domain.WorkList" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 조우철 --%>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/alarm.jsp"%>
<c:set var="date" value="${Date(Date().getTime()-60*60*24*1000)}"/>
<c:set var="dday" value="${Date(Date().getTime()+60*60*24*1000)}"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">
                <form action="memoReply?memoID=${mDTO.memoID}" method="post">
                    <table class="table" style="width:1500px; margin-left: auto; margin-right: auto;">
                        <tr class="bg-info">
                            <th name="subject" colspan="15" style="font-size: 30px; text-align: center;">
                                <c:set var="subject" value="${fn:replace(mDTO.subject, '<', '&lt;')}"/>
                                <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                ${subject}(${mDTO.writeDate})
                            </th>
                        </tr>
                        <tr class="bg-primary">

                            <th class="align-middle table-dark"
                                style="font-size: 22px; width: 100px; text-align: center;">
                                <c:set var="name" value="${fn:replace(mDTO.userName, '<', '&lt;')}"/>
                                <c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
                                ${name}
                            </th>
                        </tr>

                        <tr>
                            <td align="center" style="font-size: 21px">
                                <c:set var="content" value="${fn:replace(mDTO.content, '<', '&lt;')}"/>
                                <c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
                                <c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
                                ${content}
                            </td>
                        </tr>


                    </table>
                    <table class="table" width="600" align="center" cellpadding="5" cellspacing="0">
                        <tr class="table-secondary">
                            <td align="center">
                                <input class="btn btn-primary btn-sm" type="submit" value="답장"
                                       style="font-size: 13px; width: 80px"/>
                                <c:if test="${mDTO.marked==0}">
                                    <input class="btn btn-success btn-sm" type="button" value="관심쪽지"
                                           style="font-size: 13px; width: 80px"
                                           onclick="memoMark('memoMark?memoID=${mDTO.memoID}&currentPage=${currentPage}','${userInfo.get(0).getUserID()==mDTO.receiverID}')"/></c:if>
                                <c:if test="${mDTO.marked==1}">
                                    <input class="btn btn-dark btn-sm" type="button" value="관심없음"
                                           style="font-size: 13px; width: 80px"
                                           onclick="memoMarkGG('memoMarkGG?memoID=${mDTO.memoID}&currentPage=${currentPage}','${userInfo.get(0).getUserID()==mDTO.receiverID}')"/>
                                </c:if>
                                <input class="btn btn-danger btn-sm" type="button" value="삭제"
                                       style="font-size: 13px; width: 80px"
                                       onclick="memoDelete('memoDelete?memoID=${mDTO.memoID}&currentPage=${currentPage}','${userInfo.get(0).getUserID()==mDTO.receiverID}')"/>
                                <input class="btn btn-info btn-sm" type="button" value="돌아가기"
                                       style="font-size: 13px; width: 80px"
                                       onclick="location.href='return'"/>
                                <input type="hidden" name="userID" value="${mDTO.userID}"/>
                                <input type="hidden" name="currentPage" value="${currentPage}"/>
                                <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
                                <input type="hidden" name="memoID" value="${mDTO.memoID}">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<%@include file="/WEB-INF/views/scripts.jsp"%>
<script src="/resources/js/workDelete.js"></script>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
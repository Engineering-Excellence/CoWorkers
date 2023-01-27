<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 조우철 --%>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/alarm.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">

                <form class="m-" action="workUpdateOK.sil" method="post">
                    <table class="table" style="width:1500px; margin-left: auto; margin-right: auto;">
                        <tr class="table-primary">
                            <th colspan="15" style="font-size: 30px; text-align: center;">업무 수정</th>
                        </tr>
                        <tr>
                            <th style="width: 10%" class="align-middle table-dark">제목
                            </th>
                            <td>
                                <input id="subject" type="text" class="form-control form-control-sm"
                                       value="${dto.subject}" name="subject"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">내용
                            </th>
                            <td>
                <textarea id="content" class="form-control form-control-sm" rows="10" name="content"
                          style="resize: none">${dto.content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">우선순위
                            </th>
                            <td>
                                <c:if test="${dto.priority == 1}">
                                    <input name="priority" type="radio" checked
                                           value="${dto.currentProgress}"/><b style="color: crimson">긴급</b>
                                    <%--<input name="priority" type="radio" checked
                                           value="<c:out value="${dto.currentProgress}"/>"/>긴급--%>
                                    <input name="priority" type="radio" value="2"/><b style="color: violet">높음</b>
                                    <input name="priority" type="radio" value="3"/><b style="color: limegreen">보통</b>
                                    <input name="priority" type="radio" value="4"/><b style="color: darkgray">낮음</b>
                                </c:if>
                                <c:if test="${dto.priority == 2}">
                                    <input name="priority" type="radio" value="1"/><b style="color: crimson">긴급</b>
                                    <input name="priority" type="radio" checked
                                           value="${dto.currentProgress}"/><b style="color: violet">높음</b>
                                    <input name="priority" type="radio" value="3"/><b style="color: limegreen">보통</b>
                                    <input name="priority" type="radio" value="4"/><b style="color: darkgray">낮음</b>
                                </c:if>
                                <c:if test="${dto.priority == 3}">
                                    <input name="priority" type="radio" value="1"/><b style="color: crimson">긴급</b>
                                    <input name="priority" type="radio" value="2"/><b style="color: violet">높음</b>
                                    <input name="priority" type="radio" checked
                                           value="${dto.currentProgress}"/><b style="color: limegreen">보통</b>
                                    <input name="priority" type="radio" value="4"/><b style="color: darkgray">낮음</b>
                                </c:if>
                                <c:if test="${dto.priority == 4}">
                                    <input name="priority" type="radio" value="1"/><b style="color: crimson">긴급</b>
                                    <input name="priority" type="radio" value="2"/><b style="color: violet">높음</b>
                                    <input name="priority" type="radio" value="3"/><b style="color: limegreen">보통</b>
                                    <input name="priority" type="radio" checked
                                           value="${dto.currentProgress}"/><b style="color: darkgray">낮음</b>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">업무상태${dto.currentProgress}
                            </th>
                            <td>
                                <c:if test="${dto.currentProgress == 1}">
                                    <input name="currentProgress" type="radio" checked
                                           value="${dto.currentProgress}"/><img width="15" src="images/sug.png"> 요청
                                    <input name="currentProgress" type="radio" value="2"/><img width="15"
                                                                                               src="images/on.png"> 진행
                                    <input name="currentProgress" type="radio" value="3"/><img width="15"
                                                                                               src="images/fin.png"> 완료
                                </c:if>
                                <c:if test="${dto.currentProgress == 2}">
                                    <input name="currentProgress" type="radio" value="1"/><img width="15"
                                                                                               src="images/sug.png"> 요청
                                    <input name="currentProgress" type="radio" checked
                                           value="${dto.currentProgress}"/><img width="15" src="images/on.png"> 진행
                                    <input name="currentProgress" type="radio" value="3"/><img width="15"
                                                                                               src="images/fin.png"> 완료
                                </c:if>
                                <c:if test="${dto.currentProgress == 3}">
                                    <input name="currentProgress" type="radio" value="1"/><img width="15"
                                                                                               src="images/sug.png"> 요청
                                    <input name="currentProgress" type="radio" value="2"/><img width="15"
                                                                                               src="images/on.png"> 진행
                                    <input name="currentProgress" type="radio" checked
                                           value="${dto.currentProgress}"/><img width="15" src="images/fin.png"> 완료
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">업무진척도
                            </th>
                            <td>
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
                            <td>
                                <input id="startDate" type="date" class="form-control form-control-sm" name="startDate" value="${dto.startDate}"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">마감일
                            </th>
                            <td>
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

<%@include file="/WEB-INF/views/scripts.jsp"%>
<script type="text/javascript" src="/js/check.js"></script>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
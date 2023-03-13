<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 조우철 --%>
<%@include file="/WEB-INF/views/header.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">

                <form class="m-" action="workInsertOK" method="post" onsubmit="return boardCheck(this)">
                    <table class="table" style="width:1500px; margin-left: auto; margin-right: auto;">
                        <tr class="table-primary">
                            <th colspan="10" style="font-size: 30px; text-align: center;">업무 작성</th>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark" style="width: 10%">제목
                            </th>
                            <td colspan="1">
                                <input id="subject" type="text" class="form-control form-control-sm" name="subject"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">이름
                            </th>
                            <td>
                                <input id="userName" type="text" class="form-control form-control-sm" name="userName"
                                       value="${userInfo.get(0).getUserName()}" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">내용
                            </th>
                            <td>
                <textarea id="content" class="form-control form-control-sm" rows="10" name="content"
                          style="resize: none"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">우선순위
                            </th>
                            <td>
                                <input name="priority" type="radio" value="1"/><b style="color: crimson">긴급</b>
                                <input name="priority" type="radio" value="2"/><b style="color: violet">높음</b>
                                <input name="priority" type="radio" value="3"/><b style="color: limegreen">보통</b>
                                <input name="priority" type="radio" value="4" checked/><b style="color: darkgray">낮음</b>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">업무상태
                            </th>
                            <td>
                                <input name="currentProgress" type="radio" value="1" checked/><img width="15"
                                                                                                   src="images/sug.png"/> 요청
                                <input name="currentProgress" type="radio" value="2"/><img width="15"
                                                                                           src="images/on.png"/> 진행
                                <input name="currentProgress" type="radio" value="3"/><img width="15"
                                                                                           src="images/fin.png"/> 완료
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">업무진척도
                            </th>
                            <td>
                                <select id="workProgress" class="form-control form-control-sm" name="workProgress"
                                        size="1">
                                    <option value="0" selected>0%</option>
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
                                <input id="startDate" type="date" class="form-control form-control-sm"
                                       name="startDate"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="align-middle table-dark">마감일
                            </th>
                            <td>
                                <input id="deadline" type="date" class="form-control form-control-sm" name="deadline"/>
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
                    <input type="hidden" name="userID" value="${userInfo.get(0).getUserID()}"/>
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
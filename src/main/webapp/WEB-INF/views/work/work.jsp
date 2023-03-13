<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 조우철 --%>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="date" value="${Date(Date().getTime()-60*60*24*1000)}"/>
<c:set var="dday" value="${Date(Date().getTime())}"/>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">

                <table class="table" style="margin-left: auto; margin-right: auto;">
                    <tr class="bg-info">
                        <th colspan="10" style="font-size: 30px; text-align: center;">업무</th>
                    </tr>

                    <tr class="bg-primary">
                        <th style="width: 100px; text-align: center;">글번호</th>
                        <th style="width: 150px; text-align: center;">우선순위</th>
                        <th style="width: 400px; text-align: center;">업무명</th>
                        <th style="width: 250px; text-align: center;">상태</th>
                        <th style="width: 100px; text-align: center;">담당자</th>
                        <th style="width: 100px; text-align: center;">진척도</th>
                        <th style="width: 300px; text-align: center;">작성일(수정,삭제)</th>
                        <th style="width: 150px; text-align: center;">시작일</th>
                        <th style="width: 150px; text-align: center;">마감일</th>
                    </tr>
                    </thead>

                    <tbody>
                    <%--긴급 --%>
                    <c:forEach var="dto" items="${priority}">
                        <c:if test="${dto.deleteDate!=null}">
                        </c:if>
                        <c:if test="${dto.deleteDate==null and dto.currentProgress!=3 and dto.workProgress!=10}">
                            <tr class="bg-danger">
                                <td align="center">${dto.workID}</td>
                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.priority==1}">
                                            <b style="color: crimson">긴급</b>
                                        </c:if>
                                    </c:if>
                                </td>

                                <td class="subject" align="center">
                                    <c:if test="${dto.deleteDate != null}"></c:if>
                                    <c:if test="${dto.deleteDate == null}">
                                        <c:set var="subject" value="${fn:replace(dto.subject, '<', '&lt;')}"/>
                                        <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                        <a href="workView?workID=${dto.workID}&currentPage=${workList.currentPage}">${subject}</a>
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.currentProgress==1}">
                                            <img width="15" src="images/sug.png"> 요청중
                                        </c:if>
                                        <c:if test="${dto.currentProgress==2}">
                                            <img width="15" src="images/on.png"> 진행중
                                        </c:if>
                                        <c:if test="${dto.currentProgress==3}">
                                            <img width="15" src="images/fin.png"> 완료됨
                                        </c:if>
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:set var="userName" value="${fn:replace(dto.userName, '<', '&lt;')}"/>
                                        <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                                        ${dto.userName}
                                    </c:if>
                                </td>

                                <td align="left">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.workProgress!=10}">
                                            <c:if test="${dto.workProgress<5}">
                                                <div style="height: 5px;width:${dto.workProgress*10}px;background-color:red;"></div>
                                                <c:if test="${dto.workProgress==0}">
<%--                                                    <img width="20" src="images/thief.png">--%>
                                                </c:if>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${dto.workProgress!=10}">
                                            <c:if test="${dto.workProgress>=5}">
                                                <div style="height: 5px;width:${dto.workProgress*10}px;background-color:orange;"></div>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${dto.workProgress==10}">
                                            <div style="height: 5px;width: ${dto.workProgress*10}px;background-color:springgreen;"></div>
                                        </c:if>
                                        ${dto.workProgress*10}%
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.updateDate == null}">
                                            <c:if test="${dto.writeDate.year==date.year&&dto.writeDate.month==date.month&&dto.writeDate.date==date.date}">
                                                <fmt:formatDate value="${dto.writeDate}" pattern="a h:mm:ss"/>
                                            </c:if>
                                            <c:if test="${dto.writeDate.year!=date.year||dto.writeDate.month!=date.month||dto.writeDate.date!=date.date}">
                                                <fmt:formatDate value="${dto.writeDate}" pattern="yyyy.MM.dd.(E)"/>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${dto.updateDate != null}">
                                            <c:if test="${dto.updateDate.year==date.year&&dto.updateDate.month==date.month&&dto.updateDate.date==date.date}">
                                                (수정)
                                                <fmt:formatDate value="${dto.updateDate}" pattern="a h:mm:ss"/>
                                            </c:if>
                                            <c:if test="${dto.updateDate.year!=date.year||dto.updateDate.month!=date.month||dto.updateDate.date!=date.date}">
                                                (수정)
                                                <fmt:formatDate value="${dto.updateDate}" pattern="yyyy.MM.dd.(E)"/>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${dto.deleteDate!=null}">
                                        <c:if test="${dto.deleteDate.year==date.year&&dto.deleteDate.month==date.month&&dto.deleteDate.date==date.date}">
                                            (삭제)
                                            <fmt:formatDate value="${dto.deleteDate}" pattern="a h:mm:ss"/>
                                        </c:if>
                                        <c:if test="${dto.updateDate.year!=date.year||dto.deleteDate.month!=date.month||dto.deleteDate.date!=date.date}">
                                            (삭제)
                                            <fmt:formatDate value="${dto.deleteDate}" pattern="yyyy.MM.dd.(E)"/>
                                        </c:if>
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <fmt:formatDate value="${dto.startDate}" pattern="yyyy.MM.dd.(E)"/>
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <%--                                        <c:if test="${dto.deadline>=date}">--%>
                                        <c:if test="${dto.currentProgress==3}">
                                            <fmt:formatDate value="${dto.deadline}" pattern="yyyy.MM.dd.(E)"/>
                                        </c:if>
                                        <c:if test="${dto.currentProgress!=3}">

                                            <c:if test="${dto.deadline.after(dday)}">
                                                <fmt:formatDate value="${dto.deadline}" pattern="yyyy.MM.dd.(E)"/>
                                            </c:if>
                                            <%--마감일 초과--%>
                                            <%--                                        <c:if test="${dto.deadline<date}">--%>
                                            <c:if test="${dto.deadline.before(dday)}">
                                                <b style="color: crimson"><fmt:formatDate value="${dto.deadline}"
                                                                                          pattern="yyyy.MM.dd.(E)"/></b>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>

                    <%--긴급글이 2개 이상일시 아래 버튼 표시--%>
                    <c:if test="${priority.stream().filter(p -> p.deleteDate == null).count() >= 2}">
                        <tr>
                            <td colspan="10" align="center">
                                <%--펼치기--%>
                                <button id="showAll" class="panel-primary btn-success label-info">▼</button>
                                <%--접기--%>
                                <button id="showOne" class="panel-primary btn-success label-info hidden">▲</button>
                            </td>
                        </tr>
                    </c:if>

                    <!-- 글을 출력한다. -->
                    <c:set var="list" value="${workList.list}"/>
                    <c:if test="${list.size() == 0}">
                        <tr>
                            <td colspan="10" align="center">등록된 글이 없습니다.
                                <img style="width: 350px" src="images/thief.png">
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${list.size() != 0}">
                        <c:forEach var="dto" items="${list}">
                            <tr>
                                <td align="center">${dto.workID}</td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.priority==1}">
                                            <b style="color: crimson">긴급</b>
                                        </c:if>
                                        <c:if test="${dto.priority==2}">
                                            <b style="color: violet">높음</b>
                                        </c:if>
                                        <c:if test="${dto.priority==3}">
                                            <b style="color: limegreen">보통</b>
                                        </c:if>
                                        <c:if test="${dto.priority==4}">
                                            <b style="color: darkgray">낮음</b>
                                        </c:if>
                                    </c:if>
                                </td>

                                <td class="subject" align="center">
                                    <c:if test="${dto.deleteDate!=null}">
                                        삭제된 글입니다.
                                    </c:if>
                                    <c:if test="${dto.deleteDate == null}">
                                        <c:set var="subject" value="${fn:replace(dto.subject, '<', '&lt;')}"/>
                                        <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                        <a href="workView?workID=${dto.workID}&currentPage=${workList.currentPage}">${subject}</a>
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.currentProgress==1}">
                                            <img width="15" src="images/sug.png"> 요청중
                                        </c:if>
                                        <c:if test="${dto.currentProgress==2}">
                                            <img width="15" src="images/on.png"> 진행중
                                        </c:if>
                                        <c:if test="${dto.currentProgress==3}">
                                            <img width="15" src="images/fin.png"> 완료됨
                                        </c:if>
                                    </c:if>
                                </td>

                                </td>
                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:set var="userName" value="${fn:replace(dto.userName, '<', '&lt;')}"/>
                                        <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                                        ${userName}
                                    </c:if>
                                </td>

                                <td align="left">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.workProgress!=10}">
                                            <c:if test="${dto.workProgress<5}">
                                                <div style="height: 5px;width:${dto.workProgress*10}px;background-color:red;"></div>
                                                <c:if test="${dto.workProgress==0}">
<%--                                                    <img width="20" src="images/thief.png">--%>
                                                </c:if>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${dto.workProgress!=10}">
                                            <c:if test="${dto.workProgress>=5}">
                                                <div style="height: 5px;width:${dto.workProgress*10}px;background-color:orange;"></div>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${dto.workProgress==10}">
                                            <div style="height: 5px;width: ${dto.workProgress*10}px;background-color:springgreen;"></div>
                                        </c:if>
                                        ${dto.workProgress*10}%
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate==null}">
                                        <c:if test="${dto.updateDate == null}">
                                            <c:if test="${dto.writeDate.year==date.year&&dto.writeDate.month==date.month&&dto.writeDate.date==date.date}">
                                                <fmt:formatDate value="${dto.writeDate}" pattern="a h:mm:ss"/>
                                            </c:if>
                                            <c:if test="${dto.writeDate.year!=date.year||dto.writeDate.month!=date.month||dto.writeDate.date!=date.date}">
                                                <fmt:formatDate value="${dto.writeDate}" pattern="yyyy.MM.dd.(E)"/>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${dto.updateDate != null}">
                                            <c:if test="${dto.updateDate.year==date.year&&dto.updateDate.month==date.month&&dto.updateDate.date==date.date}">
                                                (수정됨)
                                                <fmt:formatDate value="${dto.updateDate}" pattern="a h:mm:ss"/>
                                            </c:if>
                                            <c:if test="${dto.updateDate.year!=date.year||dto.updateDate.month!=date.month||dto.updateDate.date!=date.date}">
                                                (수정됨)
                                                <fmt:formatDate value="${dto.updateDate}" pattern="yyyy.MM.dd.(E)"/>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${dto.deleteDate!=null}">
                                        <c:if test="${dto.deleteDate.year==date.year&&dto.deleteDate.month==date.month&&dto.deleteDate.date==date.date}">
                                            (삭제됨)
                                            <fmt:formatDate value="${dto.deleteDate}" pattern="a h:mm:ss"/>
                                        </c:if>
                                        <c:if test="${dto.deleteDate.year!=date.year||dto.deleteDate.month!=date.month||dto.deleteDate.date!=date.date}">
                                            (삭제됨)
                                            <fmt:formatDate value="${dto.deleteDate}" pattern="yyyy.MM.dd.(E)"/>
                                        </c:if>
                                    </c:if>
                                </td>

                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <fmt:formatDate value="${dto.startDate}" pattern="yyyy.MM.dd.(E)"/>
                                    </c:if>
                                </td>
                                <td align="center">
                                    <c:if test="${dto.deleteDate!=null}"></c:if>
                                    <c:if test="${dto.deleteDate==null}">
                                        <%--                                        <c:if test="${dto.deadline>=date}">--%>
                                        <c:if test="${dto.currentProgress==3}">
                                            <fmt:formatDate value="${dto.deadline}" pattern="yyyy.MM.dd.(E)"/>
                                        </c:if>
                                        <c:if test="${dto.currentProgress!=3}">

                                            <c:if test="${dto.deadline.after(dday)}">
                                                <fmt:formatDate value="${dto.deadline}" pattern="yyyy.MM.dd.(E)"/>
                                            </c:if>
                                            <%--마감일 초과--%>
                                            <%--                                        <c:if test="${dto.deadline<date}">--%>
                                            <c:if test="${dto.deadline.before(dday)}">
                                                <b style="color: crimson"><fmt:formatDate value="${dto.deadline}"
                                                                                          pattern="yyyy.MM.dd.(E)"/></b>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>


                    <!-- 페이지 이동 버튼 -->
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
                                   onclick="location.href='workInsert'">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/scripts.jsp"%>
<script type="text/javascript" src="js/work.js"></script>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
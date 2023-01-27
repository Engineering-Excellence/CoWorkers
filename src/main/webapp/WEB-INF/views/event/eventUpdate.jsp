<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/alarm.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">일정 보기</h1>
            <br/>
            <br/>
            <div style="float: right ">
                <button type="button" class="btn btn-default" onclick="location.href='event'">캘린더</button>
            </div>
            <div><br/></div>
            <div class="table-reponsive">
                <form action="eventUpdateOK?eventID=${eDTO.eventID}&view=${param.view}" method="post">
                    <table class="table">
                        <tr class="table-primary">
                            <th colspan="4" style="font-size: 30px; text-align: center;">일정 수정</th>
                        </tr>
                        <tr>
                        	<td colspan="1">
                        		제목
                        	</td>
                            <td colspan="3">
                                <input id="subject" type="text"
                                       class="form-control"
                                       width="80%"
                                       name="subject" autocomplete="none"
                                       value="${eDTO.subject}"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan = "1" class="align-middle table-dark" width="100px">
                                <label for="eventColor">색상</label>
                            </td>
                            <td class="align-middle" colspan="2">
                                <c:if test="${eDTO.eventColor.equals('#E1E1E0')}">
                                    <select id="eventColor" name="eventColor"
                                    >
                                        <option value="#E1E1E0" selected="selected">
                                            gray<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png"
                                                     width="15px">
                                        </option>
                                        <option value="#CDFFBE">
                                            green<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png"
                                                      width="15px">
                                        </option>
                                        <option value="#FFCDCD">
                                            red<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
                                        </option>
                                        <option value="#FAFFCD">
                                            yellow<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png"
                                                       width="15px">
                                        </option>
                                    </select>
                                    <img alt="gray" src="./images/gray_E1E1E0.png" width="15px">
                                </c:if>
                                <c:if test="${eDTO.eventColor.equals('#CDFFBE')}">
                                    <select id="eventColor" name="eventColor"
                                    >
                                        <option value="#E1E1E0">
                                            gray<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png"
                                                     width="15px">
                                        </option>
                                        <option value="#CDFFBE" selected="selected">
                                            green<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png"
                                                      width="15px">
                                        </option>
                                        <option value="#FFCDCD">
                                            red<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
                                        </option>
                                        <option value="#FAFFCD">
                                            yellow<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png"
                                                       width="15px">
                                        </option>
                                    </select>
                                    <img alt="green" src="./images/green_CDFFBE.png" width="15px">
                                </c:if>
                                <c:if test="${eDTO.eventColor.equals('#FFCDCD')}">
                                    <select id="eventColor" name="eventColor"
                                    >
                                        <option value="#E1E1E0">
                                            gray<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png"
                                                     width="15px">
                                        </option>
                                        <option value="#CDFFBE">
                                            green<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png"
                                                      width="15px">
                                        </option>
                                        <option value="#FFCDCD" selected="selected">
                                            red<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
                                        </option>
                                        <option value="#FAFFCD">
                                            yellow<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png"
                                                       width="15px">
                                        </option>
                                    </select>
                                    <img alt="red" src="./images/red_FFCDCD.png" width="15px">
                                </c:if>
                                <c:if test="${eDTO.eventColor.equals('#FAFFCD')}">
                                    <select id="eventColor" name="eventColor"
                                    >
                                        <option value="#E1E1E0">
                                            gray<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png"
                                                     width="15px">
                                        </option>
                                        <option value="#CDFFBE">
                                            green<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png"
                                                      width="15px">
                                        </option>
                                        <option value="#FFCDCD">
                                            red<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
                                        </option>
                                        <option value="#FAFFCD" selected="selected">
                                            yellow<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png"
                                                       width="15px">
                                        </option>
                                    </select>
                                    <img alt="yellow" src="./images/yellow_FAFFCD.png" width="15px">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="1">
                                <c:if test="${eDTO.allDay='true'}">
                                    종일 <input class="form-check-input"
                                              type="checkbox"
                                              name="allDay"
                                              value="true"
                                              id="allDay"
                                              checked="checked"
                                />
                                </c:if>
                                <c:if test="${eDTO.allDay='false'}">
                                    종일 <input class="form-check-input"
                                              type="checkbox"
                                              name="allDay"
                                              value="true"
                                              id="allDay"
                                />
                                </c:if>
                            </td>
                            <td colspan="3">
                                <input class="form-check-input"
                                       type="date"
                                       name="startDate"
                                       min="2000-01-01"
                                       max="2050-12-31"
                                       value="${startDate}"
                                       size=40
                                       id="startDate"
                                />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="form-check-input"
                                       type="time"
                                       name="startTime"
                                       size=40
                                       value="${startTime}"
                                       id="startTime"
                                />
                                &nbsp;&nbsp;&nbsp;&nbsp; ~
                            </td>
                       </tr>
                       <tr>
                       		<td colspan="1">
                       		</td>
                            <td>
                                <input id="endDate"
                                       type="date"
                                       name="endDate"
                                       min="2000-01-01"
                                       max="2050-12-31"
                                       value="${endDate}"
                                       size=
                                />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="endTime"
                                       type="time"
                                       name="endTime"
                                       value="${endTime}"
                                       size=40
                                />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="4">
									<textarea
                                            id="content"
                                            class="form-control form-control-sm"
                                            rows="10"
                                            name="content"
                                            style="resize: none;"
                                            placeholder="내용을 입력하세요."
                                    >${eDTO.content}</textarea>
                                <!-- <input type="button" onclick="checkConent()"> -->
                            </td>

                        </tr>
                        <tr class="table-secondary">
                            <td colspan="4" align="center">
                                <input
                                        class="btn btn-primary btn-sm"
                                        type="submit"
                                        value="저장하기"
                                        style="font-size: 13px;"
                                />
                                <input class="btn btn-default btn-sm"
                                       type="reset"
                                       value="다시쓰기"
                                       style="font-size: 13px;"
                                />
                                <input class="btn btn-default btn-sm"
                                       type="button"
                                       value="돌아가기"
                                       style="font-size: 13px;"
                                       onclick="history.back()"
                                />
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="eventID" value="${eDTO.eventID}"/>
                    <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/scripts.jsp"%>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
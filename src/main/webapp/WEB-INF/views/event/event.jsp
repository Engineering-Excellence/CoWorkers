<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/alarm.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>



        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">일정 관리</h1>
            <div class="table-reponsive">
                <div style="float: right ">
                    <!-- 모달 실행 버튼 -->
                    <button type="button" id="insert" class="btn btn-primary" data-toggle="modal" data-target="#insertEventModal">일정추가
                    </button>
                </div>
            </div>
                        
            <br/>
            <br/>
            
            <div class="table-responsive">
				<div id="calendar"></div>
            </div>
        
        </div>
        
    </div>
</div>
<br/><br/>

<!-- Modal_insert -->
<div class="modal fade" id="insertEventModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
<!--                 <form action="insertEvent" method="post"> -->
                <form>
                    <table class="table">
                        <tr class="table-primary">
                            <th colspan="3" style="font-size: 30px; text-align: center;">일정 작성</th>
                        </tr>

                        <tr>
                            <td  colspan="1" width="70px">
	                            <label for="subject">제목</label>
	                        </td>
	                        <td class="align-middle" colspan="3">
                                <input id="subject" type="text"
                                       class="form-control"
                                       width="75%"
                                       name="subject" autocomplete="none"
                                       placeholder="제목을 입력하세요."/>
                            </td>
                        </tr>
                        <tr>
                        	<td  colspan="1" width="70px">
	                            <label for="userName">작성자</label>
	                        </td>
                            <td colspan="2">
                                <input class="form-control" type="text" id="userName" name="userName" value="${userInfo.get(0).getUserName()}" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="1" width="70px">
	                            <label for="eventColor">색상</label>
	                        </td>
	                        <td class="align-middle" colspan="3">
                                <select id="eventColor" name="eventColor">
                                    <option value="#E1E1E0">
                                        낮음<img name="#E1E1E0" alt="gray" src="./images/gray_E1E1E0.png" width="15px">
                                    </option>
                                    <option value="#CDFFBE">
                                        보통<img name="#CDFFBE" alt="green" src="./images/green_CDFFBE.png" width="15px">
                                    </option>
                                    <option value="#FAFFCD">
                                        높음<img name="#FAFFCD" alt="yellow" src="./images/yellow_FAFFCD.png"
                                               width="15px">
                                    </option>
                                    <option value="#FFCDCD">
                                        긴급<img name="#FFCDCD" alt="red" src="./images/red_FFCDCD.png" width="15px">
                                    </option>
                                </select>
	                            &nbsp;&nbsp;&nbsp;&nbsp;
                                <img alt="gray" src="./images/gray_E1E1E0.png" width="15px">
                                <img alt="green" src="./images/green_CDFFBE.png" width="15px">
                                <img alt="yellow" src="./images/yellow_FAFFCD.png" width="15px">
                                <img alt="red" src="./images/red_FFCDCD.png" width="15px">
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="1" width="70px">
                                <label for="allDay">종일</label> 
                                <input class="form-check-input"
                                          type="checkbox"
                                          name="allDay"
                                          value="false"
                                          id="allDay"
                            	/>
                           	</td>
	                        <td class="align-middle" colspan="3">
                                <input class="form-check-input form-control"
                                       type="date"
                                       name="startDate"
                                       min="2000-01-01"
                                       max="2050-12-31"
                                       id="startDate"
                                />
                                <input class="form-check-input form-control" 
                                		id="startTime" 
                                		name="startTime"
                                		type="time" 
                                		required="required">
                                &nbsp;&nbsp;&nbsp;
                                <span style="font-size: 15px">~</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="endDate" 
                                       type="date" 
                                       name="endDate" 
                                       id="endDate" 
                                       min="2000-01-01" 
                                       max="2050-12-31" 
                                       class="form-control"
                                />
                                <input class="form-check-input form-control" 
                                		id="endTime" 
                                		name="endTime"
                                		type="time"
                                		required="required">
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="1" width="70px">
	                            <label for="content">내용</label>
	                        </td>
	                        <td class="align-middle" colspan="3">
		                     <textarea
		                             id="content"
		                             class="form-control form-control-sm"
		                             rows="10"
		                             name="content"
		                             style="resize: none;"
		                             placeholder="내용을 입력하세요."
		                     ></textarea>
                        </tr>
                    </table>
                    <input type="hidden" id="ip" name="ip" value="${pageContext.request.remoteAddr}"/>
                    <input type="hidden" id="userID" name="userID" value="${userInfo.get(0).getUserID()}"/>
                    <input type="hidden" id="view" name="view" value="dayGridMonth"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-primary btn-sm" onclick="insertWithModalEvent()" style="font-size: 13px;">등록하기</button>
            </div>
        </div>
    </div>
</div>


    <!-- main theme -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/coWorkers.css">
	
	<!-- event -->
    <script type="text/javascript" src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.1/index.global.min.js'></script>
    <script type="text/javascript" src='./js/event/index.global.js'></script>
    <script type="text/javascript" src='./js/event/event.js'></script>
	
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
<%@include file="/WEB-INF/views/scripts.jsp"%>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>

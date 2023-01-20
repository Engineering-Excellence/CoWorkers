<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.crunch.domain.UserInfoDTO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/alarm.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Employee List</h1>
				<!-- 
				<div class="container" style="margin-top: 20px;">
					<div class="form-group row pull-right">
						<div class="col-xs-8">
							<input id="userName" class="form-control" type="text" size="20" autocomplete="off"
								onkeyup="searchFunction()">
						</div>
					</div>
				</div>
				 -->
				<div class="container">
					<table class="table table-hover">
						<thead>
							<!--  
							<tr>
								<td colspan="6" align="right">${userInfoList.totalCount}명
									(${userInfoList.currentPage} / ${userInfoList.totalPage} 페이지)</td>
							</tr>
							-->
							<tr style="background-color: lavender;">
								<th style="text-align: center;">아이디</th>
								<th style="text-align: center;">직급코드</th>
								<th style="text-align: center;">사원명</th>
								<th style="text-align: center;">주민등록번호</th>
								<th style="text-align: center;">이메일</th>
								<th style="text-align: center;">입사일자</th>
							</tr>
						</thead>

						<tbody id='ajaxTable'>
							<c:forEach var="userInfoDTO" items="${list}">
								<tr class="table-warning">
									<td style="text-align: center;">
										<c:if test="${userInfoDTO.retireDate == null}">
											<c:set var="accountID" value="${fn:replace(userInfoDTO.accountID, '<', '&lt;')}" />
											<c:set var="accountID" value="${fn:replace(userInfoDTO.accountID, '>', '&gt;')}" />
											<%-- <a href="userAllMember?accountID=${userInfoDTO.accountID}&currentPage=${userInfoList.currentPage}"> --%>
											${accountID}
											<!-- </a> -->
										</c:if> 
										<c:if test="${userInfoDTO.retireDate != null}">
                                   			존재하지 않는 사원입니다.
                               			</c:if>
                               		</td>
                               		<td align="center">
                               			<c:set var="positionName" value="${fn:replace(userInfoDTO.positionName, '<', '&lt;')}" /> 
                               			<c:set var="positionName" value="${fn:replace(userInfoDTO.positionName, '>', '&gt;')}" />
										${userInfoDTO.positionName}
									</td>
									<td align="center">
										<c:set var="name" value="${fn:replace(userInfoDTO.userName, '<', '&lt;')}" /> 
										<c:set var="name" value="${fn:replace(userInfoDTO.userName, '>', '&gt;')}" />
										${name}
									</td>
									<td align="center">
										<c:set var="regNumber" value="${fn:replace(userInfoDTO.registerNumber, '<', '&lt;')}" /> 
										<c:set var="regNumber" value="${fn:replace(userInfoDTO.registerNumber, '>', '&gt;')}" />
										${regNumber}
									</td>
									<td align="center">
										<c:set var="mail" value="${fn:replace(userInfoDTO.email, '<', '&lt;')}" /> 
										<c:set var="mail" value="${fn:replace(userInfoDTO.email, '>', '&gt;')}" />
										${mail}
									</td>
									<td align="center">
										<c:if test="${date.year == userInfoDTO.joinDate.year && date.month == userInfoDTO.joinDate.month &&
													date.date == userInfoDTO.joinDate.date}">
											<fmt:formatDate value="${userInfoDTO.joinDate}" pattern="a h:mm" />
										</c:if> 
										<c:if test="${date.year != userInfoDTO.joinDate.year || date.month != userInfoDTO.joinDate.month ||
													date.date != userInfoDTO.joinDate.date}">
											<fmt:formatDate value="${userInfoDTO.joinDate}" pattern="yyyy.MM.dd.(E)" />
										</c:if>
									</td>
								</tr>
							</c:forEach>

							<!-- 회원목록 출력 -->
							<c:set var="list" value="${userInfoList.list}" />
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="6">
										<p>저장된 글이 없습니다.</p>
									</td>
								</tr>
							</c:if>
							<c:if test="${list.size() != 0}">
								<c:forEach var="userInfoDTO" items="${list}">
									<tr>
										<td align="center">${userInfoDTO.accountID}</td>
										<td>
											<c:if test="${userInfoDTO.retireDate == null}">
												<c:set var="accountID" value="${fn:replace(userInfoDTO.accountID, '<', '&lt;')}" />
												<c:set var="accountID" value="${fn:replace(userInfoDTO.accountID, '>', '&gt;')}" />
												<%-- <a href="userAllMember?accountID=${userInfoDTO.accountID}&currentPage=${userInfoList.currentPage}"> --%>
												{accountID} 
												<!-- </a> -->
											</c:if> 
											<c:if test="${userInfoDTO.retireDate != null}">
                                       			존재하지 않는 사원입니다.
                                   			</c:if>
                                   		</td>
										<td align="center">
											<c:set var="name" value="${fn:replace(userInfoDTO.userName, '<', '&lt;')}" /> 
											<c:set var="name" value="${fn:replace(userInfoDTO.userName, '>', '&gt;')}" />
											${name}
										</td>
										<td align="center">
											<c:if test="${date.year == userInfoDTO.joinDate.year && date.month == userInfoDTO.joinDate.month &&
														date.date == userInfoDTO.joinDate.date}">
												<fmt:formatDate value="${userInfoDTO.joinDate}"	pattern="a h:mm" />
											</c:if> 
											<c:if test="${date.year != userInfoDTO.joinDate.year || date.month != userInfoDTO.joinDate.month ||
														date.date != userInfoDTO.joinDate.date}">
												<fmt:formatDate value="${userInfoDTO.joinDate}" pattern="yyyy.MM.dd.(E)" />
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/scripts.jsp"%>
	<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/userAllMember.js"></script>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
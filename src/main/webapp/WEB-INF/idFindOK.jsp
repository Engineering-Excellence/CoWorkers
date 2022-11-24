<%@page import="java.util.List" %>
<%@page import="com.silvertier.dto.UserInfoDTO" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="com.silvertier.dao.UserInfoDAO" %>
<%@page import="com.silvertier.service.UserInfoService" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <link rel="icon" href="./images/doker.ico">
    <title>idFindOK.jsp</title>
</head>
<body>
<%-- 
<%
	request.setCharacterEncoding("UTF-8");

	/* idPwFind.jsp에서 입력하는 값 */
	String userName = request.getParameter("userName");
	String accountID = request.getParameter("accountID");
	String email = request.getParameter("email");
%>

	<jsp:useBean id="userInfoDTO" class="com.silvertier.dto.UserInfoDTO">
		<jsp:setProperty property="*" name="userInfoDTO"/>
	</jsp:useBean>
	
<%
	UserInfoService userInfoService = UserInfoService.getInstance();
	UserInfoList userInfoList = userInfoService.userInfoSelectList(request, response);
%>
	
 --%>


</body>
</html>
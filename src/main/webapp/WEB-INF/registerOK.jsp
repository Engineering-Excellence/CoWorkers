<%@page import="com.silvertier.service.UserInfoService"%>
<%@page import="com.silvertier.dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="userInfoDTO" class="com.silvertier.dto.UserInfoDTO">
		<jsp:setProperty property="*" name="userInfoDTO"/>
	</jsp:useBean>
<%
	System.out.println(userInfoDTO);
	
	UserInfoService.getInstance().userInfoInsert(request, response);
	response.sendRedirect("login.sil");
%>

</body>
</html>
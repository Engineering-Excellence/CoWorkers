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

	<jsp:useBean id="userDTO" class="com.silvertier.dto.UserInfoDTO">
		<jsp:setProperty property="*" name="userDTO"/>
	</jsp:useBean>
	
<%
	System.out.println(userDTO);
	
	
	UserInfoService.getInstance().insert(userDTO);
	response.sendRedirect("login.sil");
%>

</body>
</html>
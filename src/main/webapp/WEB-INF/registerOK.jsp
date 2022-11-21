<<<<<<< HEAD
<%@page import="java.util.ArrayList"%>
<%@page import="com.silvertier.service.UserInfoService"%>
<%@page import="com.silvertier.dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery-3.6.1.js"></script>
=======
<%@page import="com.silvertier.service.UserInfoService"%>
<%@page import="com.silvertier.dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
>>>>>>> d0a1c53537b352fca75fd31a8c46d2f095984928
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
<<<<<<< HEAD
	System.out.println("registerOK: " + userInfoDTO);

=======
	System.out.println(userInfoDTO);
	
>>>>>>> d0a1c53537b352fca75fd31a8c46d2f095984928
	UserInfoService.getInstance().userInfoInsert(request, response);
	response.sendRedirect("login.sil");
%>

</body>
</html>
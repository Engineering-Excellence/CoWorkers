<%@page import="com.silvertier.dao.UserInfoDAO"%>
<%@page import="java.awt.Window"%>
<%@page import="com.silvertier.dto.UserInfoDTO"%>
<%@page import="com.silvertier.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String ID = request.getParameter("ID");
	String Password = request.getParameter("Password");
%>
	
	<jsp:useBean id="userInfoDTO" class="com.silvertier.dto.UserInfoDTO">
		<jsp:setProperty property="*" name="userInfoDTO"/>
	</jsp:useBean>

<%
	if (ID != null && ID.equals(userInfoDTO.getAccountID())) {
		if (Password != null && Password.equals(userInfoDTO.getAccountPassword())) {
			out.println("<script>");
			out.println("alert('로그인 성공!')");
			out.println("location.href='mainView.sil'");
			out.println("</script>");
		}
	} else {
		out.println("<script>");
		out.println("alert('올바르지 않은 로그인 정보입니다.')");
		out.println("location.href='login.sil'");
		out.println("</script>");
	}
%>

</body>
</html>
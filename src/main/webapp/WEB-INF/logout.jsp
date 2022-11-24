<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="icon" href="./images/doker.ico">
	<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	HttpSession userInfoSession = request.getSession();
	userInfoSession.invalidate();
	out.println("<script>");
	out.println("alert('로그아웃 되었습니다.')");
	out.println("location.href='index.sil'");
	out.println("</script>");
%>


</body>
</html>
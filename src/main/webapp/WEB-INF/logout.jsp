<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	HttpSession userInfoSession = request.getSession();
	userInfoSession.invalidate();
	out.println("<script>");
	out.println("alert('�α׾ƿ� �Ǿ����ϴ�.')");
	out.println("location.href='index.sil'");
	out.println("</script>");
%>


</body>
</html>
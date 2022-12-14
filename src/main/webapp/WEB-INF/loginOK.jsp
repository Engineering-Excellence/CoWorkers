<%@page import="com.silvertier.dao.UserInfoDAO" %>
<%@page import="java.awt.Window" %>
<%@page import="com.silvertier.dto.UserInfoDTO" %>
<%@page import="com.silvertier.service.UserInfoService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="./images/doker.ico">
    <title>loginOK.jsp</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("accountID");
    String pw = request.getParameter("accountPassword");

%>

<jsp:useBean id="userInfoDTO" class="com.silvertier.dto.UserInfoDTO">
    <jsp:setProperty property="*" name="userInfoDTO"/>
</jsp:useBean>

<%
    //	System.out.println("login: " + userInfoDTO);

    UserInfoService service = UserInfoService.getInstance();
    String originID = service.userInfoCompareID(request, response);
    String originPW = service.userInfoComparePW(request, response);

    if (id != null && id.equals(originID)) {
        if (pw != null && pw.equals(originPW)) {
            out.println("<script>");
            out.println("alert('로그인 성공')");
            out.println("location.href='mainView.sil'");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('비밀번호 불일치')");
            out.println("location.href='login.sil'");
            out.println("</script>");
        }
    } else {
        out.println("<script>");
        out.println("alert('로그인 정보 불일치')");
        out.println("location.href='login.sil'");
        out.println("</script>");
    }

%>

</body>
</html>
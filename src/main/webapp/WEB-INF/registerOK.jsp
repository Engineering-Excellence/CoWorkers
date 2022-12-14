<%@page import="java.util.ArrayList" %>
<%@page import="com.silvertier.service.UserInfoService" %>
<%@page import="com.silvertier.dto.UserInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="./images/doker.ico">
    <title>registerOK.jsp</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="userInfoDTO" class="com.silvertier.dto.UserInfoDTO">
    <jsp:setProperty property="*" name="userInfoDTO"/>
</jsp:useBean>
<%
    System.out.println("registerOK: " + userInfoDTO);

    System.out.println(userInfoDTO);

    UserInfoService.getInstance().userInfoInsert(request, response);
    response.sendRedirect("login.sil");
%>

</body>
</html>
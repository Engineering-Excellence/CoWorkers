<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 곽규창(Kyle) --%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>CoWorkers</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/coWorkers.css" rel="stylesheet">

</head>

<body>

<fmt:requestEncoding value="UTF-8"/>
<%
    System.out.println("coWorkers.jsp");
    //  조회수를 증가시킨 글이 위치하던 페이지 번호를 받는다.
    int workID = Integer.parseInt(request.getParameter("workID"));
    System.out.println("workID : " + workID);
    int currentPage = Integer.parseInt(request.getParameter("currentPage"));
    System.out.println("currentPage : " + currentPage);
    response.sendRedirect("workView.wtf?workID=" + workID + "&currentPage=" + currentPage);
    System.out.println("workView.wtf?workID=" + workID + "&currentPage=" + currentPage);
%>
</body>

</html>
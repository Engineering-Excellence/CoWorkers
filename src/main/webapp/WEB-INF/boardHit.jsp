<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 곽규창(Kyle) 조회 수 증가 --%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>boardHit.jsp</title>

</head>

<body>

<%
    int postID = Integer.parseInt(request.getParameter("postID"));
    int currentPage = Integer.parseInt(request.getParameter("currentPage"));

    response.sendRedirect("boardList.sil?currentPage=" + currentPage);  // 조회 수 확인용
%>

</body>

</html>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
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
    <link rel="icon" href="./images/doker.ico">

    <title>CoWorkers</title>

</head>

<body>

<%
    System.out.println(pageContext.findAttribute("boardDTO"));

    Map<String, String[]> map = request.getParameterMap();
    Iterator<Map.Entry<String, String[]>> itr = map.entrySet().iterator();
    while (itr.hasNext()) {
        Map.Entry<String, String[]> entry = itr.next();
        System.out.println(String.format("%s : %s", entry.getKey(), String.join(", ", entry.getValue())));
    }

    int postID = Integer.parseInt(request.getParameter("postID"));
    int currentPage = Integer.parseInt(request.getParameter("currentPage"));

    response.sendRedirect("boardView.sil?postID=" + postID + "&currentPage=" + currentPage);  // 실제 이동
%>

</body>

</html>
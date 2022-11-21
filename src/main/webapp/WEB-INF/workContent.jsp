<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 조우철 --%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="./images/favicon_16.png">

    <title>CoWorkers</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/coWorkers.css" rel="stylesheet">

</head>

<body>
<fmt:requestEncoding value="UTF-8"/>
<%
    System.out.println(pageContext.findAttribute("dto"));

    Map<String, String[]> map = request.getParameterMap();
    Iterator<Map.Entry<String, String[]>> itr = map.entrySet().iterator();
    while (itr.hasNext()) {
        Map.Entry<String, String[]> entry = itr.next();
        System.out.println(String.format("%s : %s", entry.getKey(), String.join(", ", entry.getValue())));
    }

    int workID = Integer.parseInt(request.getParameter("workID"));
    System.out.println("workID : " + workID);
    int currentPage = Integer.parseInt(request.getParameter("currentPage"));
    System.out.println("currentPage : " + currentPage);
    response.sendRedirect("workView.wtf?workID=" + workID + "&currentPage=" + currentPage);
    System.out.println("workView.wtf?workID=" + workID + "&currentPage=" + currentPage);
%>
</body>

</html>
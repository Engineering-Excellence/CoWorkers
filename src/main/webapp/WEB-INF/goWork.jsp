<%@ page import="com.silvertier.dto.WorkList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--조우철--%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="./images/doker.ico">
    <title>goWork.jsp</title>

</head>

<body>

<fmt:requestEncoding value="UTF-8"/>
<%
    //    System.out.println(pageContext.findAttribute("dto"));
//
//    Map<String, String[]> map = request.getParameterMap();
//    Iterator<Map.Entry<String, String[]>> itr = map.entrySet().iterator();
//    while (itr.hasNext()) {
//        Map.Entry<String, String[]> entry = itr.next();
//        System.out.println(String.format("%s : %s", entry.getKey(), String.join(", ", entry.getValue())));
//    }

    int currentPage = 1;
    try {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    } catch (Exception e) {
    }

    response.sendRedirect("work.sil?currentPage=" + currentPage);
%>
</body>

</html>
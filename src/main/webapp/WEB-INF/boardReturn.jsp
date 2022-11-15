<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%-- Kyle --%>
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
</head>

<body>

<%
    int currentPage = 1;
    try {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    } catch (NumberFormatException e) {
//            throw new RuntimeException(e);
    }
    response.sendRedirect("boardList.sil?currentPage=" + currentPage);
%>

</body>

</html>
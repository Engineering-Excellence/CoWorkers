<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>index.jsp</title>

    <script src="js/jquery-3.6.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>

<body>

<fmt:requestEncoding value="UTF-8"/>

<h1>silverTier's 1st team project: coWorkers</h1>
<br/>

<h2>commit -m ‘FIRST COMMIT’</h2>

<%
    out.println("Hello, silverTier!");
%>
<br/>
Eclipse와 IntelliJ IDE 공동으로 이용가능한 프로젝트 구성 테스트 중입니다.    - by Kyle
<br/><br/>
jQuery v3.6.1
<br/>
Bootstrap v3.4.1
<br/>

</body>

</html>
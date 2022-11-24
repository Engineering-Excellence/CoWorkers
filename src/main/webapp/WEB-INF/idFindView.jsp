<%@page import="com.silvertier.service.UserInfoService"%>
<%@page import="com.silvertier.dao.UserInfoDAO"%>
<%@page import="com.silvertier.dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, height=device-height initial-scale=1">
	<link rel="icon" href="./images/doker.ico">
	<title>아이디 찾기 결과</title>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="./css/login.css">
	<script src="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
</head>
<body>

	<div>
		<table>
			<thead>
				<tr>
					<th colspan="2">
						아이디 찾기 결과
					</th>
				</tr>
				<tr>
					<td>ID</td>
					<td>
						<c:out value="${originID}">귀하께서 찾으신 아이디는 <% request.getParameter("accountID"); %> 입니다.</c:out>
					</td>
				</tr>
			</thead>
		</table>
	</div>

</body>
</html>
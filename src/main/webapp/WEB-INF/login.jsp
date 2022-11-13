<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, height=device-height initial-scale=1">
	<title>로그인 화면</title>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="./css/login.css">
	<script src="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>
	<!-- 김태형 (Terry) - login(로그인) jsp 파일 -->
	
		<div id="wrap" class="wrap">
			<div class="main-top">
				<header id="header" class="header">Silver Tier</header>
			</div>
			<div id="container" class="container"> 
				<form action="mainView.sil" method="post">
					<p>CO-WORKERS</p>
					<hr width="650">
					<table width="650" border="2" cellpadding="5" cellspacing="0"> 
						<tr>
							<th id="thTag">아이디</th>
							<td id="tdTag">
								<input id="accountID" class="form-control" type="text" name="id"></input>
								<input id="submit" class="btn btn-primary" type="submit" value="로그인"></input>
							</td>
						</tr>
						<tr>
							<th id="thTag">비밀번호</th>
							<td id="tdTag">
								<input id="accountPassword" class="form-control" type="text" name="paswword">
							</td>
						</tr>
						<tr>
							<td id="tdTag2" colspan="2" width="500" align="center">
								<input id="tdIn" class="btn btn-success" type="button" value="회원가입" onclick="location.href='registerForm.sil'"></input>
								<input id="tdIn" class="btn btn-warning" type="button" value="ID/PW 찾기" onclick="location.href='idPwFind.sil'"></input>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	
	
	

</body>
</html>
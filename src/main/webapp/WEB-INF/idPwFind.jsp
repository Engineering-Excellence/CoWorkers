<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, height=device-height initial-scale=1">
	<title>아이디 찾기</title>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="./css/idPwFind.css">
	<script src="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/idPwFind.js"></script>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>

	<!-- 김태형 (Terry) - idPwFind(ID/PW 찾기) jsp 파일 -->
	<div class="container" style="margin-top: 20px;">
		<table class="table table-hover table-bordered" style="border: 1px solid gray">
			<thead>
				<tr>
					<th colspan="2">
						<h2 id="h2">아이디 찾기</h2>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th id="th">등록한 이메일 주소</th>
					<td>
						<input id="email" class="form-control" type="text" name="email" placeholder="등록한 이메일 주소를 입력해주세요." autocomplete="off">
					</td>
				</tr>
				<tr>
					<th id="th">휴대폰 번호</th>
					<td>
						<input id="mobileNumber" class="form-control" type="text" name="mobileNumber" placeholder="인증번호를 받을 휴대전화 번호를 입력해주세요.">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-success" onclick="idView.jsp">확인하기</button>
						<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
						<c:if test="">
						
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container" style="margin-top: 20px;">
		<table class="table table-hover table-bordered" style="border: 1px solid gray">
			<thead>
				<tr>
					<th colspan="2">
						<h2 id="h2">패스워드 찾기</h2>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th id="th">등록한 아이디</th>
					<td>
						<input id="accountID" class="form-control" type="text" name="accountID" placeholder="등록한 아이디를 입력해주세요." autocomplete="off">
					</td>
				</tr>
				<tr>
					<th id="th">휴대폰 번호</th>
					<td>
						<input id="mobileNumber" class="form-control" type="text" name="mobileNumber" placeholder="인증번호를 받을 휴대전화 번호를 입력해주세요.">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-success" onclick="idView.jsp">확인하기</button>
						<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
						<c:if test="">
						
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>
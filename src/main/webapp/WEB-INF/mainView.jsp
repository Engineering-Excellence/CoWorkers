<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>메인화면</title>
	<script src="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="./css/mainView.css">
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>
	
	<div id="wrap" class="wrap">
		<header id="header" class="header">Silver Tier</header>
		<div style="width: 200px; height: auto; background-color: #110235">
			<table width="200" border="1" cellpadding="5" cellspacing="0">
				<tr>
					<ul>
					  	<li>
					  		<a href="board.sil">글</a>
					  	</li>
						<li>
							<a href="file.sil">업무</a>	
						</li>
						<li>
							<a href="event.sil">일정</a>
						</li>
					</ul>
				</tr>
			</table>	
		</div>
	</div>
	
	
	
	

</body>
</html>
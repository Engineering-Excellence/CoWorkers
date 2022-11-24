<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, height=device-height initial-scale=1">
	<link rel="icon" href="./images/doker.ico">
	<title>에러 페이지</title>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="./css/error.css">
	<script src="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
	
	<div id="wrap" class="wrap">
			<div class="main-top">
				<header id="header" class="header">Crunch Mode</header>
			</div>
			<div id="container" class="container"> 
				<form action="index.sil" method="post">
					<h1><p>!! 에러 페이지 !!</p></h1>
					<table> 
						<tbody>
							<tr>
								<td>
									<h3 style="text-align: center;">
										올바르지 않은 경로로 진입하였습니다.<br><br>
										상단의 URL을 다시 확인하시거나 아래 버튼을 통해 돌아가세요
									</h3><br>
									<button id="loginPage" class="btn btn-info" type="submit">coWorkers로 가기</button>
									<button id="back" class="btn btn-warning" type="button" onclick="history.back()">이전 페이지로 돌아가기</button>
								</td>							
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

</body>
</html>
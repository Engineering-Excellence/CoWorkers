<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, height=device-height initial-scale=1">
	<link rel="icon" href="./images/doker.ico">
	<title>���� ������</title>
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
					<h1><p>!! ���� ������ !!</p></h1>
					<table> 
						<tbody>
							<tr>
								<td>
									<h3 style="text-align: center;">
										�ùٸ��� ���� ��η� �����Ͽ����ϴ�.<br><br>
										����� URL�� �ٽ� Ȯ���Ͻðų� �Ʒ� ��ư�� ���� ���ư�����
									</h3><br>
									<button id="loginPage" class="btn btn-info" type="submit">coWorkers�� ����</button>
									<button id="back" class="btn btn-warning" type="button" onclick="history.back()">���� �������� ���ư���</button>
								</td>							
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, height=device-height initial-scale=1">
    <title>아이디 찾기</title>
    <link rel="icon" href="/images/favicon_16.png">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/idPwFind.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>

<div id="wrap" class="wrap">
    <div class="main-top">
        <header id="header" class="header">Crunch Mode</header>
    </div>
    <div id="container" class="container" style="margin-top: 30px;">
    	<div>
	        <form action="idFindOK" method="post">
	            <p>아이디 찾기</p>
	            <hr width="650">
	            <table width="650" border="2" cellpadding="5" cellspacing="0">
	                <tr>
	                    <th class="thTag">등록된 이름</th>
	                    <td class="tdTag">
	                        <input id="userName" class="form-control" type="text" name="userName" autocomplete="off">
	                    </td>
	                </tr>	
	                
	                <tr>
	                    <th class="thTag">등록된 이메일 주소</th>
	                    <td class="tdTag">
	                        <input id="email" class="form-control" type="text" name="email" autocomplete="off">
	                    </td>
	                </tr>
	                 <tr>
                    <td id="tdTag2" colspan="2" width="500" align="center">
                        <input id="submit" class="btn btn-primary" type="submit" value="아이디 찾기" onclick="findID()"></input>
                        <input class="btn btn-secondary" type="button" value="돌아가기" width="82" onclick="history.back()"></input>
                    </td>
                </tr>
	            </table>
	        </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>	
<script type="text/javascript" src="js/idFind.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, height=device-height initial-scale=1">
    <title>아이디 찾기 결과</title>
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
            <p>아이디 찾기 결과</p>
            <hr width="650">
            <table width="650" border="2" cellpadding="5" cellspacing="0">
                <tr>
                    <th class="thTag">
                    	귀하의 아이디는 <span>${accountID}</span> 입니다.
                    </th>
                </tr>	
                 <tr>
                   <td id="tdTag2" colspan="2" width="500" align="center">
                       <input class="btn btn-primary" type="button" value="로그인 창으로 돌아가기"
                       		onclick="location.href='moveLogin'"></input>
                   </td>
               </tr>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>	

</body>
</html>
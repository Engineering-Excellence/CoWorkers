<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="./images/favicon_16.png">

    <title>메인화면</title>
    
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/dashboard.css" rel="stylesheet">

  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="mainView.sil">coWorkers</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">프로필</a></li>
            <li><a href="#">환경설정</a></li>
            <li><a href="logout.sil">로그아웃</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="board.sil">게시글</a></li>
            <li><a href="work.sil">업무관리</a></li>
            <li><a href="event.sil">일정관리</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Silver Tier Members</h1>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="./images/SilverTier_Logo.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Emma Heo (허은성)</h4>
              <span class="text-muted">Team Leader</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="./images/SilverTier_Logo.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Kyle Kwak (곽규창)</h4>
              <span class="text-muted">Team Member</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="./images/SilverTier_Logo.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Anbin Cho (조우철)</h4>
              <span class="text-muted">Team Member</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="./images/SilverTier_Logo.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Terry Kim (김태형)</h4>
              <span class="text-muted">Team Member</span>
            </div>
          </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        	<h1 class="page-header">Silver Tier 업무 분장표</h1>
        	<div>
        		<table class="table table-hover table-bordered" style="border: 1px solid black;">
        			<tbody align="center">
        				<tr style="background-color: lavender;">
        					<th width="140" style="text-align: center; vertical-align: middle;">coWorkers Name</th>
        					<th width="140" style="text-align: center; vertical-align: middle;">Emma Heo (허은성)</th>
        					<th width="140" style="text-align: center; vertical-align: middle;">Kyle Kwak (곽규창)</th>
        					<th width="140" style="text-align: center; vertical-align: middle;">Anbin Cho (조우철)</th>
        					<th width="140" style="text-align: center; vertical-align: middle;">Terry Kim (김태형)</th>
        				</tr>
        				<tr>
        					<td>주요 업무</td>
        					<td>일정(Calendar)</td>
        					<td>프로젝트 설계, <br/>게시글(Board)</td>
        					<td>업무(Work)</td>
        					<td>로그인(Login), <br/>회원가입(Register)</td>
        				</tr>
        				<tr>
        					<td rowspan="4" style="vertical-align: middle;">1차 프로젝트 주요 구현사항</td>
        					<td>일정확인용 달력 구현</td>	
        					<td>DB 모델링, MVC 패턴</td>
        					<td>업무 리스트 호출 구현</td>	
        					<td>로그인/로그아웃 구현</td>	
        				</tr>	
        				<tr>
        					<td>일정 입력/수정/삭제</td>	
        					<td>게시판 기능 구현</td>
        					<td>업무 작성/수정/삭제</td>	
        					<td>회원가입 기능 구현</td>	
        				</tr>	
        				<tr>
        					<td>일정/긴급업무별 리스트 호출</td>	
        					<td>팀 업무 및 GitHub 관리</td>
        					<td>삭제된 업무 블라인드 처리</td>	
        					<td>메인 페이지 구성</td>	
        				</tr>	
        			</tbody>
        		</table>
        	</div>
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
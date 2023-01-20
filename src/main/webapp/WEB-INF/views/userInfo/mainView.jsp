<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.crunch.domain.UserInfoDTO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/alarm.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">CRUNCH Members</h1>
            <div class="row placeholders">
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="./images/crunchMode.png" width="200" height="200" class="img-responsive"
                         alt="Generic placeholder thumbnail">
                    <h4>Kyle Kwak (곽규창)</h4>
                    <span class="text-muted">Team Leader</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="./images/crunchMode.png" width="200" height="200" class="img-responsive"
                         alt="Generic placeholder thumbnail">
                    <h4>Anbin Cho (조우철)</h4>
                    <span class="text-muted">Team Member</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="./images/crunchMode.png" width="200" height="200" class="img-responsive"
                         alt="Generic placeholder thumbnail">
                    <h4>Terry Kim (김태형)</h4>
                    <span class="text-muted">Team Member</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="./images/crunchMode.png" width="200" height="200" class="img-responsive"
                         alt="Generic placeholder thumbnail">
                    <h4>Emma Heo (허은성)</h4>
                    <span class="text-muted">Team Member</span>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">CRUNCH 업무 분장표</h1>
            <div>
                <table class="table table-hover table-bordered" style="border: 1px solid black;">
                    <tbody align="center">
                    <tr style="background-color: lavender;">
                        <th width="140" style="text-align: center; vertical-align: middle;">coWorkers Name</th>
                        <th width="140" style="text-align: center; vertical-align: middle;">Kyle Kwak (곽규창)</th>
                        <th width="140" style="text-align: center; vertical-align: middle;">Anbin Cho (조우철)</th>
                        <th width="140" style="text-align: center; vertical-align: middle;">Terry Kim (김태형)</th>
                        <th width="140" style="text-align: center; vertical-align: middle;">Emma Heo (허은성)</th>
                    </tr>
                    <tr>
                        <td>담당</td>
                        <td>게시판(Board)</td>
                        <td>업무(Work)</td>
                        <td>회원정보(UserInfo)</td>
                        <td>일정(Event)</td>
                    </tr>
                    <tr>
                        <td rowspan="4" style="vertical-align: middle;">1차 프로젝트 주요 업무</td>
                        <td>MVC 패턴, DB 모델링</td>
                        <td>업무 페이지 구현</td>
                        <td>로그인/로그아웃 구현</td>
                        <td>일정확인용 달력 구현</td>
                    </tr>
                    <tr>
                        <td>게시판 기능 구현</td>
                        <td>Quality Control</td>
                        <td>회원가입 기능 구현</td>
                        <td>일정 입력/수정/삭제</td>
                    </tr>
                    <tr>
                        <td>GitHub 관리, 배포</td>
                        <td>로그인 세션 정보</td>
                        <td>사원목록 및 프로필 구현</td>
                        <td>일정/긴급업무별 리스트 호출</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/scripts.jsp"%>

</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
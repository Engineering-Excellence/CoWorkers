<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.crunch.domain.UserInfoDTO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="/WEB-INF/views/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">My Profile</h1>
            <div style="margin-left: auto; margin-right: auto; width: 80%; text-align: center; vertical-align: middle;">
                <table id="userTable" class="table table-hover table-bordered" style="border: 1px solid black;">
                    <tbody align="center">
                    	<tr>
                    		<th colspan="4" style="text-align: center; background-color: lavender;">내 프로필 정보</th>
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">아이디</th>
							<td class="tdTag1"><span>${userInfo.get(0).getAccountID()}</span></td>
							<!-- <td><input type="text" class="form-control" placeholder="변경할 아이디를 입력해주세요."></td> -->
							<!-- <td><img class="tdTag1" alt="정보 변경" src="./images/pencil.png" style="width: 20px; margin-top: 5px; cursor: pointer;" onclick="fixAccountID()"></td> -->
                    	</tr>
                     	<tr>
							<th class="thTag" style="text-align: center;">부서명</th>
							<td class="tdTag1" colspan="3"><span>IT 기획팀</span></td>
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">직급명</th>
							<td class="tdTag1" colspan="3"><span>사원</span></td>
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">입사일자</th>
							<td class="tdTag1" colspan="3"><span>${userInfo.get(0).getJoinDate()}</span></td>
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">성함</th>
							<td class="tdTag1" colspan="3"><span>${userInfo.get(0).getUserName()}</span></td>
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">주민등록번호</th>
							<td class="tdTag1" colspan="3"><span>${userInfo.get(0).getRegisterNumber()}</span></td>
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">휴대전화 번호</th>
							<td class="tdTag1"><span>${userInfo.get(0).getMobileNumber()}</span></td>
							<!-- <td><input type="text" class="form-control" placeholder="변경할 전화번호를 입력해주세요."></td> -->
							<!-- <td><img class="tdTag1" alt="정보 변경" src="./images/pencil.png" style="width: 20px; margin-top: 5px; cursor: pointer;" onclick="fixMobileNumber()"></td> -->
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">성별</th>
							<td class="tdTag1" colspan="3"><span>${userInfo.get(0).getGender()}</span></td>
                    	</tr>
                    	<tr>
							<th class="thTag" style="text-align: center;">이메일</th>
							<td class="tdTag1" colspan="3"><span>${userInfo.get(0).getEmail()}</span></td>
                    	</tr>
                    </tbody>
                </table>
                <input type="hidden" name="userID" value="${userInfo.get(0).getUserID()}"/>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/scripts.jsp"%>	
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
<%@include file="/WEB-INF/views/footer.jsp"%>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>업무</title>

    <script src="../js/jquery-3.6.1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>

<body>
<fmt:requestEncoding value="UTF-8"/>
<jsp:useBean id="date" class="java.util.Date"/>
<form class="m-3" action="workInsertOK.sil" method="post">
    <table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
        <tr class="table-primary">
            <th colspan="15" style="font-size: 30px; text-align: center;">업무</th>
        </tr>
        <tr>
            <th class="align-middle table-dark">제목
            </th>
            <td colspan="2">
                <input id="subject" type="text" class="form-control form-control-sm" name="subject"/>
            </td>
        </tr>
        <tr>
            <th class="align-middle table-dark">내용
            </th>
            <td colspan="2">
                <textarea id="content" class="form-control form-control-sm" rows="10" name="content"
                          style="resize: none"></textarea>
            </td>
        </tr>
        <tr>
            <th class="align-middle table-dark">우선순위
            </th>
            <td colspan="2">
                    <input name="priority" type="radio" value="1"/>긴급
                    <input name="priority" type="radio" value="2"/>높음
                    <input name="priority" type="radio" value="3"/>보통
                    <input name="priority" type="radio" value="4"/>낮음
            </td>
        </tr>
        <tr>
            <th class="align-middle table-dark">업무상태
            </th>
            <td colspan="2">
                <input name="currentProgress" type="radio" value="1"/>요청
                <input name="currentProgress" type="radio" value="2"/>진행
                <input name="currentProgress" type="radio" value="3"/>완료
            </td>
        </tr>
        <tr>
            <th class="align-middle table-dark">업무진척도
            </th>
            <td colspan="2">
                <select id="workProgress" class="form-control form-control-sm" name="workProgress" size="1">
                    <option value="0">0</option>
                    <option value="0">1</option>
                    <option value="0">2</option>
                    <option value="0">3</option>
                    <option value="0">4</option>
                    <option value="0">5</option>
                    <option value="0">6</option>
                    <option value="0">7</option>
                    <option value="0">8</option>
                    <option value="0">9</option>
                    <option value="0">10</option>
                </select>
            </td>
        </tr>
        <tr>
            <th class="align-middle table-dark">시작일
            </th>
            <td colspan="2">
                <input id="startDate" type="date" class="form-control form-control-sm" name="startDate"/>
            </td>
        </tr>
        <tr>
            <th class="align-middle table-dark">마감일
            </th>
            <td colspan="2">
                <input id="deadline" type="date" class="form-control form-control-sm" name="deadline"/>
            </td>
        </tr>
        <tr class="table-secondary">
            <td colspan="3" align="center">
                <input class="btn btn-primary btn-sm" type="submit" value="저장하기" style="font-size: 13px"/>
                <input class="btn btn-danger btn-sm" type="reset" value="다시쓰기" style="font-size: 13px"/>
                <input class="btn btn-info btn-sm" type="button" value="돌아가기" style="font-size: 13px"
                       onclick="history.back()"/>
            </td>
        </tr>
    </table>

    <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
</form>

</body>
</html>

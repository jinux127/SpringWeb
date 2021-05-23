<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    table.resultTable {
        font-family: verdana,arial,sans-serif;
        font-size:11px;
        color:#333333;
        border-width: 1px;
        border-color: #3A3A3A;
        border-collapse: collapse;
    }
    table.resultTable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #3A3A3A;
        background-color: #B3B3B3;
    }
    table.resultTable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #3A3A3A;
        background-color: #ffffff;
    }
</style>
</head>
<body>
	<table class="resultTable">
		<thead>
			<tr>
				<th>사용자</th>
				<th>전화번호</th>
				<th>이탈정보</th>
				<th>방위치</th>
				<th>최근 조회시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td><c:out value="${result.target_name }"/></td>
					<td><c:out value="${result.target_tel }"/></td>
					<c:choose>
						<c:when test="${result.target_leave == 'I' }">
							<td>위치중</td>
						</c:when>
						<c:when test="${result.target_leave == 'O' }">
							<td>이탈</td>
						</c:when>
						<c:otherwise>
							<td>상태없음</td>
						</c:otherwise>
					</c:choose>
					<td><c:out value="${result.target_location }"/></td>
					<td><c:out value="${result.rct_date }"/></td>
			    </tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
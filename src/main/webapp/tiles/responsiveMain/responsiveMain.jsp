<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>ResponsiveWeb</title>
</head>
<body>

	<form id="boardList">
		<table id="boardTable" class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th style="width: 200px; text-align: center;">번호</th>
					<th style="width: 200px; text-align: center;">제목</th>
				</tr>
			</thead>
			<tbody style="text-align: center;"></tbody>
		</table>
	</form>

</body>
</html>
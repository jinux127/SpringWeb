<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/static/css/workplacelist.css" >
<meta charset="UTF-8">
<title>사업장 목록</title>
</head>
<body>
    <!-- 로딩 창 -->
	<div class="overlay-wrapper"><div class="overlay"><i class="fas fa-3x fa-sync-alt fa-spin"></i></div></div>
	<div id="subjectDIV">
		<div><h5><label>사업장 목록</label></h5></div>
	</div>
	<div id="workplaceList"></div>
	<div id="worlplaceInsert">
		<form action="/workplace/insert" method="get">
 			<button type="submit" class="btn btn-primary To_Regist">사업장 신규 등록</button>
   		</form>
	</div>
</body>
<!-- <footer> -->
<!-- 	<nav class="bottomNav"> -->
<!-- 		<form action="/workplace/insert" method="post"> -->
<%-- 			<input type="hidden" name="hostSeq" value="${hostSeq}"> --%>
<%-- 			<input type='hidden' name='${_csrf.parameterName}'	value='${_csrf.token}' /> --%>
<!-- 			<input type='hidden' id='token' name = 'token' /> -->
<!--  			<button type="submit" class="btn btn-primary To_Regist">사업장 신규 등록</button> -->
<!--    		</form> -->
<!-- 	</nav> -->
<!-- </footer> -->
</html>
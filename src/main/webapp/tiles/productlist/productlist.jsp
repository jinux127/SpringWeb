<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/static/css/productlist.css" >
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
    <!-- 로딩 창 -->
	<div class="overlay-wrapper"><div class="overlay"><i class="fas fa-3x fa-sync-alt fa-spin"></i></div></div>
	<!-- 상품 목록 리스트 DIV -->
	<div id="productList">
		<h5><b>상품 목록</b></h5>
		<div>
			<form action="/product/insert" method="post" id="InsertPage">
				<input type="hidden" name="workplaceSeq" value="${workplaceSeq}">
				<input type='hidden' name='${_csrf.parameterName}'	value='${_csrf.token}'>
				<button type="submit" class="btn btn-primary" id="ToInsert">등록 페이지</button>
			</form>
		</div>
		<div class="card-body" id="productListBody">
		</div>
	</div>
</body>
</html>
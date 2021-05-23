<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/static/css/rsv.css" >

<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<form id="reservForm">
			<input type="hidden" id="productSeq" value="${productSeq}">
			<div class="card card-primary card-outline">
				<div class="card-body">
					<table id= "rsvTable">
				
						
						<tr>
							<th>상품 이름</th>
							<td><input class="form-control" type="text" id="productName" readonly="readonly" ></td>
						</tr>
						
						<tr>
							<th>가격</th>
							<td><input class="form-control" type="text" id="price" readonly="readonly" ></td>
						</tr>
						
						<tr>
							<th>계좌 정보</th>
							<td><input class="form-control" type="text" id="accountInfo" readonly="readonly" ></td>
						</tr>
						
					</table>
			</div>
		</div>
	
		
		
	</form>

</body>
</html>
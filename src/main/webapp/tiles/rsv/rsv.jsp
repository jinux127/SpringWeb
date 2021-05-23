<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="/static/css/rsv.css" >

	<title>예약하기</title>
</head>
<body oncontextmenu="return false">
	<div id="reservationDiv">
		<form id="reservForm">
			<!-- 상품 정보 -->
			<div class="card card-primary card-outline" id="productDiv">
				<div class="card-body">
					<h3>상품 정보</h3>
					<table>
						<tr>
							<th>상품 이름</th>
							<td><input class="form-control" type="text" id="productName" name="productName" autocomplete="off" disabled="disabled"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input class="form-control" type="text" id="price" name="price" autocomplete="off" disabled="disabled"></td>
						</tr>
						<tr>
							<th>최대 수용 인원</th>
							<td><input class="form-control" type="text" id="maxNumberPerson" name="maxNumberPerson" autocomplete="off" disabled="disabled"></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 날짜 정보 -->
			<div class="card card-primary card-outline" id="dateDiv">
				<div class="card-body">
					<h3>예약일 정보</h3>
					<table>
						<tr>
							<th>예약 시작일</th>
							<td><input class="form-control" type="text" id="startDate" name="startDate" readonly="readonly" value="${param.startDate}"></td>
						</tr>
						<tr>
							<th>예약 종료일</th>
							<td><input class="form-control" type="text" id="endDate" name="endDate" readonly="readonly" value="${param.endDate}"></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 예약자 정보 -->
			<div class="card card-primary card-outline" id="customerDiv">
				<div class="card-body">
					<h3>예약자 정보</h3>
					<table>
						<tr>
							<th>예약자 이름</th>
							<td><input class="form-control" type="text" name="rsvctmName" id="rsvctmName" autocomplete="off"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="form-control" type="text" name="rsvctmTel" id="rsvctmTel" autocomplete="off"></td>
						</tr>
						<tr>
							<th>인원</th>
							<td><input class="form-control" type="text" name="rsvctmNmpr" id="rsvctmNmpr" autocomplete="off"></td>
						</tr>
					</table>
				</div>
			</div>
			<div id="BTNDiv">
				<input class="form-control" type="hidden" name="productSeq" id="productSeq" value="${param.productSeq}">
				<button type="button" class="btn btn-primary" id="rsvctmBtn">예약하기</button>
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/static/css/productinsert.css" >
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
</head>
<body>
	<form id="ProductInfo">
	<!-- 기본 정보 입력 DIV -->
		<div class="card card-primary card-outline" id="Basic">
			<div class="card-body">
				<table>
					<tr>
						<th colspan="2"><label>기본 정보</label></th>
					</tr>
					<tr>
						<th>상품 이름</th>
						<td><input type="text" name="productName" class="form-control" autocomplete="off"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="number" name="price" class="form-control"></td>
					</tr>
					<tr>
						<th>최대 수용 인원</th>
						<td><input type="number" name="maxNumberPerson" class="form-control"></td>
					</tr>
				</table>
			</div>
		</div>
	<!-- 영업 시간 입력 DIV -->
		<div class="card card-primary card-outline" id="Time">
			<div class="card-body">
				<table>
					<tr>
						<th colspan="3"><label>영업 시간</label></th>
					</tr>
					<tr>
						<th>영업 시작 시간</th>
						<td colspan="2"><input type="time" name="businessStartTime" class="form-control"></td>
					</tr>
					<tr>
						<th>영업 종료 시간</th>
						<td colspan="2"><input type="time" name="businessEndTime" class="form-control"></td>
					</tr>
					<tr>
						<th>시간 단위</th>
						<td style="width: 35%;"><input type="number" id="unitTimeInput" class="form-control unitTime"></td>
						<td style="width: 35%;">
							<select class="form-control unitTime" id="unitTimeSel">
								<option value="">단위 선택</option>
								<option value="H">시간</option>
								<option value="D">일</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="unitTime">
			</div>
		</div>
	<!-- 상품 소개 입력 DIV -->
		<div class="card card-primary card-outline" id="Introduce">
			<div class="card-body">
				<table>
					<tr>
						<th colspan="2"><label>상품 소개</label></th>
					</tr>
					<tr>
						<td><textarea name="productInfo" class="form-control"></textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="workplaceSeq" value="${workplaceSeq}">
	</form>
	<!-- 등록 시 workplaceSeq를 가지고 사업장 상세 페이지 이동 -->
	<form id="GoBack" action="/product/list" method="post">
		<input type="hidden" name="workplaceSeq" value="${workplaceSeq}">
		<input type='hidden' name='productSeq' value='" + val.productSeq + "'>
		<input type='hidden' name='${_csrf.parameterName}'	value='${_csrf.token}' />
		<input type='hidden' name = 'token' />
		<button type="button" class="btn btn-primary" onclick="productRegist()" id="Regist">등록</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/static/css/productDetail.css" >
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
</head>
<body>
    <!-- 로딩 창 -->
	<div class="overlay-wrapper"><div class="overlay"><i class="fas fa-3x fa-sync-alt fa-spin"></i></div></div>
	<!-- 상품 정보 -->
	<div id="ProductInfoDiv">
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
							<td><input type="text" name="productName" class="form-control readonly"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="number" name="price" class="form-control readonly"></td>
						</tr>
						<tr>
							<th>최대 수용 인원</th>
							<td><input type="number" name="maxNumberPerson" class="form-control readonly"></td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<select name="productStatus" class="form-control disable">
									<option value="d">비활성화</option>
									<option value="e">활성화</option>
								</select>
							</td>
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
							<td colspan="2"><input type="time" name="businessStartTime" class="form-control readonly"></td>
						</tr>
						<tr>
							<th>영업 종료 시간</th>
							<td colspan="2"><input type="time" name="businessEndTime" class="form-control readonly"></td>
						</tr>
						<tr>
							<th>시간 단위</th>
							<td style="width: 35%;"><input type="number" id="unitTimeInput" class="form-control unitTime readonly"></td>
							<td style="width: 35%;">
								<select id="unitTimeSel" class="form-control unitTime disable">
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
							<td><textarea name="productInfo" class="form-control readonly"></textarea></td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" name="productSeq" value="${productSeq}">
		</form>
	</div>
	
	<!-- 버튼 -->
	<div id="BTNDIV">
		<button type="button" class="btn btn-primary mod" id="ModBTN">수정</button>
		<button type="button" class="btn btn-primary mod" id="ModFinishBTN">완료</button>
		<button type="button" class="btn btn-primary" id="DelBTN">삭제</button>		
	</div>
</body>
</html>
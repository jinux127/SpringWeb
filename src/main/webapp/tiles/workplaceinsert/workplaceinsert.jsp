<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/static/css/workplaceinsert.css" >
<meta charset="UTF-8">
<title>사업장 등록 페이지</title>
</head>
<body>
	<div><h5 style="text-align: center;"><b>사업장 등록</b></h5></div>
	<div id="workplaceInfoDiv">
		<form id="workplaceInfo">
			<!-- 기본 정보 입력 -->
			<div class="card card-primary card-outline basic">
				<div class="card-header"><h5>기본 정보</h5></div>
				<div class="card-body">
					<table>
						<tr>
							<th>사업장 이름</th>
							<td><input class="form-control" type="text" name="workplaceName" autocomplete="off"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="form-control" type="tel" name="workplaceTel" maxlength="13" autocomplete="off"></td>
						</tr>
						<tr>
							<th>시작 시간</th>
							<td><input class="form-control" type="time" name="workplaceStartTime"></td>
						</tr>
						<tr>
							<th>종료 시간</th>
							<td><input class="form-control" type="time" name="workplaceEndTime"></td>
						</tr>
					</table>
					<input type="hidden" value="${hostSeq}" name="hostSeq">
				</div>
			</div>
			
			<!-- 계좌 정보 입력 -->
			<div class="card card-primary card-outline account">
				<div class="card-header">
					<h5>계좌 정보
					<button type="button" id="directBTN" class="btn btn-primary" onclick="change(this)" style="float:right;">직접 입력</button></h5>
				</div>
				<div class="card-body" id="accountList"></div>
				<div class="card-body" id="accountListWrite">
					<table>
						<tr>
							<th>은행 선택</th>
							<td><select class="form-control" id="bankName" name="bankName"></select></td>
						</tr>
						<tr>
							<th>예금주 명</th>
							<td><input class="form-control" type="text" id="depositorName" name="depositorName" autocomplete="off"></td>
						</tr>
						<tr>
							<th>계좌 번호</th>
							<td><input class="form-control" type="number" id="accountNumber" name="accountNumber" placeholder="-제외하고 입력" autocomplete="off"></td>
						</tr>
					</table>
					<input type="hidden" id="accountSeq" name="accountSeq">
					<input type="hidden" value="${hostId}" name="hostId">
				</div>
			</div>
			<!-- 주소 정보 입력 -->
			<div class="card card-primary card-outline address">
				<div class="card-header"><h5>주소 정보</h5></div>
				<div class="card-body">
					<table>
						<tr>
							<th colspan="3"><label>주소 정보</label></th>
						</tr>
						<tr>
							<th>우편 번호</th>
							<td><input class="form-control" type="text" id="zoneCode"name="zoneCode" readonly="readonly"></td>
							<td><input type="button" class="btn btn-primary addrselbtn" id="zonecodeSearch"  value="우편번호 검색"></td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td colspan="2"><input class="form-control" type="text" id="roadAddress" name="roadAddress" readonly="readonly"></td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td colspan="2"><input class="form-control" type="text" id="detailAddress" name="detailAddress" autocomplete="off"></td>
						</tr>
					</table>
					<div id="wrap">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				</div>
			</div>
		</form>
	
<!-- 		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">
		<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				
		-->
		<div id="BTNDIV">
			<button type="button" class="btn btn-primary" id="RegBTN">등록</button>
		</div> 
	</div>
</body>
</html>
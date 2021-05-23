<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/static/css/workplacedetail.css" >
<meta charset="UTF-8">
<title>사업장 상세 페이지</title>
</head>
<body>
    <!-- 로딩 창 -->
	<div class="overlay-wrapper"><div class="overlay"><i class="fas fa-3x fa-sync-alt fa-spin"></i></div></div>
	<!-- 사업장 상세정보 DIV -->
	<div id="workplaceDetail">
		<div><h5><b>사업장 상세정보</b></h5></div>
		<form id="workplaceInfo">
			<!-- 기본 정보 -->
			<div class="card card-primary card-outline" id="BaseDIV">
				<div class="card-header"><h5>기본 정보</h5></div>
				<div class="card-body">
					<table>
						<tr>
							<th>사업장 이름</th>
							<td><input class="form-control readonly" type="text" name="workplaceName" autocomplete="off"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="form-control readonly" type="tel" name="workplaceTel" maxlength="13" autocomplete="off"></td>
						</tr>
						<tr>
							<th>시작 시간</th>
							<td><input class="form-control readonly" type="time" name="workplaceStartTime"></td>
						</tr>
						<tr>
							<th>종료 시간</th>
							<td><input class="form-control readonly" type="time" name="workplaceEndTime"></td>
						</tr>
						<tr>
							<th>상태</th>
							<td>
								<select class="form-control disable" name="workplaceStatus">
									<option value="d">비활성화</option>
									<option value="e">활성화</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 계좌 정보 -->
			<div class="card card-primary card-outline" id="AccountDIV">
				<div class="card-header">
					<h5>계좌 정보
						<button type="button" id="directBTN" class="btn btn-primary" onclick="change(this)" style="float:right; display: none;">직접 입력</button>
					</h5>
				</div>
				<!-- 수정 창 -->
				<div class="card-bodt" id="accountChange" style="display: none;">
					<!-- 리스트형 수정 창 -->
					<div id="accountList"></div>
					<!-- 직접 입력 수정 창 -->
					<div id="accountDirect" style="display: none;">
						<table>
							<tr>
								<th>은행 선택</th>
								<td><select class="form-control" name="bankName" id="setBankName"></select></td>
							</tr>
							<tr>
								<th>예금주 명</th>
								<td><input class="form-control" type="text" id="setDepositorName" name="depositorName" autocomplete="off"></td>
							</tr>
							<tr>
								<th>계좌 번호</th>
								<td><input class="form-control" type="number" id="setAccountNumber" name="accountNumber" placeholder="-제외하고 입력" autocomplete="off"></td>
							</tr>
						</table>
						<input type="hidden" id="accountSeq" name="accountSeq">
						<input type="hidden" value="${hostId}" name="hostId">
					</div>
				</div>
				<!-- 정보 창 -->
				<div class="card-body" id="accountInfo">
					<table>
						<tr>
							<th>은행 선택</th>
							<td><select class="form-control disable" id="bankName"></select></td>
						</tr>
						<tr>
							<th>예금주 명</th>
							<td><input class="form-control readonly" type="text" id="depositorName" autocomplete="off"></td>
						</tr>
						<tr>
							<th>계좌 번호</th>
							<td><input class="form-control readonly" type="number" id="accountNumber" placeholder="-제외하고 입력" autocomplete="off"></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 주소 정보 -->
			<div class="card card-primary card-outline" id="AddressDIV">
				<div class="card-header"><h5>주소 정보</h5></div>
				<div class="card-body">
					<table>
						<tr>
							<th>우편 번호</th>
							<td><input class="form-control" type="text" id="zoneCode"name="zoneCode" readonly="readonly"></td>
							<td><input type="button" class="btn btn-primary disable addrselbtn" id="zonecodeSearch"  value="우편번호 검색" ></td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td colspan="2"><input class="form-control" type="text" id="roadAddress" name="roadAddress" readonly="readonly"></td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td colspan="2"><input class="form-control readonly" type="text" id="detailAddress" name="detailAddress" autocomplete="off"></td>
						</tr>
					</table>
					<input type="hidden" name="workplaceSeq">
					<div id="wrap">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				</div>
			</div>
		</form>	
		<div id="BTNDIV">
			<button type="button" class="btn btn-primary mod" id="ModBTN">수정</button>
			<button type="button" class="btn btn-primary mod" id="ModFinishBTN">완료</button>
			<button type="button" class="btn btn-primary" id="DelBTN" onclick="delworkplace()">삭제</button>
		</div>
	</div>
</body>
</html>
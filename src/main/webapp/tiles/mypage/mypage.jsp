<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/static/css/mypage.css" >
<!--     <link rel="stylesheet" href="/static/plugins/adminLTE/plugins/bootstrap/css/bootstrap.css" > -->
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<h1>마이 페이지</h1>
	<div id="all">
		<div class="left">
			<!-- 기본 정보 -->
			<div class="card card-outline card-primary">
		    	<div class="card-header">
		        	<h3 class="card-title">기본 정보</h3>
					<div class="card-tools">
		            	<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
		            </div>
				</div>
				<div class="card-body" style="display: block;">
					<form id="userInfoForm">
						<table style="width: 100%;">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" id="hostId" name="hostId" readonly="readonly"><td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" class="form-control" id="hostName" name="hostName" readonly="readonly"><td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" class="form-control" id="hostTel" name="hostTel" readonly="readonly"><td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- 비밀번호 변경 -->
			<div class="card card-outline card-primary collapsed-card">
		    	<div class="card-header">
		        	<h3 class="card-title">비밀번호 변경</h3>
					<div class="card-tools">
		            	<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i></button>
		            </div>
				</div>
				<div class="card-body">
					<div id="pwUpdateDiv" style="width: 100%; height: 150px; display:block;">
						<form>
							<table style="width: 100%;">
								<tr>
									<th>새 비밀번호</th>
								</tr>
								<tr>
									<td><input type="password" id="password" name="passwork" class="form-control"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
								</tr>
								<tr>
									<td><input type="password" id="pwCheck" class="form-control"></td>
								</tr>
								<tr>
									<td><button type="button" id="pwChkBTN" class="btn btn-block btn-primary btn-xs">변경</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<!-- 계좌 정보 -->
			<div class="card card-outline card-primary">
		    	<div class="card-header">
		        	<h3 class="card-title">계좌 목록</h3>
					<div class="card-tools">
		            	<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
		            </div>
					<div style="float : right;">
						<input type="button" id="accountInsertBTN" class="btn btn-block bg-gradient-primary btn-xs" value="추가">
		            </div>
				</div>
				<div class="card-body" style="display: block;" id="accountList">
				</div>
			</div>
		</div>
	</div>	
	<!-- 		<input type="text" class="" id="hostPassword" name="hostPassword" readonly="readonly"> -->

	<!-- 계좌 등록 Modal -->
	<div class="modal fade" id="accountInsert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
	      		<!-- 모달 header -->
				<div class="modal-header">
					계좌 추가
				</div>
	      		<!-- 모달 body -->
				<div class="modal-body">
	    	    	<form id="accountInsertForm">
	        			<table style="width: 100%;">
	        				<tr>
	        					<th>은행</th>
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
		        		<input type="hidden" name="userId" value="${hostId}">
	        		</form>
	      		</div>
	      		<!-- 모달 footer -->
				<div class="modal-footer">
	    			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" id="insertBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 계좌 수정 Modal -->
	<div class="modal fade" id="setAccount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
	      		<!-- 모달 header -->
				<div class="modal-header">
					계좌 수정
				</div>
	      		<!-- 모달 body -->
				<div class="modal-body">
	    	    	<form id="setAccountForm">
		        		<input type="hidden" id="setAccountSeq" name="accountSeq">
	        			<table style="width: 100%;">
	        				<tr>
	        					<th>은행</th>
								<td><select class="form-control" id="setBankName" name="bankName"></select></td>
			        		</tr>
							<tr>
								<th>예금주 명</th>
								<td><input class="form-control" type="text" id="setDepositorName" name="depositorName" autocomplete="off"></td>
							</tr>
							<tr>
								<th>계좌 번호</th>
								<td><input class="form-control" type="number"id="setAccountNumber" name="accountNumber" placeholder="-제외하고 입력" autocomplete="off"></td>
							</tr>
		        		</table>
	        		</form>
	      		</div>
	      		<!-- 모달 footer -->
				<div class="modal-footer">
	    			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" id="setBtn">수정</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
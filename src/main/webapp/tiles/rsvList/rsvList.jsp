<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/static/css/rsvList.css" >

<title>예약 리스트 조회</title>
<style type="text/css">
</style>


</head>
<body>

	<div id= "aa">
		<!-- 	풀캘린더 적용 -->
		<div id='calendar'></div>
		
		
		
		
		
		<div id= 'divRsvList'>
			<div class="col-13">
	          	<div class="card">
	          		<div class="card-body">
	          			<div class="row">
	          				<div class="col-lg-11">
	          					<div class="row">
	          						<div class="col-lg-2">
					              		<div class="form-group">
					              			<label for="srch_title">상품이름</label>
					              			<input type="text" class="form-control" id="srch_productName" value="" onkeypress="return enter(event)" />
					              		</div>
				              		</div>
	          						<div class="col-lg-2">
					              		<div class="form-group">
					              			<label for="srch_title">고객이름</label>
					              			<input type="text" class="form-control" id="srch_rsvctmName" value="" onkeypress="return enter(event)" />
					              		</div>
				              		</div>
	          						<div class="col-lg-3">
					              		<div class="form-group">
					              			<label for="srch_goods_pc_se">전화번호</label>
					              			<input type="text" class="form-control" id="srch_rsvctmTel" value="" onkeypress="return enter(event)" />
					              		</div>
				              		</div>
				              		<div class="col-lg-2">
					              		<div class="form-group">
					              			<label for="srch_goods_expsr">상태</label>
					              			<select class="form-control custom-select" id="srch_reservationStatus">
					              				<option value="">전체</option>
					              				<option value="w">대기</option>
					              				<option value="c">확인</option>
					              				<option value="r">거절</option>
					              			</select>
					              		</div>
				              		</div>
			          				<div class="col-lg-3">
			          					<div class="float-right" style="margin-top: 32px;">
											<button type="button" class="btn btn-primary searchBtn" onclick="fn_search()">
												<i class="fa fa-search"></i> 검색
											</button>
										</div>
			          				</div>
	          					</div>
	          				</div>
	          				<div class= "col-lg-11">
	          					<div class="row">
	          						<div class="col-lg-2">
		          						<div class="form-group">
						           			<label for="srch_title">신청 날짜</label>
			              					<input type="date" class="form-control" id="srch_regTime"  value ="" onkeypress="return enter(event)">
		          						</div>
	          						</div>
	          						<div class="col-lg-2">
		          						<div class="form-group">
		          							<label for="srch_title">시간</label>
			              					<input type="time" class="form-control" id="srch_regTime_time" value ="" onkeypress="return enter(event)">
		          						</div>
	          						</div>
	          						<div class="col-lg-2">
		          						<div class="form-group">
						           			<label for="srch_title">시작 날짜</label>
			              					<input type="date" class="form-control" id="srch_startDate" value ="" onkeypress="return enter(event)">
		          						</div>
	          						</div>
	          						<div class="col-lg-2">
		          						<div class="form-group">
		          							<label for="srch_title">시간</label>
			              					<input type="time" class="form-control" id="srch_startDate_time"  value ="" onkeypress="return enter(event)">
		          						</div>
	          						</div>
	          						<div class="col-lg-2">
		          						<div class="form-group">
						           			<label for="srch_title">종료 날짜</label>
			              					<input type="date" class="form-control" id="srch_endDate" value ="" onkeypress="return enter(event)">
		          						</div>
	          						</div>
	          						<div class="col-lg-2">
		          						<div class="form-group">
		          							<label for="srch_title">시간</label>
			              					<input type="time" class="form-control" id="srch_endDate_time" value ="" onkeypress="return enter(event)">
		          						</div>
	          						</div>
	          						
	          					</div>
	          				</div>
		           		</div>
	              		
					</div>
	          	</div>
        	</div>
		
		
		
			<h1>고객 리스트</h1>
			<form id="rsvList">
				<table id="rsvTable" class="table table-bordered table-hover text-center">
					<thead>
						<tr>
							<th style="width: 200px; text-align: center;">신청 날짜</th>
							<th style="width: 200px; text-align: center;">상품 이름</th>
							<th style="width: 125px; text-align: center;">고객 이름</th>
							<th style="width: 150px; text-align: center;">전화번호</th>
							<th style="width: 100px; text-align: center;">인원</th>
							<th style="width: 200px; text-align: center;">예약번호</th>
							<th style="width: 200px; text-align: center;">시작 날짜</th>
							<th style="width: 200px; text-align: center;">종료 날짜</th>
							<th style="width: 125px; text-align: center;">상태</th>
						</tr>
					</thead>
				</table>
			</form>
		</div>
	</div>
	
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="/static/css/adminlte/adminlte.css">
	<link rel="stylesheet" href="/static/css/datetimepicker/jquery.datetimepicker.css"/>
	
	<script type="text/javascript" src="/static/plugins/jquery-3.5.1.min.js"></script>
	<!-- 웹 뷰 뷰포트 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
	<style type="text/css">
	/* 모바일 화면용 CSS */
		#all{
			width: 90%;
			margin: 5px auto;
		}
		th{
			text-align: center;
		}
	/* pc 큰 화면 */
		@media ( min-width :1024px) {
		}
	</style>
	<meta charset="UTF-8">
	<title>날짜 선택</title>
</head>
<body>
	<div class="card card-primary card-outline" id="all">
		<div class="card-body">
			<div class="callout callout-info">
				<table style="width: 100%;">
					<tr>
						<th colspan="2">시작일</th>
					</tr>
					<tr>
						<th><label for="startDateSel">날짜</label></th>
						<td><input type="date" class="form-control" id="startDate" onchange="setEndDateMin()"></td>
					</tr>
					<tr>
						<th><label for="startTimeSel">시간</label></th>
						<td><input type="time" class="form-control" id="startTime"></td>
					</tr>
						
					<tr>
						<th colspan="2">종료일</th>
					</tr>
					<tr>
						<th><label for="endDateSel">날짜</label></th>
						<td><input type="date" class="form-control" id="endDate"></td>
					</tr>
					<tr>
						<th><label for="endTimeSel">시간</label></th>
						<td><input type="time" class="form-control" id="endTime"></td>
					</tr>
				</table>
			</div>
			<div id="btn" style="text-align: center;">
				<input type="hidden" id="productSeq" value="${productSeq}"> 
				<button type="button" id="copyURL" class="btn btn-block btn-outline-info btn-sm" onclick="inputCheck()">URL복사</button>
				<button type="button" id="cancle" class="btn btn-block btn-outline-info btn-sm" onclick="cancle()"> 취소</button>
			</div>
		</div>
	</div>
	<!-- URL 복사 DIV  -->
	<div id="textDiv"></div>
</body>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="/static/plugins/datetimepicker/jquery.datetimepicker.full.js"></script>
<script type="text/javascript">

var now = new Date();

var year = now.getFullYear();
//달 선택 시 값이 '0X' 형식이므로 이를 맞춰주기 위한 과정
var monthTemp = now.getMonth() + 1;
var month = "";
if(monthTemp < 10){
	month = "0" + monthTemp;
}else {
	month = month = monthTemp;
}
var date = now.getDate();

var dateMin = year + "-" + month + "-" + date;
var dateMax = (year + 1) + "-" + month + "-" + date;

$(document).ready(function(){
	//날짜 최소 및 최대 선택 제한(1년)
	$('#startDate, #endDate').attr("min", dateMin);
	$('#startDate, #endDate').attr("max", dateMax);
	$('#startDate, #endDate').val(dateMin);
});
//종료일 최소값을 시작일로
function setEndDateMin(){
	$('#endDate').attr("min", $('#startDate').val());
	$('#endDate').val($('#startDate').val());
}

function inputCheck(){
	if($('#startDate').val() != "" && $('#startDate').val() != null && $('#startTime').val() != "" && $('#startTime').val() != null && $('#endDate').val() != "" && $('#endDate').val() != null && $('#endTime').val() != "" && $('#endTime').val() != null){
		//모든 input이 참
		dateCompare();
	}else{
		//비어있는 input이 있음
		alert("값을 선택해주세요");
	}
		
}

function dateCompare(){
	var startDate = $('#startDate').val();
	var startTime = $('#startTime').val();
	var endDate = $('#endDate').val();
	var endTime = $('#endTime').val();
	
	if(startDate < endDate){ // 시작일이 종료일보다 과거 >> 정상 선택
		copyURL();
	} else if(startDate == endDate){ // 시작일이 종료일과 같은 날 >> 시간 비교
		if(startTime >= endTime){ // 시작 시간이 더 빠름
			alert("종료시간을 재설정해주세요");
		}else if(startTime < endTime){ // 종료 시간이 더 빠름 >> 정상
			copyURL();
		}
	}
}

function copyURL(){
	
	var startDate = $('#startDate').val() + " " + $('#startTime').val();
	var endDate= $('#endDate').val() + " " + $('#endTime').val();
	var productSeq = $('#productSeq').val();
	
	var url = $(location).attr('protocol')+"//"+$(location).attr('host') + "/rsv/?productSeq=" + productSeq + "&startDate=" + startDate + "&endDate=" + endDate;

	var createInput = document.createElement("input");
	/* 가상으로 input text 태그 생성 */
	createInput.setAttribute("type","text");
	/* 가상으로 가져올 태그에 만들어준 input태그 붙여줌 */
	document.getElementById("textDiv").appendChild(createInput);
  	// 만든 input 태그의 value 값에 복사할 텍스트 값을 넣어줍니다.
  	createInput.value = url;
  	// 복사 기능을 수행한 후
  	createInput.select();
	document.execCommand('copy');
  	// 태그 제거
 	document.getElementById("textDiv").removeChild(createInput);
	
	window.close();
}
function cancle() {
	window.close();
}
</script>
</html>
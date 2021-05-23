<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var hostId = "${hostId}";
var hostSeq = "${hostSeq}";

$(document).ready(function(){
	banklist();
	getUserInfo();
	getAccountList();
});
// 추가 버튼 클릭
$('#accountInsertBTN').click(function(){
	$('#depositorName, #accountNumber').val(""); // input 초기화
	$('#bankName').val("").prop("selected", true); //은행 선택 초기화
	$('#accountInsert').modal('show');
});

// 등록 버튼 클릭
$('#insertBtn').click(function(){
	var temp = $('#accountInsertForm').serializeArray();
	var length = temp.length;
	var flag = 0;
	
	for(var i=0;i<length;i++){
		if(temp[i].value != null && temp[i].value != ""){
			flag++;
		}
	}
	if(flag == length){ //값이 모두 있음
		insertAccount();
		$('#accountInsert').modal('hide');
	}else{ //빈 값이 있음
		alert("미입력된 값이 있습니다.");
	}
});
// 계좌 수정 (form 전체의 값을 가져가서 값 변경 후 클릭 시 변경 값과 Seq값 가져가서 수정)
function setAccount(obj){
	var form = $(obj).parent().serializeArray();
	
	$('#setAccountSeq').val(form[0].value); // accountSeq
	$('#setBankName').val(form[1].value).prop("selected", true);  // bankName
	$('#setDepositorName').val(form[2].value); // depositorName
	$('#setAccountNumber').val(form[3].value); // accountNumber
	
	$('#setAccount').modal('show');
}
// 수정 버튼 클릭
$('#setBtn').click(function(){
	var temp = $('#setAccountForm').serializeArray();
	var length = temp.length;
	var flag = 0;
	
	for(var i=0;i<length;i++){
		if(temp[i].value != null && temp[i].value != ""){
			flag++;
		}
	}
	if(flag == length){ //값이 모두 있음
		$.ajax({
			type : "POST",
			url : "/host/setAccount.do",
			data : $('#setAccountForm').serialize(),
			datatype : "json",
		    beforeSend : function(xhr){
		        xhr.setRequestHeader(header, token);
		    }, success : function(){
		    	getAccountList();
				$('#setAccount').modal('hide');
		    }, error : function(xhr, status, e) {
		        alert('수정 실패');
		    }
		});
	}else{ //빈 값이 있음
		alert("미입력된 값이 있습니다.");
	}
});
// 계좌 삭제 (accountSeq값 가지고 감)
function deleteAccount(obj){
	var accountSeq = $(obj).siblings("input[name=accountSeq]").val();
	console.log(accountSeq);
	
	$.ajax({
		type : "POST",
		url : "/host/deleteAccount.do",
		data : {accountSeq : accountSeq},
		datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(){
	    	getAccountList();
	    }, error : function(xhr, status, e) {
	        alert('삭제 실패');
	    }
	});
}

// 기본 정보 호출
function getUserInfo(){
	$.ajax({
	    type : "POST",
	    url : "/host/getUserInfo.do",
	    data : {hostId : hostId},
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(data){
	    	//기본 정보
	    	$('input[name=hostId]').val(data.info.userId);
	    	$('input[name=hostName]').val(data.info.hostName);
	    	$('input[name=hostTel]').val(data.info.hostTel);
	    }, error : function(xhr, status, e) {
	        alert('정보 호출 실패');
	    }
	});
}
//계좌 목록 호출
function getAccountList(){
	$.ajax({
	    type : "POST",
	    url : "/host/getAccountList.do",
	    data : {hostId : hostId},
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(data){
	    	var div = $('#accountList');
	    	div.empty();
	    	var divHtml = "";
    		if(data.List.length > 0){
	    		$.each(data.List, function(index,val){
	    			divHtml +=	"<div class='callout callout-info'>" +
	    							"<form>" +
    									"<button type='button' style='width:47%; margin-left:2%; float:left;' class='btn bg-gradient-primary btn-xs' onclick='setAccount(this)'>수정</button>" +
    									"<button type='button' style='width:47%; margin-left:2%; float:left;' class='btn bg-gradient-primary btn-xs' onclick='deleteAccount(this)'>삭제</button>" +
										"<input type='hidden' name='accountSeq' value='" + val.accountSeq + "'>" +
		    							"<input type='text' class='form-control' name='bankName' value='" + val.bankName + "' readonly='readonly'>" +
		    							"<input type='text' class='form-control' name='depositorName' value='" + val.depositorName + "' readonly='readonly'>" +
		    							"<input type='text' class='form-control' name='accountNumber' value='" + val.accountNumber + "' readonly='readonly'>" +
									"</form>" +
								"</div>"; 
	    		});
    		} else {
	    		divHtml += 	"<div class='alert alert-danger'>" +
								"<h5>계좌 정보가 존재하지 않습니다.</h5>" +
								"<h5>계좌를 추가해주세요.</h5>" +
							"</div>";
    		}
	        div.append(divHtml);
	    	//로딩창 제거
	    	$('.overlay-wrapper').toggle();
	    }, error : function(xhr, status, e) {
	        alert('정보 호출 실패');
	    }
	});
}

//은행 목록 호출
function banklist(){
	$.ajax({
        type : "POST",
        url : "/workplace/getbank.do",
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(data){
	        var select = $('select[name=bankName]');
	        select.html("");
	        var options = "<option value=''>선택</option>";
	        $.each(data.bank, function(i,val){
	        	options += "<option>" + val.bank + "</option>";
	        });
	        select.html(options);
        }, error : function(xhr, status, e) {
            alert('은행 목록 호출 실패');
        }
	});
}
//계좌 등록
function insertAccount(){
	$.ajax({
	    type : "POST",
	    url : "/host/insertAccount.do",
	    data : $('#accountInsertForm').serialize(),
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(){
	        alert('계좌 등록 성공');
	        getAccountList();
	    }, error : function(xhr, status, e) {
	        alert('계좌 등록 실패');
	    }
	});
}
</script>
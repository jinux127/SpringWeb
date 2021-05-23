<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var workplaceSeq = "${workplaceSeq}";//컨트롤러에서 넘어온 workplaceSeq 값 변수에 저장 

$(document).ready(function(){
	banklist();
	disabled();
});

//전화번호 -자동입력
$('input[name=workplaceTel]').inputmask({
	mask : '999-9999-9999',
	placeholder : '',
	showMaskOnHover : false,
	showMaskOnFocus : false
});
//은행 목록 호출
function banklist(){
	$.ajax({
        type : "POST",
        url : "/workplace/getbank.do",
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(data){
	        var select = $('#bankName, #setBankName');
	        select.html("");
	        var options = "<option value=''>선택</option>";
	        $.each(data.bank, function(i,val){
	        	options += "<option value='" + val.bank +"'>" + val.bank + "</option>";
	        });
	        select.html(options);
	        getworkplaceinfo();
        }, error : function(xhr, status, e) {
            alert('은행 목록 호출 실패');
        }
	});
}
//=============================다음 주소 API=================================
$('#zonecodeSearch').click(function(){
	sample3_execDaumPostcode();
});
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
  // iframe을 넣은 element를 안보이게 한다.
  element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
	// 현재 scroll 위치를 저장해놓는다.
	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	new daum.Postcode({
	    oncomplete: function(data) {
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('zoneCode').value = data.zonecode;
	        document.getElementById("roadAddress").value = data.roadAddress;
	        // 커서를 상세주소 필드로 이동한다.
	        document.getElementById("detailAddress").focus();
	
	        // iframe을 넣은 element를 안보이게 한다.
	        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	        element_wrap.style.display = 'none';
	
	        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	        document.body.scrollTop = currentScroll;
	    },
	    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	    onresize : function(size) {
	        element_wrap.style.height = size.height+'px';
	    },
	    width : '100%',
	    height : '100%'
	}).embed(element_wrap);
	
	// iframe을 넣은 element를 보이게 한다.
	element_wrap.style.display = 'block';
}
//=============사업장 상세 정보=================
//사업장 상세 정보 호출
function getworkplaceinfo(){
	$.ajax({
	    type : "POST",
	    url : "/workplace/getworkplaceinfo.do",
	    data : {workplaceSeq : workplaceSeq},
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(data){
	    	//기본 정보
	    	$('input[name=workplaceSeq]').val(data.workplaceInfo.workplaceSeq);
	    	$('input[name=workplaceName]').val(data.workplaceInfo.workplaceName);
	    	$('input[name=workplaceTel]').val(data.workplaceInfo.workplaceTel);
	    	$('input[name=workplaceStartTime]').val(data.workplaceInfo.workplaceStartTime);
	    	$('input[name=workplaceEndTime]').val(data.workplaceInfo.workplaceEndTime);
	    	$("select[name=workplaceStatus]").val(data.workplaceInfo.workplaceStatus).prop("selected", true);
	    	//계좌 정보
	    	$("#bankName").val(data.workplaceInfo.bankName).prop("selected", true); //은행 목록 중에 선택하여 비교하므로 은행목록 호출 먼저
	    	$('#depositorName').val(data.workplaceInfo.depositorName);
	    	$('#accountNumber').val(data.workplaceInfo.accountNumber);
	    	//주소 정보
	    	$('input[name=zoneCode]').val(data.workplaceInfo.zoneCode);
	    	$('input[name=roadAddress]').val(data.workplaceInfo.roadAddress);
	    	$('input[name=detailAddress]').val(data.workplaceInfo.detailAddress);
            //로딩창 제거
	    	$('.overlay-wrapper').toggle();
	    }, error : function(xhr, status, e) {
	        alert('정보 호출 실패');
	    }
	});
}
//=============수정=================
//수정 버튼 클릭
$('#ModBTN').click(function(){
	$('.mod').toggle();
	
	$('#setBankName').val($('#bankName').val()).prop("selected", true);
	$('#setDepositorName').val($('#depositorName').val());
	$('#setAccountNumber').val($('#accountNumber').val());
	
	userAccountInfo();
	$('#accountChange, #accountInfo, #directBTN').toggle();
	abled();
});

//완료 버튼 클릭
$('#ModFinishBTN').click(function(){
	workplaceInfoCheck();
});
//사업장 상세 정보 공백 체크
function workplaceInfoCheck(){
	var temp = $('#workplaceInfo').serializeArray();
	var length = temp.length;
	var flag = 0;
	
	for(var i=0;i<length;i++){
		if(temp[i].value != null && temp[i].value != ""){
			flag++;
		}
	}
	if(flag >= length-1){ //값이 모두 있음
		setWorkplaceInfo();
	}else{ //빈 값이 있음
		alert("미입력된 값이 있습니다.");
	}
}
//사업장 기본 정보 수정
function setWorkplaceInfo(){
	$.ajax({
	    type : "POST",
	    url : "/workplace/setworkplaceinfo.do",
	    data : $('#workplaceInfo').serialize(),
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(){
	    	alert("수정이 완료되었습니다.");
	    	location.href="/workplace/list";
	    }, error : function(xhr, status, e) {
	        alert('수정 오류');
	    }
	});
}
//수정 가능하게
function abled(){
	$('.readonly').attr("readonly", false);
	$('.disable').attr("disabled", false);
}

//수정 불가능하게
function disabled(){
	$('.readonly').attr("readonly", "readonly");
	$('.disable').attr("disabled", "disabled");
}
// 유저 계좌 정보 조회
function userAccountInfo() {
	$.ajax({
	    type : "POST",
	    url : "/host/getAccountList.do",
	    data : {hostId : "${hostId}"},
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(data){
	    	var div = $('#accountList');
	    	div.empty();
	    	var divHtml = "";
    		if(data.List.length > 0){
	    		$.each(data.List, function(index,val){
	    			divHtml +=	"<div class='callout callout-info' onclick='accountSel(this)'>" +
									"<input type='hidden' class='accountSeq' value='" + val.accountSeq + "'>" +
	    							"<div class='bankName'>" + val.bankName + "</div>" +
	    							"<div class='depositorName'>" + val.depositorName + "</div>" +
	    							"<div class='accountNumber'>" + val.accountNumber + "</div>" +
								"</div>"; 
	    		});
    		} else {
	    		divHtml += 	"<div class='alert alert-danger'>" +
								"<h5>계좌 정보가 존재하지 않습니다.</h5>" +
								"<h5>계좌를 추가해주세요.</h5>" +
							"</div>";
    		}
	        div.append(divHtml);
	    }, error : function(xhr, status, e) {
	        alert('정보 호출 실패');
	    }
	});
}
//직접 입력 버튼
function change(obj){
	var text = $(obj).text();
	if(text == "직접 입력"){
		$(obj).text("목록 보기");
		$('#setBankName').val("").prop("selected", true);
		$('#accountSeq, #setDepositorName, #setAccountNumber').val("");
		$('#accountList, #accountDirect').toggle();
	} else {
		$(obj).text("직접 입력");
		$('.callout').css("background-color", "#ffffff");
		$('#accountList, #accountDirect').toggle();
	}
}
//리스트 선택
function accountSel(obj) {
	$('.callout').css("background-color", "#ffffff");
	$(obj).css("background-color", "#E6E6FA");
	
	var accountSeq = $(obj).children("input[class=accountSeq]").val()
	var bankName = $(obj).children("div[class=bankName]").text()
	var depositorName = $(obj).children("div[class=depositorName]").text()
	var accountNumber = $(obj).children("div[class=accountNumber]").text()
	
	$('#accountSeq').val(accountSeq);
	$('#setBankName').val(bankName).prop("selected", true);;
	$('#setDepositorName').val(depositorName);
	$('#setAccountNumber').val(accountNumber);
}
//=============삭제=================
//사업장 삭제
function delworkplace(){
	if(confirm("정말 삭제하시겠습니까?") == true){
		$.ajax({
		    type : "POST",
		    url : "/workplace/delete.do",
		    data : {workplaceSeq : workplaceSeq},
		    datatype : "json",
		    beforeSend : function(xhr){
		        xhr.setRequestHeader(header, token);
		    }, success : function(){
		    	alert("삭제되었습니다.");
		    	location = "/workplace/list";
		    }, error : function(xhr, status, e) {
		        alert('사업장 삭제 오류');
		    }
		});
	} else{
		return;
	}
}

</script>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

$(document).ready(function(){
	banklist();
	userAccountInfo();
});
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
		$('#bankName').val("").prop("selected", true);
		$('#accountSeq, #depositorName, #accountNumber').val("");
		$('#accountList, #accountListWrite').toggle();
	} else {
		$(obj).text("직접 입력");
		$('.callout').css("background-color", "#ffffff");
		$('#accountList, #accountListWrite').toggle();
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
	$('#bankName').val(bankName).prop("selected", true);;
	$('#depositorName').val(depositorName);
	$('#accountNumber').val(accountNumber);
}
// function userAccountInfo() {
// 	$.ajax({
//         type : "POST",
//         url : "/workplace/getUserAccountInfo.do",
//         datatype : "json",
//         beforeSend : function(xhr){
//             xhr.setRequestHeader(header, token);
//         }, success : function(data){
//         	$("#bankName").val(data.userAccountInfo.bankName).prop("selected", true);
//         	$('#depositorName').val(data.userAccountInfo.depositorName);
//         	$('#accountNumber').val(data.userAccountInfo.accountNumber);
//         }, error : function(xhr, status, e) {
//             alert('계좌 정보 호출 실패');
//         }
// 	});
// }


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
	        var select = $('#bankName');
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
//=============================다음 주소 API 시작=================================
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

/* function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).embed();
} */

//=============================다음 주소 API 종료=================================
$('#RegBTN').click(function(){
	infoCheck();
});

//사업장 정보 공백 체크
function infoCheck(){
	var temp = $('#workplaceInfo').serializeArray();
	var length = temp.length;
	var flag = 0;
	
	for(var i=0;i<length;i++){
		if(temp[i].value != null && temp[i].value != ""){
			flag++;
		}
	}
	if(flag >= length-1){ //값이 모두 있음
		insertinfo();
	}else{ //빈 값이 있음
		alert("미입력된 값이 있습니다.");
	}
}
//등록
function insertinfo(){
	$.ajax({
        type : "POST",
        url : "/workplace/insertinfo.do",
        data : $('#workplaceInfo').serialize(),
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(){
			location.href="/workplace/list";
        }, error : function(xhr, status, e) {
            alert('등록 실패');
        }
	});
}
</script>
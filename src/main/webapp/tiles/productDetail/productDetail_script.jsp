<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var productSeq = "${productSeq}";

$(document).ready(function(){
	getProductInfo();
	disabled();
});


//제품 상세 정보 호출
function getProductInfo(){
	$.ajax({
	    type : "POST",
	    url : "/product/getproductinfo.do",
	    data : {productSeq : productSeq},
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(data){
	    	$('input[name=productName]').val(data.ProductInfo.productName);
	    	$('input[name=price]').val(data.ProductInfo.price);
	    	$('input[name=maxNumberPerson]').val(data.ProductInfo.maxNumberPerson);
			$('select[name=productStatus]').val(data.ProductInfo.productStatus).prop("selected", true);
	    	$('input[name=businessStartTime]').val(data.ProductInfo.businessStartTime);
	    	$('input[name=businessEndTime]').val(data.ProductInfo.businessEndTime);

	    	//유닛타임
	    	$('input[name=unitTime]').val(data.ProductInfo.unitTime);
	    	var unitTime = data.ProductInfo.unitTime;
	    	var length = unitTime.length -1; // 마지막 1글자가 단위이므로 -1 해서 단위를 제외한 값만 가져오기 위해서
	    	var unitTimeSel = unitTime[length];
	    	var unitTimeInput = "";
	    	for(var i=0;i<length;i++){
	    		unitTimeInput += unitTime[i];
	    	}
	    	$('#unitTimeInput').val(unitTimeInput);
	    	$('#unitTimeSel').val(unitTimeSel).prop("selected", true);
	    	//유닛타임 끝
	    	
	    	$('textarea[name=productInfo]').val(data.ProductInfo.productInfo);
            //로딩창 제거
	    	$('.overlay-wrapper').toggle();
	    }, error : function(xhr, status, e) {
	        alert('상품 상세 정보 호출 실패');
	    }
		
	});
}

//시간 단위 선택 시 input과 select의 값을 합쳐 unitTime에 값 입력
$('.unitTime').change(function(){
	var unitTimeInput = $('#unitTimeInput').val();
	var unitTimeSel = $('#unitTimeSel').val();
	var val = "";
	
	if(unitTimeInput != "" && unitTimeInput != null && unitTimeSel != "" && unitTimeSel != null ){
		val = unitTimeInput + unitTimeSel;
	}else{
		val = "";
	}
	
	$('input[name=unitTime]').val(val)
});
//==================수정==================

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

//수정 버튼 클릭
$('#ModBTN').click(function(){
	$('.mod').toggle();
	abled();
});

//완료 버튼 클릭
$('#ModFinishBTN').click(function(){
	ModifyCheck();
});

function ModifyCheck(){
	var temp = $('#ProductInfo').serializeArray();
	var length = temp.length;
	var flag = 0;
	
	for(var i=0;i<length;i++){
		if(temp[i].value != null && temp[i].value != ""){
			flag++;
		}
	}
	if(flag == length){ //값이 모두 있음
		productModify();
	}else{ //빈 값이 있음
		alert("미입력된 값이 있습니다.");
	}
}
//상품 수정
function productModify(){
	$.ajax({
	    type : "POST",
	    url : "/product/setproductinfo.do",
	    data : $('#ProductInfo').serialize(),
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(){
			$('.mod').toggle();
			disabled();
	    }, error : function(xhr, status, e) {
	        alert('상품 상세 정보 수정 실패');
	    }
	});
}

//==================삭제==================
$('#DelBTN').click(function(){
	productDelete();
});
//상품 삭제
function productDelete(){
	if(confirm("정말 삭제하시겠습니까?") == true){
		$.ajax({
		    type : "POST",
		    url : "/product/delete.do",
		    data : {productSeq : productSeq},
		    datatype : "json",
		    beforeSend : function(xhr){
		        xhr.setRequestHeader(header, token);
		    }, success : function(){
		    	alert("삭제되었습니다.");
				history.back();
		    }, error : function(xhr, status, e) {
		        alert('상품 삭제 실패');
		    }
		});
	} else{
		return;
	}
}
</script>
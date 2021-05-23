<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");
$(document).ready(function(){

// 	local storage 저장된 값 불러오기
	$('#rsvctmName').val(localStorage.getItem('rsvctmName'));
	$('#rsvctmTel').val(localStorage.getItem('rsvctmTel'));
	$('#rsvctmNmpr').val(localStorage.getItem('rsvctmNmpr'));

	getProductInfo();
});


function getProductInfo() {
	
	var productSeq = $('#productSeq').val();	
	
	if (productSeq == "") {
		alert("정상적인 경로로 입장해주세요.");
	}else {
		$.ajax({
			type : "POST",
	        url : "/rsv/getProductInfo",
	        data : {"productSeq" : productSeq},
	        datatype : "json",
	        beforeSend : function(xhr){
	            xhr.setRequestHeader(header, token);
	        }, success : function(data){
	        	$('#productName').val(data.productVO.productName);
	        	$('#price').val(data.productVO.price);
	        	$('#maxNumberPerson').val(data.productVO.maxNumberPerson);
	        }, error : function(xhr, status, e) {
	            alert("조회하지 못하는 상품입니다.");
	        }
		});
	}
	
}

$('#rsvctmBtn').click(function(){
	
// 	local storage 이동하기 전 저장
	localStorage.setItem('rsvctmName', $('#rsvctmName').val());
	localStorage.setItem('rsvctmTel', $('#rsvctmTel').val());
	localStorage.setItem('rsvctmNmpr', $('#rsvctmNmpr').val());
	
	$.ajax({
        type : "POST",
        url : "/rsv/rsvctm.do",
        data : $('#reservForm').serialize(),
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(){
            alert('Success');
            location.href='/rsv/rsvResult?productSeq='+ $('#productSeq').val();
        }, error : function(xhr, status, e) {
            alert('Error');
        }
	});
});








</script>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

$(document).ready(function(){
	getProductInfo()
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
	        	
	        	var temp = "";
	        	temp += data.workplaceVO.bankName + " ";
	        	temp += data.workplaceVO.depositorName + " ";
	        	temp += data.workplaceVO.accountNumber ;
	        	
	        	
	        	$('#accountInfo').val(temp);
	        }, error : function(xhr, status, e) {
	            alert("조회하지 못하는 상품입니다.");
	        }
		});
	}
	
}

/* 

$('#rsvctmBtn').click(function(){
	var rsvctmName = $('#rsvctmName').val();
	var productSeq = $('#productSeq').val();

	$.ajax({
        type : "POST",
        url : "/resv/rsvctm.do",
        data : $('#reservForm').serialize(),
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(){
            alert('Success');
            location.href='/resv';
        }, error : function(xhr, status, e) {
            alert('Error');
        }
	});
});

$('#productBtn').click(function(){
	var productSeq = $('#productSeq').val();
	
	$.ajax({
        type : "POST",
        url : "/resv/productRsv.do",
        data : {"productSeq" : productSeq},
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(){
            alert('Success');
            location.href='/resv';
        }, error : function(xhr, status, e) {
            alert('Error');
        }
	});
}); */



</script>
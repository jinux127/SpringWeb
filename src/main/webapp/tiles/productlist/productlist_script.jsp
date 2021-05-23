<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var workplaceSeq = "${workplaceSeq}";//컨트롤러에서 넘어온 workplaceSeq 값 변수에 저장 

$(document).ready(function(){
	getProductList();
});
//=============상품 상세 리스트=================
//상품 상세 리스트 호출
function getProductList(){
	$.ajax({
	    type : "POST",
	    url : "/product/getlist.do",
	    data : {workplaceSeq : workplaceSeq},
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(data){
	    	var div = $('#productListBody');
	    	div.empty();
	    	var divHtml = "";
	    	if(data.List.length > 0){
		    	$.each(data.List, function(index,val){
		    		divHtml += "<div class='callout callout-info productCard'>" +
		    						"<form action='/product/detail' method='post'>" +
		    							"<div class='subjectDiv'><b>이름</b></div><div class='contentDiv'>" + val.productName + "</div>" +
		    							"<div class='subjectDiv'><b>상태</b></div><div class='contentDiv'>" + val.productStatus + "</div>" +
		    							"<div class='subjectDiv'><b>가격</b></div><div class='contentDiv'>" + val.price + "</div>" +
		  								"<input type='hidden' name='productSeq' value='" + val.productSeq + "'>" +	//productSeq 저장된 input
		  								"<input type='hidden' name='workplaceSeq' value='" + val.workplaceSeq+ "'>" +
		    							"<input type='hidden' name='${_csrf.parameterName}'	value='${_csrf.token}'>" +
		    							"<button type='button' class='btn btn-block btn-outline-info btn-sm' onclick='getDate("  +val.productSeq + ")'>URL생성</button>" +
	  									"<button type='submit' class='btn btn-block btn-outline-info btn-sm'>상세페이지</button>" +
	  							"</form>" +
	  						"</div>";
		    	});
	    	} else {
	    		divHtml += 	"<div class='alert alert-danger'>" +
								"<h5>상품이 존재하지 않습니다.</h5>" +
								"<h5>상품을 추가해주세요.</h5>" +
							"</div>";
	    	}
          	div.append(divHtml);
          	//로딩창 제거
			$('.overlay-wrapper').toggle();
	    }, error : function(xhr, status, e) {
	        alert('Error');
	    }
	});

}
//=====================url 복사=======================
function getDate(productSeq){

	var popupX = (document.body.offsetWidth - 350) / 2;
	var popupY = (document.body.offsetHeight - 300) / 2;
	
	var openwin = window.open("/product/getdate?productSeq=" + productSeq, "날짜 선택", "status=no, height=300, width=350, left=" + popupX + ", top=" + popupY);
}

</script>
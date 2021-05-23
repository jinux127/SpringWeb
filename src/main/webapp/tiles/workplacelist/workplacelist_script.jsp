<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var hostSeq = "${hostSeq}";
// 상품 리스트 추가 json
$(document).ready(function(){
	$.ajax({
	    type : "POST",
	    url : "/workplace/getlist.do",
	    data : {hostSeq : hostSeq},
	    datatype : "json",
	    beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);
	    }, success : function(data){
		    	var div = $('#workplaceList');
		    	div.empty();
		    	var divHtml = "";
	    	if(data.List.length > 0){
		    	$.each(data.List, function(index,val){
		    		divHtml += 	"<div class='card card-primary card-outline'>" +
									"<div class='card-body'>" +
										"<div class='callout callout-info'>" +
											"<h5>사업장 명</h5>" + "<p>" + val.workplaceName + "</p>" +
										"</div>" + 
										"<div class='callout callout-info'>" +
											"<h5>운영 시간</h5>" + "<p>" + val.workplaceStartTime + " ~ " + val.workplaceEndTime + "</p>" +
										"</div>" + 
										"<div class='callout callout-info'>" +
											"<h5>사업장 상태</h5>" + "<p>" + val.workplaceStatus + "</p>" +
										"</div>" + 
										"<div id='To_Detail'>" +
											"<form action='/workplace/detail' method='POST'>" +
												"<input type='hidden' name='workplaceSeq' value='" + val.workplaceSeq + "'>" +
												"<input type='hidden' name='${_csrf.parameterName}'	value='${_csrf.token}'>" +
												"<button type='submit' class='btn btn-block btn-outline-info btn-flat'>상세 정보</button>" +
											"</form>" +
										"</div>" +
										"<div id='To_List'>" +
											"<form action='/product/list' method='POST'>" +
												"<input type='hidden' name='workplaceSeq' value='" + val.workplaceSeq + "'>" +
												"<input type='hidden' name='${_csrf.parameterName}'	value='${_csrf.token}'>" +
												"<button type='submit' class='btn btn-block btn-outline-info btn-flat'>상품 목록</button>" +
											"</form>" +
										"</div>" +
									"</div>" +
								"</div>";
		    	});
	    	}else {
	    		divHtml += 	"<div class='alert alert-danger'>" +
	    						"<h5>사업장이 존재하지 않습니다.</h5>" +
	    						"<h5>사업장을 추가해주세요.</h5>" +
	    					"</div>";
	    	}
	            div.append(divHtml);
            $('.overlay-wrapper').toggle();
	    }, error : function(xhr, status, e) {
	        alert('Error');
	    }
	});
});

</script>
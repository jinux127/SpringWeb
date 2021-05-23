<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var workplaceSeq = "${workplaceSeq}";

//시간 단위 선택 시 input과 select의 값을 합쳐 unitTime에 값 입력
$('.unitTime').change(function(){
	var unitTimeInput = $('#unitTimeInput').val();
	var unitTimeSel = $('#unitTimeSel').val();
	var val = "";
	
	if(unitTimeInput != "" && unitTimeInput != null && unitTimeSel != "" && unitTimeSel != null ){ //값이 하나라도 비어있을시 비어있는 값 입력
		val = unitTimeInput + unitTimeSel;
	}else{
		val = "";
	}
	
	$('input[name=unitTime]').val(val)
});

//상품 등록, 사업장 상세 페이지 이동
function productRegist() {
	$.ajax({
        type : "POST",
        url : "/product/insert.do",
        data : $('#ProductInfo').serialize(),
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(data){
        	$('#GoBack').submit();
        }, error : function(xhr, status, e) {
            alert('Error');
        }
	});
}
</script>
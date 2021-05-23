<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

function insertResv() {
	
}
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
});



</script>
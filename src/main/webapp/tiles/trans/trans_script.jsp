<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
// 버튼 클릭
$('#btn_trans').click(function(){
	alert('버튼클릭');
	$.ajax({
	    type : "POST",
	    url : "https://translation.googleapis.com/language/translate/v2",
	    data : {
	    		"q": ["Helllo world","My name is Jeff"],
	    		"target": "ko",
	    		"key":"AIzaSyCWV9SnNF-ru47xLHJw0EqBCrHpgOAb--o"
	    		}
	    ,datatype : "json"
	    ,success : function(data){
			alert(data);
	    }, error : function(xhr, status, e) {
	        alert('전송 실패 e: '+ e);
	    }
	});
});

</script>

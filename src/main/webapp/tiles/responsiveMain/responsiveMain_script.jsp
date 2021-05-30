<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>

$(document).ready(function(){
	getAllList();
});


function getAllList(){
	$.ajax({
	    type : "POST",
	    url : "/responsive/getAllList.do",
	    datatype : "json",
	    success : function(data){
	    	$.each(data.List, function(index,val){
	    		console.log(val.no);
	    		console.log(val.title);
	    		console.log(val.content);
	    	});
	    }, error : function(xhr, status, e) {
	        alert('Error');
	    }
	});
	
}


</script>
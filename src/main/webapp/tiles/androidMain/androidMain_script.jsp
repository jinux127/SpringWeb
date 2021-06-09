<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>

var i = 1;
function btn_retrofit1() {
	++i;
	$("#btn1").val('Retrofit'+i);
	Android.showToast("눌리나");
}

/* 
$(document).ready(function(){
	getAllList();
});


function getAllList(){
	$.ajax({
	    type : "POST",
	    url : "/responsive/getAllList.do",
	    datatype : "json",
	    success : function(data){
	    	console.log(data);
			var body = $("#boardTable > tbody");
			body.empty;
			var bodyHtml = "";
			$.each(data.data,function(index,val){
				bodyHtml += "<tr>"+
								"<td>" + val.no + "</td>" +
								"<td>" + val.title + "</td>" +
							"</tr>";								
			});
			
			body.append(bodyHtml);
	    }, error : function(xhr, status, e) {
	        alert('Error');
	    }
	});
	
}
 */
 
</script>
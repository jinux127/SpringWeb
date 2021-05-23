<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

$(document).ready(function(){
	getWifiCheckList();
});
 
function getWifiCheckList() {
	$.ajax({
		type : "POST",
		url : "/wifiCheckList.ajax",
		data : $("listForm").serialize(),
		datatype : "json",
		beforeSend : function(xhr){
	        xhr.setRequestHeader(header, token);},
	    success : function(data) {
	    	var tableBody = $('#wifiTable > tbody');
	    	tableBody.empty();
	    	
	    	var htmlBody = "";
	    	
	    	if(data.checkList.length == 0) {
	    		htmlBody += "<tr>" + 
	    				    "<td scope='row' colspan='3'>no data</td>" + 
	    				    "</tr>";
				tableBody.append(htmlBody);
	    	} else {
		    		$.each(data.checkList, function(key, value) {
		    			htmlBody += "<tr>" + 
								    "<td scope='row'>" + 
								    "<div class='media align-items-center'>" + 
								    "<a href='#' class='avatar rounded-circle mr-3'>" + 
								    "<imt alt='Image placeholder' src='/static/img/wifi/sketch.jpg'/></a>" +
								    "<div class='media-body'>" + 
								    "<span class='mb-0 text-sm'>" + value.level + "</span>" +
								    "</div></div>" + 
								    "</td>" +
								    "<td>" + 
								    "<span class='badge badge-dot mr-4'>" +
								    "<i class='bg-warning'>" + value.bssid + "</i>" +
								    "</span>" +
								    "<td>" +
								    "<a href='#' class='btn btn-primary'>" + "See all" + "</a>" +
								    "</td>" + 
								    "</tr>";
					tableBody.append(htmlBody);		
	    		});
	    	}
	    }
	});
}

//

</script>
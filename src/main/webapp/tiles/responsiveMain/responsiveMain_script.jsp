<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>

$(document).ready(function(){
	getAllList();
	Android.getAndroidLocale("핸드폰 로컬정보조회");
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
// country, language
function getLocaleEx(language,country) {
	$("#country").val(country);
	$("#language").val(language);
// 	alert("country: "+country+"\nlanguage: "+language);
}

function getLocale(language,country){
	
	$("#country").val(country);
	$("#language").val(language);
	
	if (language != "" || language != null ||country != "" || country != null) {
		language = "ko";
		country = "KR";
	}
	
	$.ajax({
        type : "POST",
        url : "/responsive/localeEx.do",
        datatype : "json",
        data : {"country":country,
        		"language":language},
        success : function(data){
        	console.log(data);
	        var select =$('#LocaleSelect');
	        select.html("");
	        var options = "<option value=''>select</option>";
	        $.each(data.data, function(key,value){
	        	if(value.country == country) {
		        	options += "<option value = "+ value.country +" selected>" + value.TranslateCountry+ "</option>";

	        	}else{
		        	options += "<option value = "+ value.country +">" + value.TranslateCountry+ "</option>";
	        	}
	        });
	        select.html(options);
        }, error : function(xhr, status, e) {
            alert('실패');
        }
	});
	
}
</script>
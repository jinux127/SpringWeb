<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script type="text/javascript" src="/static/plugins/jquery-3.5.1.min.js"></script>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

$(document).ready(function(){
	if (typeof Android == "undefined") {
		console.log('Not Android');
	}else{
		var AndroidToken = Android.getAndroidToken();
		updateToken(AndroidToken);
	}
	
	
	});


function updateToken(AndroidToken) {
	var AndroidToken = AndroidToken;
	var userId = $('#userId').val();
	$.ajax({
		url:"/updateToken",
		type:"POST",
		data: {"AndroidToken" : AndroidToken,
				"userId" : userId},
		datatype:"json",
		beforeSend: function(xhr){
            if(token && header) {
                xhr.setRequestHeader(header, token);
            } // 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
    	},success:function(){
    		console.log("성공");
		},error:function(xhr,status,e){
            console.log("xhr:"+ xhr+"\nstatus:"+status+"\ne:"+e);
        }
	});
}

</script>
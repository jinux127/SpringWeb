<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="/static/img/TRMS_LOGO.png">
	<!-- adminLTE 적용 -->
	<link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="/static/css/adminlte/adminlte.css">
	<script type="text/javascript" src="/static/plugins/jquery-3.5.1.min.js"></script>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	<meta name="_csrf" content="${_csrf.token}" />
	<style type="text/css">
			body{
				background-color: #f8f9fa;
			}
			#all{
				background-color : white;
				width: 100%;
				padding: 50px;
			}
			#bankAllDiv, #BTNDiv{
				margin-top : 10%;
				text-align: center;
			}
			input#userId{
				float: left;
				width: 59%;
				margin-right: 1%;
			}
			#idChk{
				float: left;
				width: 39%;
			}
			#pwChk{
				text-align: center;
				color : #666;
			}
			#password, #passwordChk{
				float : left;
				width: 50%;
			}
			input[name=hostName]{float: left; width: 40%;}
			input[name=hostTel]{float: left; width: 60%;}
			/* input type=number의 화살표 제거 */
			input[type="number"]::-webkit-outer-spin-button,
			input[type="number"]::-webkit-inner-spin-button {
			    -webkit-appearance: none;
			    margin: 0;
			}
		@media ( min-width :601px) {
			#all{
				width: 500px;
				height : 600px;
				margin : 150px auto;
				padding: 50px;
				border: 2px solid #007bff;
				border-radius: 25px;
			}
		}
		@media ( min-width :1024px) {
			#all{
				width: 1000px;
				height : 600px;
				padding: 50px;
			}
			#idAllDiv, #bankAllDiv, #BTNDiv{
				width: 50%;
				float: left;
				margin-top : 3%;
			}
			#logoDiv{
				width: 45%;
				height: 450px;
				float : right;
				background-image: url('/static/img/background/cat3.png');
				background-repeat: no-repeat;
				background-size: cover;
				border-radius : 25px; 
			}
		}
	</style>
</head>
<body>
	<div id="all">
		<h1 style="text-align: center;">회원가입</h1>
		<form method="post" id="joinfrm" name="joinfrm" action="/user/register">
		
			<!-- 아이디 비밀번호 입력창 -->
			<div class="card card-primary card-outline" id="idAllDiv">
				<div class="card-body">
					<div>
						<input class="form-control" type="text" name="userId" id='userId' placeholder="아이디" autocomplete="off" >
						<button type="button" class="btn btn-primary" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
					</div>
					<div>
						<input style="height: 100%;" class="form-control" type="password" name="password" id='password' placeholder="비밀번호">
						<input class="form-control" type="password" name="passwordChk" id='passwordChk' placeholder="확인">
					</div>
					<div id="pwChk">
						<span id="alert-success">비밀번호가 일치합니다.</span>
						<span id="alert-danger">비밀번호가 일치하지 않습니다.</span>
					</div>
					<div>
						<input class="form-control" type="text" name="hostName" maxlength="10" autocomplete="off" placeholder="이름">
						<input class="form-control" type="tel" name="hostTel" maxlength="13" autocomplete="off" placeholder="전화번호">
					</div>
				</div>
			</div>
			<div id="logoDiv"></div>
			<!-- 계좌 정보 입력창 -->
			<div class="card card-primary card-outline" id="bankAllDiv">
				<div class="card-body">
					<div>
						<select class="form-control" id="bankName" name="bankName"></select>
					</div>
					<div>
						<input class="form-control" type="text" id="depositorName" name="depositorName" autocomplete="off" placeholder="예금주 명">
					</div>
					<div>
						<input class="form-control" type="number" id="accountNumber" name="accountNumber" autocomplete="off" placeholder="계좌 번호(-제외)">
					</div>
				</div>
			</div>		
			<!-- 토큰 값 -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<div id="BTNDiv">
			<input type="button" class="btn btn-primary" id="join" value="회원가입" disabled="disabled"/>
			<button class="btn btn-primary" id="cancle" type="button">취소</button>
		</div>
	</div>
<script src="../../static/plugins/inputmask/jquery.inputmask.bundle.js"></script>
<script type="text/javascript">
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");

	//전화번호 -자동입력
	$('input[name=hostTel]').inputmask({
		mask : '999-9999-9999',
		placeholder : '',
		showMaskOnHover : false,
		showMaskOnFocus : false
	});
	
	$(document).ready(function(){
		// 	패스워드 체크
		$(pwdChk);
		// 	은행 리스트 조회
		banklist();
		// 	취소
		$("#cancle").on("click", function(){
			alert('cancle');
			location.href = "/user/login";
		})
		//  회원가입	
		$("#join").on("click", function(){
			
			if($("#userId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if($("#password").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			
			if(idChkVal == "N"){
				alert("중복확인을 해주세요.");
				return false;
			}else if(idChkVal == "Y"){
				$("#joinfrm").submit();
			}
		});
	})
	
	// 패스워드 일치 체크
	function pwdChk() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#password").val();
			var pwd2 = $("#passwordChk").val();
			if (pwd1 !=""|| pwd2 != "") {
				if (pwd1 == pwd2) { // 일치
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#join").removeAttr("disabled");
				}else if (pwd1 == "" || pwd1 == null || pwd2 == "" || pwd2 == null){ // 둘 중 하나 공백
					$("#alert-success").hide();
					$("#alert-danger").hide();
					$("#join").attr("disabled", "disabled");
				}else { // 미일치
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#join").attr("disabled", "disabled");
				}
			}
		});
	}
	
	// 아이디 중복 체크
	function fn_idChk(){
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
	
		$.ajax({
			url : "/user/idChk",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val()},
			beforeSend : function(xhr)
			{
				xhr.setRequestHeader(header, token);
			},
			success : function(data){
				if(data == 1){
					$("#idChk").attr("value", "N");
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			},error: function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    // 에러가 발생한 경우
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			  }
		})
	}
	
	//은행 목록 호출
	function banklist(){
		$.ajax({
	        type : "POST",
	        url : "/user/getbank.do",
	        datatype : "json",
	        beforeSend : function(xhr){
	            xhr.setRequestHeader(header, token);
	        }, success : function(data){
		        var select = $('#bankName');
		        select.html("");
		        var options = "<option value=''>은행 선택</option>";
		        $.each(data.bank, function(i,val){
		        	options += "<option>" + val.bank + "</option>";
		        });
		        select.html(options);
	        }, error : function(xhr, status, e) {
	            alert('은행 목록 호출 실패');
	        }
		});
	}
</script>
</body>
</html>
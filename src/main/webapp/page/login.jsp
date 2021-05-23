<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="/static/css/adminlte/adminlte.css">
	<link rel="shortcut icon" href="/static/img/TRMS_LOGO.png">
	<meta charset="UTF-8">
	
<!-- 	<meta name="viewport" content="width=device-width, -->
<!-- 								   user-scalable=no,  -->
<!-- 								   target-densitydpi=medium-dpi" /> -->
	<title>Login Page</title>
	
	<script type="text/javascript" src="/static/plugins/jquery-3.5.1.min.js"></script>
	
	<style type="text/css">
		/* 모바일 css */
		/* 전체 배경 색 */
    	body{background-color: #f8f9fa;}
    	/* 로그인 창 위치 조절 */
    	#div_login{
	        position: absolute;
	        top:10%;
	        left:10%;
	        margin: auto;
	        width: 80%;
	        height: 80%;
	        
    	}
    	a{font-size: 30px;}
		a:link { color: #444444; text-decoration: none;}
		a:visited { color: #444444; text-decoration: none;}
		a:hover { color: black; text-decoration: none;}
		label {font-size: 20px;}
		input[type=submit]{width: 100%; height: 100%; font-size : 40px; }
		td{text-align: center;width: 100%; height: 20%;}
		table{width: 100%; height: 90%;}
		form{width: 100%; height: 90%;}
		h2{text-align:center;}	
		input[name=userId], input[name=password]{width: 100%; height: 100%; font-size : 40px; border: 2px solid #444444;}
		span{font-size:20px;}
		input[type=submit] {-webkit-appearance:none;}
	
		@media (min-width:1024px){
		    /* 로그인 창 위치 조절 */
		    #div_login{ 
		    	position : absolute;
		    	width: 450px;
	       		height: 500px;
		    	top : 25%;
		    	left : 35%;
		    	text-align: center;
		    	font-size: 15px;
		    }
		    table{
		    	width: 90%;
 		    	margin: auto;
		    }
		    input#userId, input#password{
		    	width: 100%;
		    	font-size: 30px;
		    }
		    input[type=submit]{
		    	width: 40%;
		    }
		}
	</style>
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	<meta name="_csrf" content="${_csrf.token}" />
</head>

<body>
	<div id="div_login" class="card">
		<div class="card-body login-card-body">
			<h2><b>통합 예약 관리</b></h2>
			<form action= "<c:url value='/login'/>"method="POST">
				<table>
					<tr>
						<td>
							<input type='text' id="userId" name='userId' value="${userId}" placeholder="아이디" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type='password' id="password" name='password' placeholder="비밀번호" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" id="remember-me" name="remember-me" />
							<label for="remember-me">Remember Me</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" class="btn btn-block btn-warning" value="로그인">
						</td>
					</tr>
					<tr>
						<td>
							<span>${requestScope.loginFailMsg}</span>
						</td>
					</tr>
					<tr>
						<td>
	                        <a href="/user/join">회원가입</a>
	                    </td>
	                </tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
				<input type="hidden" id="token" name = "token" />
			</form>
			<sec:authorize access="isAuthenticated()">
			        <input type="hidden" id="checkUserId" value='<sec:authentication property="principal.username"/>'>
			</sec:authorize>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		chkUserId()
	})
	function chkUserId() {
		var chkId = $('#checkUserId').val();
		if (chkId !== undefined) {
			 location.href="/"; 
		}else{
		}
	}
</script>

</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<% response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0); if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); %>
<!DOCTYPE html>
<html>
<head>
	<!-- adminLTE 적용 -->
	<link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="/static/css/adminlte/adminlte.css">
	<!-- 풀캘린더 -->
	<link href='/static/plugins/packages/core/main.css' rel='stylesheet' />
	<link href='/static/plugins/packages/daygrid/main.css' rel='stylesheet' />
	<link href='/static/plugins/packages/timegrid/main.css' rel='stylesheet' />
	<link href='/static/plugins/packages/list/main.css' rel='stylesheet' />
	<!-- 파비콘 -->
	<link rel="shortcut icon" href="/static/img/TRMS_LOGO.png">
	<!-- 타일즈 css -->
	<link rel="stylesheet" href="/static/css/basic.css">
	<!--     DatePicker -->
<!--     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

	<meta name="_csrf_header" content="${_csrf.headerName}" />
	<meta name="_csrf" content="${_csrf.token}" />
	<meta charset="UTF-8" >
	<!-- WebView 커지는 현상 방지 설정값-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>
<header>

	<div class="header">
		<nav style="text-align: center;">
			<a href="/"><img src="/static/img/title/title5.png" alt="통합예약관리 시스템" class="titleImg"></a>
			<div style="float: right;">
				<sec:authorize access="isAnonymous()">
					<h5>
						<a href='<c:url value="/user/login"/>'>LOGIN</a> 로그인 해주세요.
					</h5>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<form action="/logout" method="POST">
						<input type="submit" class="btn btn-block btn-outline-secondary" value="LOGOUT" />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</sec:authorize>
			</div>
		</nav>
	</div>


</header>
<body>

	<div class="padding top"></div>
	<div class="content">
        <tiles:insertAttribute name="content" />
    </div>
	<div class="padding bottom"></div>	

<!-- 스크립트 파일 목록 -->

<!-- jquery 3.5.1 호출 -->
<script src="/static/plugins/jquery-3.5.1.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/static/plugins/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="/static/plugins/adminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/jszip/jszip.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/pdfmake/pdfmake.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/pdfmake/vfs_fonts.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/static/plugins/adminLTE/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- adminLTE js  -->
<script src="/static/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<!-- 풀캘린더  -->
<script src='/static/plugins/packages/core/main.js'></script>
<script src='/static/plugins/packages/interaction/main.js'></script>
<script src='/static/plugins/packages/daygrid/main.js'></script>
<script src='/static/plugins/packages/timegrid/main.js'></script>
<script src='/static/plugins/packages/list/main.js'></script>
<!-- 다음주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- inputmask (전화번호 자동입력)-->
<script src="/static/plugins/inputmask/jquery.inputmask.bundle.js"></script>
<!-- datepicker -->
<!-- <script src="/static/plugins/datetimepicker/jquery.datetimepicker.full.js"></script> -->

<tiles:insertAttribute name="script" />


    
    
    
</body>


</html>
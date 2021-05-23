<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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

<meta charset="UTF-8">
</head>
<body>
    <tiles:insertAttribute name="content" />
    
    
    
    <!-- 스크립트 파일 목록 -->

<!-- jquery 3.5.1 호출 -->
<script src="/static/plugins/jquery-3.5.1.min.js"></script>
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
    
    
    
    
    
    
    <tiles:insertAttribute name="script" />
</body>
</html>
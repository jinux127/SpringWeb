<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/static/css/basic.css">
<link rel="shortcut icon" href="/static/img/TRMS_LOGO.png">
<link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/static/css/adminlte/adminlte.css">

<script type="text/javascript" src="/static/plugins/jquery-3.5.1.min.js"></script>

<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
    <div class="content" style="text-align: center;">
		<h3>Welcome</h3>
		<h3>안녕하십니까마귀</h3>
		<h3>어서오세요구르트</h3>

		<div>
			<button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="location.href='/home'">HOME</button>
			<button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="location.href='/workplace/list'">사업장 목록 페이지</button>
      <button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="location.href='/host/mypage'">마이페이지</button>
			<button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="wifiScan()">위치 등록</button>
			<button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="bluetooth()">블루투스</button>
			<button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="jwTest()">테스트</button>
			<button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="location.href='/map/mapTest'">맵 테스트</button>
			<button type="button" class="btn btn-block btn-outline-info btn-lg" onclick="location.href='/wifiCheck'">WIFI APPLEPIE</button>
		</div>
    </div>

    <script type="text/javascript">
    	function wifiScan() {
    		if (typeof Android == "undefined") {
    			console.log('Not Android');
    		}else{
    			Android.getWifiList();
    		}
		}

    	function bluetooth() {
    		if (typeof Android == "undefined") {
    			console.log('Not Android');
    		}else{
    			Android.getBluetooth();
    		}
		}

    	function jwTest() {
    		if (typeof Android == "undefined") {
    			console.log('Not Android');
    		}else{
    			Android.getRecyclerViewTest();
    		}
		}



    </script>
</body>
</html>

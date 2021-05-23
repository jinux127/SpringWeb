<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script type="text/javascript" src="/static/plugins/jquery-3.5.1.min.js"></script>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(36.633535, 127.425882), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var x;
var y;
function mapChoice(roadAdrress) {
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(roadAdrress, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			y = result[0].y;
			x = result[0].x;
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">격리지역</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
}


$('#zonecodeSearch').click(function(){
	sample3_execDaumPostcode();
});
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
  // iframe을 넣은 element를 안보이게 한다.
  element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
	// 현재 scroll 위치를 저장해놓는다.
	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	new daum.Postcode({
	    oncomplete: function(data) {
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('zoneCode').value = data.zonecode;
	        document.getElementById("roadAddress").value = data.roadAddress;
	        mapChoice(data.roadAddress);
	        // 커서를 상세주소 필드로 이동한다.
	        document.getElementById("detailAddress").focus();
	
	        // iframe을 넣은 element를 안보이게 한다.
	        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	        element_wrap.style.display = 'none';
	
	        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	        document.body.scrollTop = currentScroll;
	    },
	    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	    onresize : function(size) {
	        element_wrap.style.height = size.height+'px';
	    },
	    width : '100%',
	    height : '100%'
	}).embed(element_wrap);
	
	// iframe을 넣은 element를 보이게 한다.
	element_wrap.style.display = 'block';
}


/* 로컬 db 저장  */
function insertAddress() {
	var address1 = document.getElementById('roadAddress').value;
	/* DB에 안드로이드 여부 상관없이 저장 */
	insertMapData(x,y,address1);
	
	if (address1 == null) {//주소가 없으면
		alert("주소 없음");
	}else{ //주소가 있고
		if (typeof Android == "undefined") { //안드로이드가 아니면
			console.log('Not Android');
		}else{//안드로이드이면
			Android.insertAddress(address1);
		}
	}
	
}

function insertMapData(x,y,address) {
	$.ajax({
	    type : "POST",
	    url : "/map/insertMapData.do",
	    data : {map_lat : x, map_lng : y, map_address : address},
	    success : function(data){
	    	alert('성공');
	    }, error : function(xhr, status, e) {
	        alert('실패');
	    }
	});
}

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/map/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
 		document.form.userAddr.value = roadFullAddr +" " + entX +" "+ entY; 
		/* $("#userAddr").val(roadFullAddr); */
}

</script>
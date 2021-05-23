<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>맵 테스트!!</title>
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	<meta name="_csrf" content="${_csrf.token}" />
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=5f8b0f5c485f9edae6514d50d952ffb7&libraries=services"></script>
    
</head>

<body>
	<form id= "form" name="form" method="POST">
		<div id="map" style="width:100%;height:400px;"></div>
		<table>
			<tbody>
				<tr>
					<td>
						<!-- 주소 정보 -->
						<div class="card card-primary card-outline" id="AddressDIV">
							<div class="card-header"><h5>주소 정보</h5></div>
							<div class="card-body">
								<table>
									<tr>
										<th>우편 번호</th>
										<td><input class="form-control" type="text" id="zoneCode"name="zoneCode" readonly="readonly"></td>
										<td><input type="button" class="btn btn-primary disable addrselbtn" id="zonecodeSearch"  value="우편번호 검색" ></td>
									</tr>
									<tr>
										<th>도로명주소</th>
										<td colspan="2"><input class="form-control" type="text" id="roadAddress" name="roadAddress" readonly="readonly"></td>
									</tr>
									<tr>
										<th>상세 주소</th>
											<td colspan="2"><input class="form-control readonly" type="text" id="detailAddress" name="detailAddress" autocomplete="off"></td>
										<td>
											
										</td>
									</tr>
								</table>
								<div id="wrap">
												<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn btn-warning" onclick="goPopup()">도로명주소 검색</button>
						<input type="text" id="userAddr" name="userAddr" class="form-control" placeholder="Enter Addr" required="true" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<button class="btn btn-primary mod" onclick="insertAddress('test')">로컬 저장 </button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
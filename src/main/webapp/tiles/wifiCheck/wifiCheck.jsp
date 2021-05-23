<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <link rel="stylesheet" href="/static/css/wifi/nucleo.css"/>
    <link rel="stylesheet" href="/static/css/wifi/all.min.css"/>
    <link rel="stylesheet" href="/static/css/wifi/argon-dashboard.css?v=1.1.2"/>
    <link rel="stylesheet" href="/static/css/wifi/wifiCheck.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta charset="UTF-8">
<title>감염자 리스트</title>
</head>
<body>
	<form id="listForm" name="listForm" method="post" action="/leaveAt">
	<input type="hidden" name="pageNo" id="pageNo" />
		<div class="main-content">
			<div class="form-group mb-0 search-inline">
				<div class="input-group input-group-alternative">
					<div class="input-group-prepend">
						<span class="input-group-text">
							::이름
						</span>
					</div>
					<input class="form-control">
				</div>
			</div>
			<div class="form-group mb-0 search-inline">
				<div class="input-group input-group-alternative">
					<div class="input-group-prepend">
						<span class="input-group-text">
							::날짜
						</span>
					</div>
					<input class="form-control">
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header border-0">
								<h3 class="mb-0">격리자 현황</h3>
							</div>
							<div class="table-responsive">
								<table class="table align-items-center table-flush" id="wifiTable">
									<thead class="thead-light">
										<tr>
											<th scope="col">test1</th>
											<th scope="col">test2</th>
											<th scope="col">test3</th>
										</tr>
									</thead>
									<tbody>
										<!-- <tr>
											<td scope="row">
												<div class="media align-items-center">
													<a href="#" class="avatar rounded-circle mr-3">
														<img alt="Image placeholder" src="/static/img/wifi/sketch.jpg">
													</a>
													<div class="media-body">
				                          				<span class="mb-0 text-sm">TTEESSTT</span>
				                        			</div>
												</div>
											</td>
											<td>
												<span class="badge badge-dot mr-4">
													<i class="bg-warning"></i>기무띠
												</span>
				                      		</td>
				                      		<td>
				                      			<a href="#" class="btn btn-primary">See all</a>
				                      		</td>
										</tr> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
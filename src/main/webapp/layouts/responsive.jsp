<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style type="text/css">
		#main-menu,
		#android-menu,
		#sub-menu{
			margin: 0;
			padding: 0;
			list-style-type: none;
		}
	
		#rs-container{
			width: auto;
	        margin: 10px auto;
	        padding: 1%;
	        border: 1px solid #bcbcbc;
	        overflow: auto; <!-- 빠져나오는거 감싸줌-->
		}
		#rs-header{
			padding: 20px;
	        margin-bottom: 20px;
	        border: 1px solid #bcbcbc;
		}
		#rs-content{
			width: 70%;
	        padding: 20px;
	        margin-bottom: 20px;
 	        float: right;
	        border: 1px solid #bcbcbc;
		}
		#rs-sidebar{
			width: 20%;
	        padding: 20px;
	        margin-bottom: 20px;
 	        float: left;
	        border: 1px solid #bcbcbc;
		}
		#rs-footer{
			clear: both;
	        padding: 20px;
	        border: 1px solid #bcbcbc;
		}
		@media ( max-width: 920px ) {
		
	        #rs-container {
	          width: auto;
	        }
	        #rs-content {
	          float: none;
	          width: auto;
	        }
	        #rs-sidebar {
	          float: none;
	          width: auto;
	        }
	    }
	</style>
</head>
<body>
	<div id="rs-container">
	
		<div id="rs-header">
			<h1> Responsive Web Ex</h1>
		</div>
		<div id="rs-sidebar">
			
			<ul id="main-menu">
	          <li><a href="#">MENU</a>
	          	<ul id="sub-menu">
	          		<li><a href="#">Menu1</a></li>
	          		<li><a href="#">Menu2</a></li>
	          		<li><a href="#">Menu3</a></li>
	          	</ul>
	          </li>
	        </ul>
			<br>
			<ul id="android-menu">
	          <li><a href="/responsive/androidMain">Android MENU</a>
	          	<ul id="sub-menu">
	          		<li><a href="/responsive/androidMain">Menu1</a></li>
	          		<li><a href="#">Menu2</a></li>
	          		<li><a href="#">Menu3</a></li>
	          	</ul>
	          </li>
	        </ul>
        </div>
		<div id="rs-content">
			<tiles:insertAttribute name="content" />
		</div>
		
	</div>
	
	<div id="rs-footer">
		<p> JJW</p>
	</div>
	
	<script type="text/javascript" src="/static/plugins/jquery-3.5.1.min.js"></script>
	<tiles:insertAttribute name="script" />
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			androidChk();
		});
		function androidChk() {
			if (typeof Android == "undefined") {
				$("ul").remove("#android-menu");
			}
		}
	</script>
</body>
</html>
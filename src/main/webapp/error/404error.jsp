<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%  response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>404error</title>
</head>
<body>
   <table width="100%" height="80%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="100%" height="100%" align="center" valign="middle" style="padding-top: 150px;">
       			<a href="/"><img src="/static/img/error/404page.png" alt="404error"style="width:100%;"></a>
       			<div class="content" style="text-align: center;">
       				<button type="button" class="btn btn-block btn-outline-info btn-lg"  onclick="location.href='/'">메인화면</button>
       			</div>
            </td>
        </tr>
    </table>


</body>
</html>
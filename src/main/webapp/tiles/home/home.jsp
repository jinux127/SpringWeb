<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="_csrf" content="${_csrf.token}" />
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. ${data} </P>
<br>
<c:forEach var="listMap" items="${listMap}">
    ${listMap.name}<br>
</c:forEach>
<table>
<tbody>
<tr>
<td>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.username" var="userId" />
<input type="text" id="userId" value= "${userId}">
</sec:authorize></td>
</tr>

</tbody>

</table>




</body>
</html>
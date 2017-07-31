<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

</head>

<body>

	<table>
            <tr>
                <td>${memberinfo.id}</td>
                <td>${memberinfo.password}</td>
                <td>${memberinfo.name}</td>
                <td>${memberinfo.email}</td>
                <td>${memberinfo.phone}</td>
            </tr>
<!--
		<c:forEach var="member" items="${list }" varStatus="status">\
            <td>${status.index}</td>
		</c:forEach>
-->
	</table>

</body>
</html>
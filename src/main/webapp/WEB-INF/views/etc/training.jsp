<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/training.css">
        <link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
		
		<script src='/resources/js/jquery-3.1.0.js'></script>
        <script src='/resources/js/jquery-ui.js'></script>
		<script src="/resources/js/common.js"></script>

	</head>
	<body>

<!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

	<!-- program  -->

	<div class='wrap'>
	<!--  좌측메뉴 -->
		<div class='side_menu'>
			<div><h3>여름수련회</h3></div>
			<ul>
				<li><a href='training.jsp'><h5>여름수련회 소개</h5></a></li>
			</ul>
		</div>
	<!--  우측내용 -->
		<div class='training_content'>
			<div class=''>
				<div class='training_tit01'>
					<p>여름수련회 소개</p>
				</div>
				<div class='training_tit02'>
					<div><img src='/resources/img/training01.jpg'/></div>
                    <p class='f1'><strong></strong></p>
                    <p class='f2'></p>
                    <p class='f3'><span></span></p>
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->
    <div class='footer'>
        <%@ include file="../header_footer/footer.jsp" %>
    </div>
    
    <script></script>

	</body>
	</html>

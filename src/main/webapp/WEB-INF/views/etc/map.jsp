<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/map.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">

		<script src='/resources/js/jquery-3.1.0.js'></script>
		<script src='/resources/js/jquery-ui.js'></script>
		<script src='/resources/js/common.js'></script>

	</head>
	<body>

<!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

<!-- content -->
	<div class='wrap'>
	<!-- 좌측메뉴 -->
		<div class='side_menu'>
			<div><h3>템플스테이</h3></div>
			<ul>
				<li><a href='/etc/map'><h5>찾아오시는 길</h5></a></li>
			</ul>
		</div>
	<!-- 우측내용 -->
		<div class='map_content'>
			<div class=''>
				<div><h3>찾아오시는 길</h3></div>
				<div class='map_detail'>
					<div id='map'>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->

    <div class='footer'>
        <%@ include file="../header_footer/footer.jsp" %>
    </div>


	<script>
	    var map;
	    function initMap() {
	      	map = new google.maps.Map(document.getElementById('map'), {
	        center: {lat: 37.529607, lng: 127.067062},
	        zoom: 15,
	      });
	    };
    </script>

		<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9dM4RlcONOfGWs-58QxYVnCBO1IKMuNg&callback=initMap">
		</script>



	</body>
	</html>

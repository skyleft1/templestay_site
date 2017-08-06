<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/intro.css">
		
		<script src='/resources/js/jquery-3.1.0.js'></script>
		<script src='/resources/js/jquery-ui.js'></script>
		<script src="/resources/js/common.js"></script>
		<script>
		</script>

	</head>
	<body>

<!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

	<!-- intro -->

	<div class='wrap'>
	<!--  좌측메뉴 -->
		<div class='side_menu'>
			<div><h3>커뮤니티</h3></div>
			<ul>
                <li><a href='/etc/intro01'><h5>템플스테이란?</h5></a></li>
                <li><a href='/etc/intro02'><h5>템플스테이 소개</h5></a></li>
                <li><a href='/etc/monk'><h5>주지스님 인사말</h5></a></li>
                <li><a href='/etc/fac'><h5>시설 현황</h5></a></li>
			</ul>
		</div>
	<!--  우측내용 -->
		<div class='intro_content'>
			<div class=''>
				<div class='intro_tit01'>
					<p>월정사 템플스테이 소개</p>
				</div>
				<div class='intro_tit02'>
                    <p class='f1'>마음의 달이 아름다운 월정사 템플스테이</p>
                    <p class='f2'>월정사 팔각구층석탑에 걸린 달처럼 본래 우리 마음은 청정합니다. 하지만 삼독 (탐욕, 진에, 우치)에 가려져 가만히 바라보기엔 어려운 것이 현실입니다.</p>
					<div><img src='/resources/img/intro02.jpg'/></div>
                    <p class='f3'><strong>모든 번뇌를 내려놓고 '비움'의 미덕을 배워보시는 건 어떨까요?</strong></p>
                    <p class='f4'>월정사 템플스테이는 자연과 사람이 하나가 됩니다. 불교문화체험을 통해 어지러운 마음을 관조할 수 있고, 천년의 숲을 걸으며 마음을 보듬어 주는 시간을 가질 수 있습니다. 오대천 옛길을 걸으며 물소리와 친구가 되고, 산내 암자를 둘러보며 오대산의 불보살을 친견할 수 있습니다. <span>치유되는 자신을 만나고, 청정한 마음의 달을 발견할 수 있는 산사의 하루</span>가 되시길 바랍니다.</p>
                    <p class='f5'>월정사 템플스테이는 상시 운영하고 있으니 원하시는 때 참가하실 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->

    <div class='footer'>
        <%@ include file="../header_footer/footer.jsp" %>
    </div>


	</body>
	</html>

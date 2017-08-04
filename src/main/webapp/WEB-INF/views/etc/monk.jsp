<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/monk.css">
		
        <script src='/resources/js/jquery-3.1.0.js'></script>
		<script src="/resources/js/common.js"></script>
		<script>
		</script>

	</head>
	<body>

<!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

	<!-- monk -->

	<div class='wrap'>
	<!-- 좌측메뉴 -->
		<div class='side_menu'>
			<div><h3>커뮤니티</h3></div>
			<ul>
                <li><a href='/etc/intro01'><h5>템플스테이란?</h5></a></li>
                <li><a href='/etc/intro02'><h5>템플스테이 소개</h5></a></li>
                <li><a href='/etc/monk'><h5>주지스님 인사말</h5></a></li>
                <li><a href='/etc/fac'><h5>시설 현황</h5></a></li>
			</ul>
		</div>
	<!-- 우측내용 -->
		<div class='monk_content'>
			<div class=''>
				<div class='monk_tit01'>
					<p>주지스님 인사말</p>
				</div>
				<div class='monk_tit02'>
					<div class='monk_tit02_01'>
						<img src='/resources/img/monk01.jpg'/>
					</div>
					<div class='monk_tit02_02'>
						<p><strong><span>템플스테이 홈페이지</span>를 방문해 주신 여러분!<br> 반갑습니다.</strong></p>
						<p>월정사 템플스테이는 다양하고 복잡한 생활인으로서의 나는 잠시 벗어두고 전나무의 청량한 기운과 문수보살님의
							지혜의 공덕이 깃든 월정사에서 지혜를 배우고 참 나를 찾으러 떠나는 가장 쉬운 방법입니다.</p>
						<p>부처님과 제불 보살님의 넓고 자비로운 품안에서 지친 마음을 위로받고 바쁘게 걸어 온 길을 잠시 뒤돌아보시기
							바랍니다. 여럿이 손잡고 거닐어도 좁지 않을 만큼 충분히 넓은 천년의 전나무숲길을 가족끼리, 좋은 사람들끼리 손잡고
							묵언으로 걸어보면 다정하게 잡은 손의 온기를 느끼는 것만으로도 서로에게 큰 힘과 위안이 될 것입니다.</p>
						<p><span><strong>월정사 템플스테이의 모든 프로그램은 오만불보살님의 가피아래 넓고 깊은 대자연을 바탕으로 진행됩니다.</strong></span> 자연이
							들려주는 소리에 귀 기울이며 자신의 마음을 조용히 살펴보시기 바랍니다.</p>
						<p><strong>여러분께서 오대산과 월정사 그리고 부처님과 맺으신 선연善緣을 소중히 기억하겠습니다.</strong></p>
					</div>
				</div>
				<div class='monk_tit03'>
					<p><strong>천년숲길을 수천 명이 다녀갔다고 월정사와 숲길이 속(俗)스러워 지지는 않습니다.<br> 
					원래 그대로 있지요.</strong></p>
					<p><strong>- 월정사 주지 퇴우 정념 -</strong></p>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/fac.css">
		
		<script src='/resources/js/jquery-3.1.0.js'></script>
		<script src='/resources/js/jquery-ui.js'></script>
		<script src="/resources/js/common.js"></script>
		

	</head>
	<body>

<!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

	<!-- fac -->

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
		<div class='fac_content'>
			<div class=''>
				<div class='fac_tit01'>
					<p>시설 현황</p>
				</div>
				<div class='fac_tit02'>
                    <div>
                        <div>
                            <img src='/resources/img/fac01.jpg'>
                        </div>
                        <div>
                            <p><h10>템플스테이 사무실 지월당 (指月堂)</h10></p>
                            <p>템플스테이의 모든 업무를 진행하는 곳입니다.</p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <img src='/resources/img/fac02.jpg'>
                        </div>
                        <div>
                            <p><h10>적광전 (寂光殿)</h10></p>
                            <p>월정사의 큰 법당으로 석가모니부처님을 모신 곳입니다. 템플스테이 참가자가 새벽과 저녁 부처님께 예불을 올리는 곳입니다.</p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <img src='/resources/img/fac03.jpg'>
                        </div>
                        <div>
                            <p><h10>대법륜전 (大法輪殿)</h10></p>
                            <p>비로자나부처님을 모셨으며 템플스테이, 수련회, 출가학교 등의 프로그램이 진행됩니다.</p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <img src='/resources/img/fac04.jpg'>
                        </div>
                        <div>
                            <p><h10>종고루 (鐘鼓樓)</h10></p>
                            <p>종고루는 불교 의식에 쓰이는 사물이 보관된 곳으로 새벽과 저녁에 사물의식이 진행되며 종성체험이 이루어집니다.</p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <img src='/resources/img/fac05.jpg'>
                        </div>
                        <div>
                            <p><h10>보장각 (寶藏閣 월정사 성보박물관)</h10></p>
                            <p>대한불교조계종 제4교구 약 60여개의 전통사찰에 봉안된 성보문화재를 안전하게 보관, 보존하고 있으며 불, 법, 승 삼보를 전시주제로 삼아 불교문화유산을 전시하고 있습니다.</p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <img src='/resources/img/fac06.jpg'>
                        </div>
                        <div>
                            <p><h10>성적당 (性的堂)</h10></p>
                            <p>템플스테이 참가자 숙소입니다.</p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <img src='/resources/img/fac10.jpg'>
                        </div>
                        <div>
                            <p><h10>해우소 (화장실)</h10></p>
                            <p>깔끔한 현대식 시설을 갖춘 세면장입니다.</p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <img src='/resources/img/fac11.jpg'>
                        </div>
                        <div>
                            <p><h10>후원 (공양간, 식당)</h10></p>
                            <p>정갈하고 소박한 공양을 할 수 있는 곳입니다.</p>
                        </div>
                    </div>
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

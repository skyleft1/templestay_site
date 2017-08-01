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
				<li><a href='intro01.jsp'><h5>템플스테이란?</h5></a></li>
				<li><a href='intro02.jsp'><h5>템플스테이 소개</h5></a></li>
				<li><a href='monk.jsp'><h5>주지스님 인사말</h5></a></li>
				<li><a href='fac.jsp'><h5>시설 현황</h5></a></li>
			</ul>
		</div>
	<!--  우측내용 -->
		<div class='intro_content'>
			<div class=''>
				<div class='intro_tit01'>
					<p>템플스테이란?</p>
				</div>
				<div class='intro_tit02'>
                    <p class='f1'>템플스테이는 한국의 전통사찰에 머물며 사찰의 일상생활을 체험해봄으로써<br>
한국불교의 전통문화와 수행정신을 받아들이는 일입니다.</p>
                    <p class='f2'>템플스테이를 통해 스님들의 일상과 새벽예불, 참선수행, 발우공양, 다도 등 기본적인 수행생활을 체험하고, 전통사찰의 전각과 석탑, 부도, 불상, 불화 등 불교전통문화에 대한 친밀한 접근과 이해를 얻게 되며, 자연 속에서 어우러져 살아가는 삶의 본래 모습을 찾을 수 있게 됩니다.</p>
					<div><img src='/resources/img/intro01.jpg'/></div>
                    <p class='f3'><strong>템플스테이는 ‘사찰에 머무는 것’이 기본입니다.</strong></p>
                    <p class='f4'>그러나 템플스테이는 단지 사찰에 머무는 것에 그치지 않습니다. 새벽예불, 발우공양, 울력, 스님과의 다담, 참선 등 사찰에서 일어나는 일상 하나하나에 배어있는 한국불교의 역사와 전통은 1,600여년의 무게를 간직하고 있는 축적된 수행의 결과물이자 그 자체가 생각의 변화를 불러일으킬 수 있기 때문입니다.</p>
                    <p class='f5'><span>
‘불교’</span>라고 하는 종교적인 특징이외에도 자연친화적인 공간속에 한국의 정신문화적 전통을 올곧게 계승하며 생명존중사상의 깊이와 품위를 갖춘 우리 민족의 훌륭한 문화자산을 제대로 알고 체험하는데 템플스테이는 훌륭한 방편이 되어 줄 것입니다.</p>
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

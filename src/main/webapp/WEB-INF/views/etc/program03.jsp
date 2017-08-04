<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/program.css">
		
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

	<!-- program  -->

	<div class='wrap'>
	<!-- 좌측메뉴 -->
		<div class='side_menu'>
			<div><h3>여름수련회</h3></div>
			<ul>
                <li><a href='/etc/program01'><h5>휴식형 프로그램</h5></a></li>
                <li><a href='/etc/program02'><h5>체험형 프로그램</h5></a></li>
                <li><a href='/etc/program03'><h5>템플라이프</h5></a></li>
			</ul>
		</div>
	<!-- 우측내용 -->
		<div class='program_content'>
			<div class=''>
				<div class='program_tit01'>
					<p>템플라이프</p>
				</div>
				<div class='program_tit02'>
					<div>
					   <p><h11>템플라이프는?</h11></p>
					   <p>사찰의 문화와 산사의 고즈넉함을 단시간에 체험할 수 있는 프로그램으로서 잠시 '머뭄'에 그치는 것이 아니라 한국 불교의 전통을 느껴볼 수 있는 귀한 시간이 될 것입니다.</p>
                    </div>
					<div>
					   <p>ㆍ대   상 : 외국인 및 기업 연수, 수학여행, 체험학습 등</p>
					   <p>ㆍ시   간 : 2 ~3시간 이내</p>
					   <p>ㆍ선   택 : 2개 이내</p>
					   <p>ㆍ비   용 : 1인 20,000원 (공양시 5,000원 추가)</p>
					   <p>ㆍ기   간 : 연중 상시</p>
					   <p>ㆍ연락처 : 월정사 연수국 T. 033) 339-6606~7</p>
					</div>
				</div>
				<div class='program_tit03'>
					<div>
					   <p><h11>월정사 템플라이프 구성</h11></p>
					   <p>월정사 템플스테이는 <span>행복한 쉼</span>이 있습니다.</p>
					   <p>108염주 만들기 / 스님과의 차담 / 명상 / 전나무 숲길 걷기명상 / 연꽃등 만들기 / 성보박물관 해설 및 관람</p>
					</div>
					<div>
                       <img src='/resources/img/program01.jpg'>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/reserve.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">

		<script src='/resources/js/jquery-3.1.0.js'></script>
		<script src='/resources/js/jquery-ui.js'></script>
		<script src='/resources/js/common.js'></script>
		
		<script>
		
		</script>


	</head>
	<body>

<!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

<!-- content -->
	<div class=''>
		<div class='reserve_content'>
			<div class=''><h3>신청하기</h3>
				<div class=''>
					<form method='post' action=reserveAction.jsp>
                    <div></div>
						<input type='text' class ='calander1' name='' value=''>
                        <input type='text' class ='calander2' name='' value=''>

						<div>
                            <input type='button' class ='ex1' name='' value='연습'>
							<input type='submit' name='' value='신 청'>
                            <div class='result1'></div>
                            <div class='result2'></div>
						</div>
					</form>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">

<link rel='stylesheet' href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'>

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>

<script src='/resources/js/common.js'></script>



</head>
<body>

    <!-- header -->
    <div class='header'>
        <%@ include file="header_footer/header.jsp" %>
    </div>

    <!-- content -->
    <div class='content'>
        <!-- 메인사진-->
        <div class='main_content'>
            <div class='main_banner'>
                <!--  예약  -->
                <div class='reserve_content'>
                    <div class=''>
                        <div class=''>
                            <p>
                                <f1>마음의 달이 아름다운 절,</f1>
                            </p>
                            <p>
                                <f2>월정사 템플스테이</f2>
                            </p>
                        </div>
                        <div class='reserve'>
                            <form method='post' action=reserveAction.jsp>
                                <div></div>
                                <input type='text' class='calander1'
                                    name='' value='시작일'> <input
                                    type='text' class='calander2'
                                    name='' value='종료일'>
                                <div>
                                    <input type='submit' name=''
                                        value='신청하기'>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- 배너 3개 -->
        <div class='banner_content'>
            <div class=''>
                <div class='wrap_banner'>
                    <div class='notice'>
                        <div class=''>
                            <h3>게시판</h3>
                        </div>
                        <div class=''>
                            <ul>
                                <li>게시1 title n</li>
                                <li>게시2 title n-1</li>
                                <li>게시3 title n-2</li>
                                <li>게시4 title n-3</li>
                                <li>게시5 title n-4</li>
                            </ul>
                        </div>
                    </div>
                    <div class='gallery'>
                        <div>
                            <h3>포토갤러리</h3>
                        </div>
                        <div>
                            <div class='photo_size'>
                                <a href='#'> <img
                                    src='/resources/img/banner01.jpg' /></a>
                            </div>
                        </div>
                    </div>
                    <div class='program'>
                        <div>
                            <h3>프로그램</h3>
                        </div>
                        <div class='photo_size'>
                            <a href='program01.jsp'><img
                                src='/resources/img/banner03.jpg'></a>
                            <div class=''>
                                <p>
                                    <strong>휴식형 프로그램</strong>
                                </p>
                                <p>
                                    <strong>체험형 프로그램</strong>
                                </p>
                                <p>
                                    <strong>템플라이프</strong>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class='footer'>
        <%@ include file="header_footer/footer.jsp" %>
    </div>



</body>
</html>
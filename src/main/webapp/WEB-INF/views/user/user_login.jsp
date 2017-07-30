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
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

</head>

<body>

    <!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

    <!-- login -->
    <div class=''>
        <div class='login_content'>
            <div class=''>
                <h3>로그인</h3>
                <div class=''>
                    <form method='post' action='/user/user_login' >
                        <div>아이디
                            <input type='text' name='userid' value='' />
                        </div>
                        <div> 비밀번호 
                            <input type='password' name='userpassword' value='' />
                        </div>
                        <div>
                            <input type='submit' name='' value='로그인' />
                        </div>
                        <div>
                            아직 회원이 아닌가요? <a href='/user/user_join'>회원가입</a>
                        </div>
                        <div>
                            비밀번호를 잊어버렸나요? <a href='user/user_findpassword'>비밀번호 찾기</a>
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
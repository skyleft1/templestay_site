<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

<script>
$(document).ready(function(){
    
});


</script>

</head>

<body>

    <!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

    <!-- join -->
    <div class='wrap'>
        <div class='side_menu'></div>
        <div class='join_content'>
            <div class=''>
                <div class='join_maintitle'>
                    <h3>회원정보 수정</h3>
                </div>
                <div class=''>
                
                    <div><a href='/user/user_modify'>회원정보 변경</a></div>
                    <div><a href='/user/user_modify_password'>비밀번호 변경</a></div>
                        <table>
                            <tbody>
                                <tr>
                                    <th>아이디</th>
                                    <td>${info.userid}</td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td>${info.username}</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>${info.useremail}</td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>${info.phonenumber}</td>
                                </tr>
                            </tbody>
                        </table>

                        <div><a href='/user/user_delete'>회원탈퇴</a></div>
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
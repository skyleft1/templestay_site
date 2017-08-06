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
                
                    <div><a href='/user/user_modify_password'>비밀번호 변경</a></div>
                
                    <form class='modify_form' method='post' action='/user/user_modify' >
                        <table>
                            <tbody>
                                <p>
                                    <input type="hidden" name="userid" value="${modify.userid }" />
                                </p>
                                <tr>
                                    <th>이름</th>
                                    <td><input type='text' name='username' value='${modify.username}' /></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type='email' name='useremail' value='${modify.useremail}' /></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input type='text' name='phonenumber' value='${modify.phonenumber}' /></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class='wrap_submit'>
                            <input type='submit' class='modify_submit' value='회원정보 수정'>
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
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
                <form class='modify_password_form' method='post' action='/user/user_modify_password'>
                    <table>
                        <tbody>
                            <tr>
                                <th>현재 비밀번호</th>
                                    <td><input type='password' name='currentpassword' value=''></td>
                            </tr>
                            
                            <tr>
                                <th>새로운 비밀번호</th>
                                <td><input type='password' name='newpassword' value=''></td>
                            </tr>
                            <tr>
                                <th>새로운 비밀번호 확인</th>
                                <td><input type='password' name='' value=''></td>
                            </tr>
                            <div class='wrap_submit'>
                                <input type='submit' class='modify_password_submit' value='비밀번호 수정'>
                            </div>
                            
                        </tbody>
                    </table>
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
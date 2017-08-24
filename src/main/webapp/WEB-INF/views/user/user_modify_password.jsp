<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user_modify_password</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/ajaxsetup.js"></script>
<script src="/resources/js/MyApp.board.js"></script>

<script>
$(document).ready(function(){
	// 비밀번호 일치여부 확인하는 부분
    $('.modify_password_submit').click(function(e){
    	if( $('input[name="currentpassword"]').val()  != '${session_user.userpassword}') {
                $('.popup_cancel_wrap') .show();
                $('.popup_content').text('로그인 비밀번호가 틀렸습니다.');
                $('.popup_button_cancel').click(function(e) {
                    $('.popup_cancel_wrap').hide();
                });
            } else if ($('input[name="newpassword"]').val() != $('input[name="newpassword_confirm"]').val()) {
                $('.popup_cancel_wrap').show();
                $('.popup_content').text('비밀번호 확인이 일치하지 않습니다.');
                $('.popup_button_cancel').click(function(e) {
                    $('.popup_cancel_wrap').hide();
                });
            } else {
                $('.modify_password_form').submit();
    	}
    });
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
                    <h3>비밀번호 수정</h3>
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
                                <td><input type='password' name='newpassword_confirm' value=''></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class='wrap_submit'>
                        <input type='button' class='modify_password_submit' value='비밀번호 수정'>
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
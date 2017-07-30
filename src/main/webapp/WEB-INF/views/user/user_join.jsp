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
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

<!-- 
필요한 자바스크립트
1 중복체크
2 빈값 알림
3 비밀번호 확인 일치여부
 -->
<script>
$(document).ready(function(){
    $('.id_check').click(function(e){
   //	중복검사 시작
        $('table input').removeAttr('disabled', '').css('background-color', '#f7f7f7');
        });
    
    
    $('.join_submit').click(function(e) {
    	$('table input').next('label').remove();
        var a = $('.submit_check');
        for(var i=0 ; i<a.length; i++){
        	if( $(a[i]).val() == '' ){
        		$(a[i]).after('<label>빈 값을 입력하세요.</label>');
        	}
        }
        $('.submit_check').keyup( function (e) {
            if( $(this).val() !== '') {
                $(this).next('label').remove();
                }
            });
        	/*  $('.join_form').submit(); */
        if ($('.password').val() !== $('.password_confirm').val()) {
        	$('.password_confirm').after('<label>비밀번호가 일치하지 않습니다.</label>');
        } else{
        	$('.join_form').submit();
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
                    <h3>회원가입</h3>
                </div>
                <div class=''>
                    <form class='join_form' method='post' action='/user/user_join' >
                        <table>
                            <tbody>
                                <tr>
                                    <th>아이디</th>
                                    <td> 
                                        <input type='text' name='userid' value='' >
                                        <input type='button' class='id_check' value='중복체크'>
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td><input type='password' name='userpassword' class ='password' value='' disabled style='background-color: grey' />
                                    </td>
                                </tr>
                                 <tr>
                                    <th>비밀번호 확인</th>
                                    <td><input type='password' name='' class='password_confirm' value='' disabled style='background-color: grey' />
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td><input type='text' name='username' value='' class='submit_check' disabled style='background-color: grey'></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type='email' name='useremail' value='' class='submit_check' disabled style='background-color: grey'>
                                    </td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input type='text' name='phonenumber' value='' class='submit_check' disabled style='background-color: grey'>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class='wrap_submit'>
                            <input type='button' class='join_submit' value='회원가입'>
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
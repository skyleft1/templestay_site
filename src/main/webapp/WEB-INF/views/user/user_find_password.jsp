<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user_join</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/find_password.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/ajaxsetup.js"></script>
<script src="/resources/js/MyApp.board.js"></script>


<script>
$(document).ready(function(){
	
	// 비밀번호 질문답변 확인하기 -> 확인후 맞다면 아래 변경창 동적으로 띄우기
    $('.go_check').click(function(e){
    	
    	var userid = $('input[name="userid"]').val();
        var password_hint = $('select[name="password_hint"]').val();
        var password_hint_confirm = $('input[name="password_hint_confirm"]').val();
    	
        if (userid == "" || password_hint == "" || password_hint_confirm == "" ){
            $('.popup_cancel_wrap').show();
            $('.popup_content').text( "빈 값이 있습니다." );
            $('.popup_button_cancel').click(function(e){
            	$('.popup_cancel_wrap').hide();
            });
        }
        else{
            $.ajax({
                url : '/user/user_find_password'
                , data: {'userid' : userid , 'password_hint' : password_hint , 'password_hint_confirm' : password_hint_confirm }       
                , type: 'POST'       
                , timeout: 30000    
                , dataType: 'json'  
                , beforeSend : function() {
                }
            }).done( function(data, textStatus, xhr ){
                if (data.code === 1){
                	$('.wrap2').show();
    
                }else {
                	$('.popup_cancel_wrap').show();
                    $('.popup_content').text( "비밀번호 질문 답변이 일치하지 않습니다." );
                    $('.popup_button_cancel').click(function(e){
                        $('.popup_cancel_wrap').hide();
                    });
                }
            });
        }
    });

    // 비밀번호 재설정 가기
    $('.go_modify_password').click(function(e){
        
        if ($('.password').val() !== $('.password_confirm').val()) {
            $('.popup_cancel_wrap').show();
            $('.popup_content').text('비밀번호가 일치하지 않습니다.');
            $('.popup_button_cancel').click(function(e){
                $('.popup_cancel_wrap').hide();
            });
        }
        else{
            var userid = $('input[name="userid"]').val();
            var newpassword = $('input[name="newpassword"]').val();
            
            $.ajax({
                url : '/user/user_new_password'
                , data: {'userid' : userid , 'newpassword' : newpassword }       
                , type: 'POST'       
                , timeout: 30000    
                , dataType: 'json'  
                , beforeSend : function() {
                }
            }).done( function(data, textStatus, xhr ){
                if (data.code === 1){
                    $('.popup_cancel_wrap').show();
                    $('.popup_content').text( '비밀번호가 성공적으로 변경되었습니다.' );
                    $('.popup_button_cancel').click(function(e){
                        $('.popup_cancel_wrap').hide();
                        window.location.href= '/user/user_login';
                    });
                }else {
                    $('.popup_cancel_wrap').show();
                    $('.popup_content').text( '변경실패. 관리자에 문의 바랍니다.' );
                    $('.popup_button_cancel').click(function(e){
                        $('.popup_cancel_wrap').hide();
                    });
                }
            });
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
        <div class='find_content'>
            <div class=''>
                <div class='find_maintitle'>
                    <h3>비밀번호 찾기</h3>
                </div>
                <div class='wrap1'>
                    <div>
                        <div class='left'>아이디</div>
                        <div class='right'>
                            <input type='text' name='userid' value='' >
                        </div>
                    </div>
                    <div>
                        <div class='left'>비밀번호 힌트</div>
                        <div class='right'>
                            <select name='password_hint' class='password_hint' >
                                <option>내가 태어난 지역은?</option>
                                <option>어머니 성함은?</option>
                                <option>첫사랑의 이름은?</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <div class='left'>비밀번호 정답</div>
                        <div class='right'>
                            <input type='text' name='password_hint_confirm' class='' value=''  />
                        </div>
                        <div class=''>
                            <input type='button' class='go_check' value='비밀번호 재설정'>
                        </div>
                    </div>    
                </div>
                <div class='wrap2' style='display: none'>
                    <div>
                        <div class='left'>새로운 비밀번호</div>
                        <div class='right'>
                            <input type='password' name='newpassword' class ='password' value=''  />
                        </div>
                    </div>
                    <div>
                        <div class='left'>새로운 비밀번호 확인</div>
                        <div class='right'>
                            <input type='password' name='' class='password_confirm' value=''  />
                        </div>
                    </div>
                        <input type='button' class='go_modify_password' value='비밀번호 변경'  />

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
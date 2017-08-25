<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user_info</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user_info.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/ajaxsetup.js"></script>
<script src="/resources/js/MyApp.board.js"></script>

<script>
$(document).ready(function(){
	// 회원정보 수정
    $('.go_user_modify').click(function(e){
        window.location = "/user/user_modify" ;
    });
    $('.go_user_modify_password').click(function(e){
	    window.location = "/user/user_modify_password" ;
	});
	
	// 회원 탈퇴
    $('.go_user_delete').click(function(e){
        $('.popup_confirm_wrap').show();
        $('.popup_content').text('정말로 탈퇴하시겠습니까...?');
        
        $('.popup_button_confirm').click(function(e){
            $('.popup_cancel_wrap').hide();

                $.ajax({
                    url : '/user/user_delete',
                    data : null, 
                    type : 'POST', 
                    timeout : 30000, 
                    dataType : 'json', 
                    beforeSend : function() {
                    }
                }).done(function(data, textStatus, xhr) {
                    if (data.code === 1) {
                        window.location = data.url;
                    } else {
                        $('.popup_cancel_wrap').show();
                        $('.popup_content').text("삭제실패. 관리자 문의 바람.");
                        $('.popup_button_cancel').click(function(e){
                            $('.popup_cancel_wrap').hide();
                            window.location = "user/user_delete" ;
                        });
                    }
                });

         });
         $('.popup_button_cancel').click(function(e){
        	 $('.popup_confirm_wrap').hide();
         });
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
                    <h3>회원정보 수정</h3>
                </div>
                <div class=''>
                        <table>
                            <tbody>
                                <tr>
                                    <th>아이디</th>
                                    <td>${session_user.userid}</td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td>${session_user.username}</td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td>
                                    <c:choose>
                                        <c:when test='${session_user.usersex == "M" }'>
                                            남성
                                        </c:when>
                                        <c:when test="${session_user.usersex == 'F'}">
                                            여성
                                        </c:when>
                                    </c:choose>                
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>${session_user.useremail}</td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>${session_user.userphone}</td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                    우편번호    : ${session_user.addr_postcode} <br>
                                    도로명주소  : ${session_user.addr_road} <br>
                                    지번주소    : ${session_user.addr_jibun} 
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <input type="button" value="회원정보 변경" class="go_user_modify" />
                            <input type="button" value="비밀번호 변경" class="go_user_modify_password" />
                            <input type="button" value="회원탈퇴" class="go_user_delete" />
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user_info.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

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
        var confirm_delete = confirm("정말로 탈퇴하시겠습니까? ㅠㅠ");
            if (confirm_delete == true) {
                $.ajax({
                    url : '/user/user_delete',
                    data : null, // 사용하는 경우에는 { data1:'test1', data2:'test2' }
                    type : 'POST', // get, post
                    timeout : 30000, // 30초
                    dataType : 'json', // text, html, xml, json, jsonp, script
                    beforeSend : function() {
                        // 통신이 시작되기 전에 이 함수를 타게 된다.
                    }
                }).done(function(data, textStatus, xhr) {
                    if (data.code === 1) {
                        window.location = data.url;
                    } else {
                        alert("삭제실패. 관리자 문의 바람.");
                        window.location = "user/user_delete" ;
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
                                    <th>이메일</th>
                                    <td>${session_user.useremail}</td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>${session_user.phonenumber}</td>
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
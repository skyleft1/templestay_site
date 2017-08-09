<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user_join</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/ajaxsetup.js"></script>
<script src="/resources/js/MyApp.board.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!--  다음 지도 이용 -->
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->

<!-- 
필요한 자바스크립트
1 중복체크
2 빈값 알림
3 비밀번호 확인 일치여부(ajax로 하자)

 -->
<script>
$(document).ready(function(){
    $('.id_check').click(function(e){
    	var userid = $('input[name="userid"]').val();
        $.ajax({
            url : '/user/user_id_check'
            , data: {'userid' : userid }       
            , type: 'POST'       
            , timeout: 30000    
            , dataType: 'json'  
            , beforeSend : function() {
            }
        }).done( function(data, textStatus, xhr ){
            if (data.code === 1){
                $('.popup_cancel_wrap').show();
                $('.popup_content').text( data.msg );
                $('.popup_button_cancel').click(function(e){
                    $('.popup_cancel_wrap').hide();
                });
            }else {
            	$('table input:not([type=button])').removeAttr('disabled', '').css('background-color', '#f7f7f7');
            }
        });
    });


    $('.join_submit').click(function(e) {
    	var a = $('.submit_check');
        if ($('.password').val() !== $('.password_confirm').val()) {
            $('.popup_cancel_wrap').show();
            $('.popup_content').text('비밀번호가 일치하지 않습니다.');
            $('.popup_button_cancel').click(function(e){
                $('.popup_cancel_wrap').hide();
            });
        }
        else if( $(a[0]).val() === '' || $(a[1]).val() === '' || $(a[2]).val() === '' ){
            $('.popup_cancel_wrap').show();
            $('.popup_content').text('빈 값이 있습니다.');
            $('.popup_button_cancel').click(function(e){
                $('.popup_cancel_wrap').hide();
            });
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
                                
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <input type="text"  name="addr_postcode" id="sample4_postcode" placeholder="우편번호" value="">
                                        <input type="button"  onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                        <input type="text" name="addr_road" id="sample4_roadAddress" placeholder="도로명주소" value="">
                                        <input type="text" name="addr_jibun" id="sample4_jibunAddress" placeholder="지번주소" value="">
                                        <span id="guide" style="color:#999"></span>
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
    <!-- footer -->
    <div class='footer'>
        <%@ include file="../header_footer/footer.jsp" %>
    </div>


</body>
</html>
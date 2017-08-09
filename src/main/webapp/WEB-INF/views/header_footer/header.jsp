<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



 
<script type="text/javascript">
    
$(document).ready(function(){
    $('.go_login').click(function(e){
        window.location.href = "/user/user_login" ;
        });
    $('.go_join').click(function(e){
        window.location.href = "/user/user_join" ;
        });
            
    
    $('.go_logout').click(function(e){
    	$('.popup_cancel_wrap').show();
    	$('.popup_content').text('로그아웃 되었습니다.');
    	$('.popup_button_cancel').click(function(e){
    		$('.popup_cancel_wrap').hide();
    		window.location.href = "/user/user_logout" ;
    	});

    });

    $('.go_user_info').click(function(e){
        window.location.href = "/user/user_info" ;
    });
});

    
    
</script> 


<div class=''>
    <div class=''>
        <div class='login'>
            <div class=''>
            
                <c:choose>
                    <c:when test="${empty session_user}"> <!--  WebConstants파일의 SESSION_NAME의 값을 불러옴 -->
                        <div class='move_login box'>
                            <input type="button" value="로그인" class="go_login" />
                        </div>
                        <div class='dot'>ㆍ</div>
                        <div class='move_signup box'>
                            <input type="button" value="회원가입" class="go_join" />
                        </div>

                    </c:when>
                    <c:otherwise>
                        <div class='move_login box2'>
                            ${ session_user.userid} 님 환영합니다!                           
                        </div>
                        <div class='move_login box'>
                            <input type="button" value="로그아웃" class="go_logout" />
                        </div>
                        <div class='dot'>ㆍ</div>
                        <div class='move_signup box'>
                            <input type="button" value="정보수정" class="go_user_info" />
                        </div>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        <div class='warp_menu_inner'>
            <div class='wrap_menu'>
                <div class='menu'>
                    <div class='menu_logo'>
                        <a href="/"><img src='/resources/img/logo.png' /></a>
                    </div>
                    <div class='menu_content'>
                        <ul>
                            <li><div>
                                    <h3>템플스테이</h3>
                                </div></li>
                            <li><div>
                                    <h3>프로그램</h3>
                                </div></li>
                            <li><div>
                                    <h3>찾아오시는 길</h3>
                                </div></li>
                            <li><div>
                                    <h3>여름수련회</h3>
                                </div></li>
                            <li><div>
                                    <h3>커뮤니티</h3>
                                </div></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class='wrap_inner'>
                <div class='menu_content_inner'>
                    <ul>
                        <li><a href='/etc/intro01'><h5>템플스테이란?</h5></a></li>
                        <li><a href='/etc/intro02'><h5>템플스테이 소개</h5></a></li>
                        <li><a href='/etc/monk'><h5>주지스님 인사말</h5></a></li>
                        <li><a href='/etc/fac'><h5>시설 현황</h5></a></li>
                    </ul>
                    <ul>
                        <li><a href='/etc/program01'><h5>휴식형 프로그램</h5></a></li>
                        <li><a href='/etc/program02'><h5>체험형 프로그램</h5></a></li>
                        <li><a href='/etc/program03'><h5>템플라이프</h5></a></li>
                        <li><h5></h5></li>

                    </ul>
                    <ul>
                        <li><a href='/etc/map'><h5>찾아오시는 길</h5></a></li>
                        <li></li>
                        <li><h5></h5></li>
                        <li><h5></h5></li>
                    </ul>
                    <ul>
                        <li><a href='/etc/training'><h5>여름수련회 소개</h5></a></li>
                        <li><h5></h5></li>
                        <li><h5></h5></li>
                        <li><h5></h5></li>
                    </ul>
                    <ul>
                        <li><h5><a href="/board/article_list/notice?curPage=1&searchWord=${searchWord}">공지사항</a></h5></li>
                        <li><h5><a href="/board/article_list/qna?curPage=1&searchWord=${searchWord}">QnA게시판</a></h5></li>
                        <li><h5><a href="/board/article_list/free?curPage=1&searchWord=${searchWord}">자유게시판</a></h5></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
<!--  팝업창(숨겨짐)  -->
<div class='popup_cancel_wrap'>
    <div class="popup_cancel_cover"></div>
    <div class='popup_cancel'>
        <div class='popup_head'>알림</div>
        <div class='popup_content'></div>
        <div class='popup_bottom'>
            <button class='popup_button_cancel' data-dismiss='modal'>Cancel</button>
        </div>
    </div>
</div>

<div class='popup_confirm_wrap'>   
    <div class="popup_confirm_cover"></div>
    <div class='popup_confirm'>
        <div class='popup_head'>알림</div>
        <div class='popup_content'></div>
        <div class='popup_bottom'>
            <button class='popup_button_confirm' data-trigger='confirm'>확인</button>
            <button class='popup_button_cancel' data-dismiss='modal'>Cancel</button>
        </div>
    </div>
</div>


</div>
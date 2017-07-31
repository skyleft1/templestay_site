<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


 
<script type="text/javascript">
    
    $(document).ready(function(){
        $('.go_login').click(function(e){
            window.location.href = "/user/user_login" ;
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
                            <a href="javascript:location.href='/user/user_join'"><h4>회원가입</h4></a>
                        </div>

                    </c:when>
                    <c:otherwise>
                        <div class='move_login box'>
                            ${ session_user.userid} 님 환영합니다! ^0^/                          
                        </div>
                        <div class='move_login box'>
                            <a href="javascript:location.href='/user/user_logout'"><h4>로그아웃</h4></a>
                        </div>
                        <div class='dot'>ㆍ</div>
                        <div class='move_signup box'>
                            <a href="javascript:location.href='/user/user_info'"><h4>회원정보수정</h4></a>
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
                        <li><a href='intro01.jsp'><h5>템플스테이란?</h5></a></li>
                        <li><a href='intro02.jsp'><h5>템플스테이 소개</h5></a></li>
                        <li><a href='monk.jsp'><h5>주지스님 인사말</h5></a></li>
                        <li><a href='fac.jsp'><h5>시설 현황</h5></a></li>
                    </ul>
                    <ul>
                        <li><a href='program01.jsp'><h5>휴식형 프로그램</h5></a></li>
                        <li><a href='program02.jsp'><h5>체험형 프로그램</h5></a></li>
                        <li><a href='program03.jsp'><h5>템플라이프</h5></a></li>
                        <li><h5></h5></li>

                    </ul>
                    <ul>
                        <li><a href='map.jsp'><h5>찾아오시는 길</h5></a></li>
                        <li></li>
                        <li><h5></h5></li>
                        <li><h5></h5></li>
                    </ul>
                    <ul>
                        <li><a href='training.jsp'><h5>여름수련회 소개</h5></a></li>
                        <li><h5></h5></li>
                        <li><h5></h5></li>
                        <li><h5></h5></li>
                    </ul>
                    <ul>
                        <li><h5><a href="/board/article_list/notice">공지사항</a></h5></li>
                        <li><h5><a href="/board/article_list/qna">질문게시판</a></h5></li>
                        <li><h5><a href="/board/article_list/free">자유게시판</a></h5></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
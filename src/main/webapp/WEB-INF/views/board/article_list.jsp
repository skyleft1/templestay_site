<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>article_list</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bbs.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/MyApp.board.js"></script>

<script type="text/javascript">
    
    $(document).ready(function(){
        $('.go_view').click(function(e){
        	var articleno = $(this).children().attr('articleno');
        	var curPage = $(this).children().attr('curPage');
            window.location.href = "/board/article_view/${boardcd}/"+ articleno + "?curPage="+curPage;
        });
        
        $('.go_write').click(function(e){
            <c:choose>
                <c:when test="${session_user == null}">
                $('.popup_cancel_wrap').show();
                $('.popup_content').text('로그인을 하셔야 작성이 가능합니다.');

                $('.popup_button_cancel').click(function(e){
                    $('.popup_cancel_wrap').hide();
                    window.location.href = "/user/user_login" ;
                });
                // 로그인을 하지 않고 게시판 작성할 경우 alert 출력
                </c:when>
            
            <c:otherwise>
                window.location.href = "/board/article_write/${boardcd}";
                </c:otherwise>
            </c:choose>
            
        });
        
        $('.bbs_write span').click(function(e){
            var curPage = $(this).attr('articleno');
            window.location.href = "/board/article_list/${boardcd}?curPage="+curPage +"&searchWord=${searchWord}";
        })
    });

</script>


</head>
<body>

    <!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

    <!-- bbs -->

    <div class='wrap'>
        <!-- bbs 좌측메뉴 -->
        <div class='side_menu'>
            <div>
                <h3>커뮤니티</h3>
            </div>
            <ul>
                <li><h5><a href="/board/article_list/notice?curPage=1&searchWord=${searchWord}">공지사항</a></h5></li>
                <li><h5><a href="/board/article_list/qna?curPage=1&searchWord=${searchWord}">QnA게시판</a></h5></li>
                <li><h5><a href="/board/article_list/free?curPage=1&searchWord=${searchWord}">자유게시판</a></h5></li>
            </ul>
        </div>
        <!-- bbs 우측내용 -->
        <div class='bbs_content'>
            <div class=''>
                <div class='bbs_maintitle'>
                    <h3>${boardname}</h3>
                </div>
                <div class='bbs_maincontent'>
                    <table>
                        <thead>
                            <tr>
                                <th><h5>번호</h5></th>
                                <th><h5>제목</h5></th>
                                <th><h5>글쓴이</h5></th>
                                <th><h5>날짜</h5></th>
                                <th><h5>조회</h5></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var='boardlist' items='${list}' varStatus='status' >
                                <tr class='go_view'>
                                    <td articleno='${boardlist.articleno}' curPage='${curPage}'><h6>${no - status.index}</h6></td>
                                    <!--  ${no - status.index} 게시판 순서대로 번호 넣기 --> 
                                    <td><h6>${boardlist.title}</h6></td>
                                    <td><h6>${boardlist.userid } </h6></td>
                                    <td><fmt:formatDate value="${boardlist.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td><h6>${boardlist.hit}</h6></td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <div class='bbs_write'>
                        <div class='list_paging' >
                            <c:if test="${prevLink > 0 }">
                                <span articleno='${prevLink }'>[이전]</span>
                            </c:if>
                            <c:forEach var="i" items="${pageLinks }" varStatus="stat">
                                <span articleno='${i }'>${i }</span>
                            </c:forEach>
                            <c:if test="${nextLink > 0 }">
                                <span articleno='${nextLink }' class='nextpage'>[다음]</span>
                            </c:if>

                        </div>
                        <div class='write_button'>
                            <input type='button' name='' class='go_write' value='글쓰기'>
                        </div>
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
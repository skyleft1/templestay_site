<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bbs.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

<script type="text/javascript">
    
    $(document).ready(function(){
        $('.go_view').click(function(e){
        	var articleno = $(this).children().attr('articleno');
            window.location.href = "/board/article_view/${boardcd}/"+ articleno;
        });
        
        $('.go_write').click(function(e){
            window.location.href = "/board/article_write/${boardcd}";
            var a = '${msg}';
            if (a == 1){
            	alert("rrrr");
            }
            if (a != 1){
                alert("dfdfdf");
            }
            if (a != null){
                alert("null");
            }
                /* <c:if test="${msg == 1}">
                alert('로그인을 하셔야 작성이 가능합니다.');
                </c:if> */
        });
                	/* <c:set var="aa" value="${msg}" /> */
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
                <li class='go_notice'><h5>공지사항</h5></li>
                <li class='go_qna'><h5>질문과 답변</h5></li>
                <li class='go_free'><a href='/bbs/bbs'><h5>게시판</h5></a></li>
                <li><h5>포토갤러리</h5></li>
                <li><h5>홍보동영상</h5></li>
            </ul>
        </div>
        <!-- bbs 우측내용 -->
        <div class='bbs_content'>
            <div class=''>
                <div class='bbs_maintitle'>
                    <h3>${boardnm}</h3>
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
                            <c:forEach var='boardlist' items='${list2}' varStatus='status' >
                                <tr class='go_view'>
                                    <td articleno='${boardlist.articleno}'><h6>${boardlist.articleno}</h6></td>
                                    <td><h6>${boardlist.title}</h6></td>
                                    <td><h6>${boardlist.insertUID } </h6></td>
                                    <td><fmt:formatDate value="${boardlist.regdate}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                    <td><h6>${boardlist.hit}</h6></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class='bbs_write'>
                        <div>
                            <div>
                                <input type='button' name=''
                                    class='prev_bbs' value='이전'>
                            </div>
                            <div>
                                <input type='button' name=''
                                    class='next_bbs' value='다음'>
                            </div>
                        </div>
                        <div class='write_button'>
                            <input type='button' name='' class='go_write' value='글쓰기'>
                        </div>
                        <c:if test="${not empty msg }">
                            <p>alert(${msg});</p>
                        </c:if>      
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
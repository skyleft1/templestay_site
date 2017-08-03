<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>

        <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
        <link rel="stylesheet" type="text/css" href="/resources/css/bbs_view.css">
        
        <script src='/resources/js/jquery-3.1.0.js'></script>
        <script src='/resources/js/jquery-ui.js'></script>
        <script src="/resources/js/common.js"></script>
        <script src="/resources/js/MyApp.board.js"></script>
        
<script type="text/javascript">
    
    $(document).ready(function(){
        $('.go_modify').click(function(e){
            window.location.href = "/board/article_modify/${boardcd}/${articleno}";
        });
        
        // 글삭제 (삭제시 파일, 댓글 모두 삭제되어야함)
        $('.go_delete').click(function(e){
                var boardcd = $(this).attr('boardcd');
                var articleno = $(this).attr('articleno'); 
                sendpost('/board/article_delete/${boardcd}/${articleno}', {'boardcd':boardcd , 'articleno':articleno});
        });
        
        $('.go_comment_delete').click(function(e){
        	var commentno = $(this).attr('commentno');
                comment_delete(commentno);
                window.location='/board/article_view';
        });
        
        $('.go_list').click(function(e){
            window.location.href = "/board/article_list/${boardcd}";
        });
        $('.go_write').click(function(e){
            window.location.href = "/board/article_write/${boardcd}";
        });
    });

</script>

    </head>
    <body>

<!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp" %>
    </div>

    <!-- bbs_view -->
    <div class=''>
        <div class='bbs_view_content'>
            <div class=''>
                <div class='bbs_view_maintitle'><h3>게시판</h3></div>
                <div class=''>
                    <table>
                        <tbody>
                            <tr>
                                <th><h5>번호</h5></th>
                                <td><h6>${article.articleno}</h6></td>
                            </tr>
                            <tr>
                                <th><h5>제목</h5></th>
                                <td><h6>${article.title}</h6></td>
                            </tr>
                            <tr>
                                <th><h5>작성자</h5></th>
                                <td><h6>${article.insertUID}</h6></td>
                            </tr>
                            <tr>
                                <th><h5>날짜</h5></th>
                                <td><h6>${article.regdate}</h6></td>
                            </tr>
                            <tr>
                                <th><h5>내용</h5></th>
                                <td><h6>${article.content}</h6></td>
                            </tr>
                            
                        </tbody>
                    </table>

                    <div>
                        <c:forEach var='commentlist' items='${list}' varStatus='status'>
                            <div>
                                <div>${commentlist.insertUID}</div>
                                <div>
                                    <fmt:formatDate
                                        value="${commentlist.regdate}"
                                        pattern="yyyy.MM.dd HH:mm:ss" />
                                </div>
                                <div>${commentlist.memo}</div>
                            </div>


                    <!--  session의 userid 와 comment쓴 userid를 비교해 같을 경우 삭제보이기+삭제가능 --> 
                        <c:if test="${session_user.userid eq commentlist.insertUID}" >
                            <input type='button' name='' class='go_comment_delete' value='댓글삭제' commentno='${commentlist.commentno}'/>
                        </c:if>
                        
                        </c:forEach>
                    </div>
                    
                    
                    
                    
                    <div>
                        <form action='/board/article_comment/${boardcd}/${articleno}' method='post' enctype='application/x-www-form-urlencoded'>
                            <div>
                                <textarea name='memo'>
                                </textarea>
                            </div>
                            <div>
                                <input type='submit' class='go_comment' value='댓글 작성' />
                            </div>
                        </form>
                    </div>
                    
                    <div>
                        <c:if test='' >
                            ${article.content}
                            ${article.content}
                        </c:if>
                    </div>
                    
                    <div class='modify_delete'>
                        <c:choose>
                        <c:when test='${session_user.userid == article.insertUID}'>
                        <div>
                            <input type='button' name='' class='go_modify' value='수정'>
                        </div>
                        <div>
                            <input type='button' name='' class='go_delete' value='삭제' boardcd='${article.boardcd }' articleno='${ article.articleno}' />
                        </div>
                        </c:when>
                        </c:choose>
                        
                        <div>
                            <input type='button' name='' class='go_list' value='목록'>
                        </div>
                        <div>
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
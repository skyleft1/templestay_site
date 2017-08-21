<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>article_view</title>

        <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
        <link rel="stylesheet" type="text/css" href="/resources/css/bbs_view.css">
        
        <script src='/resources/js/jquery-3.1.0.js'></script>
        <script src='/resources/js/jquery-ui.js'></script>
        <script src="/resources/js/common.js"></script>
        <script src="/resources/js/MyApp.board.js"></script>
        
<script type="text/javascript">
    
    $(document).ready(function(){
        $('.go_modify').click(function(e){
            var articleno = $('.modify_delete').attr('articleno');
            var curPage = $('.modify_delete').attr('curPage');
            window.location.href = "/board/article_modify/${boardcd}/${articleno}?curPage="+curPage;
        });
        
        // 글삭제 (삭제시 파일, 댓글 모두 삭제되어야함)
        $('.go_delete').click(function(e){
            var boardcd = $('.modify_delete').attr('boardcd');
            var articleno = $('.modify_delete').attr('articleno'); 
            var curPage = $('.modify_delete').attr('curPage');
            sendpost('/board/article_delete/${boardcd}/${articleno}', {'boardcd':boardcd , 'articleno':articleno, 'curPage':curPage });
        });
        
        // 댓글 쓰기
        $('.go_comment_write').click(function(e){
        	<c:choose>
        	   <c:when test="${session_user == null}">
               $('.popup_cancel_wrap').show();
               $('.popup_content').text('로그인을 하셔야 작성이 가능합니다.');
               $('.popup_button_cancel').click(function(e){
                   $('.popup_cancel_wrap').hide();
               });

        	   </c:when>
        	   <c:otherwise>
        	     var textarea = $('.comment textarea');
        	        var articleno = $(textarea).attr('articleno');
        	           var memo = $(textarea).val();
        	             comment_write(articleno, memo);
        	   </c:otherwise>
        	</c:choose>
        });
        
        // 댓글 수정
        $('.commentlist_parent').on('click', '.click_comment_modify', function(e){
        	var memo =  $(this).siblings('.comment_memo').text();
        	$(this).siblings('.comment_memo').html("<textarea maxlength='500' class='comment_textarea'>"+ memo +"</textarea>");
        	 
        	$(this).parent().find('.hide_comment_modify_delete').hide();
        	$(this).parent().append("<input type='button' class='go_comment_modify' value='수정확인'/>");

        	});
        	$('.commentlist_parent').on('click', '.go_comment_modify', function(e){
        	    var commentno = $(this).parent($('.comment_list')).attr('commentno');
                comment_modify(commentno);
                $(this).siblings($('.hide_comment_modify_delete')).show();
                $(this).hide();
            });
        
        
        // 댓글 삭제
        $('.commentlist_parent').on('click', '.go_comment_delete', function(e){
            var commentno = $(this).parent($('.comment_list')).attr('commentno');
            comment_delete(commentno);

        });
        
        $('.go_list').click(function(e){
            window.location.href = "/board/article_list/${boardcd}?curPage=${curPage}";
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
                                <td><h6>${article.userid}</h6></td>
                            </tr>
                            <tr>
                                <th><h5>날짜</h5></th>
                                <td><h6><fmt:formatDate value="${article.date}" pattern="yyyy.MM.dd HH:mm:ss"/></h6></td>
                            </tr>
                            <tr>
                                <th><h5>내용</h5></th>
                                <td><h6>${article.content}</h6></td>
                            </tr>
                            <tr>
                                <th><h5>첨부파일</h5></th>
                                <td>
                                <div class="file_list" >
                                    <c:forEach var="file" items="${attachFileList }" varStatus="status">
                                    <a href="javascript:download('${file.tempfilename }', '${file.filename }' )">${file.filename }</a>
                                    <br />
                                    </c:forEach>
                                </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                                
                               
                                        
                    <!-- 댓글 작성 -->
                    <div class='comment_title'><div>댓글 작성</div></div>
                    <div class='comment'>
                        <textarea name='memo' articleno='${article.articleno}' class='comment_content'></textarea>
                        <input type='button' class='go_comment_write' value='댓글 작성' />
                    </div>
                    
                    
                    <div class='commentlist_parent'>
                    <!-- 댓글 반복 -->
                    <c:forEach var='commentlist' items='${list}' varStatus='status' >
                        <div class='comment_list' commentno='${commentlist.commentno }'>
                            <div><strong>${commentlist.userid}</strong></div>
                            <div class='comment_memo'>${commentlist.memo}</div>
                            <div class='comment_date'><fmt:formatDate value="${commentlist.date}" pattern="yyyy-MM-dd"/></div>                            
                        
                        <!-- 댓글 수정 삭제 -->
                            <c:if test="${session_user.userid eq commentlist.userid}" >
                                <input type='button' name='' class='click_comment_modify hide_comment_modify_delete' value='댓글수정' />
                                <input type='button' name='' class='go_comment_delete hide_comment_modify_delete' value='댓글삭제' />
                            </c:if>
                        </div>
                        <!-- session의 userid 와 comment쓴 userid를 비교해 같을 경우 삭제보이기+삭제가능 -->
                    </c:forEach>
                    </div>

                    
                    <div class='modify_delete' boardcd='${article.boardcd }' articleno='${ article.articleno}' curPage='${curPage}'>
                        <c:choose>
                        <c:when test='${session_user.userid == article.userid}'>
                        <div>
                            <input type='button' name='' class='go_modify' value='수정' >
                        </div>
                        <div>
                            <input type='button' name='' class='go_delete' value='삭제' />
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
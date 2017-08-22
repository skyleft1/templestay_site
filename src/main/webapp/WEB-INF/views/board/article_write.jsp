<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>article_write</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bbs_write.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/MyApp.board.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        $('.cancel').click(function(e) {
            window.location.href = "/board/article_view/${boardcd}/${articleno}"
        });
        
        $('.write_confirm').click(function(e){

        	// 엔터를 <br>로 치환해 DB전송하고 받는 부분
        	var str = $('textarea[name="content"]').val();
        	var str1 = str.replace(/(?:\r\n|\r|\n)/g, '\n');
        	$('textarea[name="content"]').val(str1);

        	$('.write_modify_Form').attr('action', '/board/article_write/${boardcd}/${article.articleno}');
        	$('.write_modify_Form').submit();
        	
        	/*  
        	var str1 = str.replace('<br />', /(?:\r\n|\r|\n)/g);
            $('textarea[name="content"]').val(str1);
            */
        });
        
        $('.modify_confirm').click(function(e){
        	/* 
        	// 엔터를 <br>로 치환해 DB전송하고 받는 부분
            var str = $('textarea[name="content"]').val();
            var str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
            $('textarea[name="content"]').val(str);
             */
        	$('.write_modify_Form').attr('action', '/board/article_modify/${boardcd}/${article.articleno}?curPage=${curPage}');
        	$('.write_modify_Form').submit();
        	
        });

    });
</script>

</head>
<body>

    <!-- header -->
    <div class='header'>
        <%@ include file="../header_footer/header.jsp"%>
    </div>

    <!-- bbs_view -->
    <div class=''>
        <div class='bbs_write_content'>
            <div class=''>
                <div class='bbs_write_maintitle'>
                    <h3>게시판</h3>
                </div>
                <div class=''>
                    <form class="write_modify_Form" method="post" enctype="multipart/form-data" >  
                        <table>
                            <tbody>

                                <tr class='write_modify_title'>
                                    <th><h5>제목</h5></th>
                                    <td>
                                        <textarea name='title'>${article.title}</textarea>
                                    </td>
                                </tr>
                                <tr class='write_modify_content'>
                                    <th><h5>내용</h5></th>
                                    <td>
                                        <textarea name='content'>${article.content}</textarea>
                                    </td>
                                </tr>                               
                                <tr>
                                    <td>파일첨부</td>
                                    <td><input type="file" name="uploadfile" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <c:if test="${a == 'a'}" >
                            <div>
                                <input type='button' name='' class='write_confirm' value='확인'>
                            </div>
                        </c:if>
                        
                        <c:if test="${a == 'b'}" >
                            <div>
                                <input type='button' name='' class='modify_confirm' value='확인'>
                            </div>
                        </c:if>
                        <div class='modify_delete'>
                            <input type='button' name='' class='cancel' value='취소'>
                        </div>
                                                                        
                      </form>
                    </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class='footer'>
        <%@ include file="../header_footer/footer.jsp"%>
    </div>


</body>
</html>
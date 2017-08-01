<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css"
    href="/resources/css/bbs_write.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        $('.cancel').click(function(e) {
            window.location.href = "/board/article_list/${boardcd}/"
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
        <div class='bbs_view_content'>
            <div class=''>
                <div class='bbs_view_maintitle'>
                    <h3>게시판</h3>
                </div>
                <div class=''>
                    <form class="writeForm" action="/board/article_write/${boardcd}/${article.articleno}" method="post" enctype="multipart/form-data" >  
                        <table>
                            <tbody>
                                <tr>
                                    <th><h5>제목</h5></th>
                                    <td>
                                        <textarea name='title'>
                                        ${article.title}
                                        </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th><h5>내용</h5></th>
                                    <td>
                                        <textarea name='content'>
                                        ${article.content}
                                        </textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <input type='submit' name='' class='confirm' value='확인'>
                        </div>                        
                      </form>
                                          
                    <div class='modify_delete'>
                        <div>
                            <input type='button' name='' class='cancel' value='취소'>
                        </div>
                    </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>


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
        <script>
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
                                <td><h6>번호 내용</h6></td>
                            </tr>
                            <tr>
                                <th><h5>제목</h5></th>
                                <td><h6>제목 내용</h6></td>
                            </tr>
                            <tr>
                                <th><h5>작성자</h5></th>
                                <td><h6>작성자 내용</h6></td>
                            </tr>
                            <tr>
                                <th><h5>날짜</h5></th>
                                <td><h6>날짜 내용</h6></td>
                            </tr>
                            <tr>
                                <th><h5>내용</h5></th>
                                <td><h6>내용 내용</h6></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class='modify_delete'>
                        <div>
                            <input type='bottom' name=''class='bbs_view_modify' value='수정'>
                        </div>
                        <div>
                            <input type='bottom' name=''class='bbs_view_delete' value='삭제'>
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
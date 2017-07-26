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
<link rel="stylesheet" type="text/css" href="/resources/css/bbs.css">

<script src='/resources/js/jquery-3.1.0.js'></script>
<script src='/resources/js/jquery-ui.js'></script>
<script src="/resources/js/common.js"></script>

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
                <li><h5>공지사항</h5></li>
                <li><h5>질문과 답변</h5></li>
                <li><a href='/bbs/bbs'><h5>게시판</h5></a></li>
                <li><h5>포토갤러리</h5></li>
                <li><h5>홍보동영상</h5></li>
            </ul>
        </div>
        <!-- bbs 우측내용 -->
        <div class='bbs_content'>
            <div class=''>
                <div class='bbs_maintitle'>
                    <h3>게시판</h3>
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
                                <tr>
                                    <td><h6>${list.articleno}</h6></td>
                                    <td><h6>${list.title}</h6></td>
                                    <td><h6>${list.regdate}</h6></td>
                                    <td><h6>${list.hit}</h6></td>
                                    <td><h6>${list.hit}</h6></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class='bbs_write'>
                        <div>
                            <div>
                                <input type='bottom' name=''
                                    class='prev_bbs' value='이전'>
                            </div>
                            <div>
                                <input type='bottom' name=''
                                    class='next_bbs' value='다음'>
                            </div>
                        </div>
                        <div class='write_bottom'>
                            <input type='bottom' name=''
                                class='write_bbs' value='글쓰기'>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/program.css">
		
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

	<!-- program  -->

	<div class='wrap'>
	<!-- 좌측메뉴 -->
		<div class='side_menu'>
			<div><h3>여름수련회</h3></div>
			<ul>
                <li><a href='/etc/program01'><h5>휴식형 프로그램</h5></a></li>
                <li><a href='/etc/program02'><h5>체험형 프로그램</h5></a></li>
                <li><a href='/etc/program03'><h5>템플라이프</h5></a></li>
			</ul>
		</div>
	<!-- 우측내용 -->
		<div class='program_content'>
			<div class=''>
				<div class='program_tit01'>
					<p>체험형 프로그램</p>
				</div>
				<div class='program_tit02'>
					<div><p>어디론가 훌쩍 떠나고 싶을 때 속세를 벗어나 산사에서 머물며 지친 몸과 마음을 재충전 할 수 있는 시간을 가지세요.
휴식형은 산사에서 머물며 자기만의 시간을 가질 수 있고 자기를 돌아 볼 수 있는 시간을 가질 것입니다.</p>
                    </div>
					<div><strong>첫째 날, 마음 비우는 날</strong>
					   <table>
		                  <tbody>
		                      <tr>
		                          <th>시간</th>
		                          <th>일정</th>
		                      </tr>
		                      <tr>
                                  <td>14:30</td>
                                  <td>도착, 수련복 지급, 방사안내</td>
                              </tr>
                              <tr>
                                  <td>15:30</td>
                                  <td>사찰 예절 습의 & 도량안내</td>
                              </tr>
                              <tr>
                                  <td>17:20</td>
                                  <td>저녁공양</td>
                              </tr>
                              <tr>
                                  <td>18:10</td>
                                  <td>사물울림(타종체험)</td>
                              </tr>
                              <tr>
                                  <td>19:00</td>
                                  <td>수행 - 108염주 만들기(1알 1배)</td>
                              </tr>
                              <tr>
                                  <td>20:00</td>
                                  <td>전나무 숲길 포행</td>
                              </tr>
                              <tr>
                                  <td>21:00</td>
                                  <td>취침</td>
                              </tr>
		                  </tbody>			       
					   </table>
					</div>
					<p></p>
					<div><strong>둘째 날, 마음 채우는 날</strong>
					   <table>
                          <tbody>
                              <tr>
                                  <th>시간</th>
                                  <th>일정</th>
                              </tr>
                              <tr>
                                  <td>03:50</td>
                                  <td>기상 및 세면</td>
                              </tr>
                              <tr>
                                  <td>04:20</td>
                                  <td>새벽예불</td>
                              </tr>
                              <tr>
                                  <td>05:00</td>
                                  <td>나를 깨우는 108배 & 명상</td>
                              </tr>
                              <tr>
                                  <td>06:20</td>
                                  <td>아침공양</td>
                              </tr>
                              <tr>
                                  <td>09:00</td>
                                  <td>스님과의 차담</td>
                              </tr>
                              <tr>
                                  <td>10:00</td>
                                  <td>방사정리 & 설문지 작성</td>
                              </tr>
                              <tr>
                                  <td>11:20</td>
                                  <td>점심 공양 & 회향</td>
                              </tr>
                          </tbody>  
                       </table>
					</div>
				</div>
				<div class='program_tit03'>
					<div>
					   <p>ㆍ상기 프로그램 일정은 날씨 및 사중일정 등으로 변경될 수 있음을 공지합니다.</p>
					   <p>ㆍ참가비는 반드시 <span>전화로 예약확인 후 입금</span> 부탁드립니다.</p>
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

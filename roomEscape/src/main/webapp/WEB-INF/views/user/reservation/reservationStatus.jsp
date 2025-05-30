<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
LocalDate today = LocalDate.now();
request.setAttribute("today", today.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 및 취소</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="reservation-container">
		<h2>예약 확인 및 취소</h2>
		<button type="button" onclick="realTimeReservation()">실시간예약</button>
		<button type="button" onclick="reservationStatus()">예약확인/취소</button>

		<table class="notice-table">
			<thead>
				<tr>
					<td>No.</td>
					<td>테마명</td>
					<td>예약일정</td>
					<td>예약지점</td>
					<td>예약인원</td>
					<td>예약취소</td>
					<td>리뷰</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${item.THEME_TITLE}</td>
						<td>${item.RESV_DATE}(${item.TIME_LABEL})</td>
						<td>${item.BRANCH_NAME}</td>
						<td>${item.NUM_PEOPLE}</td>
						<td><c:if test="${item.RESV_DATE > today}">
								<button type="button" onclick="cancel(${item.RESV_ID})">예약취소</button>
							</c:if> <c:if test="${item.RESV_DATE <= today}">
	                            취소불가
	                        </c:if></td>
						<td><c:if
								test="${item.RESV_DATE <= today && item.isReviewed == 0}">
								<button type="button"
									onclick="review('${fn:escapeXml(item.THEME_TITLE)}',
	                            									  '${fn:escapeXml(item.THEME_ID)}',
	                            									  '${fn:escapeXml(item.RESV_ID)}')">리뷰작성
								</button>
							</c:if> <c:if test="${item.RESV_DATE <= today && item.isReviewed == 1}">
						        작성완료
						    </c:if> <c:if test="${item.RESV_DATE > today }">
	                            작성불가
	                        </c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
    
        function realTimeReservation(){
            location.href="/user/res/userReservation";
        }
        function reservationStatus(){
            location.href="/user/res/reservationStatus";
        }
        function cancel(RESV_ID){
            if (confirm("예약을 취소하시겠습니까?")) {
                location.href = "/user/res/reservation/cancel?RESV_ID=" + (RESV_ID);
            }
        }
        function review(title,theme_id,resv_id){
            location.href = "/review/write_review?title=" + encodeURIComponent(title)+"&theme_id="+theme_id+"&resv_id="+resv_id;
        }
    </script>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
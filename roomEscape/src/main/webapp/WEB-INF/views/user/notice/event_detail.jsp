<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/event-detail.css">
    <title>이벤트 상세 보기</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="wrap">
		<h2>이벤트 상세</h2>
		<div class="event-detail-container">
			<table>
				<thead>
					<tr>
						<th>-</th>
						<th>-</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>제목</td>
						<td>${event.title}</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td>${regDateFormatted}</td>
					</tr>
					<c:if test="${not empty event.start_date}">
						<tr>
							<td>시작일</td>
							<td>${startDateFormatted}</td>
						</tr>
						<tr>
							<td>종료일</td>
							<td>${endDateFormatted}</td>
						</tr>
						<tr>
							<td>진행 상태</td>
							<td>${event.is_active eq 'Y' ? '진행 중' : '종료'}</td>
						</tr>
					</c:if>
					<tr>
						<td>내용</td>
						<td><div class="event-content">${event.content}</div></td>
					</tr>
				</tbody>
			</table>
			<a class="to-list" href="/user/notice/list">목록으로</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

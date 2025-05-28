<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice-detail.css">
	<title>공지사항 상세보기</title>
</head>	
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="wrap">
		<h2>공지사항 상세</h2>
		<div class="notice-detail-container">
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
						<td>${notice.title}</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td>${notice.regDate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><div class="notice-content">${notice.content}</div></td>
					</tr>
				</tbody>
			</table>
			<a class="to-list" href="${pageContext.request.contextPath}/user/notice/list">목록으로</a>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

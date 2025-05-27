<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>공지사항 상세보기</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <h2>${notice.title}</h2>
    <p><strong>등록일:</strong> ${notice.regDate}</p>
    <hr>
    <p>${notice.content}</p>
    <br>
    <a href="${pageContext.request.contextPath}/user/notice/list">목록으로</a>
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
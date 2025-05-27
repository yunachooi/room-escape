<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>상세 보기</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <h2>${event.title}</h2>
    <p><strong>등록일:</strong> ${event.reg_date}</p>
    <c:if test="${not empty event.start_date}">
        <p><strong>시작일:</strong> ${event.start_date}</p>
        <p><strong>종료일:</strong> ${event.end_date}</p>
        <p><strong>진행 상태:</strong> ${event.is_active eq 'Y' ? '진행 중' : '종료'}</p>
    </c:if>
    <hr>
    <p>${event.content}</p>
    <br>
    <a href="/user/notice/list">목록으로</a>
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>FAQ 작성/수정</title>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-faqForm.css">
</head>
<body>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<div id="main-content">
    <h2>FAQ ${faq != null ? '수정' : '작성'}</h2>
    <form action="/admin/faq/save" method="post">
        <input type="hidden" name="faq_id" value="${faq.faq_id}">
        <label>질문</label><br>
        <input type="text" name="question" value="${faq.question}" required style="width: 100%;"><br><br>
        <label>답변</label><br>
        <textarea name="answer" required style="width: 100%; height: 200px;">${faq.answer}</textarea><br><br>
        <button type="submit">저장</button>
    </form>
</div>
</body>
</html>
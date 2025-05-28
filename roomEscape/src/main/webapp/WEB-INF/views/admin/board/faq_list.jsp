<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>FAQ 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-faqlist.css">
</head>
<body>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<div id="main-content">
    <h2>FAQ 목록</h2>
    <table class="faq-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>질문</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="faq" items="${faqList}">
                <tr>
                    <td>${faq.faq_id}</td>
                    <td>${faq.question}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/faq/form?faq_id=${faq.faq_id}">수정</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="${pageContext.request.contextPath}/admin/faq/form">
        <button type="button">FAQ 작성하기</button>
    </a>
</div>
</body>
</html>

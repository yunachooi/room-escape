<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-branch.css">
	<title>지점 목록</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
    <h2>지점 목록</h2>
    <a href="/admin/branch/form">+ 새 지점 등록</a>
    <table border="1">
        <tr>
            <th>지점 ID</th><th>지점 이름</th><th>주소</th><th>관리</th>
        </tr>
        <c:forEach var="branch" items="${branchList}">
            <tr>
                <td>${branch.branchId}</td>
                <td>${branch.name}</td>
                <td>${branch.address}</td>
                <td>
                    <a href="/admin/branch/form?id=${branch.branchId}">수정</a>
                    <a href="/admin/branch/delete?id=${branch.branchId}" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

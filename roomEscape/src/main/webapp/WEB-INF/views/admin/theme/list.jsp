<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-theme.css">
    <title>테마 목록</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
    <h2>테마 목록</h2>
    <a href="${pageContext.request.contextPath}/admin/theme/form">+ 테마 추가</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>난이도</th>
            <th>시간</th>
            <th>최소인원</th>
            <th>최대인원</th>
            <th>활성여부</th>
            <th>관리</th>
        </tr>
        <c:forEach var="theme" items="${themes}">
            <tr>
                <td>${theme.theme_id}</td>
                <td>${theme.title}</td>
                <td>${theme.theme_level}</td>
                <td>${theme.duration}</td>
                <td>${theme.capacity_min}</td>
                <td>${theme.capacity_max}</td>
                <td>${theme.is_active}</td>
                <td>
				    <form method="get" action="${pageContext.request.contextPath}/admin/theme/form">
				        <input type="hidden" name="theme_id" value="${theme.theme_id}">
				        <button type="submit">수정</button>
				    </form>
				    <form method="post" action="${pageContext.request.contextPath}/admin/theme/delete">
				        <input type="hidden" name="theme_id" value="${theme.theme_id}">
				        <button type="submit" onclick="confirmDelete(${theme_id})">삭제</button>
				    </form>
				</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
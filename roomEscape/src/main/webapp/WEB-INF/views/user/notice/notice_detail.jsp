<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 상세보기</title>
</head>
<body>
    <h2>${notice.title}</h2>
    <p><strong>등록일:</strong> ${notice.regDate}</p>
    <hr>
    <p>${notice.content}</p>
    <br>
    <a href="${pageContext.request.contextPath}/user/notice/list">목록으로</a>
</body>
</html>
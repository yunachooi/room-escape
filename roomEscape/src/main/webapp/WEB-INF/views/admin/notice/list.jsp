<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-notice.css">
  <title>공지사항 & 이벤트 목록</title>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<h2>공지사항 & 이벤트 목록</h2>
<p><a href="/admin/notice/form">+ 새 글 등록</a></p>

<table>
  <tr>
    <th>글번호</th>
    <th>제목</th>
    <th>내용</th>
    <th>작성일</th>
    <th>삭제</th>
  </tr>

  <c:forEach var="notice" items="${noticeList}">
    <tr>
      <td>${notice.noticeId}</td>
      <td>${notice.title}</td>
      <td>${notice.content}</td>
      <td>${notice.regDate}</td>
      <td>
        <a href="/admin/notice/delete?id=${notice.noticeId}">❌ 삭제</a>
      </td>
    </tr>
  </c:forEach>
</table>

<div style="text-align:center; margin-top:20px; font-size:16px;">
  <c:forEach begin="1" end="${totalPages}" var="i">
    <c:choose>
      <c:when test="${i eq currentPage}">
        <span style="font-weight:bold; color:#d9534f; margin:0 8px;">${i}</span>
      </c:when>
      <c:otherwise>
        <a href="?page=${i}" style="text-decoration:none; color:#337ab7; margin:0 8px;">${i}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-qna.css">
<title>QNA 페이지</title>
</head>
<body id="main-content">
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
	<h2>Show QnA List Page </h2>
	<form action="/qna/search_qna" method="GET">
		<select name="type">
			<option value="title">제목</option>
			<option value="content">본문</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword" >
		<input type="submit" value="검색">
	</form>

	<table >
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="qna" items="${qna_list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><a href ="/qna/show_qna_detail_user?qna_id=${qna.qna_id }">${qna.title}</a></td>
					<td>${qna.content}</td>
					<td>${qna.reg_date}</td>
					<td>${qna.member_id}</td>
					<td>${qna.is_answered}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!--  삭제 버튼 추가 필요  -->
	
	<c:if test="${not empty success }">
		<script>
			alert("${success}");
		</script>
	</c:if>
</body>
</html>
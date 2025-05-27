<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq-detail.css">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="wrap">
	<h2>자주 묻는 질문</h2>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>${faq.faq_id}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>제목</td>
					<td>${faq.question }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${faq.answer}</td>
				</tr>
			</tbody>
		</table>
		<a class="to-list" href="/faq/show_list_user">목록으로</a>
	</div>
    <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
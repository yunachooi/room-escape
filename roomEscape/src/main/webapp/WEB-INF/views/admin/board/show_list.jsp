<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>FAQ Show List Page</h1>
	<hr>
	<table border = "1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="faq" items="${faqList}">
				<tr>
					<td>${faq.faq_id}</td>
					<td><a href="/faq/show_detail_faq?faq_id=${faq.faq_id}">${faq.question}</a></td>
					<td>${faq.admin_id}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Show Detail FAQ Page</h1>
	<hr>
	
	<table border ="1">
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
			<tr>
				<td>작성자</td>
				<td>${faq.admin_id }</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
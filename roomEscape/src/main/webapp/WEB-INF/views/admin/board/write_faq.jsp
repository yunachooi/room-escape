<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>FAQ Write Page</h1>
	<hr>
	<form action="/faq/write_faq" method="GET">
		제목: <input type="text" name="question">
		내용: <input type="text" name="answer">
		<%-- 작성자 ID 수정 필요 --%>
		<%-- <input type="hidden" name="admin_id" value="${session.id }"> --%>
		<input type="submit" value="작성">
	</form>
</body>
</html>
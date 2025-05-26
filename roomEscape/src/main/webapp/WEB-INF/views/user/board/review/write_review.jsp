<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Write Review Page</h1>
	<hr>
	<form>
		<input type="radio" name="rating" value="5" checked>5
		<input type="radio" name="rating" value="4">4
		<input type="radio" name="rating" value="3">3
		<input type="radio" name="rating" value="2">2
		<input type="radio" name="rating" value="1">1
		<textarea name="content"></textarea>
		<input type="hidden" name="theme_id" value="${theme_id }">
		<input type="text" value="${session.getMember_id }">
			
	</form>
</body>
</html>
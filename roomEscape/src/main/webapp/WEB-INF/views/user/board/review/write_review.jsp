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
	<form action="/review/insert_review" method="GET">
	<table >
		<thead>
			<tr>
				<td>테마</td>
				<td>${title } </td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>평점</td>
				<td>
					<input type="radio" name="rating" value="5" checked>5
					<input type="radio" name="rating" value="4">4
					<input type="radio" name="rating" value="3">3
					<input type="radio" name="rating" value="2">2
					<input type="radio" name="rating" value="1">1
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="member_id" value="${loginInfo.member_id }" readonly>
					<input type="hidden" name="theme_id" value="${theme_id }">
					<input type="hidden" name="resv_id" value="${resv_id }">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성"></td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>
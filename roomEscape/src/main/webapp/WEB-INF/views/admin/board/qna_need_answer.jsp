<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>QNA Need to Answer Page</h1>
	<hr>
	<table border = "1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>비밀번호</th>
				<th>작성일</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>${qna.qna_id}</td>
					<td>${qna.title}</td>
					<td>${qna.content}</td>
					<td>${qna.password}</td>
					<td>${qna.reg_date}</td>
					<td>${qna.member_id}</td>
				</tr>
		</tbody>
	</table>
	<hr>
	<form action="/qna/upload_qna_answer" method="POST">
		<input type="hidden" name="qna_id" value="${qna.qna_id }">
		답변: <textarea name="answer"></textarea>
		<%-- 관리자 ID 자동 삽입 필요함. --%>
		<%-- <input type="hidden" value="${session.id}" --%>
		<input type="submit" value="등록">
	</form>
</body>
</html>
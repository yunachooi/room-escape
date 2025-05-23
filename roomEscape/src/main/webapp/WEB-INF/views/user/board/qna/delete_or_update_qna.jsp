<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>QnA Delete Or Update Page</h1>
	<hr>
	<table border="1" cellpadding="5" cellspacing="0">
		<thead>
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>답변 여부</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${qna.title }</td>
				<td>${qna.content }</td>
				<td>${qna.reg_date }</td>
				<td>${qna.member_id }</td>
				<td>${qna.is_answered}</td>
			</tr>
		</tbody>
	</table>
	<hr>
	<form action="/qna/delete_qna_user" method="post">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>작성자 이름 (아이디)</th>
                <td><input type="text" name="member_id" required></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" required value="${qna.title }"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="5" cols="40" required >${qna.content }</textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                	<input type="hidden" name="qna_id" value="${qna.qna_id }">
                    <input type="submit" name="action" value="수정">
                    <input type="submit" name="action" value="삭제" onclick="return confirm('정말 삭제하시겠습니까?');">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
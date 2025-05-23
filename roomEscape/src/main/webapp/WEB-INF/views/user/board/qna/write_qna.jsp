<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QnA 작성</title>
</head>
<body>
    <h2>QnA 작성 페이지</h2>
    <form action="/qna/write_qna_user" method="post">
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
                <td><input type="text" name="title" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="5" cols="40" required></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="등록">
                    <input type="reset" value="초기화">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

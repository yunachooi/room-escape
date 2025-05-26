<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1>
	<hr>
	<form>
	<table border="1" cellpadding="5" cellspacing="0">
		<thead >
			<tr>
				<th>아아디</th>
				<th><input type="text" name="id" value="${loginInfo.member_id }" readonly></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw" value="${loginInfo.password }" required> </td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" name="pwcheck" value="${loginInfo.password }" required> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="pw" value="${loginInfo.name }" required></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="pw" value="${loginInfo.phone }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="pw" value="${loginInfo.email }"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="text" name="pw" value="${loginInfo.reg_date }" readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>
					
		</tbody>
	</table>
	</form>
	<hr>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Login Page</h1>
	<hr>
	
	<c:if test="${login_error1 }">
		<script>
			alert("ID 와 PW 모두 입력해주세요.");
		</script>
	</c:if>
	<c:if test="${login_error2 }">
		<script>
			alert("ID 혹은 PW가 틀립니다.");
		</script>
	</c:if>
	
	<c:if test="${not empty need_admin}">
		<script>
			alert('${need_admin}');
		</script>
	</c:if>
	
	<form action="/user/login" method="POST">
		ID:<input type="text" name="id" ><br>
		PW: <input type="password" name="pw" >
		<input type="submit" value="로그인">
	</form>
</body>
</html>
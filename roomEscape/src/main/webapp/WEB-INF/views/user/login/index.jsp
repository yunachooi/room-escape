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
	<h1>Index Page</h1>
	<hr>
	
	<c:if test="${not empty loginInfo}">
		<h2>${loginInfo.name } 님, 환영합니다! </h2>
	</c:if>
	
	
	<a href="/user/to_login">로그인 하러가기</a><br>
	<hr>
	<a href="/qna/show_qna_user">QnA 보러가기</a><br>
	<a href="/qna/to_write_qna_user">QnA 작성하기</a><br>
	<hr>
	<a href="/faq/show_list_user">FAQ 보러가기</a>
	
</body>
</html>
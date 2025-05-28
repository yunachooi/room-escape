<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<title>Insert title here</title>
</head>
<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

<body>
<main>
	<form method="POST" action="/user_info/update_info">
    <h2>마이페이지</h2>

    <label>아이디</label>
    <input type="text" name="member_id" value="${loginInfo.member_id}" readonly>

    <label>비밀번호</label>
    <input type="password" name="password" required>

    <label>비밀번호 확인</label>
    <input type="password" name="pwcheck" required>

    <label>이름</label>
    <input type="text" name="name" value="${loginInfo.name}" required>

    <label>전화번호</label>
    <input type="text" name="phone" value="${loginInfo.phone}">

    <label>이메일</label>
    <input type="text" name="email" value="${loginInfo.email}">

    <label>가입일</label>
    <input type="text" name="reg_date" value="${loginInfo.reg_date}" readonly>

    <input type="submit" value="수정">
</form>
</main>
	<hr>
	
</body>

<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
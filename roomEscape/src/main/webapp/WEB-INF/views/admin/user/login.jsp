<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body class="index">
	
	<c:if test="${login_error1}">
		<script>
			alert("ID 와 PW 모두 입력해주세요. ");
		</script>
	</c:if>
	<c:if test="${login_error2 }">
		<script>
			alert("ID 혹은 PW가 틀립니다.");
		</script>
	</c:if>
	<c:if test="${update_info_fail }">
		<script>
			alert("정보 수정에 실패했습니다.");
		</script>
	</c:if>
	<div id="formWrap">
    <img id="logo" src="/images/compoment/logo.png" alt="logo">
    <form action="/user/login" method="POST">
        ID<input type="text" name="id"><br>
        PW<input type="password" name="pw"><br>

        <div class="form-actions">
            <div class="submit-wrap">
	            <input type="submit" value="로그인">
	        </div>
            <div class="signup-area">
                <p>아이디가 없으세요?</p>
                <a href="/user/regist" class="btn-link">회원가입</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
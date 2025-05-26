<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<title>Room Escape</title>
</head>
<body class="index">
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<!-- fullscreen 이미지 -->
	  <div class="hero">
	    <div class="hero-text">
	      <h1>THE EXIT IS NOT <br>WHAT IT SEEMS</h1>
	      <p>
			  <span class="line1">방 안의 모든 것은 단서다.</span><br>
			  <span class="line2">당신의 직감이 열쇠가 된다.</span>
		  </p>
	    </div>
	  </div>
	
	<!-- 검색 영역 -->

	<Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>

	<script>
		document.addEventListener('DOMContentLoaded', function () {
		    const header = document.getElementById('mainHeader');
		    header.classList.add('transparent');
	
		    window.addEventListener('scroll', function () {
		      if (window.scrollY > 200) {
		        header.classList.remove('transparent');
		      } else {
		        header.classList.add('transparent');
		      }
		    });
		  });
	</script>

</html>
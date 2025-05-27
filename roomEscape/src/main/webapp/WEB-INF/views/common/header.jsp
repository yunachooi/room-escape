<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header id="mainHeader">
  <nav class="nav-container">
  <div class="main-nav">
	    <ul class="nav-left">
	      <li><a href="/user/theme/list">테마</a></li>
	      <li><a href="/user/res/userReservation">예약</a></li>
	    </ul>
	    <div class="logo">
	      	<a href="/"><img id="logo" src="/images/compoment/logo.png" alt="logo"></a>
	    </div>
	    <ul class="nav-right">
	      <li><a href="/user/notice/list">게시판</a></li>
	      <li><a href="/faq/show_list_user">FAQ</a></li>
	    </ul>
  </div>
    <div class="auth">
	    <c:if test="${not empty sessionScope.loginInfo}">
	        <span>${sessionScope.loginInfo.name}님 환영합니다.</span> | 
	        <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
	    </c:if>
	    <c:if test="${empty sessionScope.loginInfo}">
	        <a href="${pageContext.request.contextPath}/user/to_login">로그인</a> |
	        <a href="${pageContext.request.contextPath}/user/regist">회원가입</a>
	    </c:if>
	</div>
  </nav>
</header>
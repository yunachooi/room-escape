<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice-detail.css">
	<title>공지사항 상세보기</title>
</head>	
<body>
<h2>공지사항 & 이벤트 작성</h2>
<form method="post" action="/admin/notice/insert">
  <p>
    지점 선택:
    <label><input type="radio" name="branch" value="강남" checked> 강남</label>
    <label><input type="radio" name="branch" value="홍대"> 홍대</label>
    <label><input type="radio" name="branch" value="잠실"> 잠실</label>
  </p>
  <p>
    종류:
    <label><input type="radio" name="prefix" value="[공지사항]" checked> 공지사항</label>
    <label><input type="radio" name="prefix" value="[이벤트]"> 이벤트</label>
  </p>
  <p>제목: <input type="text" name="title" required></p>
  <p>내용:<br><textarea name="content" rows="10" cols="60"></textarea></p>
  <p><input type="submit" value="등록"></p>
  
</form>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h2>공지사항 & 이벤트 작성</h2>
<form method="post" action="/admin/notice/insert">
  <p>
    지점 선택:
    <label><input type="radio" name="branch" value="강남" checked> 강남</label>
    <label><input type="radio" name="branch" value="홍대"> 홍대</label>
    <label><input type="radio" name="branch" value="종로"> 종로</label>
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

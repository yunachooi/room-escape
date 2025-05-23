<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h2>공지사항 & 이벤트 작성</h2>
<form method="post" action="/admin/notice/insert">
    <p>
        <label><input type="radio" name="prefix" value="[공지]" checked> 공지</label>
        <label><input type="radio" name="prefix" value="[이벤트]"> 이벤트</label>
    </p>
    <p>제목: <input type="text" name="title" required></p>
    <p>내용:<br>
        <textarea name="content" rows="10" cols="50" required></textarea>
    </p>
    <p><input type="submit" value="등록"></p>
</form>

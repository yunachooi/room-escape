<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>테마 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #333;
            color: white;
        }

        header a {
            margin-left: 15px;
            color: white;
            text-decoration: none;
        }

        nav {
            display: flex;
            justify-content: center;
            gap: 30px;
            background-color: #f2f2f2;
            padding: 10px 0;
        }

        nav a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        .theme-container {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            justify-content: flex-start;
            gap: 20px;
        }

        .theme-card {
            width: calc(25% - 20px); /* 한 줄에 4개 */
            box-sizing: border-box;
            text-align: center;
        }

        .theme-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border: 1px solid #ccc;
        }

        .theme-title {
            margin-top: 10px;
            font-size: 16px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<header>
    <h1>Room Escape</h1>
    <div>
        <a href="/user/to_login">로그인</a>
        <a href="/user/regist">회원가입</a>
        <a href="/user_info/show_info">마이페이지</a>
    </div>
</header>

<nav>
    <a href="/user/theme/list">테마</a>
    <a href="/user/res/userReservation">예약하기</a>
    <a href="/user/notice/list">공지사항 & 이벤트</a>
    <a href="/user/board/index">게시판</a>
</nav>

<h2>전체 테마</h2>

<div class="theme-container">
    <c:forEach var="theme" items="${themeList}">
        <div class="theme-card">
            <img src="/images/themes/${theme.theme_id}.jpeg" alt="${theme.title}" />
            <div class="theme-title">${theme.title}</div>
        </div>
    </c:forEach>
</div>

</body>
</html>

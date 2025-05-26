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
            <img src="/images/themes/${theme.theme_id}.jpeg"
			     alt="${theme.title}"
			     onclick="showDetail(${theme.theme_id})"
			     style="cursor: pointer;" />

            <div class="theme-title">${theme.title}</div>
        </div>
    </c:forEach>
</div>

<!-- ✅ 모달창 -->
<div id="themeModal" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%);
    background:white; border:1px solid #aaa; padding:20px; z-index:9999; box-shadow:0 0 10px rgba(0,0,0,0.3);">
    
    <h3 id="modalTitle"></h3>
    <p><b>설명:</b> <span id="modalDescription"></span></p> 
    <p><b>유형:</b> <span id="modalType"></span></p>
    <p><b>난이도:</b> <span id="modalLevel"></span></p>
    <p><b>정원:</b> <span id="modalCapacity"></span></p>
    <p><b>소요시간:</b> <span id="modalDuration"></span>분</p>
    <p><b>지점:</b> <span id="modalBranch"></span></p>

    <button id="reservationBtn">예약하기</button>
    <button id="reviewWriteBtn">리뷰 작성</button>
    <button onclick="closeModal()">닫기</button>

    <input type="hidden" id="modalThemeId" />
</div>

<script>
    function showDetail(themeId) {
    	
    	 console.log("이미지 클릭됨! themeId = " + themeId); // ✅ 로그 확인용
    	
        fetch('/user/theme/detail?theme_id=' + themeId)
            .then(res => res.json())
            .then(data => {
                document.getElementById('modalTitle').textContent = data.title;
                document.getElementById('modalDescription').textContent = data.description;
                document.getElementById('modalType').textContent = data.type_name;
                document.getElementById('modalLevel').textContent = data.theme_level;
                document.getElementById('modalCapacity').textContent = data.capacity_min + " ~ " + data.capacity_max;
                document.getElementById('modalDuration').textContent = data.duration;
                document.getElementById('modalBranch').textContent = data.branch_name;
                document.getElementById('modalThemeId').value = themeId;

                document.getElementById('themeModal').style.display = 'block';
            });
    }

    function closeModal() {
        document.getElementById('themeModal').style.display = 'none';
    }

    document.addEventListener("click", function(event) {
        const modal = document.getElementById("themeModal");
        if (modal.style.display === 'block' && !modal.contains(event.target)) {
            closeModal();
        }
    });

    document.addEventListener("DOMContentLoaded", function () {
        const reviewBtn = document.getElementById("reviewWriteBtn");
        const reserveBtn = document.getElementById("reservationBtn");

        if (reviewBtn) {
            reviewBtn.addEventListener("click", function () {
                const themeId = document.getElementById("modalThemeId").value;
                const isLoggedIn = ${not empty sessionScope.loginInfo};
                if (isLoggedIn) {
                    location.href = "/user/board/review/show_review_list?themeId=" + themeId;
                } else {
                    alert("로그인이 필요한 기능입니다.");
                }
            });
        }

        if (reserveBtn) {
            reserveBtn.addEventListener("click", function () {
                const themeId = document.getElementById("modalThemeId").value;
                const isLoggedIn = ${not empty sessionScope.loginInfo};
                if (isLoggedIn) {
                    location.href = "/user/res/userReservation?theme_id=" + themeId;
                } else {
                    alert("로그인이 필요한 기능입니다.");
                }
            });
        }
    });
</script>



</body>
</html>

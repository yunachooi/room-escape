<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>테마 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .theme-container {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            justify-content: flex-start;
            gap: 20px;
        }
        .theme-card {
            width: 220px;
            text-align: center;
        }
        .theme-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border: 1px solid #ddd;
        }
        .theme-buttons button {
            margin: 5px;
            padding: 8px 12px;
            font-size: 14px;
            cursor: pointer;
        }
        #themeModal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            border: 1px solid #aaa;
            padding: 20px;
            z-index: 9999;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<h2>테마 목록</h2>

<input type="hidden" id="isLoggedIn" value="${not empty sessionScope.loginInfo}" />

<form method="get" action="/user/theme/list">
    <select name="sort" onchange="this.form.submit()">
        <option value="">-- 정렬 선택 --</option>
        <option value="rating" ${param.sort == 'rating' ? 'selected' : ''}>평점순</option>
        <option value="popular" ${param.sort == 'popular' ? 'selected' : ''}>리뷰 많은순</option>
    </select>

    <select name="type_id">
        <option value="">유형별</option>
        <c:forEach var="type" items="${types}">
            <option value="${type.type_id}" ${type.type_id eq param.type_id ? 'selected' : ''}>${type.type_name}</option>
        </c:forEach>
    </select>

    <select name="branch_id">
        <option value="">지점별</option>
        <c:forEach var="branch" items="${branches}">
            <option value="${branch.branch_id}" ${branch.branch_id eq param.branch_id ? 'selected' : ''}>${branch.name}</option>
        </c:forEach>
    </select>

    <select name="theme_level">
        <option value="">난이도별</option>
        <option value="쉬움" ${param.theme_level == '쉬움' ? 'selected' : ''}>쉬움</option>
        <option value="보통" ${param.theme_level == '보통' ? 'selected' : ''}>보통</option>
        <option value="어려움" ${param.theme_level == '어려움' ? 'selected' : ''}>어려움</option>
        <option value="익스트림" ${param.theme_level == '익스트림' ? 'selected' : ''}>익스트림</option>
    </select>

    <select name="people">
        <option value="">인원별</option>
        <option value="2" ${param.people == '2' ? 'selected' : ''}>2명</option>
        <option value="3" ${param.people == '3' ? 'selected' : ''}>3명</option>
        <option value="4" ${param.people == '4' ? 'selected' : ''}>4명</option>
    </select>

    <button type="submit">검색</button>
</form>

<div class="theme-container">
    <c:forEach var="theme" items="${themeList}">
        <div class="theme-card">
            <img src="/images/themes/${theme.theme_id}.jpeg" alt="${theme.title}" style="width:250px; height:350px;">
            <div>${theme.title}</div>
            <button onclick="showDetail(${theme.theme_id})">상세보기</button>
            <button onclick="location.href='/review/show_review?theme_id=${theme.theme_id}'">리뷰 보기</button>
            <button onclick="goWithLoginCheck('/user/res/userReservation', 'branch', ${theme.branch_id})">예약하기</button>
            <p>평점: ⭐ ${theme.avgRating} / 5.0</p>
            <p>리뷰 수: ${theme.reviewCount}개</p>
        </div>
    </c:forEach>
</div>

<div id="themeModal">
    <h3 id="modalTitle"></h3>
    <p><b>설명:</b> <span id="modalDescription"></span></p> 
    <p><b>유형:</b> <span id="modalType"></span></p>
    <p><b>난이도:</b> <span id="modalLevel"></span></p>
    <p><b>정원:</b> <span id="modalCapacity"></span></p>
    <p><b>소요시간:</b> <span id="modalDuration"></span>분</p>
    <p><b>지점:</b> <span id="modalBranch"></span></p>

    <input type="hidden" id="modalThemeId" />
    <input type="hidden" id="modalBranchId" />

    <button id="reservationBtn">예약하기</button>
    <button onclick="closeModal()">닫기</button>
</div>

<script>
    function showDetail(themeId) {
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
                document.getElementById('modalBranchId').value = data.branch_id;

                document.getElementById('themeModal').style.display = 'block';
            });
    }

    function closeModal() {
        document.getElementById('themeModal').style.display = 'none';
    }

    document.addEventListener("click", function (event) {
        const modal = document.getElementById("themeModal");
        if (modal.style.display === 'block' && !modal.contains(event.target)) {
            closeModal();
        }
    });

    function goWithLoginCheck(url, paramKey, paramValue) {
        const isLoggedIn = document.getElementById("isLoggedIn").value === "true";
        if (isLoggedIn) {
            location.href = `${url}?${paramKey}=${paramValue}`;
        } else {
            alert("로그인이 필요한 기능입니다.");
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("reservationBtn")?.addEventListener("click", () => {
            const branchId = document.getElementById("modalBranchId").value;
            goWithLoginCheck("/user/res/userReservation", "branch", branchId);
        });
    });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>

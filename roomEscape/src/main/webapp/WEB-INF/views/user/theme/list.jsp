<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>테마 목록</title>
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

<h2>테마 목록</h2>

<!-- ✅ 로그인 여부 전달용 hidden 값 -->
<input type="hidden" id="isLoggedIn" value="${not empty sessionScope.loginInfo}" />

<!-- ✅ 필터 검색폼 유지 -->
<form method="get" action="/user/theme/list">
    <select name="sort" onchange="this.form.submit()">
        <option value="">-- 정렬 선택 --</option>
        <option value="rating" ${param.sort == 'rating' ? 'selected' : ''}>평점순</option>
        <option value="popular" ${param.sort == 'popular' ? 'selected' : ''}>리뷰 많은순</option>
    </select>
	
		<!-- ✅ 유형별 -->
	<select name="type_id">
	    <option value="">유형별</option>
	    <c:forEach var="type" items="${types}">
	        <option value="${type.type_id}" ${param.type_id == type.type_id ? 'selected' : ''}>
	            ${type.type_name}
	        </option>
	    </c:forEach>
	</select>
	
    <select name="branch_id">
        <option value="">지점별</option>
        <c:forEach var="branch" items="${branches}">
            <option value="${branch.branch_id}">${branch.name}</option>
        </c:forEach>
    </select>

    <select name="theme_level">
        <option value="">난이도별</option>
        <option value="쉬움">쉬움</option>
        <option value="보통">보통</option>
        <option value="어려움">어려움</option>
        <option value="익스트림">익스트림</option>
    </select>

    <select name="people">
        <option value="">인원별</option>
        <option value="2">2명</option>
        <option value="3">3명</option>
        <option value="4">4명</option>
    </select>

    <button type="submit">검색</button>
</form>

<!-- ✅ 카드 리스트 -->
<div class="theme-container">
    <c:forEach var="theme" items="${themeList}">
        <div class="theme-card">
            <img src="/images/themes/${theme.theme_id}.jpeg" alt="${theme.title}" style="width:250px; height:350px;">
            <div>${theme.title}</div>
            <button onclick="showDetail(${theme.theme_id})">상세보기</button>
            <button onclick="location.href='/review/show_review?themeId=${theme.theme_id}'">리뷰 보기</button>
          
          
           <button onclick="handleReservation(${theme.branch_id})">예약하기</button>



            <p>평점: ⭐ ${theme.avgRating} / 5.0</p>
            <p>리뷰 수: ${theme.reviewCount}개</p>

            <!-- ✅ 모든 사용자에게 보이되, 로그인 여부에 따라 동작 -->
            <button onclick="handleWrite(${theme.theme_id})">리뷰 작성</button>
        </div>
    </c:forEach>
</div>

<!-- ✅ 모달 창 -->
<div id="themeModal">
    <h3 id="modalTitle"></h3>
    <p><b>설명:</b> <span id="modalDescription"></span></p> 
    <p><b>유형:</b> <span id="modalType"></span></p>
    <p><b>난이도:</b> <span id="modalLevel"></span></p>
    <p><b>정원:</b> <span id="modalCapacity"></span></p>
    <p><b>소요시간:</b> <span id="modalDuration"></span>분</p>
    <p><b>지점:</b> <span id="modalBranch"></span></p>

    <!-- 항상 출력 -->
    <button id="reservationBtn">예약하기</button>
    
    <button id="reviewWriteBtn">리뷰 작성</button>
    <button onclick="closeModal()">닫기</button>

    <input type="hidden" id="modalThemeId" />
  <!-- 모달브랜치아이디받기 -->
<input type="hidden" id="modalBranchId" />
    
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
	// 문서 어디든 클릭하면 실행
	document.addEventListener("click", function(event) {
	    const modal = document.getElementById("themeModal");

	    // 모달이 열려 있고, 클릭한 요소가 모달 안이 아닌 경우
	    if (modal.style.display === 'block' && !modal.contains(event.target)) {
	        closeModal();
	    }
	});

	
	// ✅ 공통 리뷰 작성 처리 함수 (카드/모달 모두에서 사용)
	function handleWrite(themeId) {
	    const isLoggedIn = document.getElementById("isLoggedIn").value === "true";
	    if (isLoggedIn) {
	        location.href = "/user/board/review/show_review_list?themeId=" + themeId;
	    } else {
	        alert("로그인이 필요한 기능입니다.");
	    }
	}
	// ✅ 공통 예약 처리 함수 (카드/모달 모두에서 사용)
	function handleReservation(themeId) {
    const isLoggedIn = document.getElementById("isLoggedIn").value === "true";
    if (isLoggedIn) {
        location.href = "/user/reservation/userReservation?branch=" + branchId; // 브랜치id 파라미터 넘겨주기
    } else { 
        alert("로그인이 필요한 기능입니다.");
    }
}

	// ✅ 모달 안 버튼도 같은 로직으로 처리
	document.addEventListener("DOMContentLoaded", function () {
	   //리뷰작성
		const btn = document.getElementById("reviewWriteBtn");
	    btn.addEventListener("click", function () {
	        const themeId = document.getElementById("modalThemeId").value;
	        handleWrite(themeId);
	    });
	    
	 // 예약하기
	    const reserveBtn = document.getElementById("reservationBtn");
	    if (reserveBtn) {
	        reserveBtn.addEventListener("click", function () {
	            const branchIdInput = document.getElementById("modalBranchId");
	            if (branchIdInput) {
	                const branchId = branchIdInput.value;
	                handleReservation(branchId);
	            } else {
	                alert("지점 정보가 없습니다.");
	            }
	        });
	    }

	});
</script>

</body>
</html>

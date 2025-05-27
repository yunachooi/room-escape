<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<title>Room Escape</title>

<!--임시스타일-->
<style>

form {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    padding: 15px;
    margin: 20px auto;
    width: fit-content;
    z-index: 10;
    position: relative;
}
select, button {
    margin: 5px;
    padding: 5px;
    color: black;
}
</style>

<style>
       

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
	        #themeModal {
	    color: black; /* ✅ 기본 글씨색 설정 */
	}
        
    </style>
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
<div class="theme-search">
	
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
  
	<div class="theme-container">
    <c:forEach var="theme" items="${themeList}">
        <div class="theme-card">
            <img src="/images/themes/${theme.theme_id}.jpeg"
			     alt="${theme.title}"
			     onclick="showDetail(${theme.theme_id})"
			     style="cursor: pointer;" />

            <div class="theme-title" style="color: black;">${theme.title}</div>
        </div>
    </c:forEach>
</div>

<!-- ✅ 모달창 -->
<div id="themeModal" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%);
    background:white; border:1px solid #aaa; padding:20px; z-index:9999; box-shadow:0 0 10px rgba(0,0,0,0.3);">
    
    <h3 id="modalTitle" style="color: black;"></h3>
    <p><b>설명:</b> <span id="modalDescription" ></span></p> 
    <p><b>유형:</b> <span id="modalType"></span></p>
    <p><b>난이도:</b> <span id="modalLevel"></span></p>
    <p><b>정원:</b> <span id="modalCapacity"></span></p>
    <p><b>소요시간:</b> <span id="modalDuration"></span>분</p>
    <p><b>지점:</b> <span id="modalBranch"></span></p>

    <button id="reservationBtn">예약하기</button>
    <button onclick="closeModal()">닫기</button>

    <input type="hidden" id="modalThemeId" />
</div>
	
	
	</div>
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
	                location.href = "/user/res/userReservation?theme_id=" + themeId;
	            });
	        }
	    });
	</script>

</html>
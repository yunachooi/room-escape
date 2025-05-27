<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="r" uri="jakarta.tags.core" %>
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
            width : 1200px;
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
	
	<r:if test="${update_info}">
		<script>
			alert("정보가 수정되었습니다.");
		</script>
	</r:if>
	
	<!-- 검색 영역 -->
	<div class="theme-search">
	<!-- 검색 태그 -->
		<form method="get" action="/user/theme/list" class="theme-filter-form">
		  <div class="filter-group">
		    <label for="sort">정렬</label>
		    <select id="sort" name="sort" onchange="this.form.submit()">
		      <option value="">-- 정렬 선택 --</option>
		      <option value="rating" ${param.sort == 'rating' ? 'selected' : ''}>평점순</option>
		      <option value="popular" ${param.sort == 'popular' ? 'selected' : ''}>리뷰 많은순</option>
		    </select>
		  </div>
		
		  <div class="filter-group">
		    <label for="type">유형별</label>
		    <select id="type" name="type_id">
		      <option value="">유형별</option>
		      <c:forEach var="type" items="${types}">
		        <option value="${type.type_id}" ${param.type_id == type.type_id ? 'selected' : ''}>${type.type_name}</option>
		      </c:forEach>
		    </select>
		  </div>
		
		  <div class="filter-group">
		    <label for="branch">지점별</label>
		    <select id="branch" name="branch_id">
		      <option value="">지점별</option>
		      <c:forEach var="branch" items="${branches}">
		        <option value="${branch.branch_id}">${branch.name}</option>
		      </c:forEach>
		    </select>
		  </div>
		
		  <div class="filter-group">
		    <label for="level">난이도별</label>
		    <select id="level" name="theme_level">
		      <option value="">난이도별</option>
		      <option value="쉬움">쉬움</option>
		      <option value="보통">보통</option>
		      <option value="어려움">어려움</option>
		      <option value="익스트림">익스트림</option>
		    </select>
		  </div>
		
		  <div class="filter-group">
		    <label for="people">인원별</label>
		    <select id="people" name="people">
		      <option value="">인원별</option>
		      <option value="2">2명</option>
		      <option value="3">3명</option>
		      <option value="4">4명</option>
		    </select>
		  </div>
		
		  <div class="filter-group">
		    <button type="submit">검색</button>
		  </div>
		</form>
	  	
	  	<!-- 테마 출력 -->
		<div class="theme-container">
	    <c:forEach var="theme" items="${themeList}">
	        <div class="theme-card">
	            <img src="/images/themes/${theme.theme_id}.jpeg"
				     alt="${theme.title}"
				     onclick="showDetail(${theme.theme_id})"
				 />
	
	            <div class="theme-title" style="color: black;">${theme.title}</div>
	        </div>
	    </c:forEach>
	</div>

	<!-- 오버레이 -->	
	<div id="modalOverlay" onclick="closeModal()"></div>
	<!-- ✅ 모달창 -->
	<div id="themeModal">
	    <div class="modal-header">
	        <h3 id="modalTitle" style="font-weight:700;"></h3>
	        <div class="modal-close" onclick="closeModal()">✖</div>
	    </div>
	    <div class="modal-body">
	        <p><b>설명:</b> <span id="modalDescription"></span></p> 
	        <p><b>유형:</b> <span id="modalType"></span></p>
	        <p><b>난이도:</b> <span id="modalLevel"></span></p>
	        <p><b>정원:</b> <span id="modalCapacity"></span></p>
	        <p><b>소요시간:</b> <span id="modalDuration"></span>분</p>
	        <p><b>지점:</b> <span id="modalBranch"></span></p>
	        <input type="hidden" id="modalThemeId" />
	        <input type="hidden" id="modalBranchId" />
	        <div class="modal-buttons">
	            <button id="reservationBtn">예약하기</button>
	        </div>
	    </div>
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
		      if (window.scrollY > 100) {
		        header.classList.remove('transparent');
		      } else {
		        header.classList.add('transparent');
		      }
		    });
		    
		    
		    
		    const reviewBtn = document.getElementById("goReviewBtn");

		    if (reviewBtn) {
		      reviewBtn.addEventListener("click", function () {
		        const themeId = document.getElementById("modalThemeId").value;                
		        location.href = "/user/notice/list?tab=review&theme_id=" + encodeURIComponent(themeId);
		      });
		    }
		    
		    
		    const reserveBtn = document.getElementById("reservationBtn");

	        if (reserveBtn) {
	            reserveBtn.addEventListener("click", function () {
	                const themeId = document.getElementById("modalThemeId").value;
	                const isLoggedIn = "${not empty sessionScope.loginInfo}" === "true";

	                if (!isLoggedIn) {
	                    alert("로그인이 필요한 기능입니다.");
	                    return; 
	                }

	                location.href = "/user/res/userReservation?theme_id=" + themeId;
	            });
	        }
	        
		  });
		
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

		            document.getElementById('themeModal').style.display = 'block';
		            document.getElementById('modalOverlay').classList.add('active');
		        });
		}

		function closeModal() {
		    document.getElementById('themeModal').style.display = 'none';
		    document.getElementById('modalOverlay').classList.remove('active');
		}

	    document.addEventListener("click", function(event) {
	        const modal = document.getElementById("themeModal");
	        if (modal.style.display === 'block' && !modal.contains(event.target)) {
	            closeModal();
	        }
	    });

	</script>
</html>
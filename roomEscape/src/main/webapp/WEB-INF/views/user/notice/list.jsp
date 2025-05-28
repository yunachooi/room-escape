<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 & 이벤트</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice.css">
</head>
<body class="notice-list">
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
<div id="notice-list">

		<h2 id="tabTitle"></h2>
	<div id="tabWrap">
	    <div id="noticeDiv" class="tab active" data-tab="notice">공지사항</div>
	    <div id="QnaDiv" class="tab" data-tab="qna">문의하기</div>
	    <div id="eventDiv" class="tab" data-tab="event">이벤트</div>
	    <div id="QnaDiv" class="tab" data-tab="review">리뷰</div>
	</div>
	
		
	<!-- 공지사항 -->
	<div id="notice" class="tab-content active">
	    <table class="notice-table">
	        <thead>
	            <tr>
	                <th style="width: 75%;">제목</th>
	                <th style="width: 25%;">등록일</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="notice" items="${noticeList}">
	                <tr>
	                    <td><a href="${pageContext.request.contextPath}/user/notice/notice_detail?notice_id=${notice.noticeId}">${notice.title}</a></td>	
	                    <td><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd" /></td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
	
	<!-- 이벤트 -->
	<div id="event" class="tab-content">
	    <table class="notice-table">
	        <thead>
	            <tr>
	                <th style="width: 75%;">제목</th>
	                <th style="width: 25%;">기간</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="event" items="${eventList}">
	                <tr>
	                    <td><a href="${pageContext.request.contextPath}/user/notice/event_detail?event_id=${event.event_id}">${event.title}</a></td>
	                    <td class="date-col">
						  <fmt:formatDate value="${event.start_date}" pattern="yyyy-MM-dd" /> ~
						  <fmt:formatDate value="${event.end_date}" pattern="yyyy-MM-dd" />
						</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
	<!-- QnA -->
<div id="qna" class="tab-content">
	<div class="qna-header">
        <h3>궁금한 점이 있다면 문의해주세요!</h3>
        <a href="${pageContext.request.contextPath}/qna/to_write_qna_user" class="qna-btn">+ 문의하기</a>
    </div>
    <table class="notice-table">
        <thead>
            <tr>	
                <th style="width: 65%;">제목</th>
                <th style="width: 25%;">작성일</th>
                <th style="width: 10%;">답변상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="qna" items="${qnaList}">
                <tr>
                    <td><a href="/user/notice/qna_detail?qna_id=${qna.qna_id}">${qna.title}</a></td>
                    <td>${qna.reg_date}</td>
                    <td>${qna.is_answered ? '답변완료' : '미답변'}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- 리뷰 -->
<div id="review" class="tab-content">
    <!-- 정렬 + 유형 필터 -->
    <div style="display: flex; gap: 10px; margin-bottom: 20px;">
        <select id="review_option" onchange="changeOption()">
            <option value="전체 보기">전체 보기</option>
            <option value="별점높은순">별점 높은순</option>
            <option value="별점낮은순">별점 낮은순</option>
            <option value="최신순">최신순</option>
        </select>

        
    </div>

    <div id="review_option_list"></div>

    <table id="initialReviewTable" class="review-table">
        <thead>
            <tr>
                <th>평점</th>
                <th>리뷰내용</th>
                <th>작성일</th>
                <th>테마</th>
                <th>작성자</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviewList}">
                <tr>
                    <td>${review.rating}</td>
                    <td>${review.content}</td>
                    <td>${review.reg_date}</td>
                    <td>${review.theme_id}</td>
                    <td>${review.member_id}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


	<script>
	
	function changeOption() {
        const select_value = document.getElementById("review_option").value;

        const url = "/review/show_review_option?select_value=" + encodeURIComponent(select_value);

        fetch(url)
            .then(response => response.json())
            .then(data => {
                const reviewbox = document.getElementById("review_option_list");
                const initialTable = document.getElementById("initialReviewTable");
                if (initialTable) initialTable.style.display = "none";

                let html = '<table class="review-table">';
                html += '<thead><tr>';
                html += '<th>평점</th><th>리뷰내용</th><th>작성일</th><th>테마</th><th>작성자</th>';
                html += '</tr></thead><tbody>';

                data.forEach((review) => {
                    html += `<tr>`;
                    html += `<td>${review.rating}</td>`;
                    html += `<td>${review.content}</td>`;
                    html += `<td>${review.reg_date}</td>`;
                    html += `<td>${review.theme_id}</td>`;
                    html += `<td>${review.member_id}</td>`;
                    html += `</tr>`;
                });

                html += '</tbody></table>';
                reviewbox.innerHTML = html;
            });
    }


	
	    $('.tab').click(function() {
	        $('.tab').removeClass('active');
	        $(this).addClass('active');
	        const tabId = $(this).data('tab');
	        $('.tab-content').removeClass('active');
	        $('#' + tabId).addClass('active');
	    });
	    
	    $(document).ready(function() {
	        // 탭 클릭 시 active 클래스 변경
	        $('.tab').click(function() {
	            $('.tab').removeClass('active');     // 기존 active 제거
	            $(this).addClass('active');          // 클릭한 탭에 active 추가
	
	            // <h2> 텍스트 변경
	            const newTitle = $(this).text();     // 클릭한 탭의 텍스트 가져오기
	            $('#tabTitle').text(newTitle);       // h2에 적용
	        });
	
	        // 페이지 로드 시 초기 제목 설정
	        const initialTitle = $('.tab.active').text();
	        $('#tabTitle').text("공지사항");
	        
	        $(document).ready(function () {
	            const urlParams = new URLSearchParams(window.location.search);
	            const tab = urlParams.get("tab");
	            const themeId = urlParams.get("theme_id");

	            if (tab) {
	                $('.tab').removeClass('active');
	                $('.tab-content').removeClass('active');

	                const targetTab = $('#' + tab);
	                const targetTabBtn = $('.tab[data-tab="' + tab + '"]');

	                if (targetTab.length && targetTabBtn.length) {
	                    targetTab.addClass('active');
	                    targetTabBtn.addClass('active');
	                    $('#tabTitle').text(targetTabBtn.text());
	                }
	            }

	            if (tab === "review" && themeId) {
	                // 테마 id로 필터링된 리뷰 불러오기
	                fetch("/review/show_review_option?select_value=전체 보기&theme_id=" + encodeURIComponent(themeId))
	                    .then(response => response.json())
	                    .then(data => {
	                        const reviewbox = document.getElementById("review_option_list");
	                        const initialTable = document.getElementById("initialReviewTable");
	                        if (initialTable) initialTable.style.display = "none";

	                        let html = '<table class="review-table">';
	                        html += '<thead><tr>';
	                        html += '<th>평점</th><th>리뷰내용</th><th>작성일</th><th>테마</th><th>작성자</th>';
	                        html += '</tr></thead><tbody>';

	                        data.forEach((review) => {
	                            html += `<tr>`;
	                            html += `<td>${review.rating}</td>`;
	                            html += `<td>${review.content}</td>`;
	                            html += `<td>${review.reg_date}</td>`;
	                            html += `<td>${review.theme_id}</td>`;
	                            html += `<td>${review.member_id}</td>`;
	                            html += `</tr>`;
	                        });

	                        html += '</tbody></table>';
	                        reviewbox.innerHTML = html;
	                    });
	            }
	        });

	        
	        
	        
	    });
	</script>
</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

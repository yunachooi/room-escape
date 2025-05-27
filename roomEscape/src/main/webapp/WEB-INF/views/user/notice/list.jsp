<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	                <th>제목</th>
	                <th>등록일</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="notice" items="${noticeList}">
	                <tr>
	                    <td><a href="${pageContext.request.contextPath}/user/notice/notice_detail?notice_id=${notice.noticeId}">${notice.title}</a></td>
	                    <td>${notice.regDate}</td>
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
	                <th>제목</th>
	                <th>기간</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="event" items="${eventList}">
	                <tr>
	                    <td><a href="${pageContext.request.contextPath}/user/notice/event_detail?event_id=${event.event_id}">${event.title}</a></td>
	                    <td>${event.start_date} ~ ${event.end_date}</td>
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
                <th>제목</th>
                <th>작성일</th>
                <th>답변상태</th>
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
    <table class="notice-table">
        <thead>
            <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviewList}">
                <tr>
                    <td><a href="/user/notice/review_detail?review_id=${review.review_id}">${review.title}</a></td>
                    <td>${review.writer}</td>
                    <td>${review.reg_date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
	<script>
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
	    });
	</script>
</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

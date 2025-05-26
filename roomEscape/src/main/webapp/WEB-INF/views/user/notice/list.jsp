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
</head>
<body class="notice-list">
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="tabWrap">
    <div id="noticeDiv" class="tab active" data-tab="notice">공지사항</div>
    <div id="eventDiv" class="tab" data-tab="event">이벤트</div>
</div>

<h2 id="tabTitle">공지사항 / 이벤트 </h2>

<div id="notice" class="tab-content active">
    <c:forEach var="notice" items="${noticeList}">
        <p><a href="${pageContext.request.contextPath}/user/notice/notice_detail?notice_id=${notice.noticeId}">${notice.title}</a> - ${notice.regDate}</p>
    </c:forEach>
</div>

<div id="event" class="tab-content">
    <c:forEach var="event" items="${eventList}">
        <p><a href="${pageContext.request.contextPath}/user/notice/event_detail?event_id=${event.event_id}">${event.title}</a> (${event.start_date} ~ ${event.end_date})</p>
    </c:forEach>
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
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

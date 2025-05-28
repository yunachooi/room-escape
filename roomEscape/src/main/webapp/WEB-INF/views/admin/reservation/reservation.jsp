<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-res.css">
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.6.0/dist/echarts.min.js"></script>
	<title>[관리자페이지] 예약 조회</title>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>	
	<div class="reservationSelect">
		<h2>지점별 예약 통계</h2>
		<form id="reservationChartForm">
			<input type="month" name="find_date" id="find_date">
		</form>
		<br />
		<div id="reservationChartContainer">
			<div id="myChart" style="width: 600px; height: 400px;"></div>
		</div>
	
		<h2>예약현황</h2>
		<form action="reservation" method="POST">
			<input type="text" name="NAME" placeholder="예약자 성명">
			<button type="submit">찾기</button>
			<button type="button" onclick="allbtn()">전체보기</button>
		</form>
		<br />
		<table border="1">
			<thead>
				<tr>
					<th>No.</th>
					<th>예약자</th>
					<th>예약지점</th>
					<th>예약일</th>
					<th>예약시간</th>
					<th>인원수</th>
					<th>요청메시지</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="reservation" items="${list}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${reservation.MEMBER_NAME}(${reservation.MEMBER_ID})</td>
								<td>${reservation.BRANCH_NAME}</td>
								<td>${reservation.RESV_DATE}</td>
								<td>${reservation.TIME_LABEL}</td>
								<td>${reservation.NUM_PEOPLE}</td>
								<td>${reservation.REQUEST_MSG}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">조회된 예약이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<script>
	    function allbtn() {
	        location.href = "/admin/res/reservation";
	    }
	    
	    const find_date = document.getElementById('find_date');
	    const today = new Date();
	    const monthValue = today.toISOString().slice(0, 7);
	    find_date.value = monthValue;

	    const chartDom = document.getElementById('myChart');
	    const myChart = echarts.init(chartDom);

	    myChart.setOption({
	        title: { text: '지점별 예약 통계' },
	        xAxis: { type: 'category', data: [] },
	        yAxis: { type: 'value' },
	        series: [{ type: 'bar', data: [] }]
	    });


	    find_date.addEventListener('change', function () {
	        const selectedDate = find_date.value;

	        if (!selectedDate) {
	            alert("날짜를 선택해주세요.");
	            return;
	        }

	        fetch('/admin/res/chart-data?find_date=' + encodeURIComponent(selectedDate))
	            .then(response => {
	                if (!response.ok) {
	                    throw new Error('서버 응답 실패');
	                }
	                return response.json();
	            })
	            .then(data => {
	                const option = {
	                    title: {
	                        text: '지점별 예약 통계 (' + selectedDate + ')'
	                    },
	                    tooltip: {},
	                    xAxis: {
	                        type: 'category',
	                        data: data.labels
	                    },
	                    yAxis: {
	                        type: 'value'
	                    },
	                    series: [{
	                        name: '예약 수',
	                        type: 'bar',
	                        data: data.data
	                    }]
	                };

	                myChart.setOption(option);
	            })
	            .catch(error => {
	                console.error('에러 발생:', error);
	                alert('데이터를 불러오는 중 문제가 발생했습니다.');
	            });
	    });

	    find_date.dispatchEvent(new Event('change'));
	</script>
</body>
</html>

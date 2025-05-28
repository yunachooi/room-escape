<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
   	<script src="https://cdn.jsdelivr.net/npm/echarts@5.6.0/dist/echarts.min.js"></script>
<title>관리자 페이지</title>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<div id="main-content">
	<h1>관리자 메인페이지</h1>
	<div class="reservationChart" style="width: 400px; height: 200px;">
		<h2>지점별 예약 통계</h2>
		<form id="reservationChartForm">
			<input type="month" name="find_date" id="find_date">
		</form>
		<br />
		<div id="reservationChartContainer">
			<div id="myChart" style="width: 600px; height: 400px;"></div>
		</div>
	</div>
</div>
</body>
<script>
	const find_date = document.getElementById('find_date');
	const today = new Date();
	const monthValue = today.toISOString().slice(0, 7);
	find_date.value = monthValue;
	
	const chartDom = document.getElementById('myChart');
	const myChart = echarts.init(chartDom);
	
	myChart.setOption({
	    title: { text: '지점별 예약 통계' },
	    tooltip: {},
	    xAxis: { type: 'category', data: ['강남점', '홍대점', '신촌점'] },
	    yAxis: { type: 'value' },
	    series: [{
	        name: '예약 수',
	        type: 'bar',
	        data: [20, 34, 15]
	    }]
	});
	
	const dummyData = {
			  "2025-05": {
			    labels: ["강남점", "홍대점", "신촌점"],
			    values: [12, 28, 7]
			  },
			  "2025-06": {
			    labels: ["강남점", "홍대점", "신촌점"],
			    values: [22, 14, 30]
			  },
			  "2025-07": {
			    labels: ["강남점", "홍대점", "신촌점"],
			    values: [10, 40, 25]
			  }
			};
	
	window.addEventListener('DOMContentLoaded', () => {
		  const dummyData = {
		    "2025-05": {
		      labels: ["강남점", "홍대점", "신촌점"],
		      values: [12, 28, 7]
		    },
		    "2025-06": {
		      labels: ["강남점", "홍대점", "신촌점"],
		      values: [22, 14, 30]
		    },
		    "2025-07": {
		      labels: ["강남점", "홍대점", "신촌점"],
		      values: [10, 40, 25]
		    }
		  };

		  const find_date = document.getElementById('find_date');
		  const chartDom = document.getElementById('myChart');
		  const myChart = echarts.init(chartDom);

		  const loadChart = (month) => {
		    const data = dummyData[month] || { labels: [], values: [] };
		    myChart.setOption({
		      title: { text: '지점별 예약 통계' },
		      tooltip: {},
		      xAxis: { type: 'category', data: data.labels },
		      yAxis: { type: 'value' },
		      series: [{
		        name: '예약 수',
		        type: 'bar',
		        data: data.values
		      }]
		    });
		  };

		  // 초기 날짜 설정 및 로드
		  const today = new Date();
		  const monthValue = today.toISOString().slice(0, 7);
		  find_date.value = monthValue;
		  loadChart(monthValue);

		  // 날짜 변경 시 더미 데이터로 차트 갱신
		  find_date.addEventListener('change', (e) => {
		    loadChart(e.target.value);
		  });
		});
</script>
</html>
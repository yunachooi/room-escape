<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
</head>
<body>
	<div class="reservation-container">
		<h2>예약하기</h2>
		<button type="button" onclick="realTimeReservation()">실시간예약</button>
		<button type="button" onclick="reservationStatus()">예약확인/취소</button>

		<div class="book">
			<form id="reservationForm" action="/userReservation" method="GET">
				<select name="branch" id="branch">
					<option value="" disabledhidden ${emptyselectedBranch ? 'selected' : ''}>지점선택</option>
					<option value="강남점" ${selectedBranch == '강남점' ? 'selected' : ''}>강남점</option>
					<option value="홍대점" ${selectedBranch == '홍대점' ? 'selected' : ''}>홍대점</option>
					<option value="잠실점" ${selectedBranch == '잠실점' ? 'selected' : ''}>잠실점</option>
				</select> <input type="date" name="find_date" id="find_date"
					value="${selectedDate}" />
			</form><br />
			
			<div id="theme-wrap">
			<c:forEach var="entry" items="${groupedThemes}">
				<div class="reservation_theme">
					<img src="./images/image.jpg" alt="${entry.key}" width="300" height="230">
					<div class="theme-title">${entry.key}</div>
					<div class="type">(${entry.value[0].TYPE_NAME})</div>

					<div class="times">
						<c:forEach var="theme" items="${entry.value}">
							<c:if test="${!theme.IS_BOOKED}">
								<a
									href="/reservationInfo?title=${theme.TITLE}&date=${selectedDate}&branch=${selectedBranch}&theme_type=${theme.TYPE_NAME}&time=${theme.TIME_LABEL}">
									<div class="time_available">${theme.TIME_LABEL}<br /> 예약가능</div>
								</a>
							</c:if>
							<c:if test="${theme.IS_BOOKED}">
								<div class="time_unavailable">${theme.TIME_LABEL}<br /> 예약완료</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
			</div>

		</div>
	</div>

	<script>
        const form = document.getElementById('reservationForm');
        const branchSelect = document.getElementById('branch');
        const dateInput = document.getElementById('find_date');

        branchSelect.addEventListener('change', () => {
            if (branchSelect.value && dateInput.value) {
                form.submit();
            }
        });

        dateInput.addEventListener('change', () => {
            if (branchSelect.value && dateInput.value) {
                form.submit();
            }
        });

        if (!dateInput.value) {
            const today = new Date().toISOString().split('T')[0];
            dateInput.value = today;
        }
    </script>
</body>
</html>

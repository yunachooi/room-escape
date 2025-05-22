<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>[관리자페이지] 예약 조회</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="reservationChart">
        <h2>지점별 예약 통계</h2>
        <form id="reservationChartForm">
            <input type="date" name="find_date" id="find_date">
            <button type="submit">조회</button>
        </form>
        <div id="reservationChartContainer">
            <canvas id="myChart" width="400" height="200"></canvas>
        </div>
    </div>

    <div class="reservationSelect">
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
                                <td>${reservation.member_name}(${reservation.member_id})</td>
                                <td>${reservation.branch_name}</td>
                                <td>${reservation.resv_date}</td>
                                <td>${reservation.time_label}</td>
                                <td>${reservation.num_people}</td>
                                <td>${reservation.request_msg}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="7">조회된 예약이 없습니다.</td></tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <script>
        // 전체보기 버튼 클릭 시 예약현황 페이지로 이동
        function allbtn() {
            location.href = "/reservation";
        }

        // 기본값: 오늘 날짜로 설정
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('find_date').value = today;
    </script>
</body>
</html>

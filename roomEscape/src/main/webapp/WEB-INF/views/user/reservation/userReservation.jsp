<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    LocalDateTime now = LocalDateTime.now();
    request.setAttribute("now", now.toString());
%>

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

        <form id="reservationForm" action="/user/res/userReservation" method="GET">
            <select name="branch" id="branch">
                <option value="" disabled ${empty selectedBranch ? 'selected' : ''}>지점선택</option>
                <option value="강남점" ${selectedBranch == '강남점' ? 'selected' : ''}>강남점</option>
                <option value="홍대점" ${selectedBranch == '홍대점' ? 'selected' : ''}>홍대점</option>
                <option value="잠실점" ${selectedBranch == '잠실점' ? 'selected' : ''}>잠실점</option>
            </select>
            <input type="date" name="find_date" id="find_date" value="${selectedDate}" />
        </form>
        <br />

        <div id="theme-wrap">
            <c:forEach var="entry" items="${groupedThemes}">
                <c:set var="themeList" value="${entry.value}" />
                <c:set var="firstTheme" value="${themeList[0]}" />

                <div class="reservation_theme">
                    <img src="/images/themes/${firstTheme.THEME_ID}.jpeg" alt="${firstTheme.TITLE}" width="300" height="230">
                    <div class="theme-title">${firstTheme.TITLE}</div>
                    <div class="type">(${firstTheme.TYPE_NAME})</div>

                    <div class="times">
                        <c:forEach var="theme" items="${themeList}">
                            <c:set var="resvDateTime" value="${theme.RESV_DATE}T${theme.TIME_LABEL}:00" />
                            <c:choose>
                                <c:when test="${!theme.IS_BOOKED and resvDateTime > now}">
                                    <a href="/user/res/reservationInfo?TITLE=${theme.TITLE}&RESV_DATE=${selectedDate}&branch=${selectedBranch}&TYPE_NAME=${theme.TYPE_NAME}&TIME_LABEL=${theme.TIME_LABEL}">
                                        <div class="time_available">${theme.TIME_LABEL}<br/>예약가능</div>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <div class="time_unavailable">${theme.TIME_LABEL}<br/>예약불가</div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        const form = document.getElementById('reservationForm');
        const branchSelect = document.getElementById('branch');
        const dateInput = document.getElementById('find_date');

        branchSelect.addEventListener('change', () => {
            if (branchSelect.value && dateInput.value) form.submit();
        });
        dateInput.addEventListener('change', () => {
            if (branchSelect.value && dateInput.value) form.submit();
        });

        if (!dateInput.value) {
            const today = new Date().toISOString().split('T')[0];
            dateInput.value = today;
        }

        function realTimeReservation() {
            location.href = "/user/res/userReservation";
        }
        function reservationStatus() {
            location.href = "/user/res/reservationStatus";
        }
    </script>
</body>
</html>

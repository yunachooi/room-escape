<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
LocalDate today = LocalDate.now();
request.setAttribute("today", today.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 및 취소</title>
</head>
<body>
    <h2>예약 확인 및 취소</h2>
    <button type="button" onclick="realTimeReservation()">실시간예약</button>
    <button type="button" onclick="reservationStatus()">예약확인/취소</button>

    <table border="1">
        <thead>
            <tr>
                <td>No.</td>
                <td>테마명</td>
                <td>예약일정</td>
                <td>예약지점</td>
                <td>예약인원</td>
                <td>예약취소</td>
                <td>리뷰</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${list}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${item.THEME_TITLE}</td>
                    <td>${item.RESV_DATE} (${item.TIME_LABEL})</td>
                    <td>${item.BRANCH_NAME}</td>
                    <td>${item.NUM_PEOPLE}</td>
                    <td>
                        <c:if test="${item.RESV_DATE > today}">
                            <button type="button" onclick="cancel(${item.RESV_ID})">예약취소</button>
                        </c:if>
                        <c:if test="${item.RESV_DATE <= today}">
                            취소불가
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${item.RESV_DATE <= today}">
                            <button type="button" onclick="review('${fn:escapeXml(item.THEME_TITLE)}')">리뷰작성</button>
                        </c:if>
                        <c:if test="${item.RESV_DATE > today}">
                            작성불가
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <script>
        function realTimeReservation(){
            location.href="/user/res/userReservation";
        }
        function reservationStatus(){
            location.href="/user/res/reservationStatus";
        }
        function cancel(RESV_ID){
            if (confirm("예약을 취소하시겠습니까?")) {
                location.href = "/user/res/reservation/cancel?RESV_ID=" + (RESV_ID);
            }
        }
        function review(title){
            location.href = "/review/write_review?title=" + encodeURIComponent(title);
        }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>예약 확인 및 취소</h2>
	<button type="button" onclick="realTimeReservation()">실시간예약</button>
	<button type="button" onclick="reservationStatus()">예약확인/취소</button>
	
	
	
	<script>
		function realTimeReservation(){
	    	location.href="/userReservation";
	    }
	    function reservationStatus(){
	    	location.href="/reservationStatus";
	    }
	</script>
</body>
</html>

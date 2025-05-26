<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보입력</title>
</head>
<body>
	<h2>예약정보입력</h2>
	<form action="/user/res/reservation/submit" method="POST" onsubmit="return validateForm()">
		<input type="hidden" name="date" value="${date}" /> 
		<input type="hidden" name="time" value="${time}" />
		<input type="hidden" name="branch" value="${branch}" /> 
		<input type="hidden" name="title" value="${title}" />
		<input type="hidden" name="theme_type" value="${theme_type}" />
		<input type="hidden" name="MEMBER_ID" value="${loginInfo.member_id }" />
		<input type="hidden" name="name" value="${loginInfo.name }" />
		<input type="hidden" name="PHONE" value="${loginInfo.phone }" />

		<table border="1">
			<tbody>
				<tr>
					<td>예약일</td>
					<td>${date} (${time}) - ${branch}</td>
				</tr>
				<tr>
					<td>테마명</td>
					<td>${title} <br /> (${theme_type})</td>
				</tr>
				<tr>
					<td>성함</td>
					<td>${loginInfo.name }</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						${loginInfo.phone }<br />
						▶ 연락처 변경은 회원정보 수정을 통해 가능합니다.<br />
						▶ 예약 완료 시 확인 문자가 자동으로 발송됩니다. 문자를 받지 못한 경우 번호 입력이 잘못 되었을 수도 있으니 해당 매장으로 꼭 연락해주세요.<br />
						▶ 매장에서 예약 1~2일 전에 선입금 및 방문 확인을 위해 연락드립니다. 수차례 연락을 받지 않는 경우 예약이 취소될 수 있습니다.
					</td>
				</tr>
				<tr>
					<td>인원</td>
					<td>
						<select name="participants" id="participants" onchange="updatePrice()">
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
						</select><br />
						▶${title }의 플레이 가능한 최소 인원은 2명입니다.<br />
						▶권장 인원(4명)을 초과하는 경우 역할이 없는 탐정 배역이 추가됩니다.
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td id="price">금액: 20,000원 (인당 10,000원)</td>
				</tr>
				<tr>
					<td>예약방식</td>
					<td>현장결제</td>
				</tr>
				<tr>
					<td>전달사항</td>
					<td>
						▶함께 하실 분들이나 매장에 전달하실 사항을 남겨주세요.<br />
						<input type="text" name="msg" placeholder="기타 요청 사항 입력">
					</td>
				</tr>
				<tr>
					<td>주의사항</td>
					<td>
						▶예약 확정을 위해 선예약금 10,000원을 기업은행 123-123456-12-123 예금주 RoomEscape로 입금하셔야 예약 확정됩니다.<br />
						▶원활한 진행을 위해 예약 시간 10분 전에 방문해주세요. 예약 시간보다 늦게 방문하시는 경우 총 플레이 시간이 차감될 수 있습니다.<br />
						▶13세 이하의 어린이, 음주자, 애견동물 동반 손님, 독감 등 전염성이 있는 환자의 경우 플레이가 제한됩니다.<br />
						▶[환불정책] 예약 전날 밤 23시 59분까지 환불 요청 시 100% 환불 가능하며, 이후에는 환불이 불가능합니다. 또한 매장 사정에 의해 게임 진행이 불가한 경우에도 100% 환불이 진행됩니다.<br />
						▶선입금 후 예약 취소 시 해당 매장에 입금 받을 계좌번호를 알려주세요. 입급자명과 환불자명은 동일해야합니다. 환불은 예약 취소 확인 후 진행되며 공휴일 제외 1~3일 이내에 처리됩니다. 만약 4일이 지나도록 환불을 받지 못한 경우 해당 매장으로 연락 부탁드립니다.<br />
						▶예약 당일 취소나 노쇼의 경우 향후 예약에 제약이 있을 수 있습니다.
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" name="agree" value="Y" required>
						개인정보취급방침에 동의함
					</td>
				</tr>
			</tbody>
		</table>

		<button type="submit">예약하기</button>
		<button type="button" onclick="resetForm()">취소</button>
	</form>

	<script>
		function resetForm() {
			location.href = "/user/res/userReservation";
		}

		function updatePrice() {
			const count = parseInt(document.getElementById("participants").value, 10);
			const total = count * 10000;
			document.getElementById("price").innerHTML = `금액: \${total.toLocaleString()}원 (인당 10,000원)`;
		}

		function validateForm() {
			const agree = document.querySelector('input[name="agree"]');
			if (!agree.checked) {
				alert("개인정보취급방침에 동의하셔야 예약이 가능합니다.");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
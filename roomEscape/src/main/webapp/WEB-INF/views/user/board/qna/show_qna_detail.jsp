<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Show QnA Detail</h1>
	<hr>
	<table border="1" cellpadding="5" cellspacing="0">
		<thead>
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>답변 여부</th>
				<th>수정 및 삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${qna.title }</td>
				<td>${qna.content }</td>
				<td>${qna.reg_date }</td>
				<td>${qna.member_id }</td>
				<td>${qna.is_answered}</td>
				<td>
					<c:if test="${qna.is_answered == 'N' }">
						<button onclick="qnaDelete()">삭제 및 삭제 </button>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	<hr>
	<c:if test="${not empty qna_answer }">
		<table border="1" cellpadding="5" cellspacing="0">
			<thead>
				<tr>
					<th>답변</th>
					<th>답변일시</th>
					<th>답변자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${qna_answer.answer}</td>
					<td>${qna_answer.reg_date}</td>
					<td>${qna_answer.admin_id}</td>
				</tr>
			</tbody>
		</table>
	</c:if>
	
	<!-- 오류 메시지 -->
	<c:if test="${update_error }">
		<script>
			alert("아이디와 비밀번호가 다릅니다 ! ");
		</script>
	</c:if>
	
	
	<script>
		function qnaDelete(){
			console.log(${qna.qna_id});
			location.href="/qna/delete_or_update_qna_user?qna_id="+${qna.qna_id};
		}
	</script>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna-detail.css">
<title>QNA 상세보기</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<h2>Show QnA Detail</h2>

	<div id="tablewrap">
		<table>
		    <thead>
		        <tr>
		            <th>-</th>
		            <th>-</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>제목</td>
		            <td>${qna.title}</td>
		        </tr>
		        <tr>
		            <td>내용</td>
		            <td><div class="qna-content">${qna.content}</div></td>
		        </tr>
		        <tr>
		            <td>작성일</td>
		            <td>${qna.reg_date}</td>
		        </tr>
		        <tr>
		            <td>작성자</td>
		            <td>${qna.member_id}</td>
		        </tr>
		        <tr>
		            <td>답변 여부</td>
		            <td>${qna.is_answered}</td>
		        </tr>
		        <c:if test="${qna.is_answered == 'N'}">
		            <tr>
		                <td>관리</td>
		                <td>
		                    <button onclick="qnaDelete()">삭제 및 수정</button>
		                </td>
		            </tr>
		        </c:if>
		    </tbody>
		</table>
			<a href="${pageContext.request.contextPath}/user/notice/list">목록으로</a>
	</div>

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
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
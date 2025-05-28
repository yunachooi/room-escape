<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-qna.css">
<title>QNA 페이지</title>
</head>
<body id="main-content">
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>

<div >
	<h2> Show Qna List Page</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>비밀번호</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="qna" items="${qna_list}">
				<tr>
					<td>${qna.qna_id}</td>
					<td class="qna_title" data-id="${qna.qna_id }">${qna.title}</td>
					<td>${qna.content}</td>
					<td>${qna.password}</td>
					<td>${qna.reg_date}</td>
					<td>${qna.member_id}</td>
					<td>
						${qna.is_answered}
						<c:if test="${qna.is_answered == 'N'}">
							<button onclick="gotoanswer(${qna.qna_id})">답변하기</button>
						</c:if>
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>

		<!-- 모달 -->
		<div id="qna_answer_modal" style="display:none; position:fixed; top:30%; left:30%; background:#fff; border:1px solid #ccc; padding:20px;">
		    <h3 id="modal_title"></h3>
		    <p id="modal_content"></p>
		    <button onclick="closeModal()">닫기</button>
		</div>
</div>	
	
	<script>
		//답변하기 버튼 누르면 이동 
		function gotoanswer(qna_id){
			location.href="/qna/show_qna_answer?qna_id="+qna_id;
		}
		
		//제목 클릭시 답변 상세보기
		document.querySelectorAll(".qna_title").forEach(el => {
			el.addEventListener("click",function(){
				const qna_id = this.dataset.id;
				fetch("/qna/show_qna_detail?qna_id="+qna_id)
					.then(response => response.json())
					.then(data =>{
						document.getElementById("modal_title").innerText = "답변 상세보기";
						document.getElementById("modal_content").innerText = data.answer;
						 document.getElementById("qna_answer_modal").style.display = "block";
					})
					.catch(err => {
					console.error("답변 조회 실패", err);
					});
			});
		});
		
		//모달창 닫기
		function closeModal() {
	        document.getElementById("qna_answer_modal").style.display = "none";
	    }
	</script>
</body>
</html>
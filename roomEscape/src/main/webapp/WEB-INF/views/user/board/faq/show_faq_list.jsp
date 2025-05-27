<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
<title>FAQ</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="faqWrap">	
		<h2>자주 묻는 질문</h2>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="faq" items="${faqList}">
					<tr>
						<td>${faq.faq_id}</td>
						<td><a href="/faq/show_detail_faq?faq_id=${faq.faq_id}">${faq.question}</a></td>
						<td>${faq.admin_id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
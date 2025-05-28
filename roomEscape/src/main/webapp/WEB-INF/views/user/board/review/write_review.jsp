<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna-write.css">
</head>
<body>
	<!-- header -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
	<h2>리뷰 작성하기</h2>
	<div class="qna-write-container">
		<input type="button" class="back-btn" value="돌아가기" onclick="history.back()">
		<form action="/review/insert_review" method="GET">
		<table >
			<thead>
				<tr>
					<th>-</th>
					<th>-</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>테마</td>
					<td>${title } </td>
				</tr>
				<tr>
					<td>평점</td>
					<td>
						<input type="radio" name="rating" value="5" checked> &nbsp 5점 &nbsp
						<input type="radio" name="rating" value="4"> &nbsp 4점 &nbsp
						<input type="radio" name="rating" value="3"> &nbsp 3점 &nbsp
						<input type="radio" name="rating" value="2"> &nbsp 2점 &nbsp
						<input type="radio" name="rating" value="1"> &nbsp 1점 &nbsp
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" style="min-height:300px;"></textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" name="member_id" value="${loginInfo.member_id}" readonly>
						<input type="hidden" name="theme_id" value="${theme_id}">
						<input type="hidden" name="resv_id" value="${resv_id}">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="작성"></td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
	<!-- footer -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
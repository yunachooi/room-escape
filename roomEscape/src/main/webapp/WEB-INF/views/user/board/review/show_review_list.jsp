<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Show Review List Page</h1>
	<hr>
	<c:if test="${not empty theme_id }">
		<input type="hidden" id="theme_id" value="${theme_id}">
	</c:if>
	<select id="review_option" onchange="changeOption(this)">
		<option >전체 보기</option>
		<option value="별점높은순">별점 높은순</option>
		<option value="별점낮은순">별점 낮은순</option>
		<option value="최신순">최신순</option>
	</select>
	
	<div id="review_option_list">--</div>
	
	<table border="1">
		<thead>
			<tr>
				<th>평점</th><th>리뷰내용</th><th>작성일</th><th>테마</th><th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="review" items="${review_list }">
				<tr>
					<td>${review.rating}</td>
					<td>${review.content}</td>
					<td>${review.reg_date}</td>
					<td>${review.theme_id}</td>
					<td>${review.member_id }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>	
	
	<script>
		
		/* window.onload = function (){
			
			 fetch("/review/show_review2")
			  .then(response => response.json())
			  .then(data => {
				  const reviewbox = document.getElementById("review_option_list");
				  
				  let html = '<table border="1">';
				  html += '<thead>';
				  html += '<tr>';
				  html += '<th>평점</th><th>리뷰내용</th><th>작성일</th><th>테마</th><th>작성자</th>';
				  html += '</tr>';
				  html += '<tbody>';
				  data.forEach((review) => {
					  html += '<tr>';
					  html += `<td>\${review.rating}</td>`;
					  html += `<td>\${review.content}</td>`;
					  html += `<td>\${review.reg_date}</td>`;
					  html += `<td>\${review.theme_id}</td>`;
					  html += `<td>\${review.member_id }</td>`;
				  html += '</tr>';
				  });
				  
				  html += '</tbody>';
				  html += '</table>';
				  
				  reviewbox.innerHTML = html;
			  });
		} */
		
	
		
		
		
		
		
		
		function changeOption(selectElement) {
			  console.log("value:", selectElement.value);
			  const select_value = document.getElementById("review_option").value;
			  const theme_id = document.getElementById("theme_id")?.value;
			  let url = "/review/show_review_option?select_value=" + encodeURIComponent(select_value);
			  
			  if (theme_id) {
					url += "&theme_id=" + encodeURIComponent(theme_id);
				}
			  fetch(url)
			  .then(response => response.json())
			  .then(data => {
				  const reviewbox = document.getElementById("review_option_list");
				  
				  let html = '<table border="1">';
				  html += '<thead>';
				  html += '<tr>';
				  html += '<th>평점</th><th>리뷰내용</th><th>작성일</th><th>테마</th><th>작성자</th>';
				  html += '</tr>';
				  html += '<tbody>';
				  data.forEach((review) => {
					  html += '<tr>';
					  html += `<td>\${review.rating}</td>`;
					  html += `<td>\${review.content}</td>`;
					  html += `<td>\${review.reg_date}</td>`;
					  html += `<td>\${review.theme_id}</td>`;
					  html += `<td>\${review.member_id }</td>`;
				  html += '</tr>';
				  });
				  
				  html += '</tbody>';
				  html += '</table>';
				  
				  reviewbox.innerHTML = html;
			  });
			  document.querySelector("table").style.display = "none";
		}
	</script>
</body>
</html>
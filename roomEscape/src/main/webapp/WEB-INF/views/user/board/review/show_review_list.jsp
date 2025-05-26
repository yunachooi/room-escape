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
	<select id="review_option" onchange="changeOption(this)">
		<option >전체 보기</option>
		<option value="별점높은순">별점 높은순</option>
		<option value="별점낮은순">별점 낮은순</option>
		<option value="최신순">최신순</option>
	</select>
	
	<div id="review_option_list">--</div>
	
	<script>
		
		window.onload = function (){
			
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
		}
		
	
		
		
		
		
		
		
		function changeOption(selectElement) {
			  console.log("value:", selectElement.value);
			  const select_value = document.getElementById("review_option").value;
			  
			  fetch("/review/show_review_option?select_value="+select_value)
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
			  
		}
	</script>
</body>
</html>
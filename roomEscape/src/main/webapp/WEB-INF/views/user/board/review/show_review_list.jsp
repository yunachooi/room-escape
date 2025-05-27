<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css">
<title>리뷰 목록</title>
</head>
<body>
  <%@ include file="/WEB-INF/views/common/header.jsp" %>

  <div id="wrap">
    <div class="review-container">
      <h2>리뷰 목록</h2>

      <c:if test="${not empty theme_id }">
        <input type="hidden" id="theme_id" value="${theme_id}">
      </c:if>

      <select id="review_option" onchange="changeOption(this)">
        <option>전체 보기</option>
        <option value="별점높은순">별점 높은순</option>
        <option value="별점낮은순">별점 낮은순</option>
        <option value="최신순">최신순</option>
      </select>

      <div id="review_option_list"></div>

      <table class="review-table">
        <thead>
          <tr>
            <th>평점</th>
            <th>리뷰내용</th>
            <th>작성일</th>
            <th>테마</th>
            <th>작성자</th>
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
    </div>
  </div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
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
				
				  let html = '<table class="review-table">';
				  html += '<thead>';
				  html += '<tr>';
				  html += '<th>평점</th><th>리뷰내용</th><th>작성일</th><th>테마</th><th>작성자</th>';
				  html += '</tr>';
				  html += '</thead>';
				  html += '<tbody>';
				  data.forEach((review) => {
				    html += '<tr>';
				    html += `<td>${review.rating}</td>`;
				    html += `<td>${review.content}</td>`;
				    html += `<td>${review.reg_date}</td>`;
				    html += `<td>${review.theme_id}</td>`;
				    html += `<td>${review.member_id}</td>`;
				    html += '</tr>';
				  });
				  html += '</tbody>';
				  html += '</table>';
				
				  reviewbox.innerHTML = html;
				
				  // 원래 테이블 숨기기
				  const originalTable = document.querySelector("table.review-table");
				  if (originalTable) {
				    originalTable.style.display = "none";
				  }
				});
	</script>
</html>
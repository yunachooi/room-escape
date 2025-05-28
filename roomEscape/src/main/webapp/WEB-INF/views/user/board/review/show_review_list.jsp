<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css">
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body class="review-list">
  <h2 id="tabTitle">리뷰</h2>

  <!-- 탭 영역 -->
  <div id="tabWrap">
    <div class="tab" onclick="location.href='/user/notice/list?tab=notice'">공지사항</div>
    <div class="tab" onclick="location.href='/user/notice/list?tab=qna'">문의하기</div>
    <div class="tab" onclick="location.href='/user/notice/list?tab=event'">이벤트</div>
    <div class="tab active">리뷰</div>
  </div>

  <!-- 내용 영역 -->
  <div id="wrap">
    <div class="review-container">
      
      <c:if test="${not empty theme_id }">
        <input type="hidden" id="theme_id" value="${theme_id}">
      </c:if>

      <!-- 필터 select 
      <select id="review_option" onchange="changeOption(this)">
        <option value="전체 보기">전체보기</option>
		<option value="별점높은순">평점높은순</option>
		<option value="별점낮은순">평점낮은순</option>
		<option value="최신순">최신순</option>
      </select>-->

      <!-- Ajax 결과 -->
      <div id="review_option_list"></div>

      <!-- 초기 테이블 -->
      <table id="originalReviewTable" class="review-table">
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
          <c:forEach var="review" items="${review_list}">
            <tr>
              <td>${review.rating}</td>
              <td>${review.content}</td>
              <td>${review.reg_date}</td>
              <td>${review.theme_id}</td>
              <td>${review.member_id}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

  <script>
    function changeOption(selectElement) {
      const select_value = selectElement.value;
      const theme_id = document.getElementById("theme_id")?.value;
      let url = "/review/show_review_option?select_value=전체 보기";

      if (theme_id) {
        url += "&theme_id=" + encodeURIComponent(theme_id);
      }

      // "전체 보기" 선택 시 초기 테이블 다시 표시
      if (select_value === "전체 보기") {
        document.getElementById("originalReviewTable").style.display = "table";
        document.getElementById("review_option_list").innerHTML = "";
        return;
      }

      fetch(url)
        .then(response => response.json())
        .then(data => {
          // 정렬 조건에 따라 정렬
          if (select.equals("별점높은순")) {
            data.sort((a, b) => b.rating - a.rating);
          } else if (select.equals("별점낮은순")) {
            data.sort((a, b) => a.rating - b.rating);
          } else if (select.equals("최신순")) {
            data.sort((a, b) => new Date(b.reg_date) - new Date(a.reg_date));
          }

          // 초기 테이블 숨김
          const originalTable = document.getElementById("originalReviewTable");
          if (originalTable) {
            originalTable.style.display = "none";
          }

          // 새 테이블 삽입
          const reviewbox = document.getElementById("review_option_list");

          let html = '<table class="review-table">';
          html += '<thead><tr>';
          html += '<th>평점</th><th>리뷰내용</th><th>작성일</th><th>테마</th><th>작성자</th>';
          html += '</tr></thead><tbody>';

          data.forEach((review) => {
            html += `<tr>`;
            html += `<td>${review.rating}</td>`;
            html += `<td>${review.content}</td>`;
            html += `<td>${review.reg_date}</td>`;
            html += `<td>${review.theme_id}</td>`;
            html += `<td>${review.member_id}</td>`;
            html += `</tr>`;
          });

          html += '</tbody></table>';
          reviewbox.innerHTML = html;
        });
    }
  </script>
</body>
</html>

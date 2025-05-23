<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 & 이벤트 목록</title>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid gray;
      padding: 6px;
      text-align: center;
    }
    a {
      text-decoration: none;
      color: red;
      font-weight: bold;
    }
    /* 모달 스타일 */
    #eventModal {
      display: none;
      position: fixed;
      top: 30%;
      left: 50%;
      transform: translateX(-50%);
      background: #fff;
      border: 1px solid #ccc;
      padding: 20px;
      z-index: 9999;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
    }
  </style>
</head>
<body>

<h2>공지사항 & 이벤트 목록</h2>
<p><a href="/admin/notice/form">+ 새 글 등록</a></p>

<table>
  <tr>
    <th>글번호</th>
    <th>제목</th>
    <th>내용</th>
    <th>작성일</th>
    <th>삭제</th>
  </tr>

  <c:forEach var="notice" items="${noticeList}">
    <tr>
      <td>${notice.noticeId}</td>
      <td>${notice.title}</td>
      <td>${notice.content}</td>
      <td>${notice.regDate}</td>
      <td>
        <a href="/admin/notice/delete?id=${notice.noticeId}">❌ 삭제</a>
      </td>
    </tr>

    <!-- [이벤트] 포함 시 응모 버튼 표시 -->
    <c:if test="${fn:contains(notice.title, '[이벤트]')}">
      <tr>
        <td colspan="5" style="text-align:center;">
          <button class="enterBtn" data-id="${notice.noticeId}">🎁 이벤트 응모하기</button>
        </td>
      </tr>
    </c:if>
  </c:forEach>
</table>

<!-- 모달 -->
<div id="eventModal">
  <p id="modalMsg"></p>
  <button onclick="$('#eventModal').hide()">확인</button>
</div>

<script>
  $(function () {
    $(".enterBtn").click(function () {
      const noticeId = $(this).data("id");

      $.post("/admin/notice/enter", { noticeId: noticeId })
        .done(function (response) {
          $("#modalMsg").text(response);
          $("#eventModal").show();
        })
        .fail(function () {
          $("#modalMsg").text("⚠ 이벤트 응모 중 오류가 발생했습니다.");
          $("#eventModal").show();
        });
    });
  });
</script>

<div style="text-align:center; margin-top:20px; font-size:16px;">
  <c:forEach begin="1" end="${totalPages}" var="i">
    <c:choose>
      <c:when test="${i eq currentPage}">
        <span style="font-weight:bold; color:#d9534f; margin:0 8px;">${i}</span>
      </c:when>
      <c:otherwise>
        <a href="?page=${i}" style="text-decoration:none; color:#337ab7; margin:0 8px;">${i}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>


</body>
</html>

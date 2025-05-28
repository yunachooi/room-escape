<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="sidebar">  
   <ul>
  	<li><img src="/images/compoment/logo_f.png"></li>
    <li><a href="/admin/main"><span class="menu-text">메인페이지</span></a></li>
    <li><a href="/admin/theme/list"><span class="menu-text">테마관리</span></a></li>
    <li><a href="/admin/branch/list"><span class="menu-text">지점관리</span></a></li>
    <li><a href="/admin/res/reservation"><span class="menu-text">예약관리</span></a></li>
    <li><a href="/admin/notice/list"><span class="menu-text">게시판 관리</span></a></li>
    <li><a href="/"><span class="menu-text">사용자 홈페이지</span></a></li>
  </ul>

  <div class="admin-info">
    <p>${sessionScope.loginId}님 반갑습니다.</p>
    <form method="post" action="/admin/logout">
      <button id="sidebar-submit" type="submit">로그아웃</button>
    </form>
  </div>
</div>
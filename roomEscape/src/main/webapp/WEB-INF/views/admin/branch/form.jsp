<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>지점 등록/수정</title></head>
<body>
    <h2>${branchDto != null ? '지점 수정' : '새 지점 등록'}</h2>
    
    
    <form method="post" action="/admin/branch/save">
        <c:if test="${branchDto != null}">
            <input type="hidden" name="branchId" value="${branchDto.branchId}" />
        </c:if>
        
        <p>지점 이름: <input type="text" name="name" value="${branchDto.name}" required /></p>
        <p>주소: <input type="text" name="address" value="${branchDto.address}" /></p>
        
        <input type="submit" value="저장" />
        
        <a href="/admin/branch/list">목록</a>
    </form>
</body>
</html>

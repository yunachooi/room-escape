<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>테마 등록</title>
</head>
<body>
    <h2>테마 등록</h2>
    <form method="post" action="${empty theme.theme_id ? '/admin/theme/insert' : '/admin/theme/update'}">
	    <c:if test="${not empty theme.theme_id}">
	        <input type="hidden" name="theme_id" value="${theme.theme_id}">
	    </c:if>
	    제목: <input type="text" name="title" value="${theme.title}" required><br>
	    설명: <textarea name="description">${theme.description}</textarea><br>
	    난이도: <select name="theme_level">
			    <option value="쉬움" ${theme.theme_level == '쉬움' ? 'selected' : ''}>쉬움</option>
			    <option value="보통" ${theme.theme_level == '보통' ? 'selected' : ''}>보통</option>
			    <option value="어려움" ${theme.theme_level == '어려움' ? 'selected' : ''}>어려움</option>
			    <option value="익스트림" ${theme.theme_level == '익스트림' ? 'selected' : ''}>익스트림</option>
			</select><br>
	    시간(분): <input type="number" name="duration" value="${theme.duration}"><br>
	    최소인원: <input type="number" name="capacity_min" value="${theme.capacity_min}"><br>
	    최대인원: <input type="number" name="capacity_max" value="${theme.capacity_max}"><br>
	    활성화 여부:
		<select name="is_active">
		  <option value="Y" ${theme.is_active == 'Y' ? 'selected' : ''}>활성화</option>
		  <option value="N" ${theme.is_active == 'N' ? 'selected' : ''}>비활성화</option>
		</select><br>
	    지점 :
		<select name="branch_id">
		    <c:forEach var="b" items="${branches}">
		        <option value="${b.branch_id}" ${theme.branch_id == b.branch_id ? "selected" : ""}>
		            ${b.name}
		        </option>
		    </c:forEach>
		</select>
		<br>
		
		유형 :
		<select name="type_id">
		    <c:forEach var="t" items="${types}">
		        <option value="${t.type_id}" ${theme.type_id == t.type_id ? "selected" : ""}>
		            ${t.type_name}
		        </option>
		    </c:forEach>
		</select>
		<br>
	    <button type="submit">${empty theme.theme_id ? '등록' : '수정'}</button>
	</form>
</body>
</html>

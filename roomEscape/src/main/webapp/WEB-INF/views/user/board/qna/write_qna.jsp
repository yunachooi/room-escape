<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QnA 작성</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna-write.css">
</head>
<body>
    <!-- header -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div id="wrap">
        <h2>QnA 작성</h2>
        <div class="qna-write-container">
		<input type="button" class="back-btn" value="돌아가기" onclick="history.back()">
            <form action="/qna/write_qna_user" method="post">
                <table>
	            	<thead>
						<tr>
							<th>-</th>
							<th>-</th>
						</tr>
					</thead>
                    <tbody>
                        <tr>
                            <td>작성자 이름 (아이디)</td>
                            <td><input type="text" name="member_id" required></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password" name="password" required></td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" required></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="content" rows="6" required></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="btn-group">
                                <input type="reset" value="초기화">
                                <input type="submit" value="등록">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>회원가입 페이지</title>
</head>
<body>
    <h2>회원가입</h2>
    <form id="registForm" action="/user/regist" method="post" onsubmit="return validateForm();">
    <h3>필수 항목</h3>
        아이디: <input type="text" name="member_id" id="member_id">
        <button type="button" onclick="checkDuplicateId()">중복 확인</button><span id="id_check" hidden></span><br>
        <!-- 아이디 중복검사 -->
        <script>
			function checkDuplicateId() {
			    var id = $('#member_id').val();
			    $.get('/user/checkId', { member_id: id }, function(isAvailable) {
			    	$('#id_check').show();
			        if (isAvailable) {
			            $('#id_check').text('사용가능한 아이디입니다.').css({color : 'green'});
			        } else {
			        	$('#id_check').text('이미 사용 중인 아이디입니다.').css({color : 'red'});
			        }
			    });
			}
		</script>
		비밀번호: <input type="password" id="password" name="password"><br>
		비밀번호 확인: <input type="password" id="password_check" name="password_check"><span id="pw_match_msg"></span><br>
		<!-- 비밀번호 일치 확인 -->
		<script>
			$(document).ready(function() {
			    $('#password, #password_check').on('keyup', function() {
			        const pw = $('#password').val();
			        const pwCheck = $('#password_check').val();
			
			        if (pw && pwCheck) {
			            if (pw === pwCheck) {
			                $('#pw_match_msg')
			                    .text('비밀번호가 일치합니다.').css({color : 'green'});
			            } else {
			                $('#pw_match_msg')
			                    .text('비밀번호가 일치하지 않습니다.').css({color : 'red'});
			            }
			        } else {
			            $('#pw_match_msg').text('');
			        }
			    });
			});
		</script>
        이름: <input type="text" name="name"><br>
        <h3>선택 항목</h3>
        전화번호: <input type="text" name="phone"><br>
        이메일: <input type="email" name="email"><br>
        <button type="submit">가입하기</button>
    </form>
    <!-- 필수값 입력 확인 -->
    <script>
    
		function isPasswordSecure(password) {
		    const hasLetter = /[a-zA-Z]/.test(password);
		    const hasNumber = /\d/.test(password);
		    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
	
		    const count = [hasLetter, hasNumber, hasSpecial].filter(Boolean).length;
		    return password.length >= 8 && count >= 2;
		}

		function validateForm() {

		    const id = $('#member_id').val().trim();
		    const idCheckMsg = $('#id_check').text().trim();
		    const pw = $('#password').val();
		    const pwCheck = $('#password_check').val();
		    const name = $('input[name="name"]').val().trim();
		    
		    if (!id) {
		        alert('아이디를 입력해주세요.');
		        $('#member_id').focus();
		        return false;
		    }
		    if (idCheckMsg !== '사용가능한 아이디입니다.') {
		        alert('아이디 중복 확인을 해주세요.');
		        $('#member_id').focus();
		        return false;
		    }
		    if (!pw) {
		        alert('비밀번호를 입력해주세요.');
		        $('#password').focus();
		        return false;
		    }
		    if (!pwCheck) {
		        alert('비밀번호 확인을 입력해주세요.');
		        $('#password_check').focus();
		        return false;
		    }
		    if (pw !== pwCheck) {
		        alert('비밀번호가 일치하지 않습니다.');
		        $('#password_check').focus();
		        return false;
		    }
		    if (!name) {
		        alert('이름을 입력해주세요.');
		        $('input[name="name"]').focus();
		        return false;
		    }
		    if (!isPasswordSecure(pw)) {
		        alert('비밀번호는 8자 이상이며, 문자/숫자/기호 중 두 가지 이상을 포함해야 합니다.');
		        $('#password').focus();
		        return false;
		    }
		    return true;
		}
		</script>
</body>
</html>

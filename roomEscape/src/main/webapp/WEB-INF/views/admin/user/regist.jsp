<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
	
		//비밀번호 일치 확인
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
		
		    //전화번호 유효성 검사
	            $('#phone').on('input', function () {
	                let input = $(this).val().replace(/\D/g, ''); // 숫자만 남김
	
	                // 11자리일 때 000-0000-0000 형식
	                if (input.length > 3 && input.length <= 7) {
	                    input = input.replace(/(\d{3})(\d+)/, '$1-$2');
	                } else if (input.length > 7) {
	                    input = input.replace(/(\d{3})(\d{4})(\d+)/, '$1-$2-$3');
	                }
	
	                $(this).val(input);
	            });
		
		    	//이메일 선택
			    $('#domain_select').on('change', function () {
			        const selected = $(this).val();
			        if (selected) {
			            $('#email_domain').val(selected).prop('readonly', true);
			        } else {
			            $('#email_domain').val('').prop('readonly', false); 
			        }
			    });
        });
	</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/regist.css">
    <title>회원가입 페이지</title>
</head>
<body>
    <h2>회원가입</h2>
    <form id="registForm" action="/user/regist" method="post" onsubmit="return validateForm();">
    <h3 class="sub-title">필수 항목</h3>
        아이디
		<input type="text" name="member_id" id="member_id" placeholder="중복 확인을 눌러주세요">
		
		<div class="id-row">
		    <button type="button" onclick="checkDuplicateId()">중복 확인</button>
		    <span id="id_check" hidden></span>
		</div><br> 
		비밀번호 <input type="password" id="password" name="password" placeholder="영문, 숫자, 기호 포함 8자 이상"><br>
		비밀번호 확인 <input type="password" id="password_check" name="password_check" placeholder="한번 더 입력해주세요"><span id="pw_match_msg"></span><br>
        이름 <input type="text" name="name"><br>
        전화번호 <input type="text" name="phone" id="phone" maxlength="13" placeholder="-를 빼고 숫자만 입력하세요"><br>
        
        <h3 class="sub-title">선택 항목</h3>
			이메일:
        <div class="email-row">
			<input type="text" id="email_id" placeholder="example">
			@
			<input type="text" id="email_domain" name="email" placeholder="domain.com">
			<select id="domain_select">
			    <option value="">직접 입력</option>
			    <option value="naver.com">naver.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="daum.net">daum.net</option>
			</select><br>
        </div>
	        <button type="submit">가입하기</button>
    </form>
    <script>
	    //아이디 중복검사
		function checkDuplicateId() {
		    var id = $('#member_id').val().trim();
		    
		    if (!id) {
		    	$('#id_check').show();
		    	$('#id_check').text('아이디를 입력하세요.').css({color : 'red'});
		        return;
		    }
		    
		    $.get('/user/checkId', { member_id: id }, function(isAvailable) {
		    	$('#id_check').show();
		        if (isAvailable) {
		            $('#id_check').text('사용가능한 아이디입니다.').css({color : 'green'});
		        } else {
		        	$('#id_check').text('이미 사용 중인 아이디입니다.').css({color : 'red'});
		        }
		    });
		}    
		//필수값 입력 확인
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
		    const phone = $('#phone').val().trim();
		    
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
			if (!phone) {
			    alert('전화번호를 입력해주세요.');
			    $('#phone').focus();
			    return false;
			}
			if (!/^\d{3}-\d{4}-\d{4}$/.test(phone)) {
			    alert('전화번호 형식이 올바르지 않습니다. 예: 010-1234-5678');
			    $('#phone').focus();
			    return false;
			}
		    return true;
		}
		

		</script>
</body>
</html>

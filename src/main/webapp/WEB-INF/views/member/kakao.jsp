<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.kakao.init('자바스크립트 코드');
	
	function kakaoinit(){
		window.kakao.Auth.login({
			scope:'profile_nickname,account_email'
			success: function(result){
				window.kakao.API.request({
					url: '/member/kakao',
					success: res=> {
						const email = res.kakao_account.email;
						const name = res.properties.nickname;
						
						console.log(email);
						console.log(name);
						
						document.getElementById('m_id').value = email;
						document.getElementById('m_email').value = email;
						document.getElementById('m_name').value = name;
						
					}
					
				})
				
			}
			
		})
		
	}
</script>
</head>
<body>
	<h2>카카오 회원가입</h2>
	<button onclick="kakaoinit()">카카오 정보 가져오기</button><br>
	<form action="/member/signup" name="signup_form" method="post">
		아이디 : <input type="text" id="m_id" name="m_id"><br>
		비밀번호 : <input type="password" name="m_password"><br>
		이름 : <input type="text" id="m_name" name="m_name"><br>
		이메일 : <input type="text" id="m_email" name="m_email"><br>
		전화번호 : <input type="text" name="m_phone"><br>
		타입 : <select name="m_type">
			<option value="student">학생</option>
			<option value="teacher">선생님</option>
		</select>
		<!-- <input type="hidden" name="m_type" value="student"><br> -->
		<button onclick="idch()">가입하기</button><br>
	</form>
	
</body>
</html>
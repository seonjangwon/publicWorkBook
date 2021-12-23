<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function idch(){
		const id = document.getElementById('m_id').value;
		
		$.ajax({
			type:'post',
			url:'/member/idch',
			data:{"m_id":id},
			datatype:'text',
			success:function(result){
				alert('성공'+result);
				if(result=='ok'){
					signup_form.submit();
				}else{
					alert('중복 아이디입니다');
				}
			},
			error:function(){
				alert('오타를 찾아요');
			}
		});
	}
</script>
</head>
<body>
	<h2>학생으로 회원가입</h2>
	
	<form action="/member/signup" name="signup_form" method="post">
		아이디 : <input type="text" id="m_id" name="m_id"><br>
		비밀번호 : <input type="password" name="m_password"><br>
		이름 : <input type="text" name="m_name"><br>
		이메일 : <input type="text" name="m_email"><br>
		전화번호 : <input type="text" name="m_phone"><br>
		<input type="hidden" name="m_type" value="student"><br>
		<button onclick="idch()">가입하기</button><br>
	</form>
</body>
</html>
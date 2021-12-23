<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function pwch(){
		const id = document.getElementById('m_id').value;
		const pw = document.getElementById('m_pw').value;
		
		$.ajax({
			type:'post',
			url:'/member/pwch',
			data:{"m_password":pw, "m_id":id},
			datatype:'text',
			success:function(result){
				alert('성공'+result);
				if(result=="ok"){
					update_form.submit();
				}else{
					alert('비밀번호가 틀립니다');
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
	<h2>정보 수정</h2>
	<form action="update" method="post" name="update_form">
		<input type="text" id="m_id" name="m_id" value="${loginDTO.m_id}" readonly><br>
		<input type="password" id="m_pw" name="m_password"><br>
		이름 : <input type="text" name="m_name" value="${loginDTO.m_name}"><br>
		이메일 : <input type="text" name="m_email" value="${loginDTO.m_email }"><br>
		전화번호 : <input type="text" name="m_phone" value="${loginDTO.m_phone }"><br>
		<input type="hidden" name="m_type" value="${loginDTO.m_type}"><br>
		<button onclick="pwch()">수정하기</button>
	</form>
</body>
</html>
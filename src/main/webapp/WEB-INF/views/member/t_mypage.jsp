<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>선생님 마이페이지</h2>
	
	아이디 : ${loginDTO.m_id}<br>
	비밀번호 : ${loginDTO.m_password}<br>
	이름 : ${loginDTO.m_name}<br>
	이메일 : ${loginDTO.m_email}<br>
	전화번호 : ${loginDTO.m_phone}<br>
	
	<a href="/member/update">내 정보 수정</a><br>
	<a href="/member/t_myquestion?m_id=${loginDTO.m_id}">내 문제 보기</a>
	
</body>
</html>
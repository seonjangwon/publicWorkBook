<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>과목 설정</h2>
	<form action="/question/subject" method="post">
		<input type="hidden" name="c_number" value="${c_num}"><br>
		과목이름 : <input type="text" name="s_name"><br>
		작성자 : <input type="text" name="m_id" value="${loginDTO.m_id}" readonly><br>
		문제 숫자 : <input type="text" name="s_quantity" value="5"><br>
		<input type="submit" value="과목설정">
	</form>
</body>
</html>
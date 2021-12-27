<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL(JSP Standard Tag Library)사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>문제 출제</h2>
	<form action="/question/write" method="post" enctype="multipart/form-data">
		<c:forEach begin="0" end="${sdto.s_quantity - 1}" varStatus="status">
			${status.count} 번 문제 <br>
			<input type="hidden" name="qList[${status.index}].s_number" value="${s_num}"><br>
			<input type="hidden" name="qList[${status.index}].m_id" value="${loginDTO.m_id}"><br>
			문제 : <input type="text" name="qList[${status.index}].q_name"><br>
			보기 사진 : <input type="file" name="qList[${status.index}].q_file"><br>
			선택지1 : <input type="text" name="qList[${status.index}].q_select1" placeholder="필수"><br>
			선택지2 : <input type="text" name="qList[${status.index}].q_select2" placeholder="필수"><br>
			선택지3 : <input type="text" name="qList[${status.index}].q_select3" placeholder="필수"><br>
			선택지4 : <input type="text" name="qList[${status.index}].q_select4" placeholder="필수"><br>
			선택지5 : <input type="text" name="qList[${status.index}].q_select5" placeholder="필수 아님"><br>
			정답 : <input type="text" name="qList[${status.index}].q_answer"><br>
			해설 : <input type="text" name="qList[${status.index}].q_exposition"><br><br><br>
		</c:forEach>
	<input type="submit" value="만들기">
	</form>
	
</body>
</html>
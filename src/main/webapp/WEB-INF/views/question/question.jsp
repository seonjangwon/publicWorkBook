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
	<h3>카테고리 설정</h3>
	
	<h3>카테고리 만들기</h3>
	<form action="/question/category" method="post">
		카테고리 이름 : <input type="text" name="c_name" >
		<input type="submit" value="카테고리 설정">
	</form>
	
	
	<h3>카테고리 선택</h3>
	<form action="/question/category" method="post">
		<select name="c_number">
			<option selected>카테고리 선택</option>
		<c:forEach items="${cList}" var="c">
			<option value="${c.c_number}">${c.c_name}</option>
		</c:forEach>
		</select>
		<input type="submit" value="카테고리 설정">
	</form>
</body>
</html>
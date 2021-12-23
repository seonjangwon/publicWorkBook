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

	<h2>문제 풀기 시작</h2>
	<h3>카테고리 선택</h3>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<c:forEach items="${cList}" var="c" varStatus="s">
		<tr>
			<td>${s.count}</td>
			<td><a href="/question/category_select?c_number=${c.c_number}">${c.c_name}</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
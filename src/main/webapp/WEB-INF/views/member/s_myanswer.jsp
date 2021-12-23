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
	<h2>내가 푼 문제</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>과목 번호</th>
			<th>점수</th>
		</tr>
		<c:forEach items="${msList}" var="ms" varStatus="s">
		<tr>
			<td>${s.count}</td>
			<td>${ms.s_number}</td>
			<td>${ms.ms_score}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
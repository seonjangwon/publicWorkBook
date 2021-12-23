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
	<h2>과목 선택</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>과목이름</th>
			<th>작성자</th>
			<th>문제 숫자</th>
		</tr>
		<c:forEach items="${sList}" var="s" varStatus="st">
		<tr>
			<td>${st.count}</td>
			<td><a href="/question/detail?s_number=${s.s_number}">${s.s_name}</a></td>
			<td>${s.m_id}</td>
			<td>${s.s_quantity}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
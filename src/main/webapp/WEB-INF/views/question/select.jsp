<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL(JSP Standard Tag Library)사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
</head>
<body>
	<h2>과목 선택</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>과목이름</th>
			<th>작성자</th>
			<th>문제 숫자</th>
			<th>리뷰</th>
		</tr>
		<c:forEach items="${sList}" var="s" varStatus="st">
		<tr>
			<td>${st.count}</td>
			<td><a href="/question/detail?s_number=${s.s_number}">${s.s_name}</a></td>
			<td>${s.m_id}</td>
			<td>${s.s_quantity}</td>
			<td><a href="/answer/r_detail?s_number=${s.s_number}">리뷰</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
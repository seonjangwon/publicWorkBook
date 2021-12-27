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
	<h2>리뷰</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>점수 (평균<c:choose>
					<c:when test="${avg == 0}">
					0
					</c:when>
					<c:when test="${avg == 1}">
					⭐
					</c:when>
					<c:when test="${avg == 2}">
					⭐⭐
					</c:when>
					<c:when test="${avg == 3}">
					⭐⭐⭐
					</c:when>
					<c:when test="${avg == 4}">
					⭐⭐⭐⭐
					</c:when>
					<c:otherwise>
					⭐⭐⭐⭐⭐
					</c:otherwise>
				</c:choose>)</th>
			<th>내용</th>
		</tr>
		<c:forEach items="${rList}" var="r" varStatus="s">
			<tr>
				<td>${s.count}</td>
				<td>${r.m_id}</td>
				<td>
				<c:choose>
					<c:when test="${r.r_score == 0}">
					0
					</c:when>
					<c:when test="${r.r_score == 1}">
					⭐⭐
					</c:when>
					<c:when test="${r.r_score == 2}">
					⭐⭐
					</c:when>
					<c:when test="${r.r_score == 3}">
					⭐⭐⭐
					</c:when>
					<c:when test="${r.r_score == 4}">
					⭐⭐⭐⭐
					</c:when>
					<c:otherwise>
					⭐⭐⭐⭐⭐
					</c:otherwise>
				</c:choose>
				</td>
				<td>${r.r_contents}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
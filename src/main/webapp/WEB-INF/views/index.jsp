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
	<h2>index</h2>
	<c:choose>
		<c:when test="${loginDTO eq null}">
			<a href="/member/signup">회원 가입</a>
			<a href="/member/signin">로그인</a>
		</c:when>
		<c:otherwise>
			<a href="/member/signout">로그아웃</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${loginDTO.m_type eq 'teacher' }">
			<a href="/member/t_mypage">선생님 마이페이지</a>
		</c:when>
		<c:when test="${loginDTO.m_type eq 'student' }">
			<a href="/member/s_mypage">학생 마이페이지</a>
		</c:when>
		<c:when test="${loginDTO.m_type eq 'admin' }">
			<a href="/member/admin">관리자 페이지</a>
		</c:when>
	</c:choose>
	
	<c:choose>
		<c:when test="${loginDTO.m_type eq 'teacher' }">
			<a href="/question/question">문제 출제하러</a>
		</c:when>
		<c:when test="${loginDTO.m_type eq 'student' }">
			<a href="/question/solve">문제 풀러</a>
		</c:when>
	</c:choose>
	
</body>
</html>
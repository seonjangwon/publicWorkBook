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
	<h2>문제 풀기</h2>
	<form action="/answer/submit" method="post">
	<c:forEach items="${qList}" var="q" varStatus="s">
		<input type="hidden" name="AList[${s.index}].s_number" value="${q.s_number}">
		<input type="hidden" name="AList[${s.index}].q_number" value="${q.q_number}">
		<input type="hidden" name="AList[${s.index}].m_id" value="${loginDTO.m_id}">
		${s.count}번 문제 <br>
		${q.q_name}<br>
		<img alt="해설이 없습니다" src="/resources/uplode/${q.q_filename}">${q.q_filename}<br>
		<input type="radio" id="${s.count}_1" name="AList[${s.index}].a_answer" value="1">
		<label for="${s.count}_1">${q.q_select1}</label><br>
		<input type="radio" id="${s.count}_2" name="AList[${s.index}].a_answer" value="2">
		<label for="${s.count}_2">${q.q_select2}</label><br>
		<input type="radio" id="${s.count}_3" name="AList[${s.index}].a_answer" value="3">
		<label for="${s.count}_3">${q.q_select3}</label><br>
		<input type="radio" id="${s.count}_4" name="AList[${s.index}].a_answer" value="4">
		<label for="${s.count}_4">${q.q_select4}</label><br>
		<c:if test="${q.q_select5 != null}">
		<input type="radio" id="${s.count}_5" name="AList[${s.index}].a_answer" value="5">
		<label for="${s.count}_5">${q.q_select5}</label><br>
		</c:if>
		<br><br>
	</c:forEach>
	<input type="submit" value="정답 제출">
	</form>
</body>
</html>
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
	<h2>전체 회원 관리</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>타입</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${mList}" var="m">
		<tr>
			<td>${m.m_number}</td>
			<td>${m.m_id}</td>
			<td>${m.m_password}</td>
			<td>${m.m_name}</td>
			<td>${m.m_email}</td>
			<td>${m.m_phone}</td>
			<td>${m.m_type}</td>
			<td><a href="/member/m_delete?m_id=${m.m_id}&page=${page.page}">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
	${page}
	<div>
		<c:choose>
			<c:when test="${page.page <= 1 }">
				[이전]
			</c:when>
			
			<c:otherwise>
				<a href="/member/m_findAll?page=${page.page-1}">[이전]</a>
			</c:otherwise>
			
		</c:choose>
		
		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq page.page }">
					${i}
				</c:when>
				<c:otherwise>
					<a href="/member/m_findAll?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${page.page >= page.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="/member/m_findAll?page=${page.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
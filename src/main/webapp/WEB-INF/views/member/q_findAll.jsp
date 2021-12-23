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
<body>
	<h2>전체 문제 출력</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>과목이름</th>
			<th>작성자</th>
			<th>문제 숫자</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${sList}" var="s" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td><a href="/question/detail?s_number=${s.s_number}">${s.s_name}</a></td>
				<td>${s.m_id}</td>
				<td>${s.s_quantity}</td>
				<td><a href="/member/delete?s_number=${s.s_number}">삭제</a></td>
			</tr>
			<tr>
				<td>
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">
									리뷰 확인</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse show"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<c:forEach items="${rList}" var="r">
										
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:choose>
			<c:when test="${page.page <= 1 }">
				[이전]
			</c:when>

			<c:otherwise>
				<a href="/member/m_findAll?page=${page.page-1}">[이전]</a>
			</c:otherwise>

		</c:choose>

		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i"
			step="1">
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
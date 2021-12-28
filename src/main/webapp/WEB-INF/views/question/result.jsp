<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL(JSP Standard Tag Library)사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#review_form input[type=radio]{
		display : none;
	}
	#review_form label{
		font-sizw : 30em;
		color : transparent;
		text-shadow : 0 0 0 #f0f0f0;
	}
	#review_form label:hover{
   		text-shadow: 0 0 0 #a00; /* 마우스 호버 */
	}
	#review_form label:hover ~ label{
   		text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
	}
	#review_form input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
	}
	#review_form fieldset{
    	display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    	direction: rtl; /* 이모지 순서 반전 */
    	border: 0; /* 필드셋 테두리 제거 */
	}
	#review_form fieldset legend{
    	text-align: right;
	}
</style>
</head>
<body>
	<h2>풀이 결과</h2>
	
	점수 : ${score} <br>
	<c:choose>
		<c:when test="${falseList eq null}">
			와우 만접이에요!
		</c:when>
		<c:otherwise>
			<c:forEach items="${falseList}" var="f">
				문제 : ${f.q_name}<br>
				<img alt="해설 x" src="/resources/uplode/${f.q_filename}"><br>
				1. ${f.q_select1}<br>
				2. ${f.q_select1}<br>
				3. ${f.q_select1}<br>
				4. ${f.q_select1}<br>
				<c:if test="${f.q_select5 != null}">
				5. ${f.q_select1}<br>
				</c:if>
				${f.q_answer}<br>
				${f.q_exposition}<br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<h2>리뷰 등록</h2>
	<form id="review_form" action="/answer/review" method="post">
		<input type="hidden" name="s_number" value="${falseList[1].s_number}"><br>
		작성자 : <input type="text" name="m_id" value="${loginDTO.m_id}" readonly><br>
	<fieldset>
		<legend>별점<br></legend>
		<input type="radio" name="r_score" value="5.0" id="score1"><label for="score1">⭐</label>
		<input type="radio" name="r_score" value="4.0" id="score2"><label for="score2">⭐</label>
		<input type="radio" name="r_score" value="3.0" id="score3"><label for="score3">⭐</label>
		<input type="radio" name="r_score" value="2.0" id="score4"><label for="score4">⭐</label>
		<input type="radio" name="r_score" value="1.0" id="score5"><label for="score5">⭐</label>
		<br>
	</fieldset><br>
		리뷰 내용 : <input type="text" name="r_contents"><br>
		<input type="submit" value="리뷰 등록">
	</form>
	
</body>
</html>
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
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script>
	function submit_btn(){
		submit_form.submit();
	}
</script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/">Public Work Book</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<c:choose>
						<c:when test="${loginDTO eq null}">
							<li><a class="dropdown-item" href="/member/signup">회원가입</a></li>
							<li><a class="dropdown-item" href="/member/signin">로그인</a></li>
						</c:when>
						<c:when test="${loginDTO.m_type eq 'teacher' }">
							<li><a class="dropdown-item" href="/member/t_mypage">선생님
									마이페이지</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="/member/signout">로그아웃</a></li>
							<li><a class="dropdown-item" href="/member/kakaologout">카카오
									로그아웃</a></li>
						</c:when>
						<c:when test="${loginDTO.m_type eq 'student' }">
							<li><a class="dropdown-item" href="/member/s_mypage">학생
									마이페이지</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="/member/signout">로그아웃</a></li>
							<li><a class="dropdown-item" href="/member/kakaologout">카카오
									로그아웃</a></li>
						</c:when>
						<c:when test="${loginDTO.m_type eq 'admin' }">
							<li><a class="dropdown-item" href="/member/admin">관리자
									페이지</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="/member/signout">로그아웃</a></li>
							<li><a class="dropdown-item" href="/member/kakaologout">카카오
									로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="/"><div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> index </a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<c:choose>
							<c:when test="${loginDTO.m_type eq 'teacher' }">
								<a class="nav-link" href="/question/question"><div
										class="sb-nav-link-icon">
										<i class="fas fa-columns"></i>
									</div> 문제 출제 </a>
							</c:when>
							<c:when test="${loginDTO.m_type eq 'student' }">
								<a class="nav-link" href="/question/solve"><div
										class="sb-nav-link-icon">
										<i class="fas fa-book-open"></i>
									</div> 문제 풀기 </a>
							</c:when>
						</c:choose>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<c:choose>
							<c:when test="${loginDTO.m_type eq 'teacher' }">
								<a class="nav-link" href="/member/t_mypage">
									<div class="sb-nav-link-icon">
										<i class="fas fa-chart-area"></i>
									</div> 선생님 마이페이지
								</a>
							</c:when>
							<c:when test="${loginDTO.m_type eq 'student' }">
								<a class="nav-link" href="/member/s_mypage"><div
										class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 학생 마이페이지 </a>
							</c:when>
							<c:when test="${loginDTO.m_type eq 'admin' }">
								<div class="sb-nav-link-icon">
									<i class="fas fa-table"></i> <a class="nav-link"
										href="/member/admin"><div class="sb-nav-link-icon">
											<i class="fas fa-table"></i>
										</div> 관리자 페이지 </a>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Subject
										Setting</h3>
								</div>
								<form action="/answer/submit" name="submit_form" method="post">
									<div class="row">
										<div class="col-xl-6 card-body">
											<c:forEach items="${qList}" var="q" varStatus="s" begin="0" step="2">
												<input type="hidden" name="AList[${s.index}].s_number" value="${q.s_number}">
												<input type="hidden" name="AList[${s.index}].q_number" value="${q.q_number}">
												<input type="hidden" name="AList[${s.index}].m_id" value="${loginDTO.m_id}">
												<div>${s.index + 1}번문제</div>
												<div>${q.q_name}</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-1" type="radio"
														value="1" /> <label class="form-check-label" for="${s.index}-1">${q.q_select1}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-2" type="radio"
														value="2" /> <label class="form-check-label" for="${s.index}-2">${q.q_select2}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-3" type="radio"
														value="3" /> <label class="form-check-label" for="${s.index}-3">${q.q_select3}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-4" type="radio"
														value="4" /> <label class="form-check-label" for="${s.index}-4">${q.q_select4}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-5" type="radio"
														value="5" /> <label class="form-check-label" for="${s.index}-5">${q.q_select5}</label>
												</div>
											</c:forEach>
										</div>
										<div class="col-xl-6 card-body">
											<c:forEach items="${qList}" var="q" varStatus="s" begin="1" step="2">
												<input type="hidden" name="AList[${s.index}].s_number" value="${q.s_number}">
												<input type="hidden" name="AList[${s.index}].q_number" value="${q.q_number}">
												<input type="hidden" name="AList[${s.index}].m_id" value="${loginDTO.m_id}">
												<div>${s.index + 1}번문제</div>
												<div>${q.q_name}</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-1" type="radio"
														value="1" /> <label class="form-check-label" for="${s.index}-1">${q.q_select1}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-2" type="radio"
														value="2" /> <label class="form-check-label" for="${s.index}-2">${q.q_select2}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-3" type="radio"
														value="3" /> <label class="form-check-label" for="${s.index}-3">${q.q_select3}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-4" type="radio"
														value="4" /> <label class="form-check-label" for="${s.index}-4">${q.q_select4}</label>
												</div>
												<div class="form-radio mb-3">
													<input class="form-check-input"
														name="AList[${s.index}].a_answer"
														id="${s.index}-5" type="radio"
														value="5" /> <label class="form-check-label" for="${s.index}-5">${q.q_select5}</label>
												</div>
											</c:forEach>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="btn btn-primary" onclick="submit_btn()">만들기</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<h2>문제 풀기</h2>
				<form action="/answer/submit" method="post">
					<c:forEach items="${qList}" var="q" varStatus="s">
						<input type="hidden" name="AList[${s.index}].s_number" value="${q.s_number}">
						<input type="hidden" name="AList[${s.index}].q_number" value="${q.q_number}">
						<input type="hidden" name="AList[${s.index}].m_id" value="${loginDTO.m_id}">
		${s.count}번 문제 <br>
		${q.q_name}<br>
						<img alt="해설이 없습니다" src="/resources/uplode/${q.q_filename}">${q.q_filename}<br>
						<input type="radio" id="${s.count}_1"
							name="AList[${s.index}].a_answer" value="1">
						<label for="${s.count}_1">${q.q_select1}</label>
						<br>
						<input type="radio" id="${s.count}_2"
							name="AList[${s.index}].a_answer" value="2">
						<label for="${s.count}_2">${q.q_select2}</label>
						<br>
						<input type="radio" id="${s.count}_3"
							name="AList[${s.index}].a_answer" value="3">
						<label for="${s.count}_3">${q.q_select3}</label>
						<br>
						<input type="radio" id="${s.count}_4"
							name="AList[${s.index}].a_answer" value="4">
						<label for="${s.count}_4">${q.q_select4}</label>
						<br>
						<c:if test="${q.q_select5 != null}">
							<input type="radio" id="${s.count}_5"
								name="AList[${s.index}].a_answer" value="5">
							<label for="${s.count}_5">${q.q_select5}</label>
							<br>
						</c:if>
						<br>
						<br>
					</c:forEach>
					<input type="submit" value="정답 제출">
				</form>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="/resources/assets/demo/chart-area-demo.js"></script>
	<script src="/resources/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="/resources/js/datatables-simple-demo.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL(JSP Standard Tag Library)사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./mystyle.css" />
<!-- [if lte IE 8] -->
<script type="text/javascript" src="./respond.min.js"></script>
<!-- [endif] -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style>
	@media screen and (max-height: 500px) {
		.carousel{
		 height: 100px;
		 margin: 20px;
	}
	}
	
	
</style>
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
				<div id="carouselExampleCaptions" class="carousel slide" width="10%"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/resources/upload/people-g4a1ce80ce_1920.jpg" class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>Public Work Book</h5>
								<p>다양한 사람들과 함께 문제를 공유해 보아요</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="/resources/upload/children-g43ba51970_1920.jpg" class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>합격!</h5>
								<p>합격의 즐거움을 모두에게 알려주세요</p>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<h2>index</h2>
				${loginDTO}
				<c:choose>
					<c:when test="${loginDTO eq null}">
						<a href="/member/signup">회원 가입</a>
						<a href="/member/signin">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="/member/signout">로그아웃</a>
						<br>
						<a href="/member/kakaologout">카카오 로그아웃</a>

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
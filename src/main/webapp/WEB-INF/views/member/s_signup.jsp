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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
>
<script>
	function idch(){
		const id = document.getElementById('m_id').value;
		
		$.ajax({
			type:'post',
			url:'/member/idch',
			data:{"m_id":id},
			datatype:'text',
			success:function(result){
				alert('성공'+result);
				if(result=='ok'){
					signup_form.submit();
				}else{
					alert('중복 아이디입니다');
				}
			},
			error:function(){
				alert('오타를 찾아요');
			}
		});
	}
	function idch2() {
		const id = document.getElementById('inputFirstName').value;

		$.ajax({
			type : 'post',
			url : '/member/idch',
			data : {
				"m_id" : id
			},
			datatype : 'text',
			success : function(result) {
				alert('성공' + result);
				if (result == 'ok') {
					signup_form2.submit();
				} else {
					alert('중복 아이디입니다');
				}
			},
			error : function() {
				alert('오타를 찾아요');
			}
		});
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
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    <div class="card-body">
                                        <form action="/member/signup" name="signup_form2" method="post">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputFirstName" type="text" name="m_id" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">아이디</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputLastName" type="password" name="m_password" placeholder="Enter your last name" />
                                                        <label for="inputLastName">비밀번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="email" name="m_email" placeholder="name@example.com" />
                                                <label for="inputEmail">이메일</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPassword" type="text" name="m_name" placeholder="Create a password" />
                                                        <label for="inputPassword">이름</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPasswordConfirm" type="text" name="m_phone" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">전화번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0"><input type="hidden"
						name="m_type" value="student">
                                                <div class="d-grid"><a class="btn btn-primary btn-block" onclick="idch2()">Create Account</a></div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="/member/signin">Have an account? Go to login</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
	<h2>학생으로 회원가입</h2>
	
	<form action="/member/signup" name="signup_form" method="post">
		아이디 : <input type="text" id="m_id" name="m_id"><br>
		비밀번호 : <input type="password" name="m_password"><br>
		이름 : <input type="text" name="m_name"><br>
		이메일 : <input type="text" name="m_email"><br>
		전화번호 : <input type="text" name="m_phone"><br>
		<input type="hidden" name="m_type" value="student"><br>
		<button onclick="idch()">가입하기</button><br>
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
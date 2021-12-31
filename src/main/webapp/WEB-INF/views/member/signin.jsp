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
	function login(){
		login_form.submit();
	}
</script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/">Start Bootstrap</a>
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
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<form name="login_form" action="/member/login" method="post">
										<div class="form-floating mb-3">
											<input class="form-control" name="m_id" id="inputEmail" type="text"
												placeholder="name@example.com" /> <label for="inputEmail">ID</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="m_password" id="inputPassword"
												type="password" placeholder="Password" /> <label
												for="inputPassword">Password</label>
										</div>
										<div class="form-radio mb-3">
											<input class="form-radio-input" name="m_type" id="teacher"
												type="radio" value="teacher" /> <label class="form-check-label"
												for="teacher">teacher</label>
											<input class="form-radio-input" name="m_type" id="student"
												type="radio" value="student" /> <label class="form-check-label"
												for="student">student</label>
											<input class="form-radio-input" name="m_type" id="admin"
												type="radio" value="admin" /> <label class="form-check-label"
												for="admin">admin</label>	
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="password.html">Forgot Password?</a> <a
												class="btn btn-primary" onclick="login()">Login</a>
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="/member/signup">Need an account? Sign up!</a>
									</div>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="https://kauth.kakao.com/oauth/authorize?client_id=5156cbc6620cde3e4649044a00f0dd0d&redirect_uri=http://localhost:8087/member/kakaologin&response_type=code">kakao Sign in!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h2>로그인</h2>
				<h3>선생님</h3>
				<form action="/member/login" method="post">
					아이디 : <input type="text" name="m_id"><br> 비밀번호 : <input
						type="password" name="m_password"><br> <input
						type="hidden" name="m_type" value="teacher"><br> <input
						type="submit" value="선생님 로그인">
				</form>

				<h3>학생</h3>
				<form action="/member/login" method="post">
					아이디 : <input type="text" name="m_id"><br> 비밀번호 : <input
						type="password" name="m_password"><br> <input
						type="hidden" name="m_type" value="student"><br> <input
						type="submit" value="학생 로그인">
				</form>

				<h3>관리자</h3>
				<form action="/member/login" method="post">
					아이디 : <input type="text" name="m_id"><br> 비밀번호 : <input
						type="password" name="m_password"><br> <input
						type="hidden" name="m_type" value="admin"><br> <input
						type="submit" value="관리자 로그인">
				</form>
				<br>
				<button id="naverIdLogin_loginButton">네이버로 로그인</button>
				<a href="/member/naverlogin">네이버</a><br> <a
					href="https://kauth.kakao.com/oauth/authorize?client_id=5156cbc6620cde3e4649044a00f0dd0d&redirect_uri=http://localhost:8087/member/kakaologin&response_type=code">
					카카오</a>
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
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
        window.Kakao.init('4f7e6a6740e72046aa0b6c7aab194013');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/member/kakaologin',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>

<!-- 네이버 스크립트 -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "VtWYln_sPBiE7qV0Kd6h", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8087/index", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
</html>
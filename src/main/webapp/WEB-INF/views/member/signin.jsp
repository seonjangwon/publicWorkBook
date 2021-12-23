<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인</h2>
	<h3>선생님</h3>
	<form action="/member/login" method="post">
		아이디 : <input type="text" name="m_id"><br>
		비밀번호 : <input type="password" name="m_password"><br>
		<input type="hidden" name="m_type" value="teacher"><br>
		<input type="submit" value="선생님 로그인"> 
	</form>
	
	<h3>학생</h3>
	<form action="/member/login" method="post">
		아이디 : <input type="text" name="m_id"><br>
		비밀번호 : <input type="password" name="m_password"><br>
		<input type="hidden" name="m_type" value="student"><br>
		<input type="submit" value="학생 로그인"> 
	</form>
	
	<h3>관리자</h3>
	<form action="/member/login" method="post">
		아이디 : <input type="text" name="m_id"><br>
		비밀번호 : <input type="password" name="m_password"><br>
		<input type="hidden" name="m_type" value="admin"><br>
		<input type="submit" value="관리자 로그인"> 
	</form>
	<br>
	<button id="naverIdLogin_loginButton">네이버로 로그인</button>
	<a href="/member/naverlogin">네이버</a>
</body>
<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

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
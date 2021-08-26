<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="resources/index/css/test.css">
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>LOGIN</title>
</head>
<body>
	<div class="Main-container">
		<div class="col-md-6 container-login">
			<div class="wrap-login">
				<form class="login-form" action="login" method="post">
					<span class="login-form-title">EVERY FARM</span>

					<div class="wrap-input">
						<input type="text" class="input" name="M_Id" placeholder="ID"
							required> <span class="focus-input"></span> <span
							class="symbol-input"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input">
						<input type="password" class="input" name="M_Pw"
							placeholder="Password" required> <span
							class="focus-input"></span> <span class="symbol-input"> <i
							class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="login-form-btn-container">
						<button type="submit" class="login-form-btn">Login</button>
					</div>
					<div class="login-form-btn-container">
						<a
							href="https://kauth.kakao.com/oauth/authorize
            ?client_id=498888e1cfaa9f3669cf117f84502ba4&redirect_uri=http://localhost:8090/kakaoLogin&response_type=code">
							<img alt="카카오로그인버튼" src="/resources/img/kakaologin.png">
						</a>
					</div>
					<div id="naver_id_login"></div>
					<div id="naver">
						<a href="javascript:void(0)"
							onclick="naverLogout(); return false;"> <span>네이버 로그아웃</span>
						</a>
					</div>
					<div class="text-center p-t-1">
						<select name="authority">
							<option value="ROLE_USER">member</option>
							<option value="ROLE_ADMIN">farmer</option>
						</select> <a href="/findId" class="txt2">아이디 찾기</a> <span class="txt1-1">/</span>
						<a href="/findPw" class="txt2">비밀번호 찾기</a>
					</div>
					<div class="text-center p-t-2">
						<a href="/sign" class="txt2">계정이 없으신가요?<i
							class="fa fa-long-arrow-right " aria-hidden="true"></i></a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var naver_id_login = new naver_id_login("Ql4Y2VZqHjqj9oNnoWts",
				"http://localhost:8090/callback");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://localhost:8090/login");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();

		var testPopUp;
		function openPopUp() {
			testPopUp = window
					.open("https://nid.naver.com/nidlogin.logout", "_blank",
							"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp() {
			testPopUp.close();
		}
		function naverLogout() {
			openPopUp();
			setTimeout(function() {
				closePopUp();
			}, 1000);
		}
	</script>
</body>
</html>
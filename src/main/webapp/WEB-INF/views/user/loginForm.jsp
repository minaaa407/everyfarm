<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="resources/index/css/test.css">
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<div class="Main-container">
		<div class="col-md-6 container-login">
			<div class="wrap-login">
				<form class="login-form" action="/login" method="post">
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
						<br> <br> <br> <a href="javascript:void(0)"
							onclick="kakaoLogin();"> <img
							src=/resources/img/kakaologin.png title="카카오로그인" alt="카카오톡으로 로그인">
						</a> <a href="javascript:void(0)" onclick="kakaoLogout();"> <span>카카오
								로그아웃</span>
						</a>
						<button class="btn btn-primary" id="googleLoginBtn">구글 로그인</button>
					</div>

					<div class="text-center p-t-1">
						<select name="authority">
							<option value="ROLE_USER">member</option>
							<option value="ROLE_ADMIN">farmer</option>
						</select> <a href="#" class="txt2">아이디 찾기</a> <span class="txt1-1">/</span>
						<a href="/findPw" class="txt2">비밀번호 찾기</a>
					</div>
					<div class="text-center p-t-2">
						<a href="#" class="txt2">계정이 없으신가요?<i
							class="fa fa-long-arrow-right " aria-hidden="true"></i></a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		/* 		$(function() {
		 if ("${id}" != null && "${id}" != "") {
		 $('#M_Id').val("${id}");
		 }
		 }); */
		Kakao.init('18b909a01a9f7b33f53573a4d3341f16'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)
						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
		
		
		const onClickGoogleLogin = function(e) {
	    	//구글서버로 인증코드 발급 요청
	 		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?
			client_id=본인클라이언트ID&
			redirect_uri=http://localhost:8080/score/User/google/auth(위에서 추가한 URL)&
			response_type=code&
			scope=email%20profile%20openid&
			access_type=offline");
	 	}
	</script>
</body>
</html>
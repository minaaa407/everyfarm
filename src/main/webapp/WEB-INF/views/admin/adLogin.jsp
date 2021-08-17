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
				<form class="login-form" action="adLogin" method="post">
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
						</a>
					</div>
					<div class="login-form-btn-container">
						<a
							href="https://kauth.kakao.com/oauth/authorize
            ?client_id=498888e1cfaa9f3669cf117f84502ba4&redirect_uri=http://localhost:8090/kakaoLogin&response_type=code">
							<img alt="카카오로그인버튼" src="/resources/img/kakaologin.png">
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

	<!-- 소셜로그인 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</body>
</html>
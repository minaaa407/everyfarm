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
				<form class="login-form" action="admin/login" method="post">
					<span class="login-form-title">ADMIN FARM</span>

					<div class="wrap-input">
						<input type="text" class="input" name="A_Id" placeholder="ID"
							required> <span class="focus-input"></span> <span
							class="symbol-input"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input">
						<input type="password" class="input" name="A_Pw"
							placeholder="Password" required> <span
							class="focus-input"></span> <span class="symbol-input"> <i
							class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="login-form-btn-container">
						<button type="submit" class="login-form-btn">Login</button>
					</div>
					<div class="text-center p-t-1">
						<a href="/admin/findId" class="txt2">아이디 찾기</a> <span class="txt1-1">/</span>
						<a href="/admin/findPw" class="txt2">비밀번호 찾기</a>
					</div>
					<div class="text-center p-t-2">
						<a href="/admin/sign" class="txt2">관리자 계정 추가<i
							class="fa fa-long-arrow-right " aria-hidden="true"></i></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
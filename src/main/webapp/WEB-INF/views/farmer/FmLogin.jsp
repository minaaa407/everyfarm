<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="resources/index/css/test.css">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>LOGIN</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<style>
	.input{
	
	padding : 0px;
	text-indent: 60px;
	}

</style>

</head>
<body>
	<div class="Main-container">
		<div class="col-md-6 container-login" style="padding : 0px">
			<div class="wrap-login">
				<form class="login-form" action="farmerLogin" method="post"
					id="loginBtn">
					
					<div class="login-form-btn-container">
						<!-- <a class="everyfarm" href="index.jsp">EVERY <span>FARM</span></a> -->
						<a class="everyfarm" href="index.jsp"><img class="logo" src="/resources/img/everyfarm.png" style="width: 400px;" alt="메인 바로가기"></a>
					</div>
					<br>
					<br>
					
					<span class="login-form-title">FARMER's FARM</span>

					<div class="wrap-input">
						<input type="text" class="input" name="F_Id" placeholder="ID"
							required> <span class="focus-input"></span> <span
							class="symbol-input"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input">
						<input type="password" class="input" name="F_Pw"
							placeholder="Password" required> <span
							class="focus-input"></span> <span class="symbol-input"> <i
							class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="login-form-btn-container">
						<button type="submit" class="login-form-btn">Login</button>
					</div>
					<div class="text-center p-t-1">
						<a href="/farmerFindId" class="txt2">아이디 찾기</a> <span
							class="txt1-1">/</span> <a href="/farmerFindPw" class="txt2">비밀번호
							찾기</a>
					</div>
					<div class="text-center p-t-2">
						<a href="/farmerSign" class="txt2">계정이 없으신가요?<i
							class="fa fa-long-arrow-right " aria-hidden="true"></i></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
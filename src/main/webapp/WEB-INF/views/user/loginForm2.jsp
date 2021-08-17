<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="resources/index/css/test.css">
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="677450549591-uug8q1h3bnd5pk3huf8e8mobv9kr40cb.apps.googleusercontent.com">
<title>LOGIN</title>
</head>
<body>
	<div class="Main-container">
		<div class="col-md-6 container-login">
			<div class="wrap-login">
				<form class="login-form" action="login" method="post">
					<span class="login-form-title">EVERY FARM</span>
					<div style="margin-bottom: 10px;"
						class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="search_1"
							name="search_total" onclick="search_check(1)" checked="checked">
						<label class="custom-control-label font-weight-bold text-white"
							for="search_1">소비자</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="search_2"
							name="search_total" onclick="search_check(2)"> <label
							class="custom-control-label font-weight-bold text-white"
							for="search_2">농업인</label>
					</div>

					<div id="member">
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
						<div class="text-center p-t-1">
							<a href="/findId" class="txt2">아이디 찾기</a> <span class="txt1-1">/</span>
							<a href="/findPw" class="txt2">비밀번호 찾기</a>
						</div>
						<div class="text-center p-t-2">
							<a href="/sign" class="txt2">계정이 없으신가요?<i
								class="fa fa-long-arrow-right " aria-hidden="true"></i></a>
						</div>
					</div>
					
					<div id="farmer" style="display: none">
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
						<div class="text-center p-t-1">
							<a href="/findId" class="txt2">아이디 찾기</a> <span class="txt1-1">/</span>
							<a href="/findPw" class="txt2">비밀번호 찾기</a>
						</div>
						<div class="text-center p-t-2">
							<a href="/sign" class="txt2">계정이 없으신가요?<i
								class="fa fa-long-arrow-right " aria-hidden="true"></i></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function search_check(num) {
			if (num == '1') {
				document.getElementById("member").style.display = "";
				document.getElementById("farmer").style.display = "none";
			} else {
				document.getElementById("member").style.display = "none";
				document.getElementById("member").style.display = "";
			}
		}
	</script>
</body>
</html>
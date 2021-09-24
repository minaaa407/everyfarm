<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="resources/index/css/test.css">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/editor/connn.ico" />
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>LOGIN</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp" />
	<div class="Main-container">
		<div class="col-md-12 container-login">
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
							<img alt="카카오로그인버튼" style="width: 250px;height: 55px;" src="/resources/img/kakaologin.png">
						</a>
					</div>
					<div class="login-form-btn-container">
						<%
							String clientId = "Ql4Y2VZqHjqj9oNnoWts";//애플리케이션 클라이언트 아이디값";
							String redirectURI = URLEncoder.encode("http://localhost:8090/user/callback", "UTF-8");
							SecureRandom random = new SecureRandom();
							String state = new BigInteger(130, random).toString();
							String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							apiURL += "&client_id=" + clientId;
							apiURL += "&redirect_uri=" + redirectURI;
							apiURL += "&state=" + state;
							session.setAttribute("state", state);
						%>
						<a href="<%=apiURL%>"><img height="50"
							src="/resources/img/naverlogin.png" /></a>
					</div>
					<div class="text-center p-t-1">
						<a href="/findId" class="txt2">아이디 찾기</a> <span class="txt1-1">/</span>
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
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</body>
</html>
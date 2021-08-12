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
						<br> <br> <br>
						<!-- kakao -->
						<a href="javascript:void(0)" onclick="kakaoLogin();"> <img
							src=/resources/img/kakaologin.png title="카카오로그인" alt="카카오톡으로 로그인">
						</a> <a href="javascript:void(0)" onclick="kakaoLogout();"> <span>카카오
								로그아웃</span>
						</a>
						<!-- google -->
						<div id="google_login" class="g-signin2" onclick="init();">
							<i class="fa fa-google-plus fa-fw"></i>
						</div> <a href="#" onclick="signOut();">Sign out</a>
					</div>

					<div class="text-center p-t-1">
						<select name="authority">
							<option value="ROLE_USER">member</option>
							<option value="ROLE_ADMIN">farmer</option>
						</select> <a href="#" class="txt2">아이디 찾기</a> <span class="txt1-1">/</span>
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
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	<script>
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
		/* 
		function kakaoLoginPro(response){
			var data = {id:response.id,email:response.kakao_account.email}
			$.ajax({
				type : 'POST',
				url : '/kakao_login',
				data : data,
				dataType : 'json',
				success : function(data){
					console.log(data)
					if(data.JavaData == "YES"){
						alert("로그인되었습니다.");
						location.href = '/home'
					}else if(data.JavaData == "register"){
						$("#kakaoEmail").val(response.kakao_account.email);
						$("#kakaoId").val(response.id);
						$("#kakaoForm").submit();
					}else{
						alert("로그인에 실패했습니다");
					}
					
				},
				error: function(xhr, status, error){
					alert("로그인에 실패했습니다."+error);
				}
			});
			 */
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
		
		//구글 로그인
		// google signin API
		var googleUser = {};
		function init() {
			 gapi.load('auth2', function() {
			  console.log("init()시작");
			  auth2 = gapi.auth2.init({
			        client_id: '677450549591-uug8q1h3bnd5pk3huf8e8mobv9kr40cb.apps.googleusercontent.com',
			        cookiepolicy: 'single_host_origin',
			      });
			      attachSignin(document.getElementById('google_login'));
			 });
		}
		
		//google signin API2
		function attachSignin(element) {
			var mId = {
					m_Id : $("#m_Id").val()
				}
			var mPw = {
					m_Pw : $("#m_Pw").val()
				}


		    auth2.attachClickHandler(element, {},
		        function(googleUser) {
		    	var profile = googleUser.getBasicProfile();
		    	var id_token = googleUser.getAuthResponse().id_token;
			  	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  	  console.log('ID토큰: ' + id_token);
			  	  console.log('Name: ' + profile.getName());
			  	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
					$(function() {
						$.ajax({
						    url: '/google_login',
						    type: 'post',
						    data: {
								"m_Id" : mId,
								"m_Pw" : mPw,
						        "username": profile.getName(),
								"email": profile.getEmail()
							    },
						    success: function (data) {
						            alert("구글아이디로 로그인 되었습니다");
						            location.href="/home";
						        }
						});
					})
		        }, function(error) {
		          alert(JSON.stringify(error, undefined, 2));
		        });
		    console.log("구글API 끝");
		  }
		//구글 로그아웃
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		};
	</script>
</body>
</html>
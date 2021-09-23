<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>EVERY FARM</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet" href="/resources/index/css/animate.css">

<link rel="stylesheet" href="/resources/index/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/index/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/index/css/magnific-popup.css">

<link rel="stylesheet" href="/resources/index/css/ionicons.min.css">

<link rel="stylesheet" href="/resources/index/css/flaticon.css">
<link rel="stylesheet" href="/resources/index/css/icomoon.css">
<link rel="stylesheet" href="/resources/index/css/style.css">

<style>
.everyfarm {
  color: #000000;
  font-weight: 900;
  font-size: 54px;
  line-height: 1;
  margin-bottom: 30px; }
  .everyfarm span {
    color: #4e9525; }
    .logo{
    width:100%;
    }
  .sign{
  	text-align: center;
  }
  .signmargin {
  margin-right : 25px;
  }
</style>
</head>
<body>
	<!-- Start Header -->
	<header>
		<div class="container pt-5 pb-4">
			<div class="row justify-content-between">
				<div class="col">
					<div>
						<!-- <a class="everyfarm" href="index.jsp">EVERY <span>FARM</span></a> -->
						<a class="everyfarm" href="index.jsp"><img class="logo" src="/resources/img/everyfarm.png" alt="메인 바로가기"></a>
					</div>
				</div>
				<div class="col sign">
							<c:choose>
								<c:when test="${empty member}">
									<div>
										<a href="/login" class="signmargin">로그인</a>
										<a href="/sign">회원가입</a>
									</div>
								</c:when>
								<c:when test="${not empty member}">
										<a><span style="font-weight:bold">${member.m_Name}님</span> 환영합니다.</a>
									<div>
										<a href="/mypage" class="signmargin">내 정보</a>
									<c:choose>
										<c:when test="${member.m_Pw eq 'KAKAO'}">
											<a href="/klogout">로그아웃</a>
										</c:when>
										<c:when test="${member.m_Pw eq 'NAVER'}">
											<a href="/nlogout">로그아웃</a>
										</c:when>
										<c:otherwise>
											<a href="/logout">로그아웃</a>
										</c:otherwise>
									</c:choose>
								</div>
								</c:when>
							</c:choose>
							</div>
						</div>
				</div>
		<!-- Start NavBar -->
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container-fluid">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="fa fa-bars"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav m-auto">
						<li id="a1" class="nav-item active"><a href="index.jsp"
							class="nav-link" style="font-size:20px">Home</a></li>
						<li id="a2" class="nav-item"><a href="/productlist" class="nav-link" style="font-size:20px">농장</a></li>
						<li id="a3" class="nav-item"><a href="/reviewList" class="nav-link" style="font-size:20px">REVIEW</a></li>
						<li id="a4" class="nav-item"><a href="/qnalist" class="nav-link" style="font-size:20px">Q&A</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- END NavBar -->
	<!-- END Header -->
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="/resources/index/js/jquery.min.js"></script>
	<script src="/resources/index/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/index/js/popper.min.js"></script>
	<script src="/resources/index/js/bootstrap.min.js"></script>
	<script src="/resources/index/js/jquery.easing.1.3.js"></script>
	<script src="/resources/index/js/jquery.waypoints.min.js"></script>
	<script src="/resources/index/js/jquery.stellar.min.js"></script>
	<script src="/resources/index/js/owl.carousel.min.js"></script>
	<script src="/resources/index/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/index/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/resources/index/js/google-map.js"></script>
	<script src="/resources/index/js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-23581568-13');
	</script>

</body>
</html>
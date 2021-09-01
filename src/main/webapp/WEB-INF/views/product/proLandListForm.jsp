<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="resources/index/css/animate.css">

<link rel="stylesheet" href="resources/index/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/index/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/index/css/magnific-popup.css">

<link rel="stylesheet" href="resources/index/css/ionicons.min.css">

<link rel="stylesheet" href="resources/index/css/flaticon.css">
<link rel="stylesheet" href="resources/index/css/icomoon.css">
<link rel="stylesheet" href="resources/index/css/style.css">
</head>
<style>
.top {
	text-align: center;
}

.top p {
	font-size: 0.8em;
	color: gray;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
}

thead th {
	padding-top: 15px;
	padding-bottom: 15px;
	font-weight: bold;
	vertical-align: top;
	color: black;
	border-bottom: 3px solid black;
	background: #dcdcdc;
}

tbody td {
	width: 350px;
	padding: 10px;
	font-size: 0.9em;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
}

tbody tr #num {
	width: 80px;
}

tbody tr #title {
	width: 420px;
	text-align: left;
}

tbody tr #name {
	width: 100px;
}

tbody tr #date {
	width: 100px;
}

tbody tr #readc {
	width: 80px;
}

#pageList {
	margin: auto;
	width: 50%;
	text-align: center;
}

#rezButton {
	text-align: right;
}

#regSearch {
	text-align: center;
}
</style>

<script>
function proDelete(p_No) {
	if (confirm('삭제하시겠습니까?')) {
		location.href='ProDelete?p_No=' + p_No;
	}
}
</script>

<title></title>
</head>

<body>
	<header>
		<div class="container pt-5 pb-4">
			<div class="row justify-content-between">
				<div class="col-md-8 order-md-last">
					<div class="row">
						<div class="col-md-6 text-center">
							<a class="navbar-brand" href="index.jsp">EVERY <span>FARM</span></a>
						</div>
						<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
							<form action="#" class="searchform order-lg-last">
								<div class="form-group d-flex">
									<input type="text" class="form-control pl-3"
										placeholder="Search">
									<button type="submit" placeholder=""
										class="form-control search">
										<span class="fa fa-search"></span>
									</button>
								</div>
							</form>
						</div>
						<div>
							<c:choose>
								<c:when test="${empty member}">
									<li><a href="/login">로그인</a></li>
									<li><a href="/sign">회원가입</a></li>
								</c:when>
								<c:when test="${not empty member}">
									<li>${member.m_Name}님환영합니다.</li>
									<li><a href="/mypage">내 정보</a></li>
									<li><a href="/logout">로그아웃</a></li>
								</c:when>
							</c:choose>
						</div>
					</div>
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
						<li class="nav-item active"><a href="index.jsp"
							class="nav-link">Home</a></li>
						<li class="nav-item"><a href="about.html" class="nav-link">농장</a></li>
						<li class="nav-item"><a href="/proRegisterForm"
							class="nav-link">농장 등록</a></li>
						<li class="nav-item"><a href="/reviewList" class="nav-link">REVIEW</a></li>
						<li class="nav-item"><a href="blog.html" class="nav-link">Q&A</a></li>
						<li class="nav-item"><a href="/proAdminListForm"
							class="nav-link">Contact</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- END NavBar -->
	<!-- END Header -->
	<h2>상품 리스트</h2>
	

		<div class="table" class="col-lg-12">
		<table>
			<thead>
				<tr>
					<th>상품번호</th>
					<th>메인이미지</th>
					<th>아이디</th>
					<th>제목</th>
					<th>등록날짜</th>
					<th>승인여부</th>
					<th>수정</th>
					<th>삭제</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${productlist}">
					<tr>
						<td class="content">${p.p_No}</td>
						<td class="content"><img id='product${p.p_No}'
							src="/resources/upload/product/${p.p_No}/${p.p_Img}"
							class="test1" width="90" height="auto" alt="Image ${p.p_No}">
						</td>
						<td class="content">${p.p_Id}</td>
						<td class="content">${p.p_Title}</td>
						<td class="content">${p.p_Date}</td>
						<td class="content">${p.p_Accept}</td>
						<td class="content"><a
							href="/productdetail?productno=${p.p_No}">상세보기</a></td>
						<td><button type="button" class="btn btn-outline-dark"
								onclick="javascript:proDelete(${p.p_No})">삭제</button></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	
	<!-- Start Footer -->
	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4">
						<h2 class="logo">
							<a href="#">EVERY <span>FARM</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Services</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Garden Care</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Lawn mowing</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Lawn Care</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Gutter Cleaning</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>New Lawn Installation</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Contact information</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Business Hours</h2>
						<div class="opening-hours">
							<h4>Opening Days:</h4>
							<p class="pl-3">
								<span>Monday â Friday : 9am to 20 pm</span> <span>Saturday
									: 9am to 17 pm</span>
							</p>
							<h4>Vacations:</h4>
							<p class="pl-3">
								<span>All Sunday Days</span> <span>All Official Holidays</span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->
</body>
</html>
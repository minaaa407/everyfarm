<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<title>EVERY FARM</title>
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
<link rel="stylesheet" href="resources/index/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/index/css/magnific-popup.css">

<link rel="stylesheet" href="resources/index/css/ionicons.min.css">

<link rel="stylesheet" href="resources/index/css/flaticon.css">
<link rel="stylesheet" href="resources/index/css/icomoon.css">
<link rel="stylesheet" href="resources/index/css/style.css">
</head>
<body>

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
								<button type="submit" placeholder="" class="form-control search">
									<span class="fa fa-search"></span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
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
					<li class="nav-item"><a href="services.html" class="nav-link">농장
							등록</a></li>
					<li class="nav-item"><a href="gallery.html" class="nav-link">REVIEW</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Q&A</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->


<p>데이터 집어 넣기</p>
<div class ="row">
	<div class ="col-lg-3 col-md-12">
		<div class = "productlisttop">
			<ul>
				<li>
					<a href="#">곡물 </a>
				</li>
				<li>
					<a href="#">구확작물 </a>
				</li>
				<li>
					<a href="#">채소</a>
				</li>
			</ul>
		</div>
	</div>
	<div class ="col-lg-9 col-md-12">
		<div class ="row">
			<div class ="col-lg-6 col-md-6">
			<select name="ptype" id="ptype">
					<option value="옷장">옷장</option>
					<option value="소파">소파</option>
					<option value="식탁">식탁</option>
					<option value="책장">책장</option>
					<option value="의자">의자</option>
					<option value="테이블">테이블</option>
					<option value="서랍">서랍</option>
			</select>
			</div>
			<div class ="col-lg-6 col-md-6">
				<a href="#">농장평점</a>/<a href="#">평수</a>/<a href="#">작은평수</a>/<a href="#">농장평점</a>

			</div>
			
		</div>
		<div class = "productlist">
		<div class ="row">
		<c:forEach var="p" varStatus="ps" items="${basketbean.getBasketbeanList() }" >
			<div class ="col-lg-4">${p.b_Seed} ${p.b_Land} ${p.b_Totalprice} ${p.p_Img} ${p.p_Manpay } ${p.p_Title } ${p.p_Landprice }<br/>
				
			</div>
				</c:forEach>
				
		</div>
		</div>
		
		
		<div class = "productlist2">
		<div class ="row">
		<c:forEach var="p" varStatus="ps" items="${basketbean2.getBasketbeanList() }" >
			<div class ="col-lg-4">${p.b_Seed} ${p.b_Land} ${p.b_Totalprice} ${p.p_Img} ${p.p_Manpay } ${p.p_Title } ${p.p_Landprice }<br/>
				
			</div>
				</c:forEach>
				
		</div>
		</div>
	</div>


</div>


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



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="resources/index/js/jquery.min.js"></script>
	<script src="resources/index/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/index/js/popper.min.js"></script>
	<script src="resources/index/js/bootstrap.min.js"></script>
	<script src="resources/index/js/jquery.easing.1.3.js"></script>
	<script src="resources/index/js/jquery.waypoints.min.js"></script>
	<script src="resources/index/js/jquery.stellar.min.js"></script>
	<script src="resources/index/js/owl.carousel.min.js"></script>
	<script src="resources/index/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/index/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/index/js/google-map.js"></script>
	<script src="resources/index/js/main.js"></script>

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
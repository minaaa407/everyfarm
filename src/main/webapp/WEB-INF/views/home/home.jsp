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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp" />

	<div class="hero-wrap js-fullheight"
		style="background-image: url('resources/index/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
				data-scrollax-parent="true">
				<div class="col-md-6 ftco-animate">
					<h2 class="subheading">Welcome to EVERY FARM</h2>
					<h1>농장 신청</h1>
					<p class="mb-4">내 손안의 농장</p>
					<p>
						<a href="/productlist" class="btn btn-primary mr-md-4 py-2 px-4">농장 보러가기
							 <span class="ion-ios-arrow-forward"></span>
						</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<section class="ftco-section ftco-no-pt">
		<div class="container">
			<div class="row justify-content-center mb-5 pt-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">FARMER</span>
					<h2 class="mb-4">BEST FARMER</h2>
				</div>
			</div>
			<div class="services-wrap px-4">
				<div class="row d-flex">
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="services text-center">
							<div
								class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-fence"></span>
							</div>
							<div class="text">
								<h3>Garden Care</h3>
								<p>Seeking justice in the world is a sed significant
									emotional and investment when we follow this call.</p>
							</div>
							<a href="#"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="ion-ios-arrow-round-forward"></span></a>
						</div>
					</div>
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="services text-center">
							<div
								class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-lawn-mower"></span>
							</div>
							<div class="text">
								<h3>Lawn mowing</h3>
								<p>Seeking justice in the world is a sed significant
									emotional and investment when we follow this call.</p>
							</div>
							<a href="#"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="ion-ios-arrow-round-forward"></span></a>
						</div>
					</div>
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="services text-center">
							<div
								class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-natural-resources"></span>
							</div>
							<div class="text">
								<h3>Lawn care</h3>
								<p>Seeking justice in the world is a sed significant
									emotional and investment when we follow this call.</p>
							</div>
							<a href="#"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="ion-ios-arrow-round-forward"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb bg-light">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-6 d-flex">
					<div
						class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-end"
						style="background-image: url(resources/index/images/about.jpg);">
						<a href="https://www.youtube.com/watch?v=Vu1LCN8RcjU"
							class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
							<span class="icon-play"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 pl-md-5">
					<div class="row justify-content-start py-5">
						<div class="col-md-12 heading-section ftco-animate">
							<span class="subheading">Welcome to EVERY FARM</span>
							<h2 class="mb-4">BEST SEED</h2>
							<div class="services-wrap">
								<c:choose>
									<c:when test="${empty payView}">
										<div>
											<p class="services-list">상품이 존재하지 않습니다.</p>
										</div>
									</c:when>
									<c:when test="${!empty payView}">
										<c:forEach var="payView" items="${payView}">
											<p class="services-list">${ payView.pay_Seed}</p>
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-10 text-center heading-section ftco-animate">
					<span class="subheading">PRODUCT</span>
					<h2 class="mb-4">BEST PRODUCT</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="carousel-seasonal owl-carousel ftco-owl">
						<div class="item">
							<div class="wrap">
								<c:choose>
									<c:when test="${empty proView}">
										<div>
											<p align="center">상품이 존재하지 않습니다.</p>
										</div>
									</c:when>
									<c:when test="${!empty proView}">
										<c:forEach var="proView" items="${proView}">
											<div
												class="seasonal img d-flex align-items-center justify-content-center"
												style="background-image: ${proView.p_Img};"></div>
											<div class="text text-center px-4">
												<h3>
													<a href="/productdetail?productno=${proView.p_No}">${proView.p_Title}</a>
												</h3>
											</div>
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">REVIEW</span>
					<h2>BEST REVIEW</h2>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-4 d-flex ftco-animate">
					<c:choose>
						<c:when test="${empty revView}">
							<div>
								<p align="center">상품이 존재하지 않습니다.</p>
							</div>
						</c:when>
						<c:when test="${!empty revView}">
							<c:forEach var="revView" items="${revView}">
								<div class="blog-entry justify-content-end">

									<a href="blog-single.html" class="block-20"
										style="background-image: url('resources/index/images/image_1.jpg');">
									</a>

									<div class="text p-4 float-right d-block">
										<h3 class="heading mb-0">
											<a href="/reviewDetail?rev_No=${revView.rev_No}">${revView.rev_Title}</a>
										</h3>
										<p>${revView.rev_Name}</p>
										<p>
											<a href="/reviewDetail?rev_No=${revView.rev_No}"
												class="btn btn-primary">Read more</a>
										</p>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />
  
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
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

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet" href="resources/index/css/animate.css">

<link rel="stylesheet" href="resources/index/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/index/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/index/css/magnific-popup.css">

<link rel="stylesheet" href="resources/index/css/ionicons.min.css">

<link rel="stylesheet" href="resources/index/css/flaticon.css">
<link rel="stylesheet" href="resources/index/css/icomoon.css">
<link rel="stylesheet" href="resources/index/css/style.css">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<style type="text/css">
.ribbon {
	width: 48%;
	height: 188px;
	margin-bottom: 30px;
	background-size: cover;
	text-transform: uppercase;
	color: white;
}

.ribbon:nth-child(even) {
	margin-right: 4%;
}

@media ( max-width : 500px) {
	.ribbon {
		width: 100%;
	}
	.ribbon:nth-child(even) {
		margin-right: 0%;
	}
}

.ribbon2 {
	width: 60px;
	padding: 10px 0;
	position: absolute;
	top: -6px;
	left: 25px;
	text-align: center;
	border-top-left-radius: 3px;
	background: #F47530;
}

.ribbon2:before {
	height: 0;
	width: 0;
	right: -5.5px;
	top: 0.1px;
	border-bottom: 6px solid #8D5A20;
	border-right: 6px solid transparent;
}

.ribbon2:before, .ribbon2:after {
	content: "";
	position: absolute;
}

.ribbon2:after {
	height: 0;
	width: 0;
	bottom: -29.5px;
	left: 0;
	border-left: 30px solid #F47530;
	border-right: 30px solid #F47530;
	border-bottom: 30px solid transparent;
}
</style>
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
					<h1>?????? ??????</h1>
					<p class="mb-4">??? ????????? ??????</p>
					<p>

						<a href="/productlist" class="btn btn-primary mr-md-4 py-2 px-4">?????? ????????????
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
								class="icon d-flex justify-content-center align-items-center ribbon">
								<span class="flaticon-fence"></span>
								<span class="ribbon2">1</span>
							</div>
							<div class="text">
								<h3>${farView1.p_Title}</h3>
								<p>${farView1.p_Content}</p>
							</div>
							<a href="/productdetail?productno=${farView1.p_No}"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="ion-ios-arrow-round-forward"></span></a>
						</div>
					</div>
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="services text-center">
							<div
								class="icon d-flex justify-content-center align-items-center ribbon">
								<span class="flaticon-lawn-mower"></span>
								<span class="ribbon2">2</span>
							</div>
							<div class="text">
								<h3>${farView2.p_Title}</h3>
								<p>${farView2.p_Content}</p>
							</div>
							<a href="/productdetail?productno=${farView2.p_No}"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="ion-ios-arrow-round-forward"></span></a>
						</div>
					</div>
					<div class="col-md-4 d-flex align-items-stretch">
						<div class="services text-center">
							<div
								class="icon d-flex justify-content-center align-items-center   ribbon">
								<span class="flaticon-natural-resources"></span>
								<span class="ribbon2">3</span>
							</div>
							<div class="text">
								<h3>${farView3.p_Title}</h3>
								<p>${farView3.p_Content}</p>
							</div>
							<a href="/productdetail?productno=${farView3.p_No}"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="ion-ios-arrow-round-forward"></span></a>
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
					<c:choose>
						<c:when test="${!empty revView}">
			<div class="row d-flex">
							<c:forEach var="revView" items="${revView}">
				<div class="col-md-4 d-flex ftco-animate">
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
				</div>
							</c:forEach>
			</div>
						</c:when>
					</c:choose>
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
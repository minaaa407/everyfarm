<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
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
</head>
<body>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/index/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">Contact us</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/farmer">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Contact us <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<div class="row mb-5">
							<div class="col-md-3">
								<div class="dbox w-100 text-center">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-map-marker"></span>
									</div>
									<div class="text">
										<p>
											<span>Address:</span> 서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차
											410 호
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="dbox w-100 text-center">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-phone"></span>
									</div>
									<div class="text">
										<p>
											<span>Phone:</span> <a href="tel://1234567890">010-1234-5678</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="dbox w-100 text-center">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-paper-plane"></span>
									</div>
									<div class="text">
										<p>
											<span>Email:</span> <a href="mailto:alsdk9458@gmail.com">alsdk9458@gmail.com</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="dbox w-100 text-center">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-globe"></span>
									</div>
									<div class="text">
										<p>
											<span>Website</span> <a href="/farmer">EveryFarm.com</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row no-gutters">
							<div class="col-md-7">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">Contact Us</h3>
									<div id="form-message-warning" class="mb-4"></div>
									<div id="form-message-success" class="mb-4">Your message
										was sent, thank you!</div>
									<form method="POST" id="contactForm" name="contactForm"
										class="contactForm" action="contact">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="name">Full Name</label> <input
														type="text" class="form-control" name="name" id="name"
														placeholder="Name">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="email">Email Address</label> <input
														type="email" class="form-control" name="email" id="email"
														placeholder="Email">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="subject">Title</label> <input
														type="text" class="form-control" name="subject"
														id="subject" placeholder="Title">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="#">Message</label>
													<textarea name="message" class="form-control" id="message"
														cols="30" rows="4" placeholder="Message"></textarea>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="submit" value="Send Message"
														class="btn btn-primary" onclick="send()">
													<div class="submitting"></div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="col-md-5 d-flex align-items-stretch">
								<div class="info-wrap w-100 p-5 img"
									style="background-image: url(resources/index/images/about.jpg);">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script type="text/javascript">
		function send() {
			var email = $("#email");
			var name = $("#name");
			var subject = $("#subject");
			var message = $("#message");

			if (email == "") {
				alert("이메일을 작성해주세요.");
			} else {

				$.ajax({
					type : "post", //요청 메소드 방식
					url : "/contact",
					data : {
						"email" : email,
						"name" : name,
						"subject" : subject,
						"message" : message
					},
					dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
					success : function(result) {
						if (result.error == true) {
							alert("성공");
							location.href = result.url;
						} else {
							alert("실패");
							location.href = result.url;
						}
					},
					error : function(a, b, c) {
						//통신 실패시 발생하는 함수(콜백)
						alert("a:" + a + "b:" + b + "c:" + c);
					}
				});
			}
		}
	</script>


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
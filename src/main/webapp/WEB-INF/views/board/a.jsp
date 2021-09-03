<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>QnA 문의</title>
<style type="text/css">

</style>	

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/index/css/animate.css">
<link rel="stylesheet" href="/resources/index/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/index/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/index/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/index/css/ionicons.min.css">
<link rel="stylesheet" href="/resources/index/css/flaticon.css">
<link rel="stylesheet" href="/resources/index/css/icomoon.css">
<link rel="stylesheet" href="/resources/index/css/style.css">

</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>

   	
		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
						
							<div class="row no-gutters">
								<div class="col-md-12">
									<div class="contact-wrap w-100 p-md-5 p-4">
										<h3 class="mb-4">Contact Us</h3>
										<div id="form-message-warning" class="mb-4"></div> 
					      		<div id="form-message-success" class="mb-4">
					            Your message was sent, thank you!
					      		</div>
										<form method="POST" id="contactForm" name="contactForm" class="contactForm">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="name">Full Name</label>
														<input type="text" class="form-control" name="name" id="name" placeholder="Name">
													</div>
												</div>
												<div class="col-md-6"> 
													<div class="form-group">
														<label class="label" for="email">Email Address</label>
														<input type="email" class="form-control" name="email" id="email" placeholder="Email">
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="subject">Subject</label>
														<input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="#">Message</label>
														<textarea name="message" class="form-control" id="message" cols="30" rows="4" placeholder="Message"></textarea>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<input type="submit" value="Send Message" class="btn btn-primary">
														<div class="submitting"></div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
						
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


    
    
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
    
    
</body>

</html>
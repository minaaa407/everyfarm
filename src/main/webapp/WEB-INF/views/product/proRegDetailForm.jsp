<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<title>Insert title here</title>
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

<script>
	function hideRowSub() {
		const row = document.getElementById('Subimg');
		row.style.display = 'none';
	}

	function showRowSub() {
		const row = document.getElementById('Subimg');
		row.style.display = '';
	}

	function hideRowDetail() {
		const row = document.getElementById('Imgdetail');
		row.style.display = 'none';
	}

	function showRowDetail() {
		const row = document.getElementById('Imgdetail');
		row.style.display = '';
	}
</script>

<style>
table {
	width: 52%;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	vertical-align: middle;
	margin: auto;
}

thead th {
	padding: 15px;
	font-weight: bold;
	vertical-align: top;
	color: black;
	border-bottom: 3px solid black;
}

tbody td {
	width: 200px;
	font-size: 0.9em;
	vertical-align: left;
	border-bottom: 1px solid #ccc;
}

#button {
	text-align: center;
	color: #4e9525;
}
</style>
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
	<form:form enctype="multipart/form-data" commandName="product"
		action="/proUpdate" method="post">
		<table>
			<thead>
				<tr>
					<th scope="row" colspan="4">상품 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="1" style="width: 20%;"><label>작성자</label></td>
					<td colspan="3"><input type="text" style="text-align: left;"
						name="p_Id" value="${productinfo.p_Id}" maxlength="50" required
						autofocus></td>
				</tr>
				<tr>
					<td colspan="1" style="width: 20%;"><label>제 목</label></td>
					<td colspan="3"><input type="text" name="p_Title" value="${productinfo.p_Title}"
						maxlength="50" required autofocus></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 메인 이미지 </label></td>
					<td style="text-align: left;"><input name="p_Img1" type="file"
						accept="img/*" /> <input type="hidden" name="p_Img" value=""></td>
				</tr>
				<tr>
					<td style="width: 20%;"><input type='button' value='서브사진 등록'
						onclick='showRowSub()' /></td>
					<td></td>
				</tr>
			<tbody id="Subimg" style="display: none;">
				<tr>
					<td style="width: 20%;"><label> 서브 이미지1 </label></td>
					<td style="text-align: left;"><input name="p_Subimg12"
						type="file" accept="subimg1/image/*" /> <input type="hidden"
						name="p_Subimg1" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지2 </label></td>
					<td style="text-align: left;"><input name="p_Subimg22"
						type="file" accept="subimg2/image/*" /> <input type="hidden"
						name="p_Subimg2" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지3 </label></td>
					<td style="text-align: left;"><input name="p_Subimg32"
						type="file" accept="subimg3/image/*" /> <input type="hidden"
						name="p_Subimg3" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지4 </label></td>
					<td style="text-align: left;"><input name="p_Subimg42"
						type="file" accept="subimg4/image/*" /> <input type="hidden"
						name="p_Subimg4" value="1111"><input
						type='button' value='닫기' onclick='hideRowSub()' /></td>
				</tr>
			</tbody>


			<tr>
				<td style="width: 20%;"><input type='button' value='상세사진 등록'
					onclick='showRowDetail()' /></td>
				<td></td>
			</tr>
			<tbody id="Imgdetail" style="display: none;">
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지1 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail12"
						type="file" accept="imgdetail1/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지2 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail22"
						type="file" accept="imgdetail2/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지3 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail32"
						type="file" accept="imgdetail3/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지4 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail42"
						type="file" accept="imgdetail4/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"><input type='button'
					value='닫기' onclick='hideRowDetail()' /></td>
				</tr>

			</tbody>
			<tr>
				<td colspan="1"><label>상세 내용</label></td>
				<td colspan="3"><textarea class="form-control" name="p_Content" value="${productinfo.p_Content}"
						rows="10"  required> 
            </textarea></td>
			</tr>
			<tr>
				<td colspan="1" style="width: 20%;"><label>토지 가격</label></td>
				<td colspan="3"><input type="text" name="p_Landprice" value="${productinfo.p_Landprice}"
					maxlength="50" required autofocus></td>
			</tr>
			<tr>
				<td colspan="1" style="width: 20%;"><label>유지 관리비</label></td>
				<td colspan="3"><input type="text" name="p_Manpay" value="${productinfo.p_Manpay}"
					maxlength="50" required autofocus></td>
			</tr>

			</tbody>
		</table>

		<br>
		<div id="button">
			<input type="submit" class="btn btn-dark" value="글쓰기">&nbsp;&nbsp;
			<button class="btn btn-outline-dark" onclick="back()">뒤로가기</button>
		</div>
	</form:form>
	<br>
	<br>
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
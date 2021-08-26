<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>REVIEW</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<!-- 
    <link rel="stylesheet" href="resources/review/reviewList/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/ss/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/style.css" type="text/css">
    -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/animate.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/flaticon.css">
<link rel="stylesheet" href="resources/review/reviewList/css/style.css">
<link rel="stylesheet" href="resources/review/style.css">
</head>
<body>
	<!-- Page Preloder -->

	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Shoping Cart Section Begin -->
	<section class="ftco-section">
		<div class="container">
			<div class="row flex-direction:row-reverse justify-content-center">
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text">
							
							<c:choose>
								<c:when test="${empty revList}">
									<div>
										<p align="center">게시글이 없습니다</p>
									</div>
								</c:when>
								<c:when test="${!empty revList}">
									<c:forEach var="re" items="${revList}">
										<a href="" class="block-20 img"
											style="background-image: url('resources/review/reviewList/img/test.jpg')"></a>
										<div class="meta mb-3">
											<div>
												<fmt:formatDate pattern="yyyy/MM/dd" value="${re.rev_Date}" />
											</div>
											<div>${re.rev_Name}</div>
											<div>
												<a class="meta-chat"><span class="fa fa-eye"></span>&nbsp;${re.rev_Readcount}</a>
											</div>
											<h3 class="heading">
												<a href="/reviewDetail?rev_No=${re.rev_No}">${re.rev_Title}</a>
											</h3>
											<fieldset class="rating">
												<c:if test="${re.rev_Rate eq 0.5}">
													<label class="half" for="starhalf"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 1}">
													<label class="full" for="star1"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 1.5}">
													<label class="half" for="star1half"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 2}">
													<label class="full" for="star2"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 2.5}">
													<label class="half" for="star2half"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 3}">
													<label class="full" for="star3"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 3.5}">
													<label class="half" for="star3half"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 4}">
													<label class="full" for="star4"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 4.5}">
													<label class="half" for="star4half"></label>
												</c:if>
												<c:if test="${re.rev_Rate eq 5}">
													<label class="full" for="star5"></label>
												</c:if>
											</fieldset>
										</div>

									</c:forEach>
								</c:when>
							</c:choose>
							<button type="button" id="revWrite"
								class="btn btn-outline-success"
								onclick="location.href='/reviewWrite'">글쓰기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Js Plugins 
    <script src="resources/review/reviewList/js/jquery-3.3.1.min.js"></script>
    <script src="resources/review/reviewList/js/bootstrap.min.js"></script>
    <script src="resources/review/reviewList/js/jquery.nice-select.min.js"></script>
    <script src="resources/review/reviewList/js/jquery-ui.min.js"></script>
    <script src="resources/review/reviewList/js/jquery.slicknav.js"></script>
    <script src="resources/review/reviewList/js/mixitup.min.js"></script>
    <script src="resources/review/reviewList/js/owl.carousel.min.js"></script>
    <script src="resources/review/reviewList/js/main.js"></script>
    -->
	<script src="resources/review/reviewList/js/jquery.min.js"></script>
	<script
		src="resources/review/reviewList/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/review/reviewList/js/popper.min.js"></script>
	<script src="resources/review/reviewList/js/bootstrap.min.js"></script>
	<script src="resources/review/reviewList/js/jquery.easing.1.3.js"></script>
	<script src="resources/review/reviewList/js/jquery.waypoints.min.js"></script>
	<script src="resources/review/reviewList/js/jquery.stellar.min.js"></script>
	<script src="resources/review/reviewList/js/owl.carousel.min.js"></script>
	<script
		src="resources/review/reviewList/js/jquery.magnific-popup.min.js"></script>
	<script
		src="resources/review/reviewList/js/jquery.animateNumber.min.js"></script>
	<script src="resources/review/reviewList/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/review/reviewList/js/google-map.js"></script>
	<script src="resources/review/reviewList/js/main.js"></script>
	<script type="text/javascript">
		
	</script>
	<%-- 	
	<%@include file ="/WEB-INF/views/home/header.jsp" %>
	<%@include file ="/WEB-INF/views/home/footer.jsp" %> --%>
</body>

</html>
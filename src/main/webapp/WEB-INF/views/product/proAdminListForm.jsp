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
function paging(i){
	var page = "page" + i;
	document.getElementById('selectpage').value = i;
	document.myHiddenForm.submit();
}

function search(){
	
	var select = document.getElementById('productselect').value;
	
	var text = document.getElementById('selectText').value;
	if(select == "p_Id"){
		text = "%" + text + "%";
	}else{
		text = text;
	}
	document.getElementById('where').value = select;
	document.getElementById('wherecolumn').value= text;
	
	document.myHiddenForm.submit();
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
	<br>
	<div id="rezButton">
		<button type="button" class="btn btn-dark">승인전</button>
		<button type="button" class="btn btn-dark">승인후</button>
		<button type="button" class="btn btn-dark">전체보기</button>
	</div>
	<br>

	<div class="table">
		<table>
			<thead>
				<tr>
					<th>상품번호</th>
					<th>아이디</th>
					<th>메인이미지</th>
					<th>제목</th>
					<th>토지 사이즈</th>
					<th>등록날짜</th>
					<th>상품등록</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${productlist}">
					<tr>
						<td class="content"><a
							href="/productdetail?productno=${p.p_No}">${p.p_No}</a></td>
						<td class="content">${p.p_Id}</td>
						<td class="content"><img id='product${p.p_No}'
							src="/resources/upload/product/${p.p_No}/${p.p_Img}"
							class="test1" width="150" height="auto" alt="Image ${p.p_No}">
						</td>
						<td class="content">${p.p_Title}</td>
						<td class="content">${p.p_Land}</td>
						<td class="content">${p.p_Date}</td>
						<td><input class="buttonmenuadmin" type="button"
							value="${p.p_Accept}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<div id="pageList" class="product__pagination">

		<c:if test="${pagebeen.pro eq 'true' }">
			<a id="page${pagebeen.pagestart -1}" style="cursor: pointer"
				onclick="paging(${pagebeen.pagestart -1})">이전 </a>
		</c:if>

		<c:forEach var="i" begin="${pagebeen.pagestart}"
			end="${pagebeen.pageend}" step="1">
			<a id="page${i}" style="cursor: pointer" onclick="paging(${i })">${i }</a>
		</c:forEach>
		<c:if test="${pagebeen.post eq 'true'}">
			<a id="page${pagebeen.pageend +1}" style="cursor: pointer"
				onclick="paging(${pagebeen.pageend +1})">다음 </a>
		</c:if>
	</div>
	<!-- form 해당 부분 scrip 이벤트 통해서 자동 전송 처리 -->
	<form:form commandName="pagebeen" name="myHiddenForm"
		action="/proAdminListForm" method="post">
		<input type="hidden" id="selectpage" name="selectpage" value="1">
		<input type="hidden" id="pagestart" name="pagestart"
			value="${pagebeen.pagestart}">
		<input type="hidden" id="pageend" name="pageend"
			value="${pagebeen.pageend}">
		<input type="hidden" id="endnumber" name="endnumber"
			value="${pagebeen.endnumber}">
		<input type="hidden" id="limit" name="limit" value="${pagebeen.limit}">
		<input type="hidden" id="offset" name="offset"
			value="${pagebeen.offset}">
		<input type="hidden" id="tableindex" name="tableindex"
			value="${pagebeen.tableindex}">
		<input type="hidden" id="pagingnumber" name="pagingnumber"
			value="${pagebeen.pagingnumber}">
		<input type="hidden" id="pro" name="pro" value="${pagebeen.pro}">
		<input type="hidden" id="post" name="post" value="${pagebeen.post}">
		<input type="hidden" id="where" name="where" value="${pagebeen.where}">
		<input type="hidden" id="wherecolumn" name="wherecolumn"
			value="${pagebeen.wherecolumn}">

	</form:form>
	<br />
	<div id="regSearch">
		<select name="productselect" id="productselect">
			<option value="p_No">상품번호</option>
			<option value="p_Id">아이디</option>
			<option value="p_Land">토지 사이즈</option>
		</select> <input type="text" name="selectText" id="selectText"> <input
			type="button" value="검색" onclick="search()">
	</div>
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
</body>
</html>
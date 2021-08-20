<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Every Farm</title>


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	rel="stylesheet">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>


<!-- 사이드 추가-->
<link rel="stylesheet" href="resources/user/css/sidebar-menu.css">
<script src="resources/user/js/sidebar-menu.js"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<!-- 사이드 추가-->


<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>





<link rel="stylesheet" href="resources/user/css/mypage.css">
<link rel="stylesheet" href="resources/user/css/sidemenu.css">
<script type="text/javascript" src="resources/user/js/sidemenu.js"></script>
<style type="text/css">
	#table {
	margin: auto;
}
</style>


</head>
<body>

	<div class="container">
		<div class="view-account">
			<section class="module">
				<div class="module-inner">
					<div class="side-bar">
						<div class="user-info">
							<img class="img-profile img-circle img-responsive center-block"
								src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
							<ul class="meta list list-unstyled">
								<li class="name">${member.m_Name}</li>
								<li class="email">${member.m_Id}</li>
							</ul>
						</div>
						<section>
							<div class="nav-side-menu">
								<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
									data-target="#menu-content"></i>
								<div class="menu-list">
									<ul id="menu-content" class="menu-content collapse out">
										<li class="active"><a href="#"> <i class="fa fa-user"></i>
												내 정보
										</a></li>
										<li data-toggle="collapse" data-target="#products"><a
											href="/mypage" onclick="return false;"><i class="fa fa-clock-o">
											</i> 내가 쓴 게시글 <span class="arrow"></span></a></li>
										<ul class="sub-menu collapse" id="products">
											<li><a href="/myQnA?=m_Id${member.m_Id}">QnA</a></li>
											<li><a href="/myReview?m_Id=${member.m_Id}">리뷰게시판</a></li>
											<li><a href="#">추가할공간</a></li>
											<li><a href="#">추가할공간</a></li>
										</ul>
										<li><a href="/myPayList?m_Id=${member.m_Id}"> <i class="fa fa-credit-card"></i> 결제
												내역
										</a></li>
									</ul>
								</div>
							</div>
						</section>
					</div>
					<div class="content-panel">
						<h2 class="title">내 결제내역</h2>
						<table id="table">
							<thead>
								<tr>
									<th scope="col">주문번호 &nbsp;&nbsp;&nbsp;</th>
									<th scope="col">농장주ID&nbsp;&nbsp;&nbsp;</th>
									<th scope="col">상품이미지&nbsp;&nbsp;&nbsp;</th>
									<th scope="col">상품번호&nbsp;&nbsp;&nbsp;</th>
									<th scope="col">상품명&nbsp;&nbsp;&nbsp;</th>
									<th scope="col">금액&nbsp;&nbsp;&nbsp;</th>
									<th scope="col">결제날짜&nbsp;&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${empty mypay}">
										<th align="center">결제 내역이 없습니다.</th>
								</c:when>
								<c:when test="${!empty mypay}">
								<c:forEach var="pay" items="${mypay}">
									<fmt:formatDate var="pay_Date" value="${pay.pay_Date }"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="pay_order" value="${pay.pay_Date }"
										pattern="yyyyMMddkkmmss" />
									<tr>
										<th scope="col">${pay_order}${pay.pay_Orderno}&nbsp;&nbsp;&nbsp;
										</th>
										<th scope="col">${pay.p_Id }&nbsp;&nbsp;&nbsp;</th>
										<th scope="col">${pay.p_Img }&nbsp;&nbsp;&nbsp;</th>
										<th scope="col">${pay.p_No }&nbsp;&nbsp;&nbsp;</th>
										<th scope="col">${pay.p_Title }&nbsp;&nbsp;&nbsp;</th>
										<th scope="col">${pay.pay_Totalprice }&nbsp;&nbsp;&nbsp;
										</th>
										<th scope="col"><c:out value="${pay_Date}" />&nbsp;&nbsp;&nbsp;
										</th>
									</tr>
								</c:forEach>
								</c:when>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>
	</div>
	<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
	

</body>
</html>
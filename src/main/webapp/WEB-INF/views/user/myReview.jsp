<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Checkout example for Bootstrap</title>


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


<!-- Modal -->
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
<!-- Modal -->


<link rel="stylesheet" href="resources/user/css/mypage.css">
<link rel="stylesheet" href="resources/user/css/sidemenu.css">
<script type="text/javascript" src="resources/user/js/sidemenu.js"></script>

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
								<form action="" method="post">
									<ul id="menu-content" class="menu-content collapse out">
										<li ><a href="/mypage"> <i class="fa fa-user"></i>
												내 정보
										</a></li>
										<li class="active" data-toggle="collapse" data-target="#products"><a
											href="" onclick="return false;"><i class="fa fa-clock-o">
											</i> 내가 쓴 게시글 <span class="arrow"></span></a></li>
										<ul class="sub-menu collapse" id="products">
											<li><a href="/myQnA">QnA</a></li>
											<li><a onclick='return submit2(this.form);'>리뷰게시판</a></li>
											<li><a href="#">추가할공간</a></li>
											<li><a href="#">추가할공간</a></li>
										</ul>
										<li><a href="/myPayList"> <i class="fa fa-credit-card"></i> 결제
												내역
										</a></li>
									</ul>
									</form>
								</div>
							</div>
						</section>
					</div>

					<div class="content-panel">
						<h2 class="title">나의 리뷰</h2>
						<form class="form-horizontal" method="post" >
							<fieldset class="fieldset">
								<h3 class="fieldset-title">내가 남긴 추억</h3>
								<div class="form-group avatar">
										<section class="ftco-section">
		<div class="container">
			<div class="row flex-direction:row-reverse justify-content-center">
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text">
							<table class="table">
								<thead>
									<tr class="text-center" style="background: #E6E6F2;">
										<th style="width: 10%">글번호</th>
										<th style="width: 55%">제목</th>
										<th style="width: 15%">작성자</th>
										<th style="width: 15%">조회수</th>
										<th style="width: 15%">작성시간</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty revList}">
										<tr>
											<td colspan="4"><h3 style="text-align: center;">작성된
													게시글이 없습니다.</h3></td>
										</tr>
									</c:if>
									<c:if test="${!empty revList}">
										<c:forEach var="re" items="${revList}">
											<tr>
												<td style="text-align: center;">${re.rev_No}</td>
												<td><a href="/reviewDetail?rev_No=${re.rev_No}">${re.rev_Title}</a></td>
												<td style="text-align: center;">${re.rev_Name}</td>
												<td style="text-align: center;"><span class="fa fa-eye"></span>&nbsp;${re.rev_Readcount}</td>
												<td style="text-align: center;"><fmt:formatDate pattern="yyyy/MM/dd" value="${re.rev_Date}" /></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
								</div>
							</fieldset>
							<hr>
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>


</body>
<script type="text/javascript">

function submit2(frm) { 
  frm.action='/myReview?m_Id=${member.m_Id}'; 
  frm.submit(); 
  return true; 
} 

</script>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>


</html>

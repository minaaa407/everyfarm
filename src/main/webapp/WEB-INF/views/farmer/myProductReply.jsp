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

<title>EveryFarm 농부</title>

<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
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

<style type="text/css">
td {
	text-align: center;
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
								src="resources/img/farmer.png" alt="회원 기본이미지">
							<ul class="meta list list-unstyled">
								<li class="name">${farmer.f_Name}</li>
								<li class="email">${farmer.f_Id}</li>
							</ul>
						</div>
					</div>

					<div class="content-panel">
						<h2 class="title">나의 리뷰</h2>
						<form class="form-horizontal" method="post">
							<fieldset class="fieldset">
								<h3 class="fieldset-title">내가 남긴 추억</h3>
								<div class="form-group avatar">
									<section class="ftco-section">
										<div class="container">
											<div
												class="row flex-direction:row-reverse justify-content-center">
												<div class="col-md-12  ftco-animate">
													<div class="blog-entry justify-content-end">
														<div class="text">
															<table class="table">
																<thead>
																	<tr class="text-center" style="background: #E6E6F2;">
																		<th style="width: 55%">내용</th>
																		<th style="width: 15%">작성일</th>
																	</tr>
																</thead>
																<tbody>
																	<c:if test="${empty productReply}">
																		<tr>
																			<td colspan="4"><h3 style="text-align: center;">작성된
																					댓글이 없습니다.</h3></td>
																		</tr>
																	</c:if>
																	<c:if test="${!empty productReply}">
																		<c:forEach var="re" items="${productReply}">
																			<tr>
																				<td><a href="/reviewDetail?rev_No=${re.rev_No}">${re.c_content}</a></td>
																				<td style="text-align: center;"><fmt:formatDate
																						pattern="yyyy/MM/dd" value="${re.c_date}"/></td>
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


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>


</html>

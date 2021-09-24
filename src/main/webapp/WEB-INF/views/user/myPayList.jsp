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




<!-- 테이블 -->
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<!-- 테이블 -->




<link rel="stylesheet" href="resources/user/css/mypage.css">
<link rel="stylesheet" href="resources/user/css/sidemenu.css">
<script type="text/javascript" src="resources/user/js/sidemenu.js"></script>

<style type="text/css">
#table {
	margin: auto;
}
hr{

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
								src="resources/img/user.png" alt="회원 기본이미지">
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
										<li ><a href="/mypage"> <i class="fa fa-user"></i>
												내 정보
										</a></li>
										<li data-toggle="collapse" data-target="#products"><a
											href="" onclick="return false;"><i
												class="fa fa-clock-o"> </i> 내가 쓴 게시글 <span class="arrow"></span></a></li>
										<ul class="sub-menu collapse" id="products">
											<li><a href="/myQnA">QnA</a></li>
											<li><a href="/myReview">리뷰게시판</a></li>
										</ul>
										<li class="active"><a href="/myPayList"> <i
												class="fa fa-credit-card"></i> 결제 내역
										</a></li>
									</ul>
								</div>
							</div>
						</section>
					</div>
					<div class="content-panel">
						<h2 class="title">내 결제내역</h2>
						<hr>
						<div class="table-responsive">
							<table id="table" class="table table-striped hover">
								<thead>
									<tr>
										<th scope="col">주문번호 &nbsp;&nbsp;&nbsp;</th>
										<th scope="col">평수 &nbsp;&nbsp;&nbsp;</th>
										<th scope="col">품종&nbsp;&nbsp;&nbsp;</th>
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
													<td scope="col">${pay_order}&nbsp;&nbsp;&nbsp;</td>
													<td scope="col">${pay.pay_Land}평&nbsp;&nbsp;&nbsp;</td>
													<td scope="col">${pay.pay_Seed}&nbsp;&nbsp;&nbsp;</td>
													<td scope="col">${pay.pay_Totalprice}&nbsp;&nbsp;&nbsp;</td>
													<td scope="col"><c:out value="${pay_Date}" />&nbsp;&nbsp;&nbsp;
													</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#table').dataTable({
				language : lang_kor,
				"lengthMenu": [[3, 5, 10,-1], [3, 5, 10, "전체"]],
				columnDefs: [ { "defaultContent": "-", "targets": "_all" } ]
			});
		});
		var lang_kor = {
			"decimal" : "",
			"emptyTable" : "데이터가 없습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 개)",
			"infoEmpty" : "0개",
			"infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
			"infoPostFix" : "",
			"thousands" : ",",
			"lengthMenu" : "_MENU_ 개씩 보기",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"search" : "검색 : ",
			"zeroRecords" : "검색된 데이터가 없습니다.",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			},
			"aria" : {
				"sortAscending" : " :  오름차순 정렬",
				"sortDescending" : " :  내림차순 정렬"
			}
		};
	</script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
	<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>EVERY FARM 농부 | 회원 리스트</title>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<style>
.modal {
	position: absolute;
	width: 50%;
	height: 50%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}
td, th {
	border-color: #9ea4ca;
}
body {
	background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;
}
.limiter {
	width: 100%;
	margin: 0 auto;
}
.container-table100 {
	width: 100%;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	flex-direction: column;
}
.wrap-table100 {
	width: 1170px;
}
table {
	border-spacing: 1;
	border-collapse: collapse;
	border-radius: 10px;
	overflow: hidden;
	width: 100%;
	margin: 0 auto;
	position: relative;
}
table * {
	position: relative;
}
table td, table th {
	padding-left: 8px;
}
table thead tr {
	height: 60px;
	background: #efefef
}
table tbody tr {
	height: 50px;
	background-color: rgba(255, 255, 255, 0.4);
}
table tbody tr:last-child {
	border: 0;
}
table td, table th {
	text-align: center;
}
.pagination {
	display: inline-block;
}
.pagination a {
	float: left;
	padding: 8px 16px;
	border-radius: 20%;
}
.pagination a.active {
	background-color: #7971ea;
	color: white;
}
.pagination a:hover:not (.active ) {
	background-color: silver;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
		id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler"
								data-toggle="collapse" data-target="#sidenav-collapse-main"
								aria-controls="sidenav-main" aria-expanded="false"
								aria-label="Toggle sidenav">
								<span></span> <span></span>
							</button>
						</div>
					</div>
				</div>
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/farmer/farmerSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table id="farmerTable" border="1">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:100px"/>
							<col style="width:200px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
							<col style="width:80px"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문자 ID</th>
								<th scope="col">주문번호</th>
								<th scope="col">평수</th>
								<th scope="col">작물</th>
								<th scope="col">결제금액</th>
								<th scope="col">주소</th>
								<th scope="col">결제일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty myCus}">
									<div>
										<p align="center">회원이 존재하지 않습니다.</p>
									</div>
								</c:when>
								<c:when test="${!empty myCus}">
									<c:forEach var="myCus" items="${myCus}">
										<fmt:formatDate var="pay_order" value="${pay.pay_Date }"
											pattern="yyyyMMddkkmmss" />
										<tr>
											<td class="row1">${myCus.pay_Id}</td>
											<td class="row2">${myCus.pay_Orderno}</td>
											<td class="column6">${myCus.pay_Land}</td>
											<td class="column3">${myCus.pay_Seed}</td>
											<td class="column4">${myCus.pay_Totalprice}</td>
											<td class="column5">${myCus.pay_Address}</td>
											<td class="column7"><fmt:formatDate pattern="yyyy-MM-dd"
													value="${myCus.pay_Date}" /></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
					<div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>주문자명</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>주문번호</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>품종</option>
							</select> <input type="text" name="keyword"
								value="${pageMaker.cri.keyword }"
								onKeypress="javascript:if(event.keyCode==13)">
							<button>검색</button>
						</div>
					</div>
					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">

								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="${pageMaker.startPage-1}">[이전]</a></li>
								</c:if>

								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
										href="${num}">${num}</a></li>
								</c:forEach>

								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a
										href="${pageMaker.endPage + 1 }">[다음]</a></li>
								</c:if>

							</ul>
						</div>
					</div>
					<form id="moveForm" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount }"> <input
							type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 페이징 및 검색!!!!  -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		let moveForm = $("#moveForm");
		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm
									.append("<input type='hidden' name='pay_Date' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/get");
							moveForm.submit();
						});
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/myCustomer");
			moveForm.submit();
		});
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
	<!-- 페이징 및 검색!!!!  -->
</body>
</html>
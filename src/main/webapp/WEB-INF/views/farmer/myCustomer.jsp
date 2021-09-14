<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Table V01</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/list/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/list/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/list/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/list/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/list/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/admin/list/css/util.css">
<link rel="stylesheet" type="text/css"
	href="resources/admin/list/css/main3.css">
<!--===============================================================================================-->
<!-- Argon CSS -->
<link rel="stylesheet" href="resources/admin/list/css/argon.css?v=1.2.0"
	type="text/css">

</head>
<body>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div>
					<a id="listAll" style="cursor: pointer" onclick="orderby(this.id)">전체
					</a>&nbsp;&nbsp; <a id="listBefore" style="cursor: pointer"
						onclick="orderby(this.id)">가입요청 </a>&nbsp;&nbsp; <a id="listAfter"
						style="cursor: pointer" onclick="orderby(this.id)">가입완료 </a>
				</div>
				<br>
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">주문자 ID</th>
								<th class="column2">주문번호</th>
								<th class="column3">평</th>
								<th class="column4">씨앗</th>
								<th class="column5">결제금액</th>
								<th class="column6">주소</th>
								<th class="column7">결제일</th>
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
								value="${pageMaker.cri.keyword }"onKeypress="javascript:if(event.keyCode==13)">
							<button>검색</button>
						</div>
					</div>
					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">

								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="${pageMaker.startPage-1}">◀ 이전</a></li>
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
										href="${pageMaker.endPage + 1 }">다음 ▶</a></li>
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
					<br>
					<div class="col-lg-6 col-5 text-right">
						<a href="/farmerAdd" class="btn btn-sm btn-neutral">계정 추가</a> <a
							href="#" class="btn btn-sm btn-neutral">계정 삭제</a>

					</div>
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

	<script type="text/javascript">
		function orderby(id) {

			if (id == "listAll") {
				document.getElementById('orderby').value = "f_Date";
				document.getElementById('ascdesc').value = "ASC";

			} else if (id == "listBefore") {
				document.getElementById('orderby').value = "p_Landprice";
				document.getElementById('ascdesc').value = "ASC";

			} else if (id == "listAfter") {
				document.getElementById('orderby').value = "p_Landprice";
				document.getElementById('ascdesc').value = "DESC";
			}
			document.myHiddenForm.submit();

		}
	</script>




	<!--===============================================================================================-->
	<script src="resources/admin/list/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/admin/list/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/admin/list/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/admin/list/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/admin/list/js/main.js"></script>

</body>
</html>
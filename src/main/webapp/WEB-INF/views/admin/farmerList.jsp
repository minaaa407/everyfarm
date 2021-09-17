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
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
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
	href="resources/admin/list/css/main2.css">
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
								<th class="column0"></th>
								<th class="column1">ID</th>
								<th class="column2">NAME</th>
								<th class="column3">ADDRESS</th>
								<th class="column4">TEL</th>
								<th class="column5">BIRTH</th>
								<th class="column6">RATE</th>
								<th class="column7">DATE</th>
								<th class="column8">AUTH</th>
								<th class="column9">SIGN</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty farmer}">
									<div>
										<p align="center">회원이 존재하지 않습니다.</p>
									</div>
								</c:when>
								<c:when test="${!empty farmer}">
									<c:forEach var="farmer" items="${farmer}">
										<tr>
											<td class="column0"><input type="checkbox" id="fCheck"></td>
											<td class="column1">${farmer.f_Id}</td>
											<td class="column2">${farmer.f_Name}</td>
											<td class="column3">${farmer.f_Addr}</td>
											<td class="column4">${farmer.f_Tel}</td>
											<td class="column5">${farmer.f_Birth}</td>
											<td class="column6">${farmer.f_Rate}</td>
											<td class="column7"><fmt:formatDate pattern="yyyy-MM-dd"
													value="${farmer.f_Date}" /></td>
											<td class="column8">${farmer.f_Auth}</td>
											<td class="column9">${farmer.f_Sign}</td>
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
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>ID</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>이름</option>
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
						<input onclick="location.href='/farmerAdd'"
							class="btn btn-sm btn-neutral" value="계정 추가"> <input
							class="btn btn-sm btn-neutral" onclick="fDelete()" value="계정 삭제">
					</div>
				</div>
			</div>
		</div>
	</div>

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
			moveForm.attr("action", "/farmerList");
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
		function fDelete() {
			var checkArr = [];
			var fTest = $(".column8").val();
			$("input[id='fCheck']:checked").each(function(i) {
				checkArr.push($(this).val());
			});
			if (checkArr.length == 0) {
				alert('선택된 회원이 없습니다.');
				return;
			} else {
				if (fTest == "TEST") {
					$("#myModal").modal('show');
				} else {
					alert("해당 계정을 삭제 할 권한이 없습니다.");
				}
			}
		}
	</script>
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header flex-column">
					<div class="icon-box">
						<i class="material-icons">&#xE5CD;</i>
					</div>
					<h4 class="modal-title w-100">해당 계정을 삭제하시겠습니까?</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>거래 내역이 있는 회원님의 경우 거래증명을 위해 &nbsp;&nbsp;&nbsp;수집된 개인정보를 6개월간
						보관 후 파기합니다.</p>
				</div>
				<div class="modal-footer justify-content-center">
					<input type="button" class="btn btn-secondary" data-dismiss="modal"
						value="취 소"> <input
						onclick="location.href='/farmerMyInfoDelete'" type="submit"
						class="btn btn-danger" formaction="/myInfoDelete" value="삭 제">
				</div>
			</div>
		</div>
	</div>


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
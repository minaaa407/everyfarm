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
	href="resources/admin/list/css/main.css">
<!--===============================================================================================-->
<!-- Argon CSS -->
<link rel="stylesheet" href="resources/admin/list/css/argon.css?v=1.2.0"
	type="text/css">
</head>
<body>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column0">Check</th>
								<th class="column1">ID</th>
								<th class="column2">NAME</th>
								<th class="column3">ADDRESS</th>
								<th class="column4">TEL</th>
								<th class="column5">BIRTH</th>
								<th class="column6">DATE</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty member}">
									<div>
										<p align="center">회원이 존재하지 않습니다.</p>
									</div>
								</c:when>
								<c:when test="${!empty member}">
									<c:forEach var="member" items="${member}">
										<tr>
											<td class="column0"><input type="checkbox" name="check"></td>
											<td class="column1">${member.m_Id}</td>
											<td class="column2">${member.m_Name}</td>
											<td class="column3">${member.m_Addr}</td>
											<td class="column4">${member.m_Tel}</td>
											<td class="column5">${member.m_Birth}</td>
											<td class="column6"><fmt:formatDate pattern="yyyy-MM-dd"
													value="${member.m_Date}" /></td>
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
						<a href="/userAdd" class="btn btn-sm btn-neutral">계정 추가</a>
						<button class="btn btn-sm btn-neutral" onclick="userDel();">계정
							삭제</button>
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
			moveForm.attr("action", "/userList");
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
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
					<br>
					<div class="col-lg-6 col-5 text-right">
						<a href="/farmerAdd" class="btn btn-sm btn-neutral">계정 추가</a> <a href="#"
							class="btn btn-sm btn-neutral">계정 삭제</a>
					</div>
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
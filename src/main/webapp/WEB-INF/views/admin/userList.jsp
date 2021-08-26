<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Table V01</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="resources/admin/list/images/icons/favicon.ico" />
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
</head>
<body>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
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
											<td class="column1">${member.m_Id}</td>
											<td class="column2">${member.m_Name}</td>
											<td class="column3">${member.m_Addr}</td>
											<td class="column4">${member.m_Tel}</td>
											<td class="column5">${member.m_Birth}</td>
											<td class="column6"><fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_Date}" /></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>




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
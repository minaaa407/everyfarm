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

	<!-- <script type="text/javascript">
		function userDel() {
			var check = $("input[name='check']:checked").length;
			var user = ${member.m_Addr};
			var checkArr = [];
			$("input[name='check']:checked").each(function() {
				checkArr.push($(this).val());
				console.log(check);
			});
			if (check == 0) {
				alert("선택된 회원이 없습니다.");
			} else if(user == "TEST") {
				$.ajax({
					type : "POST",
					url : "/userDelete",
					data : {"checkArr" : checkArr},
					dataType : "json",
					success : function(result) {
						if (result.error == true) {
							alert("테스트 계정을 삭제했습니다.");
						} else {
							alert("해당 계정은 삭제 할 수 없습니다.");
						}
					},
					error : function() {
						alert("서버통신 오류");
					}
				});
			}
		}
	</script> -->




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
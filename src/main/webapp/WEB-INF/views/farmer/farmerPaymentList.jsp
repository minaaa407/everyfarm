<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<title>결제내역-농장주 | EveryFarm</title>
<style>
td, th {
border-color:#9ea4ca;
}
body{
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
  width: 1500px;
  padding-bottom: 20px;
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
  border-radius:20%;
}
.pagination a.active {
  background-color: #7971ea;
  color: white;
}
.pagination a:hover:not(.active) {
background-color: silver;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1">
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
			<!-- Brand -->
			<a class="navbar-brand pt-0" href="/farmer"> <img
				src="resources/farmer/img/brand/brand.jpg" class="navbar-brand-img"
				alt="...">
			</a>
			<!-- User -->
			<ul class="nav align-items-center d-md-none">
				<li class="nav-item dropdown"><a class="nav-link nav-link-icon"
					href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="ni ni-bell-55"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right"
						aria-labelledby="navbar-default_dropdown_1">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img
								alt="Image placeholder"
								src="resources/farmer/img/theme/team-1-800x800.jpg">
							</span>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-single-02"></i> <span>My profile</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-settings-gear-65"></i> <span>Settings</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-calendar-grid-58"></i> <span>Activity</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-support-16"></i> <span>Support</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
							<span>Logout</span>
						</a>
					</div></li>
			</ul>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="./index.html"> <img
								src="resources/farmer/img/brand/blue.png">
							</a>
						</div>
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
				<!-- Form -->
				<form class="mt-4 mb-3 d-md-none">
					<div class="input-group input-group-rounded input-group-merge">
						<input type="search"
							class="form-control form-control-rounded form-control-prepended"
							placeholder="Search" aria-label="Search">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<span class="fa fa-search"></span>
							</div>
						</div>
					</div>
				</form>
				<jsp:include page="/WEB-INF/views/farmer/farmerSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>
	</div>
	<!-- Navigation -->
	<div class="col-md-11">
		<div class="limiter">
 			<div class="container-table100">
 				<div class="wrap-table100">
 					<div class="table100">
						<table border="1">
						<colgroup>
							<col style="width:50px"/>
							<col style="width:30px"/>
							<col style="width:30px"/>
							<col style="width:40px"/>
							<col style="width:80px"/>
							<col style="width:50px"/>
							<col style="width:100px"/>
							<col style="width:60px"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문자명</th>
								<th scope="col">땅평수</th>
								<th scope="col">씨앗</th>
								<th scope="col">금액</th>
								<th scope="col">배송메시지</th>
								<th scope="col">전화번호</th>
								<th scope="col">배송지</th>
								<th scope="col">주문날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="farmerpay" items="${farmerpaymentlist}">
							<script>
							</script>
							<fmt:formatDate var="pay_Date" value="${farmerpay.pay_Date }" pattern="yyyy-MM-dd"/>
								<tr>
									<td>${farmerpay.pay_Name }</td>
									<td>${farmerpay.pay_Land }평</td>
									<td>${farmerpay.pay_Seed }</td>
									<td>${farmerpay.pay_Totalprice }원</td>
									<td>${farmerpay.pay_Deliverymemo }</td>
									<td>${farmerpay.pay_Tel }</td>
									<td>${farmerpay.pay_Address }</td>
									<td><c:out value="${pay_Date }"/></td>
									<%-- <button type="button" class="btn btn-primary mr-md-2 py-1 px-2" onclick="location.href='/farmerPaymentListDetail/${pay.pay_Orderno}'">상세</button> --%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 페이징 start -->
				<div class="row">
                    	<div class="col btn-group pagination">
                        	<c:if test="${pageMaker.prev }">
                            	<a href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>[이전]</a>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                            	<c:if test="${pageNum eq pageMaker.cri.page}">
                            		<a class="active" href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageNum)}"/>'>
                                		<span id="pagingCur" style="background-color: #7971ea; color: white;">${pageNum}</span>
                                	</a>
                            	</c:if>
                                <c:if test="${pageNum ne pageMaker.cri.page}">
                                	<a href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageNum)}"/>'>
                               			<span>${pageNum}</span>
                               		</a>
                               	</c:if>
                            </c:forEach>
                            <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                            	<a href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                                	<span style="font-weight: bold;">[다음]</span>
                                </a>
                            </c:if>
                        </div>
				</div>
				<!-- 페이징 start -->
				</div>
			</div>
			</div>
			</div>
			</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

function modal() {
	alert(1);
	$.ajax({
		type: "POST",
		url: "/modal/modal_view",
		data : {
			searchCode1: $('#search-code-1').val(),
			searchCode2: $('#search-code-2').val()
		},
		beforeSend: function() {
			$.loading(true);
		},
		success: function(data) {
			$.modal(data, 'l'); // modal창 호출
		},
		complete: function() {
			$.loading(false);
		},
		error: function(e) {
			// TODO 에러 화면
		}
		
	});
}


</script>
</body>
</html>
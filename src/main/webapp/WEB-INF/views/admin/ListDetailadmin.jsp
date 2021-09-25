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
<title>EVERY FARM 관리자 | 상세내역</title>
<style>
.modal { 
	position:absolute; 
	width:50%; 
	height:50%; 
	background: rgba(0,0,0,0.8); 
	top:0; 
	left:0; 
	display:none; 
}
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
  width: 600px;
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
table tbody tr {
  height: 60px;
  background-color: rgba(255, 255, 255, 0.4);
}
table tbody tr:last-child {
  border: 0;
}
table td {
  text-align: center;
}
.hd {
background: #efefef;
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
								src="resources/admin/img/theme/team-1-800x800.jpg">
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
								src="resources/admin/img/brand/blue.png">
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
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>
		<div class="limiter">
 			<div class="container-table100">
 				<div class="wrap-table100">
					<table border="1">
							<fmt:formatDate var="pay_Date" value="${payDetail.pay_Date }" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="pay_order" value="${payDetail.pay_Date }" pattern="yyyyMMddkkmmss"/>
							<tr><td class="hd">주문번호</td><td>${pay_order}${payDetail.pay_Orderno }</td></tr>
							<tr><td class="hd">상품명</td><td>${payDetail.p_Title }</td></tr>
							<tr><td class="hd">금액</td><td>${payDetail.pay_Totalprice }원</td></tr>
							<tr><td class="hd">농부이름</td><td>${payDetail.f_Name }</td></tr>
							<tr><td class="hd">농부아이디</td><td>${payDetail.p_Id }</td></tr>
							<tr><td class="hd">땅평수</td><td>${payDetail.pay_Land }평</td></tr>
							<tr><td class="hd">씨앗</td><td>${payDetail.pay_Seed }</td></tr>
							<tr><td class="hd">주문자명</td><td>${payDetail.pay_Name }</td></tr>
							<tr><td class="hd">주문자아이디</td><td>${payDetail.pay_Id }</td></tr>
							<tr><td class="hd">배송지</td><td>${payDetail.pay_Address }</td></tr>
							<tr><td class="hd">전화번호</td><td>${payDetail.pay_Tel }</td></tr>
							<tr><td class="hd">이메일</td><td>${payDetail.pay_Email }</td></tr>
							<tr><td class="hd">배송메시지</td><td>${payDetail.pay_Deliverymemo }</td></tr>
							<tr><td class="hd">주문날짜</td><td><c:out value="${pay_Date }"/></td></tr>
					</table>
				</div>
			</div>
		</div>
</body>
</html>

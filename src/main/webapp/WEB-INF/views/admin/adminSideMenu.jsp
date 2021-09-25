<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous"> 	
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="/resources/admin/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="/resources/admin/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="/resources/admin/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<style>
body{
	padding-left:250px;
	}
	.sep{
	    border-top: 1px solid lightgray;
    margin-top: 30px;
    padding-top: 30px;
}
	</style>
</head>
<body>
<!-- Brand -->
			<a class="navbar-brand pt-0" href="/admin"> <img
				src="resources/admin/img/brand/brand.jpg" class="navbar-brand-img"
				alt="...">
			</a>
<ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="/admin">
              <i class="ni ni-tv-2 text-primary"></i> 대시보드
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/proAdminListForm">
              <i class="ni ni-box-2 text-blue"></i> 상품관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/adminPaymentList">
              <i class="ni ni-bullet-list-67 text-yellow"></i> 결제내역
            </a>
          </li>
	 <li class="nav-item">
            <a class="nav-link " href="/userList">
              <i class="ni ni-single-02 text-red"></i> 회원관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/farmerList">
              <i class="ni ni-single-02 text-orange"></i> 농부관리
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link " href="/adminQnaList">
              <i class="ni ni-bullet-list-67 text-yellow"></i> Q&A관리
            </a>
		</li>
	<li class="nav-item">
            <a class="nav-link " href="">
              <i class="ni ni-bullet-list-67 text-yellow"></i> 리뷰관리
            </a>
		</li>
          <li class="nav-item">
            <a class="nav-link" href="/adminLogout">
              <i class="ni ni-key-25 text-info"></i> 로그아웃
            </a>
          </li>
        <li class="nav-item sep"><a href="/home" class="nav-link"><span
				class="fas fa-users text-green"></span>&nbsp;&nbsp;&nbsp;&nbsp;EVERY FARM</a></li>
		<li class="nav-item"><a href="/farmerLogin" class="nav-link"><span
				class="fas fa-tractor text-green"></span>&nbsp;&nbsp;&nbsp;&nbsp;FARMER's FARM</a></li>
		<li class="nav-item"><a href="/adminLogin" class="nav-link"><span
				class="fas fa-users-cog text-green"></span>&nbsp;&nbsp;&nbsp;&nbsp;ADMIN's FARM</a></li>
	</ul>
</body>
</html>

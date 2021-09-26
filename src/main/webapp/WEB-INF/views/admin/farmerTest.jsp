<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
	<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<title>Sign Up | Bootstrap Based Admin Template - Material
	Design</title>
<!-- Favicon-->
<link rel="icon" href="resources/admin/sign/favicon.ico"
	type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">



<!-- Waves Effect Css -->
<link href="resources/admin/sign/plugins/node-waves/waves.css"
	rel="stylesheet" />

<!-- Animation Css -->
<link href="resources/admin/sign/plugins/animate-css/animate.css"
	rel="stylesheet" />

<!-- Custom Css -->
<link href="resources/admin/sign/css/style.css" rel="stylesheet">

<style>
@media (min-width: 768px){
	#sidenav-collapse-main {
	padding-left: 1rem;
    padding-right: 1rem;
    
	}
	
	#sidenav-collapse-main a.navbar-brand{
		text-align: left;
    
	}
	
	#sidenav-collapse-main a.nav-link{
		padding : 0.65rem 1.5rem;
    	margin-top: 0px;
    	margin-left: 8px;
	}
	
	
	
	.navbar-vertical.navbar-expand-md .navbar-brand{
	text-align: left;
	}
}

.ls-closed .navbar-brand {
    margin-left: 27px;
}


</style>


</head>

<body class="signup-page" style="
    background: #b0cd56">
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
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>
	
	<div class="signup-box">
		<div class="logo">
			<a href="javascript:void(0);">Farmer&nbsp;<b>TEST</b></a>
		</div>
		<div class="card">
			<div class="body">
				<form id="sign_up" action="farmerAdd" method="POST">
					<div class="msg">테스트 계정 생성</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">email</i>
						</span>
						<div class="form-line">
							<input type="email" class="form-control" name="f_Id"
								placeholder="Email Address" required>
						</div>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">person</i>
						</span>
						<div class="form-line">
							<input type="text" class="form-control" name="f_Name"
								placeholder="Name" required autofocus>
						</div>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">lock</i>
						</span>
						<div class="form-line">
							<input type="password" class="form-control" name="f_Pw"
								placeholder="Password" required>
						</div>
					</div>

					<button class="btn btn-block btn-lg bg-pink waves-effect"
						type="submit">SIGN UP</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Jquery Core Js -->
	<script src="resources/admin/sign/plugins/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core Js -->
	<script src="resources/admin/sign/plugins/bootstrap/js/bootstrap.js"></script>

	<!-- Waves Effect Plugin Js -->
	<script src="resources/admin/sign/plugins/node-waves/waves.js"></script>

	<!-- Validation Plugin Js -->
	<script
		src="resources/admin/sign/plugins/jquery-validation/jquery.validate.js"></script>

	<!-- Custom Js -->
	<script src="resources/admin/sign/js/admin.js"></script>
	<script src="resources/admin/sign/js/pages/examples/farmerSign.js"></script>
</body>

</html>
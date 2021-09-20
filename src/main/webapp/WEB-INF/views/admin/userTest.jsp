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
<title>Sign Up | Bootstrap Based Admin Template - Material
	Design</title>
<!-- Favicon-->
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">

<!-- Bootstrap Core Css -->
<link href="resources/admin/sign/plugins/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- Waves Effect Css -->
<link href="resources/admin/sign/plugins/node-waves/waves.css"
	rel="stylesheet" />

<!-- Animation Css -->
<link href="resources/admin/sign/plugins/animate-css/animate.css"
	rel="stylesheet" />

<!-- Custom Css -->
<link href="resources/admin/sign/css/style.css" rel="stylesheet">
</head>

<body class="signup-page">
	<div class="signup-box">
		<div class="logo">
			<a href="javascript:void(0);">User&nbsp;<b>TEST</b></a>
		</div>
		<div class="card">
			<div class="body">
				<form id="sign_up" action="userAdd" method="POST">
					<div class="msg">테스트 계정 생성</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">email</i>
						</span>
						<div class="form-line">
							<input type="email" class="form-control" name="m_Id"
								placeholder="Email Address" required>
						</div>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">person</i>
						</span>
						<div class="form-line">
							<input type="text" class="form-control" name="m_Name"
								placeholder="Name" required autofocus>
						</div>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">lock</i>
						</span>
						<div class="form-line">
							<input type="password" class="form-control" name="m_Pw"
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
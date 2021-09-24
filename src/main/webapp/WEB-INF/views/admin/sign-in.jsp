<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background: #b0cd56;">




<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>EVERY FARM 관리자 | 로그인</title>
    <!-- Favicon-->
    <link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="resources/admin/sign/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="resources/admin/sign/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="resources/admin/sign/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="resources/admin/sign/css/style.css" rel="stylesheet">
    
<style>

.login-page {
	background-color :#b0cd56;
}

.bg-pink {
    background-color: #358418d4 !important;
}

.login-page .login-box a {
	color: #333
}

</style>
    
</head>

<body class="login-page">
	  <br>
	  <br>
	<div class="login-form-btn-container">
						<!-- <a class="everyfarm" href="index.jsp">EVERY <span>FARM</span></a> -->
						<a class="everyfarm" href="index.jsp"><img class="logo" src="/resources/img/everyfarm.png" style="width: 400px;background: #b0cd56;" alt="메인 바로가기"></a>
	</div>
	<br>
	<br>
    <div class="login-box" style="background: #b0cd56;">
      <br>
        <div class="logo" style="background: #b0cd56;">
            <a href="javascript:void(0);">ADMIN's<b> FARM</b></a>
        </div>
          <br>
        <div class="card">
            <div class="body" >
                <form id="sign_in" action="adminLogin" method="POST">
              
                    <div class="msg">EVERY FARM | 관리자</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="a_Id" placeholder="ID" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="a_Pw" placeholder="Password" required>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                     	<div class="col-xs-4">
                     	</div>
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-pink waves-effect" type="submit">SIGN IN</button>
                        </div>
                        <div class="col-xs-4">
                     	</div>
                    </div>
                    <div class="row m-t-15 m-b--20">
                        <div class="col-xs-12 align-center">
                            <a href="/adminFindId">Forgot ID?</a>
                        </div>
                        <div class="col-xs-12 align-center">
                            <a href="/adminFindPw">Forgot Password?</a>
                        </div>
                    </div>
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
    <script src="resources/admin/sign/plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="resources/admin/sign/js/admin.js"></script>
    <script src="resources/admin/sign/js/pages/examples/sign-in.js"></script>
</body>

</html>
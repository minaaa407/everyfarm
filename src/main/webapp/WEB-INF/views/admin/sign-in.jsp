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
    
    <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous"> 
    
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

.logintitle{
   font-size: 36px;
    display: block;
    width: 100%;
    text-align: center;
    color: white;
}
</style>
    
</head>

<body class="login-page">
	  <br>
	  <br>
	<div class="login-form-btn-container" style="
    display: flex;
    align-content: center;
    justify-content: space-around;
	">
						<!-- <a class="everyfarm" href="index.jsp">EVERY <span>FARM</span></a> -->
						<a class="everyfarm" href="index.jsp"><img class="logo" src="/resources/img/everyfarm.png" style="width: 400px;background: #b0cd56;" alt="메인 바로가기"></a>
	</div>
	<br>
	<br>
    <div class="login-box" style="background: #b0cd56;">
      <br>
        <div class="logo" style="background: #b0cd56;">
            <span class="logintitle">ADMIN's<b> FARM</b></span>
        </div>
          <br>
        <div class="card">
            <div class="body" >
                <form id="sign_in" action="adminLogin" method="POST">
              		<br><br>
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
                        <div class="col-xs-6 align-center">
                            <a href="/adminFindId">아이디 찾기</a>
                        </div>
                        <div class="col-xs-6 align-center">
                            <a href="/adminFindPw">비밀번호 찾기</a>
                        </div>
                        
                        <div class="col-xs-12 align-center">
                            <hr>
                        </div>
                        
                        <div class="col-xs-6 align-center">
	                        <a href="/home" class="ftco-animate py-1 d-block"><span
										class="fas fa-users"></span>&nbsp;&nbsp;&nbsp;&nbsp;EVERY FARM</a>
                         </div>
						
						<div class="col-xs-6 align-center">
							<a href="/farmerLogin" class="ftco-animate py-1 d-block"><span
									class="fas fa-tractor"></span>&nbsp;&nbsp;&nbsp;&nbsp;FARMER's FARM</a>
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
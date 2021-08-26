<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Sign In | Bootstrap Based Admin Template - Material Design</title>
    <!-- Favicon-->
    <link rel="icon" href="resources/admin/sign/favicon.ico" type="image/x-icon">

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
</head>

<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Admin<b>Farm</b></a>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" action="adminLogin" method="POST">
                    <div class="msg">Sign in to start your session</div>
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
                    <div class="row">
                        <div class="col-xs-8 p-t-5">
                            <input type="checkbox" name="rememberme" id="rememberme" class="filled-in chk-col-pink">
                            <label for="rememberme">Remember Me</label>
                        </div>
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-pink waves-effect" type="submit">SIGN IN</button>
                        </div>
                    </div>
                    <div class="row m-t-15 m-b--20">
                        <div class="col-xs-6 align-right">
                            <a href="/adminFindId">Forgot Password?</a>
                        </div>
                        <div class="col-xs-6 align-right">
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
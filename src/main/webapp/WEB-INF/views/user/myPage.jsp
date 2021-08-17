<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Checkout example for Bootstrap</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	rel="stylesheet">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>


<!-- 사이드 추가-->
<link rel="stylesheet" href="resources/user/css/sidebar-menu.css">
<script src="resources/user/js/sidebar-menu.js"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<!-- 사이드 추가-->


<!-- Modal -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Modal -->


<link rel="stylesheet" href="resources/user/css/mypage.css">
<style type="text/css">
<!--
탈퇴 Modal -->body {
	font-family: 'Varela Round', sans-serif;
}

.modal-confirm {
	color: #636363;
	width: 400px;
	display: inline-block;
	left: 35%;
	top: 20%;
}

.modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
	text-align: center;
	font-size: 14px;
}

.modal-confirm .modal-header {
	border-bottom: none;
	position: relative;
}

.modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}

.modal-confirm .close {
	position: absolute;
	top: -5px;
	right: -2px;
}

.modal-confirm .modal-body {
	color: #999;
}

.modal-confirm .modal-footer {
	border: none;
	text-align: center;
	border-radius: 5px;
	font-size: 13px;
	padding: 10px 15px 25px;
}

.modal-confirm .modal-footer a {
	
}

.modal-confirm .icon-box {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 50%;
	z-index: 9;
	text-align: center;
	border: 3px solid #f15e5e;
}

.modal-confirm .icon-box i {
	color: #f15e5e;
	font-size: 46px;
	display: inline-block;
	margin-top: 13px;
}

.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	min-width: 120px;
	border: none;
	min-height: 40px;
	border-radius: 3px;
	margin: 0 5px;
}

.modal-confirm .btn-secondary {
	background: #c1c1c1;
}

.modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus
	{
	background: #a8a8a8;
}

.modal-confirm .btn-danger {
	color: #fff;
	background: #f15e5e;
}

.modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
	color: #fff;
	background: #ee3535;
}

.trigger-btn {
	display: inline-block;
}
<!--
탈퇴Modal--
>
</style>

</head>
<body>
	<div class="container">
		<div class="view-account">
			<section class="module">
				<div class="module-inner">
					<div class="side-bar">
						<div class="user-info">
							<img class="img-profile img-circle img-responsive center-block"
								src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
							<ul class="meta list list-unstyled">
								<li class="name">${member.m_Name}</li>
								<li class="email">${member.m_Id}</li>
							</ul>
						</div>
						<section>
							<div class="nav btn-group dropright sidebar-menu">
								<button type="button" class="btn btn-secondary dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<span class="fa fa-clock-o"> </span> 활동내역활동내역
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="#">내가 쓴 게시물</a> <a
										class="dropdown-item" href="#">My Q&A</a> <a
										class="dropdown-item" href="#">내가</a>
								</div>
							</div>
							<ul class="nav sidebar-menu">
								<li class="active"><a href="#"><span class="fa fa-user"></span>
										내 정보</a></li>
								<li><a href="#"><span class="fa fa-cog"></span>
										Settings</a></li>
								<li><a href="#"><span class="fa fa-credit-card"></span>
										결제 내역</a></li>
								<li class="nav-item open">
								<li><a href="#"><span class="fa fa-clock-o"> </span>
										활동내역</a></li>
							</ul>
						</section>
					</div>
					<div class="content-panel">
						<h2 class="title">내 정보</h2>
						<form class="form-horizontal" method="post" id="myInfo">
							<fieldset class="fieldset">
								<h3 class="fieldset-title">상세정보</h3>
								<div class="form-group avatar">
									<figure class="figure col-md-2 col-sm-3 col-xs-12">
										<img class="img-rounded img-responsive"
											src="https://bootdey.com/img/Content/avatar/avatar1.png"
											alt="">
									</figure>
									<div class="form-inline col-md-10 col-sm-9 col-xs-12">
										<input type="file" class="file-uploader pull-left">
										<button type="submit"
											class="btn btn-sm btn-default-alt pull-left">Update
											Image</button>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 col-sm-3 col-xs-12 control-label">이
										름 </label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input type="text" name="m_Name" class="form-control"
											value="${member.m_Name}">
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2 col-sm-3 col-xs-12 control-label">
										아이디</label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input type="text" id="txtId" class="form-control" name="m_Id"
											value="${member.m_Id}" readonly>
									</div>
								</div>

								<div class="form-group has-feedback">
									<label class="col-md-2 col-sm-3 col-xs-12 control-label">
										변경할 비밀번호</label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input type="password" name="m_Pw" id="m_Pw"
											class="form-control" value="" required>
									</div>
									<span id="pwdRegErr" class="invalid-feedback help-block">8글자
										이상 입력하세요.</span> <span
										class="glyphicon glyphicon-ok form-control-feedback"></span>
								</div>

								<div class="form-group has-feedback">
									<label class="col-md-2 col-sm-3 col-xs-12 control-label">비밀번호
										확인 </label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input type="password" id="txtPasswordConfirm"
											name="txtPasswordConfirm" class="form-control" value=""
											required>
									</div>
									<span class="glyphicon glyphicon-ok form-control-feedback"></span>
								</div>
							</fieldset>
							<fieldset class="fieldset">
								<h3 class="fieldset-title">Contact Info</h3>
								<div class="form-group">
									<label class="col-md-2  col-sm-3 col-xs-12 control-label">현재
										주소</label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input type="text" class="form-control"
											value="${member.m_Addr}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2  col-sm-3 col-xs-12 control-label"></label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input class="form-control" placeholder="우편번호" id="Addr1"
											name="Addr1" type="text" readonly="readonly"> <input
											type="button" onclick="execPostCode();" value="우편번호 찾기">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2  col-sm-3 col-xs-12 control-label"></label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input class="form-control" placeholder="도로명 주소" id="Addr2"
											name="Addr2" type="text" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2  col-sm-3 col-xs-12 control-label"></label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input class="form-control" placeholder="상세주소" id="Addr3"
											name="Addr3" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2  col-sm-3 col-xs-12 control-label"></label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input class="form-control" placeholder="참고항목" id="Addr4"
											name="Addr4" type="text" />
									</div>
								</div>
							</fieldset>
							<hr>
							<div class="form-group">
								<div
									class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
									<button class="btn btn-style-1 btn-primary" type="submit"
										formaction="/myInfoUpdate">내 정보 수정</button>
								</div>
								<div class="text-center">
									<!-- Button  (Modal) -->
									<a href="#myModal" class="trigger-btn" id="DeleteBtn"
										data-toggle="modal">계정 탈퇴</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>

	<!-- Modal 내용 -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header flex-column">
					<div class="icon-box">
						<i class="material-icons">&#xE5CD;</i>
					</div>
					<h4 class="modal-title w-100">정말 탈퇴하시겠습니까?</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>거래 내역이 있는 회원님의 경우 거래증명을 위해 &nbsp;&nbsp;&nbsp;수집된 개인정보를 6개월간
						보관 후 파기합니다.</p>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취 소</button>
					<button href="/myInfoDelete?m_Id=${member.m_Id}" type="submit"
						class="btn btn-danger" formaction="/myInfoDelete">탈 퇴</button>
				</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>

<script type="text/javascript">
	$('#DeleteBtn').click(function() {
		$('#m_Pw').attr('disabled', 'disabled');
		$('#txtPasswordConfirm').attr('disabled', 'disabled');
	})
	$(document)
			.ready(
					function() {

						$('#myInfo')
								.validate(
										{
											rules : {
												/*아이디할곳임 : {
													required : true,
													minlength : 3,
													remote : "Validate"
												},*/
												m_Pw : {
													required : true,
													passwordCk : true,
													minlength : 8,
													maxlength : 16
												},
												txtPasswordConfirm : {
													required : true,
													equalTo : '#m_Pw'
												}
											/*이름할곳임 : {
												required : true
											},
											이메일할곳임 : {
												required : true,
												email : true
											},
											주소할곳임 : {
												required : true,
												
											}*/
											// 1~100범위
											},
											messages : {
												/*아이디할곳임 : {
													required : "아이디를 입력하시오.",
													minlength : jQuery.format("아이디는 {0}자 이상 입력해주세요!"),
													remote : jQuery.format("입력하신 {0}는 이미존재하는 아이디입니다. ")
												},*/
												m_Pw : {
													required : "암호를 입력하시오.",
													passwordCk : "비밀번호는 영문자, 숫자, 특수문자 조합을 입력해야 합니다.",
													minlength : jQuery
															.format("암호는 {0}자 이상 입력해주세요!"),
													maxlength : jQuery
															.format("암호는 {0}자 이하 입력해주세요!")
												},
												txtPasswordConfirm : {
													required : "암호확인를 입력하시오.",
													equalTo : "암호를 다시 확인하세요"
												}
											/*이름할곳임 : {
												required : "이름을 입력하시오."
											},
											이메일할곳임 : {
												required : "이메일을 입력하시오.",
												email : "올바른 이메일을 입력하시오."
											},
											주소할곳임 : {
												 짜야해..
											}*/
											},
											submitHandler : function(frm) {
												location
														.replace('/myInfoDelete');
												form.submit();
												frm.submit(); //유효성  통과하면 가즈아~
											},
											success : function(e) {
												//
											}

										});

						$.validator
								.addMethod(
										"passwordCk",
										function(value, element) {
											return this.optional(element)
													|| /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&amp;+=]).*$/
															.test(value);
										});

					}); //end ready()
</script>
<!-- daum 도로명주소 찾기 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {

				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				document.getElementById('Addr1').value = data.zonecode;
				document.getElementById("Addr2").value = roadAddr;
				document.getElementById("Addr3").value = data.jibunAddress;

				if (roadAddr !== '') {
					document.getElementById("Addr4").value = extraRoadAddr;
				} else {
					document.getElementById("Addr4").value = '';
				}

				var guideTextBox = document.getElementById("guide");
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr
							+ ')';
					guideTextBox.style.display = 'block';

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr
							+ ')';
					guideTextBox.style.display = 'block';
				} else {
					guideTextBox.innerHTML = '';
					guideTextBox.style.display = 'none';
				}
			}
		}).open();
	}
</script>
</html>

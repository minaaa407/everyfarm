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
<!--  다음 주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
#proFile {
	margin-top: 35%;
}

#profileImg {
	width: 100%;
}

#myInfo label.error {
	color: red;
}

body {
	background: rgb(29, 185, 81)
}

.form-control:focus {
	box-shadow: none;
	border-color: #BA68C8
}

.profile-button {
	color: rgb(135, 247, 145);
	background: rgb(255, 255, 255);
	box-shadow: none;
	border:;
	border-color: rgb(135, 247, 145);
}

.profile-button:hover {
	background: rgb(29, 185, 81)
}

.profile-button:focus {
	background: #682773;
	box-shadow: none
}

.profile-button:active {
	background: #682773;
	box-shadow: none
}

.back:hover {
	color: #682773;
	cursor: pointer
}

.labels {
	font-size: 11px
}

.add-experience:hover {
	background: #BA68C8;
	color: #fff;
	cursor: pointer;
	border: solid 1px #BA68C8
}

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
탈퇴
 
Modal
 
-->
</style>

</head>
<body>

	<div class="container rounded bg-white mt-5 mb-5">
		<div class="row">
			<div class="col-md-3 border-right">
				<div id="proFile"
					class="d-flex flex-column align-items-center text-center p-3 py-5">
					<img id="profileImg" class="rounded-circle md-5"
						src="https://og-data.s3.amazonaws.com/media/artworks/half/A0880/A0880-0016.jpg">
					<span class="font-weight-bold">${member.m_Name}</span><span
						class="text-black-50">${member.m_Id}</span><span> </span>
				</div>
			</div>
			<div class="col-md-5 border-right">
				<form method="POST" id="myInfo">
					<div class="p-3 py-5">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h4 class="text-right">내 정보</h4>
						</div>
						<div class="row mt-2">
							<div class="col-md-12">
								<label class="labels">아 이 디</label><input type="text" id="txtId"
									class="form-control" name="m_Id" value="${member.m_Id}"
									readonly>
							</div>
						</div>
						<div class="row mt-3">

							<div class="col-md-12">
								<label class="labels">현재 비밀번호</label><input type="password"
									class="form-control" placeholder="" value="${member.m_Pw}"
									readonly>
							</div>
							<div class="form-group has-feedback">
								<div class="col-md-12">
									<label class="labels">변경할 비밀번호</label><input type="password"
										name="m_Pw" id="m_Pw" class="form-control" value="" required>
								</div>
								<span id="pwdRegErr" class="invalid-feedback help-block">8글자
									이상 입력하세요.</span> <span
									class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>


							<div class="form-group has-feedback">
								<div class="col-md-12">
									<label class="labels">비밀번호 확인</label><input type="password"
										id="txtPasswordConfirm" name="txtPasswordConfirm"
										class="form-control" value="" required>
								</div>
								<span class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<label class="labels">전화번호</label><input type="text"
										name="m_Tel" class="form-control" placeholder=""
										value="${member.m_Tel}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<label class="labels">주소</label><input type="text"
										name="m_Addr" class="form-control" placeholder=""
										value="${member.m_Addr}">
									<button type="button" class="btn btn-default"
										onclick="execPostCode();">
										<i class="fa fa-search"></i> 우편번호 찾기
									</button>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-6">
								<label class="labels">생일</label><input type="text"
									class="form-control" placeholder="" value="${member.m_Birth}"
									readonly>
							</div>
							<div class="col-md-6">
								<label class="labels">가입날짜</label><input class="form-control"
									value="<fmt:formatDate pattern ="yyyy/MM/dd" value="${member.m_Date}" />"
									readonly />
							</div>
						</div>
						<div class="mt-5 text-center">
							<button class="btn btn-primary profile-button" type="submit"
								formaction="/myInfoUpdate">내 정보 수정</button>
						</div>
						<div class="text-center">
							<!-- Button  (Modal) -->
							<a href="#myModal" class="trigger-btn" id="DeleteBtn"
								data-toggle="modal">계정 탈퇴</a>
						</div>
				</form>

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
								<p>거래 내역이 있는 회원님의 경우 거래증명을 위해 &nbsp;&nbsp;&nbsp;수집된 개인정보를
									6개월간 보관 후 파기합니다.</p>
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
			</div>
		</div>
		<div class="col-md-4">
			<div class="p-3 py-5">
				<div
					class="d-flex justify-content-between align-items-center experience">
					<span>내가 쓴 게시글</span>
				</div>
				<br>
				<table class="table table-bordered">
					<tr>
						<th scope="row">제목</th>
						<th scope="row">내용(N글자에서 자를것)</th>
						<th scope="row">작성날짜</th>
					</tr>
					<tr>
						<td>좋아</td>
						<td>이거는너무~~....</td>
						<td>2021-08-08</td>
						<!-- 리스트 아직. -->
					</tr>
				</table>
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
<script type="text/javascript">
	//우편번호
	function execPostCode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullRoadAddr = data.roadAddress;
						var extraRoadAddr = '';
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
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}
						console.log(data.zonecode);
						console.log(fullRoadAddr);

						$("[name=m_SubAddr]").val(data.zonecode);
						$("[name=m_MainAddr]").val(fullRoadAddr);

						document.getElementById('m_SubAddr').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('m_MainAddr').value = fullRoadAddr;
						document.getElementById('m_DetailAddr').value = data.jibunAddress;
					}
				}).open();
	}
</script>
</html>

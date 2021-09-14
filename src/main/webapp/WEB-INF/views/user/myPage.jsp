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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densitydpi =medium-dpi">

<title>Checkout example for Bootstrap</title>


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
<link rel="stylesheet" href="resources/user/css/sidemenu.css">
<script type="text/javascript" src="resources/user/js/sidemenu.js"></script>

<style type="text/css">
/* 모달 시작 */
body {
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
/* 모달 끝 */
.table__th {
	background-color: #f7f7f7;
	color: #333;
	font-weight: normal;
}

.table__th, .table__td {
	padding: 10px 20px;
	border-top: 1px solid #e7e7e7;
	border-bottom: 1px solid #e7e7e7;
}

.table__td {
	border-left: 1px solid #e7e7e7;
}

.button__span {
	font-size: 12px;
	color: #fff;
	line-height: 1;
	font-weight: normal;
	border: 1px solid #73757c;
	background-color: #73757c;
}

.id {
	color: #f0562d;
}

.edit {
	font-size: 15px;
	color: #fff;
	line-height: 1;
	font-weight: normal;
	border: 5px solid #73757c;
	background-color: #73757c;
}
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
							<div class="nav-side-menu">
								<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
									data-target="#menu-content"></i>
								<div class=" menu-list">
									<ul id="menu-content" class="menu-content collapse out">
										<li class="active"><a href="#"> <i class="fa fa-user"></i>
												내 정보
										</a></li>
										<li data-toggle="collapse" data-target="#products"><a
											href="#" onclick="return false;"><i class="fa fa-clock-o">
											</i> 내가 쓴 게시글 <span class="arrow"></span></a></li>
										<ul class="sub-menu collapse" id="products">
											<li><a
												onclick="location.href='/myQnA'"
												type="submit">QnA</a></li>
											<li><a href="/myReview">리뷰게시판</a></li>
											<li><a href="#">추가할공간</a></li>
											<li><a href="#">추가할공간</a></li>
										</ul>
										<li><a href="/myPayList"> <i
												class="fa fa-credit-card"></i> 결제 내역
										</a></li>
									</ul>
								</div>
							</div>
						</section>
					</div>

					<div class="content-panel">
						<h2 class="title">내 정보</h2>
						<form class="form-horizontal" method="post" id="myInfo">
							<fieldset class="fieldset">
								<h3 class="fieldset-title">상세정보</h3>
								<table>
									<colgroup>
										<col width="20%">
										<col width="100%">
									</colgroup>
									<tbody>
										<tr>
											<th class="table__th">아이디</th>
											<td class="table__td id">${member.m_Id}<input
												type="hidden" name="m_Id" id="m_Id" value="${member.m_Id}"></td>
										</tr>
									</tbody>
									<tbody id="pwd_hide">
										<tr>
											<th class="table__th">비밀번호</th>
											<td class="table__td"><strong>●●●●●●●●●●</strong> <a
												style="display: inline;" href="#" class=""
												id="pwd_modify_on"><span class="edit">변경</span></a></td>
										</tr>
									</tbody>
									<tbody id="pwd_modify_on1" style="display: none;">
										<tr>
											<th class="table__th">비밀번호</th>
											<td class="table__td">
												<div class="col-md-10 col-sm-9 col-xs-12">
													<input type="password" name="m_Pw" id="m_Pw"
														placeholder="신규 비밀번호" class="form-control" required>
													<span class="glyphicon glyphicon-ok form-control-feedback"></span>
												</div>
												<div class="form-group has-feedback">
													<label class="col-md-2 col-sm-3 col-xs-12 control-label">
													</label>
													<div class="col-md-10 col-sm-9 col-xs-12">
														<input type="password" id="txtPasswordConfirm"
															placeholder="비밀번호 확인" name="txtPasswordConfirm"
															class="form-control" value="" required>
													</div>
													<span class="glyphicon glyphicon-ok form-control-feedback"></span>
												</div>
												<button class="btn btn-style-1" type="submit"
													formaction="/myInfoPwdrUpdate">
													<span class="edit">변경</span>
												</button> <a href="#" id="pwd_modify_off"><span class="edit">취소</span></a>
											</td>
										</tr>
									</tbody>

									<tbody id="Name_hide">
										<tr>
											<th class="table__th">이름</th>
											<td class="table__td">${member.m_Name}<a
												style="display: inline;" class="" id="Name_modify_on"> <span
													class="edit">수정</span>
											</a>
											</td>
										</tr>
									</tbody>

									<tbody id="Name_modify_on1" style="display: none;">
										<tr>
											<th class="table__th">이름</th>
											<td class="table__td"><input type="text" name="m_Name"
												id="m_Name" placeholder="변경할 이름" class="form-control"
												style="display: inline;" required>
												<button class="btn btn-style-1" type="submit"
													formaction="/myInfoNameUpdate">
													<span class="edit">변경</span>
												</button> <a href="#" id="Name_modify_off"> <span class="edit">취소</span></a></td>
										</tr>
									</tbody>

									<tbody>
										<tr>
											<th class="table__th">연락처</th>
											<td class="table__td">${member.m_Tel}<input
												type="hidden" name="m_Tel" id="m_Tel"
												value="${member.m_Tel}"></td>
										</tr>
									</tbody>

									<tbody id="Addr_hide">
										<tr>
											<th class="table__th">주소</th>
											<td class="table__td">${member.m_Addr}<a
												style="display: inline;" href="#" class=""
												id="Addr_modify_on"><span class="edit">변경</span></a> <input
												type="hidden" name="m_Addr" id="m_Addr"
												value="${member.m_Addr}"></td>
										</tr>
									</tbody>

									<tbody id="Addr_modify_on1" style="display: none;">
										<tr>
											<th class="table__th">주소</th>
											<td class="table__td">
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
														<input class="form-control" placeholder="도로명 주소"
															id="Addr2" name="Addr2" type="text" readonly="readonly" />
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
												<button class="btn btn-style-1" type="submit"
													formaction="/myInfoAddrUpdate">
													<span class="edit">변경</span>
												</button> <a href="#" id="Addr_modify_off"><span class="edit">취소</span></a>
											</td>
										</tr>
									<tbody>
										<tr>
											<th class="table__th">가입 날짜</th>
											<td class="table__td"><fmt:formatDate
													value="${member.m_Date}" pattern="yyyy/MM/dd" />
										</tr>
									</tbody>
								</table>
								<div class="text-center">
									<!-- Button  (Modal) -->
									<a href="#myModal" class="trigger-btn" id="DeleteBtn"
										data-toggle="modal">계정 탈퇴</a>
								</div>
							</fieldset>
							<hr>
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
					<button onclick="location.href='/myInfoDelete?m_Id=${member.m_Id}'"
						type="submit" class="btn btn-danger" formaction="/myInfoDelete">탈
						퇴</button>
				</div>
			</div>
		</div>
	</div>
</body>


<script type="text/javascript">
	Name_modify_on

	$(function() {
		$("#Name_modify_on").click(function() {
			if ($("#Name_modify_on").css("display") == "inline") {
				$('#Name_modify_on1').hide();
				$('#Name_hide').hide();
			}
			if ($("#Name_modify_on1").css("display") == "none") {
				$('#Name_modify_on1').show();
			}
		});
	});
	$(function() {
		$("#Name_modify_off").click(function() {
			if ($("#Name_modify_on").css("display") == "inline") {
				$('#Name_modify_on').hide();
				$('#Name_modify_on1').hide();
			}
			if ($("#Name_modify_on1").css("display") == "none") {
				$('#Name_hide').show();
				$('#Name_modify_on').show();
			}
		});
	});

	$(function() {
		$("#pwd_modify_on").click(function() {
			if ($("#pwd_modify_on").css("display") == "inline") {
				$("#Addr_modify_on1").hide();
				$('#pwd_modify_on').hide();
				$('#pwd_hide').hide();
				$("#Name_modify_on1").hide();
			}
			if ($("#pwd_modify_on1").css("display") == "none") {
				$('#pwd_modify_on1').show();

			}
		});
	});

	$(function() {
		$("#pwd_modify_off").click(function() {
			if ($("#pwd_modify_on").css("display") == "none") {
				$('#pwd_modify_on').show();
				$('#Addr_modify_on1').hide();
			}
			if ($("#pwd_modify_on1").css("display") !== "none") {
				$('#pwd_modify_on1').hide();
				$('#pwd_hide').show();
			}
		});
	});

	$(function() {
		$("#Addr_modify_on").click(function() {
			if ($("#Addr_modify_on").css("display") == "inline") {
				$('#Addr_modify_on').hide();
				$('#pwd_modify_on1').hide();
				$('#Name_modify_on1').hide();
				$('#Addr_hide').hide();
			}
			if ($("#Addr_modify_on1").css("display") == "none") {
				$('#Addr_modify_on1').show();

			}
		});
	});

	$(function() {
		$("#Addr_modify_off").click(function() {
			if ($("#Addr_modify_on").css("display") == "none") {
				$('#Addr_modify_on').show();
				$('#pwd_modify_on').show();
				$('#Addr_hide').show();
			}
			if ($("#Addr_modify_on1").css("display") !== "none") {
				$('#Addr_modify_on1').hide();
			}
		});
	});
</script>

<script type="text/javascript">
	
	
</script>


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
												frm.submit(); //유효성  통과하면 submit();
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

					}); // document ready 끝
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

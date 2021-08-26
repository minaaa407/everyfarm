<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="resources/sign/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet"
	href="resources/sign/vendor/nouislider/nouislider.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/sign/css/style.css">


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

<style type="text/css">
label.error {
	position: inherit;
}

.error {
	color: red;
}
</style>

</head>
<body>

	<div class="main">

		<div class="container">
			<div class="signup-content">
				<div class="signup-img">
					<img src="resources/sign/images/join.jpg" alt="">
					<div class="signup-img-content">
						<h2>Register now</h2>
						<p>while seats are available !</p>
					</div>
				</div>
				<div class="signup-form">
					<form:form method="POST" commandName="memberBean"
						class="register-form" action="/sign" onsubmit="return check()">
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="m_Id" class="required">아이디</label> <input
										type="text" name="m_Id" id="m_Id" placeholder="ID"
										required="required" /> <span class="id_input_re_1">사용가능한
										아이디입니다.</span> <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
									<button id="mailNum" class="mailNum" onclick="mail()">인증번호
										발급</button>
									<div class="invalid-feedback" id="invalid-id">필수 입력사항입니다.
									</div>
								</div>
								<!-- Email 인증번호 -->
								<div class="form-input">
									<label for="e_Num" class="required">인증번호</label> <input
										type="text" name="e_Num" id="e_Num" required />
								</div>
								<button type="button" class="w-100 btn btn-primary btn-lg"
									style="padding-left: 9px; font-size: 13px"
									onclick="mailCheck()" id="mailNum2">인증번호 확인</button>
								<div class="form-input has-feedback">
									<label>비밀번호</label>
									<div>
										<input type="password" name="m_Pw" id="m_Pw"
											class="form-control" placeholder="PASSWORD" required />
									</div>
									<div class="invalid-feedback" id="invalid-pw">필수 입력사항입니다.
									</div>
									<div class="invalid-feedback" id="invalid-pw2">8~20자의 영문
										소문자와 특수문자로 비밀번호를 설정할 수 있습니다.</div>
									<span class="glyphicon glyphicon-ok form-control-feedback"></span>
								</div>

								<div class="form-input has-feedback">
									<div>
										<label>비밀번호 확인</label> <input type="password"
											class="form-control" id="txtPasswordConfirm"
											name="txtPasswordConfirm" placeholder="PASSWORD" required />
									</div>
									<div class="invalid-feedback">필수 입력사항입니다.</div>
									<span class="glyphicon glyphicon-ok form-control-feedback"></span>
								</div>
								<div class="col-12">
									<div class="alert alert-success" id="alert-success">비밀번호가
										일치합니다.</div>
								</div>
								<div class="col-12">
									<div class="alert alert-danger" id="alert-danger">비밀번호가
										일치하지 않습니다.</div>
								</div>
								<div class="form-input">
									<label for="m_Name" class="required">이름</label> <input
										type="text" name="m_Name" id="m_Name" placeholder="NAME"
										required="required" />
									<div class="invalid-feedback" id="invalid-name">필수
										입력사항입니다.</div>
									<div class="invalid-feedback" id="invalid-name2">이름은 한글과
										영문만 사용할 수 있습니다.</div>
								</div>
								<div class="form-input">
									<label for="m_Birth" class="required">생년월일</label> <input
										type="date" name="m_Birth" required="required" />
									<div class="invalid-feedback" id="invalid-birth">필수
										입력사항입니다.</div>
								</div>
								<div class="form-input">
									<label for="m_Tel" class="required">휴대전화</label> <input
										type="tel" name="m_Tel" id="m_Tel"
										placeholder="ex)01012345678" required="required" />
									<div class="invalid-feedback" id="invalid-phone">숫자만
										입력해주세요.</div>
								</div>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="우편번호" id="Addr1"
									name="Addr1" type="text" readonly="readonly" />
								<button onclick="execPostCode();">우편번호 검색</button>
								<input class="form-control" placeholder="도로명 주소" id="Addr2"
									name="Addr2" type="text" readonly="readonly" /> <input
									class="form-control" placeholder="상세주소" id="Addr3" name="Addr3"
									type="text" /> <input class="form-control" placeholder="참고항목"
									id="Addr4" name="Addr4" type="text" />
								<div class="invalid-feedback">필수 입력사항입니다.</div>
							</div>
						</div>
						<div class="form-submit">
							<input type="submit" value="가입하기" class="submit" id="submit"
								name="submit" /> <input type="button" value="취소" class="submit"
								id="reset" name="reset" />
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {
			$('#mailNum2').hide();
		});
		function mail() {
			var mail = $("#m_Id").val();
			var name = $("#m_Name").val();
			if (mail === "") {
				alert("이메일을 입력해주세요.");
				return;
			} else if (!mail.includes('@')) {
				alert("올바르지 않은 이메일 형식입니다.");
				return;
			} else {
				$
						.ajax({
							type : "POST", //요청 메소드 방식
							url : "/checkMail",
							data : {
								"m_Id" : mail
							},
							dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
							success : function(result) {
								if (result.error == true) {
									alert('입력하신 이메일로 회원가입 인증번호를 발송했습니다. \n 인증번호가 오지 않으면 입력하신 이메일을 다시 확인해주세요.');
									$('#mailNum').hide();
									$('#mailNum2').show();
								} else if (result.error == false) {
									alert('인증번호 발송에 실패했습니다.');
								}
							},
							error : function(request, status, error) {
								alert("code = " + request.status
										+ " message = " + request.responseText
										+ " error = " + error);
								//통신 실패시 발생하는 함수(콜백)
							}
						});
			}
		}

		$('#mailNum2').click(
				function() {
					var mailCheck = $("#e_Num").val();
					var id = $('#m_Id').val();
					if (mailCheck === "") {
						alert("이메일 인증번호를 입력해주세요.");
						return;
					}
					$.ajax({
						type : "POST", //요청 메소드 방식
						url : "/mailNum",
						data : {
							"mailCheck" : mailCheck,
							"id" : id
						},
						dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
						success : function(result) {

							if (result.error == true) {
								alert('이메일 인증이 완료되었습니다.');
								$("#m_Id").attr("disabled", true);
								$("#mailCheck").attr("disabled", true);
							} else if (result.error == false) {
								alert('이메일 인증번호가 일치하지 않습니다.');
							}
						},
						error : function(request, status, error) {
							alert("code = " + request.status + " message = "
									+ request.responseText + " error = "
									+ error);
							//통신 실패시 발생하는 함수(콜백)
						}
					});
				});
		$(function() {
			$("#invalid-pw2").hide();

			$("input").keyup(function() {
				var match = /^[a-z0-9.;\-]{8,20}$/;
				var pwd = $("#m_Pw").val();
				if (pwd != "") {
					if (!match.test(pwd)) {
						$("#invalid-pw2").show();
					} else {
						$("#invalid-pw2").hide();
					}
				} else {
					$("#invalid-pw2").hide();
				}
			});

			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#m_Pw").val();
				var pwd2 = $("#m_pw2").val();
				if (pwd1 != "" && pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
				if (pwd1 == "" && pwd2 == "") {
					$("#alert-success").hide();
					$("#alert-danger").hide();
				}
			});
		});
		function check() {
			var id = $("#m_Id").val();
			if (id == "") {
				$('#invalid-id').show();
				return false;
			} else if (!$("#mailNum").attr("disabled")) {
				alert('이메일 인증을 완료해주세요.');
				return false;
			}
			var match = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/;
			var name = $("#m_Name").val();
			if (name != "") {
				if (!match.test(name)) {
					alert('이름을 올바르게 입력해주세요.');
					return false;
				}
			}
		}

		$(function() {
			$("#invalid-name2").hide();

			$("input").keyup(function() {
				var match = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/;
				var name = $("#m_Name").val();
				if (name != "") {
					if (!match.test(name)) {
						$("#invalid-name2").show();
					} else {
						$("#invalid-name2").hide();
					}
				} else if (name == "") {
					$("#invalid-name2").hide();
				}
			});
		});

		$(function() {
			$("#invalid-phone").hide();

			$("input").keyup(function() {
				var match = /[^0-9]/g;
				var tel = $("#m_Tel").val();
				if (tel != "") {
					if (match.test(tel)) {
						$("#invalid-phone").show();
					} else {
						$("#invalid-phone").hide();
					}
				} else if (tel == "") {
					$("#invalid-phone").hide();
				}

			});
		});
	</script>


	<!-- JS -->
	<script src="resources/sign/vendor/jquery/jquery.min.js"></script>
	<script src="resources/sign/vendor/nouislider/nouislider.min.js"></script>
	<script src="resources/sign/vendor/wnumb/wNumb.js"></script>
	<!-- <script
		src="resources/sign/vendor/jquery-validation/dist/jquery.validate.min.js"></script> -->

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
	<script src="http://code.jquery.com/jquery-1.3.2.min.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>


	<script
		src="resources/sign/vendor/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="resources/sign/js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
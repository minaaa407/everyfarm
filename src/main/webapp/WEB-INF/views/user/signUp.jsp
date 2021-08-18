<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<form method="POST" class="register-form" action="/sign">
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="m_Id" class="required">아이디</label> <input
										type="text" name="m_Id" id="m_Id" placeholder="ID"
										required="required" /> <span class="id_input_re_1">사용
										가능한 아이디입니다.</span> <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
								</div>
								<button class="mailNum" onclick="mail()">인증번호발급</button>
								<!-- Email 인증번호 -->
								<div class="form-input">
									<label for="e_Num" class="required">인증번호</label> <input
										type="text" id="e_Num" required="required" />
								</div>
								<div class="form-input">
									<label for="m_Pw" class="required">비밀번호</label> <input
										type="password" name="m_Pw" id="m_Pw" placeholder="PASSWORD"
										required="required" />
								</div>
								<div class="form-input">
									<label for="m_Pw2" class="required">비밀번호 확인</label> <input
										type="password" id="m_Pw2" placeholder="PASSWORD"
										required="required" />
								</div>
								<div class="form-input">
									<label for="m_Name" class="required">이름</label> <input
										type="text" name="m_Name" id="m_Name" placeholder="NAME"
										required="required" />
								</div>
								<div class="form-input">
									<label for="m_Birth" class="required">생년월일</label> <input
										type="date" name="m_Birth" required="required" />
								</div>
								<div class="form-input">
									<label for="m_Tel" class="required">휴대전화</label> <input
										type="tel" name="m_Tel" id="m_Tel"
										placeholder="ex)01012345678" required="required" />
								</div>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="우편번호" id="Addr1"
									name="Addr1" type="text" readonly="readonly"> <input
									type="button" onclick="execPostCode();" value="우편번호 찾기">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="도로명 주소" id="Addr2"
									name="Addr2" type="text" readonly="readonly" />
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="상세주소" id="Addr3"
									name="Addr3" type="text" />
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="참고항목" id="Addr4"
									name="Addr4" type="text" />
							</div>
						</div>
						<div class="form-submit">
							<input type="submit" value="가입하기" class="submit" id="submit"
								name="submit" /> <input type="button" value="취소" class="submit"
								id="reset" name="reset" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var empJ = /\s/g;
		var pwJ = /^[A-Za-z0-9]{4,12}$/;
		var nameJ = /^[가-힣]{2,6}$/;
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		
		

		$(document).ready(function() {
			// 취소
			$("#reset").on("click", function() {
				location.href = "/home";
			})

			$("#submit").on("click", function() {
				if ($("#m_Id").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#m_Id").focus();
					return false;
				}
				if ($("#m_Pw").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#m_Pw").focus();
					return false;
				}
				if ($("#m_Pw2").val() == "") {
					alert("비밀번호를 확인해주세요.");
					$("#m_Pw2").focus();
					return false;
				}
				if ($("#m_Pw").val() != $("#m_Pw2").val()) {
					alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
					$("#m_Pw").focus();
					return false;
				}
				if ($("#m_Pw").val().length < 8) {
					alert("비밀번호는 8자 이상으로 설정해야 합니다.");
					$("#m_Pw").val("").focus();
					return false;
				}
			});
		})

		function mail() {
			var mail = {
				m_Id : $("#m_Id").val()
			}

			$.ajax({
				type : "post", //요청 메소드 방식
				url : "/checkMail",
				data : mail,
				dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
				success : function(result) {
					if (result.error == true) {
						alert("성공");
					} else {
						alert("실패");
					}
				},
				error : function(a, b, c) {
					//통신 실패시 발생하는 함수(콜백)
					alert("a:" + a + "b:" + b + "c:" + c);
				}
			});
		}

		//아이디 중복검사
		$('#m_Id').on("propertychange change keyup paste input", function() {

			var memberId = {
				m_Id : $("#m_Id").val()
			}

			$.ajax({
				type : "post",
				url : "/checkId",
				data : memberId,
				success : function(result) {
					if (result != 'fail') {
						$('.id_input_re_1').css("display", "inline-block");
						$('.id_input_re_2').css("display", "none");
					} else {
						$('.id_input_re_2').css("display", "inline-block");
						$('.id_input_re_1').css("display", "none");
					}
				},
				error : function(a, b, c) {
					//통신 실패시 발생하는 함수(콜백)
					alert("a:" + a + "b:" + b + "c:" + c);
				}
			});

		});

		$(function() {
			var getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);

			//패스워드 입력값 검증.
			$('#m_Pw')
					.on(
							'keyup',
							function() {
								if (!getPwCheck.test($("#m_Pw").val())
										|| $("#m_Pw").val().length < 8) {
									$('#m_Pw')
											.html(
													'<b style="font-size:14px;color:red;">특수문자 포함 8자이상 입력해주세요.</b>');
								} else {
									$('#m_Pw').html('');
								}
							});

			//패스워드 확인란 입력값 검증.
			$('#m_Pw2')
					.on(
							'keyup',
							function() {
								if ($("#m_Pw").val() != $("#m_Pw2").val()) {
									$('#m_Pw2')
											.html(
													'<b style="font-size:14px;color:red;">비밀번호가 일치하지 않습니다.</b>');
								} else {
									$('#m_Pw2').html('');
								}
							});
		});
	</script>


	<!-- JS -->
	<script src="resources/sign/vendor/jquery/jquery.min.js"></script>
	<script src="resources/sign/vendor/nouislider/nouislider.min.js"></script>
	<script src="resources/sign/vendor/wnumb/wNumb.js"></script>
	<script
		src="resources/sign/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="resources/sign/vendor/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="resources/sign/js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
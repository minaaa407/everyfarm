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
<link rel="stylesheet" href="resources/sign/vendor/nouislider/nouislider.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/sign/css/style.css">


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<!-- daum 도로명주소 찾기 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						class="register-form" action="sign">
						<form:errors path="*" cssClass="error" element="div" />
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="m_Id" class="required">아이디</label>
									<form:input type="text" name="m_Id" id="m_Id" path="m_Id"
										placeholder="ID" required="required" />
									<form:errors path="m_Id" cssClass="error" />
									<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
										class="id_input_re_2">아이디가 이미 존재합니다.</span>
								</div>
								<button id="checkId" class="mailNum" onclick="mail()">인증번호발급</button>
								<!-- Email 인증번호 -->
								<div class="form-input">
									<label for="e_Num" class="required">인증번호</label> <input
										type="text" name="e_Num" id="e_Num" required="required" />
								</div>
								<div class="alert alert-success" id="alert-success-email">인증번호가
									일치합니다.</div>
								<div class="alert alert-danger" id="alert-danger-email">인증번호가
									일치하지 않습니다.</div>
								<div class="form-input">
									<label for="m_Pw" class="required">비밀번호</label>
									<form:input type="password" path="m_Pw" name="m_Pw" id="m_Pw"
										placeholder="PASSWORD" required="required" />
									<form:errors path="m_Pw" cssClass="error" />
								</div>
								<div class="form-input">
									<label for="m_Pw2" class="required">비밀번호 확인</label>
									<form:input type="password" path="m_Pw" id="m_Pw2"
										placeholder="PASSWORD" required="required" />
									<form:errors path="m_Pw" cssClass="error" />
								</div>
								<div class="form-input">
									<label for="m_Name" class="required">이름</label>
									<form:input type="text" path="m_Name" name="m_Name" id="m_Name"
										placeholder="NAME" required="required" />
									<form:errors path="m_Name" cssClass="error" />
								</div>
								<div class="form-input">
									<label for="m_Birth" class="required">생년월일</label>
									<form:input type="date" path="m_Birth" name="m_Birth"
										required="required" />
									<form:errors path="m_Birth" cssClass="error" />
								</div>
								<div class="form-input">
									<label for="m_Tel" class="required">휴대전화</label>
									<form:input type="tel" path="m_Tel" name="m_Tel" id="m_Tel"
										placeholder="ex)01012345678" required="required" />
									<form:errors path="m_Tel" cssClass="error" />
								</div>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="우편번호" id="Addr1"
									name="Addr1" type="text" readonly="readonly" />
								<button onclick="execPostCode();">우편번호 검색</button>
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
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#submit").on("click", function(e) {
			e.preventDefault();
			var id = $("#m_Id").val();
			var name = $("#m_Name']").val();
			var pw = $("#m_Pw").val();

			console.log("회원가입_아이디: " + id);
			console.log("회원가입_이름: " + name);
			console.log("회원가입_비밀번호: " + pw);

			//아이디,비밀번호 유효성 검사
			if (id == null || id == "") {
				alert("아이디를 입력해주세요");
				return false;
			}
			if (pw == null || pw == "") {
				alert("비밀번호를 입력해주세요");
				return false;
			}
			if (name == null || name == "") {
				alert("이름을 입력해주세요");
				return false;
			}
			if ("#checkId" == false) {
				alert("인증번호를 확인해주세요");
				return false;
			}
			$("form").submit();
		});

		function mail() {
			var mail = {
				m_Id : $("#m_Id").val()
			}
			var code = "";
			var checkBox = $(".e_Num");

			if (mail == "") {
				alert("이메일을 작성해주세요.");
			} else {

				$.ajax({
					type : "post", //요청 메소드 방식
					url : "/checkMail",
					data : mail,
					dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
					success : function(result) {
						if (result.error == true) {
							checkBox.attr("disabled", false);
							checkBox.val('');
							$("#alert-success-email").hide();
							$("#alert-danger-email").hide();
							code = result;
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
		}
		
		$(".e_Num").keyup(function() {
			var inputCode = $(".e_Num").val();
			if (inputCode != "" || code != "") {
				if (inputCode == code) {
					$("#alert-success-email").show();
					$("#alert-danger-email").hide();
					$(".e_Num").attr("disabled",true); //인증번호 입력 멈춤
					checkCode = true;
				} else {
					$("#alert-success-email").hide();
					$("#alert-danger-email").show();
					checkCode = false;
				}
			}
		});

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

			//비밀번호 확인
			$('#m_Pw2').blur(function() {
				if ($('#m_Pw').val() != $('#m_Pw2').val()) {
					if ($('#m_Pw2').val() != '') {
						alert("비밀번호가 일치하지 않습니다.");
						$('#m_Pw2').val('');
						$('#m_Pw2').focus();
					}
				}
			})
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
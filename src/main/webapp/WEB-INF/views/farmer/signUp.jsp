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
					<form:form method="POST" commandName="farmerBean"
						class="register-form" action="/farmerSign"
						enctype="multipart/form-data" onsubmit="return check()">
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="f_Id" class="required">아이디</label> <input
										type="email" name="f_Id" id="f_Id" placeholder="ID"
										onKeyup="this.value=this.value.replace(/[^a-zA-Z0-9!@#$%^&*()_-+=~?:;`|/.]/gi,'');"
										required="required" /> <span class="id_input_re_1">사용가능한
										아이디입니다.</span><span class="id_input_re_2">아이디가 이미 존재합니다.</span> <br>
									<button id="mailNum" class="mailNum" onclick="mail()">인증번호
										발급</button>
								</div>
								<!-- Email 인증번호 -->
								<div class="form-input">
									<label for="e_Num" class="required">인증번호</label> <input
										type="text" name="e_Num" id="e_Num"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										maxlength="6" required /> <br>
									<button type="button" class="w-100 btn btn-primary btn-lg"
										style="padding-left: 9px; font-size: 13px"
										onclick="mailCheck()" id="mailNum2">인증번호 확인</button>
								</div>
								<div class="form-input has-feedback">
									<label for="f_Pw" class="required">비밀번호</label>
									<div>
										<input type="password" name="f_Pw" id="f_Pw"
											class="form-control" placeholder="PASSWORD"
											pattern="^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{8,20}$"
											maxlength="20" required />
									</div>
								</div>

								<div class="form-input has-feedback">
									<div>
										<label for="f_Pw2" class="required">비밀번호 확인</label> <input
											type="password" class="form-control" id="f_Pw2" name="f_Pw2"
											placeholder="PASSWORD" required />
									</div>
									<div class="alert alert-success" id="alert-success">비밀번호가
										일치합니다.</div>
									<div class="alert alert-danger" id="alert-danger">비밀번호가
										일치하지 않습니다.</div>
								</div>
								<div class="form-input">
									<label for="f_Name" class="required">이름</label> <input
										type="text" name="f_Name" id="f_Name" placeholder="NAME"
										onKeyup="this.value=this.value.replace(/[^a-zA-Zㄱ-힣0-9]/gi,'');"
										required="required" />
								</div>
								<div class="form-input">
									<label for="f_Birth" class="required">생년월일</label> input <input
										type="date" name="m_Birth" id="txtDate" required="required" />
								</div>
								<div class="form-input">
									<label for="f_Tel" class="required">휴대전화</label> <input
										type="tel" name="f_Tel" id="f_Tel"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										maxlength="11" placeholder="ex)01012345678"
										required="required" />
								</div>
							</div>
							<div class="form-group">
								<label for="f_Addr" class="required">주소</label> <input
									class="form-control" placeholder="우편번호" id="Addr1" name="Addr1"
									type="text" readonly="readonly" />
								<button onclick="sample6_execDaumPostcode()">우편번호 검색</button>
								<input class="form-control" placeholder="도로명 주소" id="Addr2"
									name="Addr2" type="text" readonly="readonly" /> <input
									class="form-control" placeholder="상세주소" id="Addr3" name="Addr3"
									type="text"
									onKeyup="this.value=this.value.replace(/[^a-zA-Zㄱ-힣0-9()]/gi,'');"
									required="required" /> <input class="form-control"
									placeholder="참고항목" id="Addr4" name="Addr4" type="text" />
							</div>
							<div class="form-input">
								<label for="f_Auth" class="required">농업경영체 증명서</label> <input
									type="file" name="f_Auth" />
							</div>
						</div>
						<div class="form-submit">
							<input type="submit" value="가입하기" class="submit" id="submit"
								name="submit" /> <a href="/farmerLogin"><input
								type="button" value="취소" class="submit" id="reset" name="reset" /></a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- daum 도로명주소 찾기 api -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("Addr4").value = extraAddr;

							} else {
								document.getElementById("Addr4").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('Addr1').value = data.zonecode;
							document.getElementById("Addr2").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("Addr3").focus();
						}
					}).open();
		}

		//아이디 중복검사
		$('#f_Id').on("propertychange change keyup paste input", function() {

			var memberId = {
				f_Id : $("#f_Id").val()
			}

			$.ajax({
				type : "post",
				url : "/farmerCheckId",
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
			$('#mailNum2').hide();
		});

		function mail() {
			var mail = {
				f_Id : $("#f_Id").val()
			}
			var code = "";
			var num = {
				e_Num : $("#e_Num").val()
			}

			if (mail == "") {
				alert("이메일을 작성해주세요.");
			} else {

				$.ajax({
					type : "post", //요청 메소드 방식
					url : "/farmerCheckMail",
					data : {
						"m_Id" : mail,
						"e_Num" : num
					},
					dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
					success : function(result) {
						if (result.error == true) {
							checkBox.attr("disabled", false);
							checkBox.val('');
							$("#alert-success-email").hide();
							$("#alert-danger-email").hide();
							code = result;
							alert("작성하신 메일로 인증번호를 전송했습니다. 확인해주세요.");
							$('#e_Num').hide();
							$('#mailNum2').show();
						} else {
							alert("인증번호 전송에 실패하였습니다. 작성하신 이메일을 다시 확인 바랍니다.");
						}
					},
					error : function(a, b, c) {
						//통신 실패시 발생하는 함수(콜백)
						alert("a:" + a + "b:" + b + "c:" + c);
					}
				});

			}
		}

		$('#mailNum2').click(
				function() {
					var mailCheck = {
						e_Num : $("#e_Num").val()
					}
					var id = {
						f_Id : $("#f_Id").val()
					}
					if (mailCheck === "") {
						alert("이메일 인증번호를 입력해주세요.");
						return;
					}
					$.ajax({
						type : "POST", //요청 메소드 방식
						url : "/farmerMailNum",
						data : {
							"e_Num" : mailCheck,
							"f_Id" : id
						},
						dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
						success : function(result) {

							if (result.error == true) {
								alert('이메일 인증이 완료되었습니다.');
								$("#f_Id").attr("disabled", true);
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
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#f_Pw").val();
				var pwd2 = $("#f_Pw2").val();
				if (pwd1 != "" || pwd2 != "") {
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
			});
		});

		$(function() {
			var dtToday = new Date();

			var month = dtToday.getMonth() + 1;
			var day = dtToday.getDate();
			var year = dtToday.getFullYear();

			if (month < 10)
				month = '0' + month.toString();
			if (day < 10)
				day = '0' + day.toString();

			var maxDate = year + '-' + month + '-' + day;
			$('#txtDate').attr('max', maxDate);
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
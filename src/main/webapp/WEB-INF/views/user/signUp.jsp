<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

/* 
var empJ = /\s/g; 
var idJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
var pwJ = /^[A-Za-z0-9]{4,12}$/; 
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
var birthJ = false;
var address = $('#M_DetailAddr');
$(document).ready(function() {
	var address = $('#M_DetailAddr');
	$("#M_Id").blur(function () {
		if($('#M_Id').val()==''){
		$('#CheckId').text('아이디를 입력하세요.');
		$('#CheckId').css('color','red');
		}else if(idJ.test($('#M_Id').val())!=true){
			$('#CheckId').text('이메일 양식을 맞춰주세요.'); 
			$('#CheckId').css('color', 'red');
		}else if($('#M_Id').val()!=''){
			var M_Id = $('#M_Id').val();
			$.ajax({
				async : true,
				type : 'POST',
				data : M_Id,
				url : '/CheckId',
				dateType: 'json', 
				contentType: "application/json; charset=UTF-8", 
				success : function(data){
					if(data.cnt > 0){ 
						$('#CheckId').text('중복된 아이디 입니다.'); 
						$('#CheckId').css('color', 'red'); 
						$("#usercheck").attr("disabled", true); 
					}else{ 
						if(idJ.test(M_Id)){ 
							$('#CheckId').text('사용가능한 아이디 입니다.');
							$('#CheckId').css('color', 'blue'); 
							$("#usercheck").attr("disabled", false); 
						} else if(M_Id==''){ 
							$('#CheckId').text('아이디를 입력해주세요.'); 
							$('#CheckId').css('color', 'red'); 
							$("#usercheck").attr("disabled", true);
						} else{ 
							$('#CheckId').text("아이디는 이메일 형식입니다."); 
							$('#CheckId').css('color', 'red'); 
							$("#usercheck").attr("disabled", true);
						}
					}
				}
			});
		}
	});
	
	$('form').on('submit',function(){ var inval_Arr = new Array(8).fill(false);
	if (idJ.test($('#M_Id').val())) {
		inval_Arr[0] = true;
		} else { 
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
		}
		// 비밀번호가 같은 경우 && 비밀번호 정규식 
		if (($('#M_Pw').val() == ($('#M_Pw2').val())) && pwJ.test($('#M_Pw').val())) {
			inval_Arr[1] = true;
		} else { 
			inval_Arr[1] = false; 
			alert('비밀번호를 확인하세요.');
			return false; 
		} 
		//이름 정규식 
		if (nameJ.test($('#M_Name').val())) {
			inval_Arr[2] = true;
		} else { 
			inval_Arr[2] = false;
			alert('이름을 확인하세요.'); 
			return false;
		} 
		// 생년월일 정규식 
		if (birthJ) { 
			console.log(birthJ);
			inval_Arr[3] = true;
		} else { 
			inval_Arr[3] = false; 
			alert('생년월일을 확인하세요.'); 
			return false;
		} 
		// 이메일 정규식 
 		if (mailJ.test($('#mem_email').val())){ 
			console.log(phoneJ.test($('#mem_email').val())); 
			inval_Arr[4] = true;
		} else { 
		inval_Arr[4] = false; 
			alert('이메일을 확인하세요.');
			return false; 
		}  
		// 휴대폰번호 정규식 
		if (phoneJ.test($('#M_Tel').val())) { 
			console.log(phoneJ.test($('#M_Tel').val())); 
			inval_Arr[5] = true;
		} else { 
			inval_Arr[5] = false; 
			alert('휴대폰 번호를 확인하세요.'); 
			return false; 
		} 
		//주소확인 
		if(address.val() == ''){ 
			inval_Arr[7] = false; 
			alert('주소를 확인하세요.'); 
			return false; 
		}else inval_Arr[7] = true; 
		//전체 유효성 검사 
		var validAll = true; 
		for(var i = 0; i < inval_Arr.length; i++){ 
			if(inval_Arr[i] == false){ 
				validAll = false; 
			} 
		} if(validAll == true){ 
		// 유효성 모두 통과
			alert('EVERY FARM 회원이 되어주셔 감사합니다.'); 
		} else{ 
			alert('정보를 다시 확인하세요.') 
		} 
	}); 
	$('#M_Id').blur(function() { 
		if (idJ.test($('#M_Id').val())) { 
			console.log('true'); 
			$('#CheckId').text(''); 
		} else { 
			console.log('false'); 
			$('#CheckId').text('이메일 양식을 확인해주세요.'); 
			$('#CheckId').css('color', 'red'); 
		} 
	}); 
	$('#M_Pw').blur(function() { 
		if (pwJ.test($('#M_Pw').val())) { 
			console.log('true');
			$('#CheckPw').text('');
		} else { 
			console.log('false');
			$('#CheckPw').text('4~12자의 숫자 , 문자로만 사용 가능합니다.'); 
			$('#CheckPw').css('color', 'red'); 
		} 
	}); 
	//1~2 패스워드 일치 확인 
	$('#M_Pw2').blur(function() { 
		if ($('#M_Pw').val() != $(this).val()) { 
			$('#CheckPw2').text('비밀번호가 일치하지 않습니다.'); 
			$('#CheckPw2').css('color', 'red'); 
		} else { 
			$('#CheckPw2').text(''); 
		} 
	}); 
	//이름에 특수문자 들어가지 않도록 설정 
	$("#M_Name").blur(function() { 
		if (nameJ.test($(this).val())) { 
			console.log(nameJ.test($(this).val())); 
			$("#CheckName").text(''); 
		} else { 
			$('#CheckName').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)'); 
			$('#CheckName').css('color', 'red'); 
		} 
	}); 
 	$("#M_Email").blur(function() { 
		if (mailJ.test($(this).val())) { 
			$("#CheckEmail").text(''); 
		} else { 
			$('#CheckEmail').text('이메일 양식을 확인해주세요.'); 
			$('#CheckEmail').css('color', 'red'); 
		} 
	});
	// 생일 유효성 검사 
	var birthJ = false; 
	// 생년월일 birthJ 유효성 검사 
	$('#M_Birth').blur(function(){ 
		var dateStr = $(this).val(); 
		var year = Number(dateStr.substr(0,4)); 
		// 입력한 값의 0~4자리까지 (연) 
		var month = Number(dateStr.substr(4,2)); 
		// 입력한 값의 4번째 자리부터 2자리 숫자 (월) 
		var day = Number(dateStr.substr(6,2)); 
		// 입력한 값 6번째 자리부터 2자리 숫자 (일) 
		var today = new Date(); 
		// 날짜 변수 선언 
		var yearNow = today.getFullYear(); 
		// 올해 연도 가져옴 
		if (dateStr.length <=8) { 
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다. 
			if (year > yearNow || year < 1900 ){ 
				$('#CheckBirth').text('생년월일을 확인해주세요'); 
				$('#CheckBirth').css('color', 'red'); 
			} else if (month < 1 || month > 12) { 
				$('#CheckBirth').text('생년월일을 확인해주세요 '); 
				$('#CheckBirth').css('color', 'red'); 
			}else if (day < 1 || day > 31) { 
				$('#CheckBirth').text('생년월일을 확인해주세요 '); 
				$('#CheckBirth').css('color', 'red'); 
			}else if ((month==4 || month==6 || month==9 || month==11) && day==31) { 
				$('#CheckBirth').text('생년월일을 확인해주세요 '); 
				$('#CheckBirth').css('color', 'red'); 
			}else if (month == 2) { 
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)); 
				if (day>29 || (day==29 && !isleap)) { 
					$('#CheckBirth').text('생년월일을 확인해주세요 '); 
					$('#CheckBirth').css('color', 'red'); 
				}else{ 
					$('#CheckBirth').text(''); 
					birthJ = true; 
				} 
			}else{ 
				$('#CheckBirth').text(''); 
				birthJ = true; 
			}
	//end of if 
		}else{ 
			//1.입력된 생년월일이 8자 초과할때 : auth:false 
			$('#CheckBirth').text('생년월일을 확인해주세요 '); 
			$('#CheckBirth').css('color', 'red'); 
		} 
	}); 
	//End of method /* 
	// 휴대전화 
	$('#M_Tel').blur(function(){ 
		if(phoneJ.test($(this).val())){ 
			console.log(nameJ.test($(this).val())); 
			$("#CheckTel").text(''); 
		} else { 
			$('#CheckTel').text('휴대폰번호를 확인해주세요 '); 
			$('#CheckTel').css('color', 'red'); 
		} 
	}); 
}); 

 */
//우편번호
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           var fullRoadAddr = data.roadAddress;
           var extraRoadAddr = '';

           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=M_SubAddr]").val(data.zonecode);
           $("[name=M_MainAddr]").val(fullRoadAddr);
           
           document.getElementById('M_SubAddr').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('M_MainAddr').value = fullRoadAddr;
           document.getElementById('M_DetailAddr').value = data.jibunAddress;
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
					<img src="resources/sign/images/form-img.jpg" alt="">
					<div class="signup-img-content">
						<h2>Register now</h2>
						<p>while seats are available !</p>
					</div>
				</div>
				<div class="signup-form">
					<form:form method="POST" class="register-form" id="usercheck" name="member"
						action="/sign" modelAttribute="member">
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="M_Id" class="required">아이디</label> <input
										type="text" name="M_Id" id="M_Id" placeholder="ID" required="required"/>
									<div class="check" id="CheckId" />
								</div>
								<!-- Email 인증번호 -->
								<!-- 
								<div class="form-input">
                                    <label for="phone_number" class="required">인증번호</label>
                                    <input type="text" name="phone_number" id="phone_number"onclick="_hide();" />
                                </div>
                                 -->
								<div class="form-input">
									<label for="M_Pw" class="required">비밀번호</label> <input
										type="password" name="M_Pw" id="M_Pw" placeholder="PASSWORD" required="required"/>
									<div class="check" id="CheckPw" />
								</div>
<!-- 								<div class="form-input">
									<label for="M_Pw2" class="required">비밀번호 확인</label> <input
										type="password" name="M_Pw2" id="M_Pw2" placeholder="PASSWORD" required="required"/>
									<div class="check" id="CheckPw2" />
								</div> -->
								<div class="form-input">
									<label for="M_Name" class="required">이름</label> <input
										type="text" name="M_Name" id="M_Name" placeholder="NAME" required="required"/>
									<div class="check" id="CheckName" />
								</div>
								<div class="form-input">
									<label for="M_Birth" class="required">생년월일</label> <input
										type="date" name="M_Birth" id="currentDate"/>
									<div class="check" id="CheckBirth" />
								</div>
								<div class="form-input">
									<label for="M_Tel" class="required">휴대전화</label> <input
										type="tel" name="M_Tel" id="M_Tel"
										placeholder="ex)01012345678" required="required"/>
									<div class="check" id="CheckTel" />
								</div>
							</div>
<!-- 							<div class="form-group">
								<input class="form-control" style="width: 40%; display: inline;"
									placeholder="우편번호" name="M_Addr" id="M_SubAddr" type="text"
									readonly="readonly" >
								<button type="button" class="btn btn-default"
									onclick="execPostCode();">
									<i class="fa fa-search"></i> 우편번호 찾기
								</button>
							</div>
							<div class="form-group">
								<input class="form-control" style="top: 5px;"
									placeholder="도로명 주소" name="M_Addr" id="M_MainAddr" type="text"
									readonly="readonly" />
							</div> -->
							<div class="form-group">
								<input class="form-control" placeholder="상세주소" name="M_Addr"
									id="M_DetailAddr" type="text" />
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

	<script>document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);</script>

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
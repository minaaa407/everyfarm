<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/findPw",
				type : "POST",
				dataType: "json", 
				data : {
					a_Name : $("#a_Name").val(),
					a_Id : $("#a_Id").val(),
					a_Email : $("#a_Email").val()
				},
				success : function(result) {
					if(result.error == false){
					alert("해당아이디는 존재하지 않습니다.");
					
						location.href=result.url;
					}else{
						alert("임시 비밀번호를 메일로 전송했습니다.");
						location.href=result.url;
					}
				},
			})
		});
	})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 456.3px;">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>이름</label>
					<input class="w3-input" type="text" id="a_Name" name="a_Name" placeholder="이름" required>
				</p>
				<p>
					<label>아이디</label>
					<input class="w3-input" type="text" id="a_Id" name="a_Id" placeholder="아이디" required>
				</p>
				<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="a_Eamil" name="a_Eamil" placeholder="이메일" required>
				</p>
				<p class="w3-center">
					<button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">로그인으로</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>결제 완료 | EveryFarm</title>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
			<div>
				<h2><span>결제 완료</span></h2>
				<hr>
				<div>
					<span>장바구니</span>
					<span>&gt;</span>
					<span>주문서</span>
					<span>&gt;</span>
					<span style="font-weight:bold">결제 완료</span>
				</div>
			</div>
			
			<hr>
			<br>
			<br>
			
			<div>
				<h1 style="text-align:center">결제가 성공적으로 완료되었습니다.</h1>
			</div>
			
			<div style="text-align:center">   
				<input type=button value="조회하기" onclick="location.href='/WEB-INF/views/member/login.jsp'">
				<input type=button value="구매내역" onclick="location.href='/WEB-INF/views/member/mypage.jsp'">
				<input type=button value="홈" onclick="location.href='index.jsp'"/>
			</div>
			<button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
			<br>
			<br>
			<input type=hidden id="pay_Name" name="pay_Name" value="${payname }" />
			<input type=hidden id="pay_Email" name="pay_Email" value="${payemail }" />
			<input type=hidden id="pay_Totalprice" name="pay_Totalprice" value="${totalprice }" />
			<input type=hidden id="pay_Orderno" name="pay_Orderno" value="${pay_Orderno }" />
			<hr>
			
			
			
<%-- <footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer>	 --%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(function(){
	/* 	alert($("#pay_Name").val());
		alert($("#pay_Email").val());
		alert($("#pay_Totalprice").val());
		alert($("#pay_Orderno").val()); */
		$.ajax({
			url : "/sendmessage2",
			type : "POST",
			dataType: "json", 
			data : {
				pay_Name : '권형준',
				pay_Email : 'rjarorgudwns@naver.com',
				pay_Totalprice : '1000',
				pay_Orderno : '40'
			},
			success : function(result) {
				if(result.error == false){
				alert("해당아이디는 존재하지 않습니다.");
				
					location.href=result.url;
				}else{
					alert("인증번호를 메일로 전송했습니다.");
					location.href="/paycomplete2";
				}
			},
			error : function(a, b, c) {
				//통신 실패시 발생하는 함수(콜백)
				alert("a:" + a + "b:" + b + "c:" + c);
			}
		})
})

</script>
	
</body>
</html>
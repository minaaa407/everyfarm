<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
.ulStep {
    list-style:none;
    margin:0;
    padding:0;
    display: inline-block;
}

.order1 {
    border : 0;
    float: left;
    border: 1px solid #E6E6E6;
    width:250px;
    height:60px;
    text-align: center; 
    display: inline-block;
    margin: 0;
    padding: 15px;
    
	
}
.orderStep {
	margin-bottom: 50px;
	margin-top: 50px;
	text-align: center;
}
.select {
font-weight:bold;
background-color:#E6E6E6;
}
</style>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
			<div class="orderStep">
			        <ul class="ulStep">
						<li class="order1">01 - 장바구니</li>
			            <li class="order1">02 - 주문서작성</li>
			            <li class="order1 select">03 - 결제완료</li>
			        </ul>
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
			<br>
			<br>
			<c:forEach var="pay" items="${paymentlist}">
			<input type=hidden id="pay_Name" name="pay_Name" value="${pay.pay_Name }" />
			<input type=hidden id="pay_Email" name="pay_Email" value="${pay.pay_Email }" />
			<input type=hidden id="pay_Totalprice" name="pay_Totalprice" value="${pay.pay_Totalprice }" />
			<input type=hidden id="pay_Orderno" name="pay_Orderno" value="${pay.pay_Orderno }" />
			</c:forEach>
			<hr>
			
			
			
<%-- <footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer>	 --%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(function(){
		/* console.log("payname = " + ${payname });
		console.log("payemail = " + ${payemail });
		console.log("totalprice = " + ${totalprice });
		console.log("pay_Orderno = " + ${pay_Orderno }); */
		console.log("payname = " + $("#pay_Name").val());
		console.log("pay_Email = " + $("#pay_Email").val());
		console.log("pay_Totalprice = " + $("#pay_Totalprice").val());
		console.log("pay_Orderno = " + $("#pay_Orderno").val()); 
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
				console.log("메일전송실패.");
				
				}else{
					console.log("메일전송완료.");
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
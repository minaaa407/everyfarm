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
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
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
	margin-top: 100px;
	text-align: center;
}
.select {
font-weight:bold;
background-color:#E6E6E6;
}
.complete{
margin-bottom: 100px;
	margin-top: 50px;
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
			
			<div class="complete">
				<div>
					<h1 style="text-align:center">
						<span>결제가 성공적으로</span>
						<br>
						<span>완료되었습니다.</span>
					</h1>
				</div>
				
				<div style="text-align:center">   
					<input type=button class="btn btn-primary" value="결제내역" onclick="location.href='/myPayList'">
					<input type=button class="btn btn-primary" value="홈" onclick="location.href='/home'"/>
				</div>
			</div>
			<c:forEach var="pay" items="${paymentlist}">
			<input type=hidden id="pay_Name" name="pay_Name" value="${pay.pay_Name }" />
			<input type=hidden id="pay_Email" name="pay_Email" value="${pay.pay_Email }" />
			<input type=hidden id="pay_Totalprice" name="pay_Totalprice" value="${pay.pay_Totalprice }" />
			<input type=hidden id="pay_Orderno" name="pay_Orderno" value="${pay.pay_Orderno }" />
			</c:forEach>
			<jsp:include page="/WEB-INF/views/home/footer.jsp" />
			
</body>
</html>
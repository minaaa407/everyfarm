<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			
			<br>
			<br>
			<hr>
			
			
			
<%-- <footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer>	 --%>
</body>
</html>
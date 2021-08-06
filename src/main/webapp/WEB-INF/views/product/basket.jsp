<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
</head>
<body>

<h2>장바구니</h2>

<table border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
 			<th>아이디</th> 
 			<th>이미지</th>
 			<th>상품 정보(대종류, 상품 이름, 땅 사이즈, 땅 가격, 유지비)</th>
 			<th>옵션(씨앗 종류-소종류, 씨앗 갯수, 씨앗 가격)</th>
 			<th>총 가격</th>
			<th>배송비</th>
			
<!-- 		<th bgcolor="orange" width="200">상품 번호</th>
			<th bgcolor="orange" width="200">대종류</th>
			<th bgcolor="orange" width="200">상품 이름</th>
			<th bgcolor="orange" width="200">땅 사이즈</th>
			<th bgcolor="orange" width="200">땅 가격</th>
			<th bgcolor="orange" width="200">씨앗</th>
			<th bgcolor="orange" width="200">씨앗 가격</th>
			<th bgcolor="orange" width="200">씨앗 갯수</th>
			<th bgcolor="orange" width="200">유지비</th>
			<th bgcolor="orange" width="200">총 가격</th>
			<th bgcolor="orange" width="200">배송비</th> 			-->
		</tr>
	</thead>
	
	<c:forEach items="${basketList }" var="b">
		<tr>
			<td>${b.b_Id }</td>
<%-- 		<td>${b.b_Pno }</td>
 			<td align="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
 			<td>${b.b_Main}</td>
			<td>${b.b_Mainimg}</td>
			<td>${b.b_Title}</td>
			<td>${b.b_Land}</td>
			<td>${b.b_Landprice}</td>
			<td>${b.b_Sub}</td>
			<td>${b.b_Seedprice}</td>     
			<td>${b.b_Seedcount}</td>
      		<td>${b.b_Manpay}</td>        
			<td>${b.b_Totalprice}</td>
 			<td>${b.b_Delivery}</td>     --%>  
	
		</tr>
	</c:forEach>
</table>

<br>
<br>

<hr>

<table border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>상품 금액</th>
			<th>- 할인금액</th>
			<th>+ 배송비</th>
			<th>결제 예정 금액</th>
		</tr>
	</thead>
	
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
</table>



</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역-관리자 | EveryFarm</title>
</head>
<body>

<h2><span>결제내역</span></h2>

<hr>
 				 <table>
					<thead>
						<tr>
							<th scope="col">주문자명&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">주문번호 &nbsp;&nbsp;&nbsp;</th>
							<th scope="col">농장주ID&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">상품이미지&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">상품번호&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">상품명&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">금액&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">결제날짜&nbsp;&nbsp;&nbsp; </th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="pay" items="${paymentlist}">
							<fmt:formatDate var="pay_Date" value="${pay.pay_Date }" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="pay_order" value="${pay.pay_Date }" pattern="yyyyMMddkkmmss"/>
						<tr>
							<th scope="col">${pay.m_Name }&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">${pay_order}${pay.pay_Orderno }&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">${pay.p_Id }&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">${pay.p_Img }&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">${pay.p_No }&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">${pay.p_Title }외 2건&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">${pay.pay_Totalprice }&nbsp;&nbsp;&nbsp; </th>
							<th scope="col"><c:out value="${pay_Date }"/>&nbsp;&nbsp;&nbsp; </th>
							<th scope="col"><button type="button" onclick="location.href='/adminPayListDelete/${pay.pay_Orderno }'">삭제</button>&nbsp;</th>
							<th scope="col"><button type="button" onclick="location.href='/adminPaymentListDetail/${pay.pay_Orderno}'">상세</button></th>
						</tr>
						</c:forEach>
						</tbody>
				</table>
 			
</body>
</html>
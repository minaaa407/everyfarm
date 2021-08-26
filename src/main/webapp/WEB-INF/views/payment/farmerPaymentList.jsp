<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<meta charset="UTF-8">
<title>결제내역-농장주 | EveryFarm</title>
<style>
@media (min-width: 1200px) {
.container1 {
    max-width: 1600px;
	}
}
.container1 {
	font-size:20px;
   	text-align: center;
   	position: absolute;
    top: 50%;
    left: 5%;
    width: 100%;
    height: 100%;
    margin: auto;
	}
.container {
	font-size:20px;
   	text-align: center;
	}
</style>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
<h2><span>결제내역</span></h2>

<hr>
 			<div class="container">
				<div class="col ">
					<div class="row form-control">
						<span class="col-md-1">주문자명</span>
						<span class="col-md-2">주문번호</span>
						<span class="col-md-1">상품번호</span>
						<span class="col-md-1">상품명</span>
						<span class="col-md-1">씨앗</span>
						<span class="col-md-1">땅평수</span>
						<span class="col-md-1">금액</span>
						<span class="col-md-2">날짜</span>
						<span class="col-md-2">비고</span>
					</div>
						<c:forEach var="pay" items="${paymentlist}">
						<fmt:formatDate var="pay_Date" value="${pay.pay_Date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="pay_order" value="${pay.pay_Date }" pattern="yyyyMMddkkmmss"/>
						<div class="row form-control">
							<span class="col-md-1">${pay.m_Name }</span>
							<span class="col-md-2">${pay_order}${pay.pay_Orderno }</span>
							<span class="col-md-1">${pay.p_No }</span>
							<span class="col-md-1">${pay.p_Title }</span>
							<span class="col-md-1">${pay.pay_Seed }</span>
							<span class="col-md-1">${pay.pay_Land }</span>
							<span class="col-md-1">${pay.pay_Totalprice }</span>
							<span class="col-md-2"><c:out value="${pay_Date }"/></span>
							<span class="col-md-2">
								<button type="button" class="btn btn-primary mr-md-2 py-1 px-2" onclick="location.href='/farmerPayListDelete/${pay.pay_Orderno }'">삭제</button>
								<button type="button" class="btn btn-primary mr-md-2 py-1 px-2" onclick="location.href='/farmerPaymentListDetail/${pay.pay_Orderno}'">상세</button>
							</span>
						</div>
						</c:forEach>
				</div>
			</div>
<%-- <footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer> --%>
</body>
</html>
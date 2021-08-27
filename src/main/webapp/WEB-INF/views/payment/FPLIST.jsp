<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>농부 : Every Farm</title>
<style>
html, body {
  height: 100%;
  width: 100%;
}

.container {
  min-height: 100%;
  display: flex;
  flex-direction: column;
  align-items: stretch;
}

footer {
  flex: 0;
}
</style>
</head>
<body>
<!-- Navigation -->
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/farmer/farmerSideMenu.jsp"></jsp:include>
				<!-- Divider -->
				<hr class="my-3">
				<!-- Heading -->
				<h6 class="navbar-heading text-muted">Documentation</h6>
				<!-- Navigation -->
				<ul class="navbar-nav mb-md-3">
					<li class="nav-item"><a class="nav-link"
						href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
							<i class="ni ni-spaceship"></i> Getting started
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html">
							<i class="ni ni-palette"></i> Foundation
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html">
							<i class="ni ni-ui-04"></i> Components
					</a></li>
				</ul>
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
			<jsp:include page="/WEB-INF/views/home/footer.jsp" />
			<!--   Core   -->
<script src="resources/farmer/js/plugins/jquery/dist/jquery.min.js"></script>
<script
	src="resources/farmer/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<script src="resources/farmer/js/plugins/chart.js/dist/Chart.min.js"></script>
<script
	src="resources/farmer/js/plugins/chart.js/dist/Chart.extension.js"></script>
<!--   Argon JS   -->
<script src="resources/farmer/js/argon-dashboard.min.js?v=1.1.2"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
</body>
</html>
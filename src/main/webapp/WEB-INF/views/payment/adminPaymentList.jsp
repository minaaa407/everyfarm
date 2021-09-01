<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function modal() {
	alert(1);
	$.ajax({
		type: "POST",
		url: "/modal/modal_view",
		data : {
			searchCode1: $('#search-code-1').val(),
			searchCode2: $('#search-code-2').val()
		},
		beforeSend: function() {
			$.loading(true);
		},
		success: function(data) {
			$.modal(data, 'l'); // modal창 호출
		},
		complete: function() {
			$.loading(false);
		},
		error: function(e) {
			// TODO 에러 화면
		}
		
	});
}


</script>
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<meta charset="UTF-8">


<title>결제내역-관리자 | EveryFarm</title>
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
    width: 70%;
    height: 100%;
    margin: auto;
	}
.container {
	font-size:20px;
	text-align: center;
}
.modal { 
	position:absolute; 
	width:50%; 
	height:50%; 
	background: rgba(0,0,0,0.8); 
	top:0; 
	left:0; 
	display:none; 
}
</style>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
<h2><span>결제내역</span></h2>

<hr>
 			<div class="container1">
				<div class="col list-group-item list-group-item-action group">
					<div class="row ">
						<span class="col-md-2">상품명</span>
						<span class="col-md-1">상품번호</span>
						<span class="col-md-1">주문자명</span>
						<span class="col-md-2">주문번호</span>
						<span class="col-md-1">농장주ID</span>
						<span class="col-md-1">금액</span>
						<span class="col-md-2">날짜</span>
						<span class="col-md-2">비고</span>
					</div>
					<div class="col list-group">	
						<c:forEach var="pay" items="${paymentlist}" varStatus="mo">
						<fmt:formatDate var="pay_Date" value="${pay.pay_Date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="pay_order" value="${pay.pay_Date }" pattern="yyyyMMddkkmmss"/>
						<div class="row ">
							<span class="col-md-2">${pay.p_Title }</span>
							<span class="col-md-1">${pay.p_No }</span>
							<span class="col-md-1">${pay.pay_Name }</span>
							<span class="col-md-2">${pay_order}${pay.pay_Orderno }</span>
							<span class="col-md-1">${pay.p_Id }</span>
							<span class="col-md-1">${pay.pay_Totalprice }</span>
							<span class="col-md-2"><c:out value="${pay_Date }"/></span>
							<span class="col-md-2">
								<button type="button" class="btn btn-primary mr-md-2 py-1 px-2" onclick="location.href='/adminPayListDelete/${pay.pay_Orderno }'">삭제</button>
								<button type="button" class="btn btn-primary mr-md-2 py-1 px-2" data-target="#layerpop${mo.index}" data-toggle="modal">상세</button>
							</span>
						</div>
										<div class="modal fade" id="layerpop${mo.index}" >
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <!-- header -->
				      <div class="modal-header">
				        <!-- header title -->
				        <h4 class="modal-title">상세정보</h4>
				      </div>
				      <!-- body -->
				      <div class="modal-body">
				      		<div class="container">
				      			<div class="col">
				      				<div class="row">
										<div class="col-md-6 form-group">
											<label for="1">주문번호</label>
											<input name="name" class="form-control" id="1" value="${pay_order}${pay.pay_Orderno }" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="2">주문자 성명</label>
											<input name="name" class="form-control" id="2" value="${pay.pay_Name }" readonly>
										</div>
									</div>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<label for="3">상품번호</label>
											<input name="name" class="form-control" id="3" value="${pay.p_No }" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="4">상품명</label>
											<input name="name" class="form-control" id="4" value="${pay.p_Title}""${pay.pay_Land + pay.pay_Seed}" readonly>
										</div>
									</div>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<label for="5">상품금액</label>
											<input name="name" class="form-control" id="5" value="${pay.pay_Totalprice }원" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="6">농장주ID</label>
											<input name="name" class="form-control" id="6" value="${pay.p_Id }" readonly>
										</div>
									</div>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<label for="7">배송비</label>
											<input name="name" class="form-control" id="7" value="3,000원" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="8">주문날짜</label>
											<input name="name" class="form-control" id="8" value="${pay_Date }" readonly>
										</div>
									</div> 
									<div class="form-group"> 
										<label for="9">배송메시지</label>
										<textarea name="name" class="form-control" id="9" readonly>${pay.pay_Deliverymemo}</textarea>
									</div>
									<label for="10">주문상태</label>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<input name="name" class="form-control" id="10" value="농사중">
										</div>
										<div class="col-md-6">
											<select class="form-control" id="10">
							                    <option>농사중</option>
							                    <option>농사완료</option>
							                    <option>배송준비중</option>
							                    <option>배송완료</option>
							                </select>
						                </div>
									</div>
				      			</div>
				      		</div>
				      	</div>
				      <!-- Footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
						</c:forEach>
					</div>

				</div>
			</div>
			

<%-- <footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer> --%>



</body>
</html>
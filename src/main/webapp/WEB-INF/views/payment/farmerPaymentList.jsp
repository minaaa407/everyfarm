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
<input type="button" id="submit" value="선택 삭제" onclick="checkremove();" />
 			<div class="container">
				<div class="col ">
					<div class="row form-control">
					<span><input type="checkbox" id="all" name="all"/></span>
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
						<c:set var="i" value="${i+1}"/>
						<fmt:formatDate var="pay_Date" value="${pay.pay_Date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="pay_order" value="${pay.pay_Date }" pattern="yyyyMMddkkmmss"/>
						<div class="row form-control">
						<span><input type="checkbox" id="${i-1}" name="list0" value="${pay.pay_Orderno}"></span>
							<span class="col-md-1">${pay.m_Name }</span>
							<span class="col-md-2">${pay_order}${pay.pay_Orderno }</span>
							<span class="col-md-1">${pay.p_No }</span>
							<span class="col-md-1">${pay.p_Title }</span>
							<span class="col-md-1">${pay.pay_Seed }</span>
							<span class="col-md-1">${pay.pay_Land }</span>
							<span class="col-md-1">${pay.pay_Totalprice }</span>
							<span class="col-md-2"><c:out value="${pay_Date }"/></span>
							<span class="col-md-2">
								<button type="button" class="btn btn-primary mr-md-2 py-1 px-2" onclick="location.href='/farmerPaymentListDetail/${pay.pay_Orderno}'">상세</button>
							</span>
						</div>
						</c:forEach>
				</div>
			</div>
<%-- <footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer> --%>
<script>
var check = 0;
var allcheck = $("input:checkbox[name='all']").length;
var $checkok = 0;
var arr = [];
var checktrue = false;

$(document).on('click','#all',function(){
alert("전체 체크박스 개수" + allcheck);
	if($("#all").prop("checked")){
		$("input[name='list0']").prop("checked",true);
		} else {
		$("input[name='list0']").prop("checked",false);	
		}
	});
	
$(document).on('click','input[name=list0]',function(){
	if($('input[name=list0]:checked').length==$('input[name=list0]').length){
    	$('#all').prop('checked',true);
    }else{
        $('#all').prop('checked',false);
    }
});


function checkremove() {
	var check = $("input:checkbox[name='list0']:checked").length;
	var allcheck = $("input:checkbox[name='all']").length;
	arr.length = 0;
	var $checkok = 0;
	var payno = [];
	if(check == 0){
		alert("상품을 선택해주세요.");
	} else {
		if (confirm('선택하신' + check + '건의 내역을 삭제하시겠습니까?')) {  
			  for (var h = 0; h < allcheck; h++) {
			    	var $checkok = $('#'+h);
			      	if($checkok.prop('checked')) {
			      		arr.push(h);
			    	}
			    }
			  for (var j = 0; j < check; j++) {
			 			payno.push($('#'+arr[j]).val() * 1);
			  }
			  alert(arr.length);			  
			  alert(payno);
			  window.location.href = "http://localhost:8090/adminPayListDelete?payno=" + payno;
		} else{   
			return false;
		}
	}
}

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
</body>
</html>
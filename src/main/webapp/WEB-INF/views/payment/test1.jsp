<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.everyfarm.payment.PaymentBean"%>
<%@ page import="java.util.*"%>
    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>Insert title here</title>
</head>
<body>

	
<script>
   	$(function(){
		var IMP = window.IMP; // 생략가능
		   	IMP.init('imp84402228');  // 가맹점 식별 코드
			
		   	IMP.request_pay({
		    pg : 'kakaopay', // 결제방식
		    pay_method : 'card',	// 결제 수단
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'Every Farm 결제',	// order 테이블에 들어갈 주문명 혹은 주문 번호
		    amount : ${totalprice},
		    buyer_email : 'dune',	// 구매자 email
		    buyer_name :  '권형준',	// 구매자 이름
		    buyer_tel :  '1237',	// 구매자 전화번호
		    buyer_addr :  '안양동',	// 구매자 주소
		    buyer_postcode :  '010-010',	// 구매자 우편번호
		   }, function(rsp) {
			console.log(rsp);
			if ( rsp.success ) { // 성공시
			      var msg = '결제가 완료되었습니다.';
			      location.href = "/paycomplete";
			      
			   } else { // 실패시
			      var msg = '결제에 실패하였습니다. 결제를 다시 진행해주세요.';
			      alert(msg);
			      window.history.back();
			   }
			});
		}); 
	
   	
  </script>
  
</body>



</html>
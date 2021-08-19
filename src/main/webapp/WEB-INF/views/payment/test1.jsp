<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
 //   String name = (String)request.getAttribute("name");
 //   String email = (String)request.getAttribute("email");
 //  String phone = (String)request.getAttribute("phone");
 //  String address = (String)request.getAttribute("address");
  //  int totalPrice = (int)request.getAttribute("totalPrice");
     String name = (String)request.getParameter("name");
     String email = (String)request.getParameter("email");
     String phone = (String)request.getParameter("phone");
     String address = (String)request.getParameter("address");
     String stotalPrice = (String)request.getParameter("totalPrice");
      int totalPrice = Integer.parseInt(stotalPrice);
    
     System.out.println("name: "+name);
    System.out.println("email: "+email);
     System.out.println("phone: "+phone);
     System.out.println("address: "+address);
     System.out.println("stotalPrice: "+stotalPrice);
      System.out.println("totalPrice: "+totalPrice);
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>Insert title here</title>
</head>
<body>
<script>
var IMP = window.IMP; // 생략가능
   IMP.init('imp84402228');  // 가맹점 식별 코드

   IMP.request_pay({
      pg : 'kakaopay', // 결제방식
       pay_method : 'card',	// 결제 수단
       merchant_uid : 'merchant_' + new Date().getTime(),
      name : 'Every Farm 결제',	// order 테이블에 들어갈 주문명 혹은 주문 번호
       amount : '<%=totalPrice%>',	// 결제 금액
       buyer_email : '<%=email%>',	// 구매자 email
      buyer_name :  '<%=name%>',	// 구매자 이름
       buyer_tel :  '<%=phone%>',	// 구매자 전화번호
       buyer_addr :  '<%=address%>',	// 구매자 주소
       buyer_postcode :  '010-010',	// 구매자 우편번호
       company : 'Every Farm'
       // m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
   }, function(rsp) {
	if ( rsp.success ) { // 성공시
		var msg = '결제가 완료되었습니다.';
		msg += '고유ID : ' + rsp.imp_uid;
		msg += '상점 거래ID : ' + rsp.merchant_uid;
		msg += '결제 금액 : ' + rsp.paid_amount;
		msg += '이름 : ' + rsp.paid_buyer_name;
		msg += '주소 : ' + rsp.paid_buyer_addr;
		msg += '카드 승인번호 : ' + rsp.apply_num;
	} else { // 실패시
		var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
	}
		alert(msg);
		document.write(msg);
});
  </script>
  
  <p>msg</p>
  
  
  
</body>



</html>
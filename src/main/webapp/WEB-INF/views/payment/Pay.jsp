<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = (String)request.getAttribute("name");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address");
    int totalPrice = Integer.parseInt(request.getAttribute("totalPrice").toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp89525201'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'EveryFarm 결제',
            amount : '<%=totalPrice%>',
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
            /* m_redirect_url: 'https://www.yourdomain.com/payments/complete' */
            
        }, function (rsp) {
        	console.log(rsp);
        	if (rsp.success) {
        	var msg = '결제가 완료되었습니다.';
        	msg += '<%=name%>' 
        	msg += '<%=phone%>' 
        	msg += '<%=address%>' 
        	msg += '<%=email%>'
        	location.href='http://localhost:8090/payment/Kakao?;
        	} else {
        	var msg = '결제에 실패하였습니다.';
        	}
        	alert(msg);
        	});
        	});


        	
            
            
            
            
            
            
            
            
            
            
            
            
            
            

   
    
    </script>
 
</body>
</html>
<%@page import="kr.co.everyfarm.payment.PaymentBean"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 : EveryFarm</title>
 
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
body{ cursor: url("/resources/editor/css/sap.cur"), auto;}
a, a:link { cursor: url('/resources/editor/css/sap.cur'), auto;} 
a:hover, a:focus { cursor: url('/resources/editor/css/sap.cur'), auto;} 
a:active {cursor: url('/resources/editor/css/sap.cur'), auto;} 
input { cursor: url('/resources/editor/css/sap.cur'), auto; }
select {cursor: url('/resources/editor/css/sap.cur'), auto;}
label {cursor: url('/resources/editor/css/sap.cur'), auto;}
textarea {cursor: url('/resources/editor/css/sap.cur'), auto;}
select:option {cursor: url('/resources/editor/css/sap.cur'), auto;}
 #rphone2_1 {
 height:100%;
 width:15%;
 }
th, td {
padding:15px
}
table {
 width: -webkit-fill-available;
 border-spacing: 10px;
 border-color: #cccccc;
 border-left-color: #FFFFFF;
 border-right-color: #FFFFFF;
      }
th {
border-right-color:#cccccc;
}
.grid {
margin-bottom: -10px;
}
.address {
height: 25px;
}
#raddr1 , #raddr2 {
margin-top: 12px;
}
</style>
</head>
<body>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
<div class="container">	
	<div clss="row">
	<div clss="col">
	<div>
				<h2><span>결제</span></h2>
				<hr>
				<div>
					<a href="/product/basket"><span style="color:black;">장바구니</span></a>
					<span>&gt;</span>
					<span style="font-weight:bold">주문서</span>
					<span>&gt;</span>
					<span>결제 완료</span>
				</div>
			</div>
			<br>
			<hr>
	
				<form:form commandName="payment" action="/pay" method="post" id="pay_data" name="pay_data">
				
				<input type="hidden" name="pay_Id" id="" value="${Member.m_Id}" />
				<p>&#10071; 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</p>
				<!-- 국내배송상품 주문내역 -->
	<div class="orderListArea ">
        <div class="title">
            <h3>배송상품 주문내역</h3>
            <p class="button">
            	<a href="javascript:window.history.back();">
            		<img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_prev.gif" alt="이전페이지"/>
            	</a>
            </p>
        </div>
        
         <!-- 기본배송 -->
        <div class="ec-base-table typeList ">
            <table border="1" summary="">
				<caption>기본배송</caption>
				<colgroup>
					<col style="width:27px" class=""/>
					<col style="width:92px"/>
					<col style="width:auto"/>
					<col style="width:98px"/>
					<col style="width:75px"/>
					<col style="width:98px"/>
					<col style="width:98px"/>
					<col style="width:85px"/>
					<col style="width:98px"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="">
							<input type="checkbox" onclick="EC_SHOP_FRONT_ORDERFORM_PRODUCT.proc.setCheckOrderList('chk_order_cancel_list_basic', this);"/>
						</th>
                        <th scope="col">상품이미지</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">땅가격</th>
                        <th scope="col">수량</th>
                        <th scope="col">씨앗</th>
                        <th scope="col">인건비</th>
                        <th scope="col">배송비</th>
                        <th scope="col">합계</th>
                    </tr>
                </thead>
                <tbody> 
						<c:set var="total_price" value="0" />
						<c:set var="delivery" value="3000" />
						<c:choose>
					 		<c:when test = "${memBasket != null}">  
					 		<c:forEach var="p" varStatus="ps" items="${memBasket}" >
						    <c:set var="price" value="${(p.b_Land * p.p_Manpay) + (p.b_Land * p.p_Landprice) }" />
						    <input type="hidden" name="paymentbeanList[${ps.index}].pay_Deliverymemo" id="dm" value=""/>
							<input type="hidden" name="paymentbeanList[${ps.index}].pay_Address" id="Ad" value=""/>
						<tr>
							<th scope="col">
								<input type="checkbox" id="chk_order_cancel_list0" name="chk_order_cancel_list_basic0" value="">
							</th>
							<th scope="col"><a href="/productdetail"><img src="/resources/img/${p.p_Img }" name="image"  /></a></th>
							<th scope="col"><input name="title" value="${p.p_Title}" size="5" readonly /></th>
							<th scope="col"><input name="paymentbeanList[${ps.index}].pay_No" value="${p.b_Pno }" size="5" readonly/></th>
							<th scope="col"><input name="paymentbeanList[${ps.index}].pay_Land" value="${p.b_Land}" size="5" readonly/></th>
							<th scope="col"><input name="paymentbeanList[${ps.index}].pay_Seed" value="${p.b_Seed}" size="5" readonly/></th>
							<th scope="col"><input name="landprice" value="${ p.b_Land * p.p_Landprice }" size="5" readonly/>원</th>
							<th scope="col"><input name="manpay" value="${ p.b_Land * p.p_Manpay }" size="5" readonly/>원</th>
							<th scope="col">= <input name="paymentbeanList[${ps.index}].pay_Totalprice" value="${ price }" size="5" readonly/>원</th>
								<c:set var= "total_price" value="${total_price + price}"/>
								<c:set var= "landtotal" value="${landtotal + p.b_Land}"/>
						</tr>
						</c:forEach>
						</c:when>
						
						<c:otherwise>
					 		<c:forEach var="p" varStatus="ps" items="${memBasketModel.getBasketbeanList() }" >
						<c:set var="price" value="${ p.b_Totalprice + p.b_Land * p.p_Manpay }" />
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Deliverymemo" id="dm" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Address" id="Ad" value=""/>
						<tr>
							<th scope="col"><input name="image" value="${p.p_Img }" size="5" readonly /></th>
							<th scope="col"><input name="title" value="${p.p_Title}" size="5" readonly /></th>
							<th scope="col"><input name="paymentbeanList[${ps.index}].pay_No" value="${p.b_Pno }" size="5" readonly/></th>
							<th scope="col"><input name="paymentbeanList[${ps.index}].pay_Land" value="${p.b_Land}" size="5" readonly/></th>
							<th scope="col"><input name="paymentbeanList[${ps.index}].pay_Seed" value="${p.b_Seed}" size="5" readonly/></th>
							<th scope="col"><input name="landprice" value="${ p.b_Land * p.p_Landprice }" size="5" readonly/>원</th>
							<th scope="col"><input name="manpay" value="${ p.b_Land * p.p_Manpay }" size="5" readonly/>원</th>
							<th scope="col">= <input name="paymentbeanList[${ps.index}].pay_Totalprice" value="${ price }" size="5" readonly/>원</th>
								
								<c:set var= "total_price" value="${total_price + price}"/>
								<c:set var= "landtotal" value="${landtotal + p.b_Land}"/>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
					
                    
		<tfoot class="right">
			<tr>
				<td class=""></td>
		        <td colspan="8">
					<span class="gLeft">[기본배송]</span> 상품구매금액 
					<strong>130,000
						<span class="displaynone"> (0)</span>
					</strong> + 배송비 
					<span id="domestic_ship_fee">0 (무료)</span> 
					<span class="displaynone"> - 상품할인금액 0 </span> = 합계 : 
					<strong class="txtEm gIndent10">
						<span id="domestic_ship_fee_sum" class="txt18">130,000</span>
					</strong> 
					<span class="displaynone"></span>
				</td>
				</tr>
				</tfoot>
				</table>
		   </div>
		</div>
						
								
					
					<div class="container ">
						<div class="col">
							<div class="row form-group">
								<div>
									<span class="col-mb-3">합계</span>
									<span class="col-mb-3">배송비</span>
									<span class="col-mb-3">총금액</span>
								</div>
							</div>
							<div class="row form-control">	
								<div>
							    	<span class="col-mb-3"><input name="price" value="${ total_price }" size="5" readonly/>원</span>
									<span class="col-mb-3"><input name="delivery" value="3000" size="5" readonly/>원</span>
									<span class="col-mb-3"><input name="payTotalprice" value="${ delivery + total_price }" size="5" readonly />원</span>
								</div>
							</div>	
						</div>
					</div>
					<br>
				
	<div class="row">			
		<span class="col-md-10" style="text-align:left; font-weight:bold">배송 정보</span>
		<span class="col-md-2" style="text-align:right"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/> 필수입력사항</span>
	</div>
	<hr>
		<table border=1 >
			<tbody class="">
				<tr class="">
					<th scope="row">배송지 선택</th>
					<td>
						<div class="address">
							<input id="sameaddr" name="sameaddr" value="M" type="radio" /><label for="sameaddr" >회원 정보와 동일</label>
							<input id="otheraddr" name="otheraddr" value="F" type="radio"  /><label for="otheraddr" >새로운 배송지</label> 
							<a href="#none" id="btn_shipp_addr" class="" ><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_address.gif" alt="주소록 보기"/></a>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">받으시는 분<img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
					<td><input id="m_Name" name="m_Name" class="inputTypeText" size="15" value="" type="text" /></td>
				</tr>
				<tr>
					<th scope="row">주소 <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
					<td>
                        <input id="postcode" name="postcode" size="6" maxlength="6" value="" type="text" />    
                                            
                        <a href="#none" id="btn_search_rzipcode" onclick="sample4_execDaumPostcode()">
                        	<img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_zipcode.gif" alt="우편번호"/>
                        </a>
                        
                        <br>
                        
                        <input id="raddr1" name="raddr1" size="70" value="${Member.m_Addr }" type="text"/> 기본주소
                        
                        <br>
                        
                        <input id="raddr2" name="raddr2" size="40" value="" type="text" /> 나머지주소 (선택입력가능)
                    </td>
                </tr>		
				<tr class="">
					<th scope="row">전화번호 <span class=""><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></span></th>
					<td>
						<input id="tel" name="tel" maxlength="3" size="3" value="${fn:substring(Member.m_Tel,0,3) }" />
						-<input id="tel1" name="tel1" maxlength="4" size="4" value="${fn:substring(Member.m_Tel,3,7) }" />
						-<input id="tel2" name="tel2" maxlength="4" size="4" value="${fn:substring(Member.m_Tel,7,11) }" />
					</td>
                </tr>
                </tbody>
                <tbody class="email">
                	<tr>
                		<th scope="row">이메일 <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
						<td>
							<input id="mail1" name="mail1" value="" type="text" />@<input id="mail2" name="mail2" value="" type="text" />
							<select id="mail" name="mail">
							<option value="" selected="selected">- 이메일 선택 -</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="empas.com">empas.com</option>
							<option value="korea.com">korea.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="etc">직접입력</option>
							</select>
							<p class="grid">이메일을 통해 주문처리과정을 보내드립니다.
							<br>
							이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요</p>		
						</td>
					</tr>
				</tbody>
				<tbody class="delivery ">

				<tr class="">
				<th scope="row">배송메시지 <span class="displaynone" ></span>
				</th>

                    <td>
                        <textarea id="omessage" name="pay_Deliverymemo" maxlength="255" cols="70" ></textarea> 
                        <div class="message displaynone"></div>
                        <select id="memo" name="memo" onChange="memo1()">
		                        <option value="">배송 시 요청사항을 선택해주세요</option>
		                        <option value="부재 시 경비실에 맡겨주세요" >부재 시 경비실에 맡겨주세요</option>
		                        <option value="부재 시 택배함에 넣어주세요" >부재 시 택배함에 넣어주세요</option>
		                        <option value="부재 시 집 앞에 놔주세요" >부재 시 집 앞에 놔주세요</option>
		                        <option value="배송 전 연락 바랍니다" >배송 전 연락 바랍니다</option>
		                        <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해주세요" >파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
	                        	<option value="">직접 입력</option>
                    		</select>
                    </td>
                    	</tr>
        		</table>
							
                            	<div><input type="hidden" id="pay_Address1" name="pay_Address1" value="" /></div>
                            	<div><input type="hidden" id="pay_Address2" name="pay_Address2" value="" /></div>
                            	<div><input type="hidden" id="pay_Address3" name="pay_Address3" value="" /></div>
    			
        		
        		<br>
        		 
        		<hr>
        			
				<hr>
                       
                        <h3>결제 정보</h3>
                       <input type="radio" id="method1" name="pay_Method" value="신용카드"/><label for="method1" >신용카드</label>
                       <input type="radio" id="method2" name="pay_Method" value="카카오페이"/><label for="method2" >카카오페이</label>
                       <input type="radio" id="method3" name="pay_Method" value="네이버페이"/><label for="method3" >네이버페이</label>
                       <input type="radio" id="method4" name="pay_Method" value="계좌이체"/><label for="method4" >계좌이체</label>
                       	
                        </form:form>
                        <div class="col">
                                <input type="button" onClick="submit()" id="kakao" value="${ delivery + total_price }원 결제하기" />
                        </div>
                        
			</div>
		</div>
	</div>
	
	
	<script>
	// 우편번호 자르기
	var post = '${Member.m_Addr }';
	var lastpost = post.slice(-6, -1);
	var firstpost = post.slice(0, -7);
	console.log(firstpost);
	console.log(lastpost);
	document.getElementById('postcode').value = lastpost;
	document.getElementById('raddr1').value = firstpost;
	
	// 전화번호
	var tel = $('#tel').val();
	var tel1 = $('#tel1').val();
	var tel2 = $('#tel2').val();
	
	// 이메일
	var email = '${Member.m_Id}';
	var strArray = email.split('@');
	console.log(strArray[0] + ', ' + strArray[1]);
	var mail1 = document.getElementById('mail1').value = strArray[0];
	var mail2 = document.getElementById('mail2').val = strArray[1];
	console.log(mail1 + mail2);
	
	$(document).ready(function(){
		var name = '${Member.m_Name }';
		var empty = '';
		$("input:radio[id=sameaddr]").prop("checked", true); // 사용자동일에 체크되어있음
		if($("input:radio[id=sameaddr]").is(":checked")) {       // 사용자동일에 체크되어있으면 실행
			$("input:radio[id=otheraddr]").prop("checked", false);  // 새로운배송지에 체크 해제
			$('#m_Name').val(name);       $('#m_Name').prop('readonly', true);
			$('#postcode').val(lastpost); $('#postcode').prop('readonly', true);
			$('#raddr1').val(firstpost);  $('#raddr1').prop('readonly', true);
			$('#tel').val(tel);			  $('#tel').prop('readonly', true);
			$('#tel1').val(tel1);		  $('#tel1').prop('readonly', true);
			$('#tel2').val(tel2);		  $('#tel2').prop('readonly', true);
			$('#mail1').val(mail1);  	  $('#mail1').prop('readonly', true);
			$('#mail2').val(mail2);		  $('#mail2').prop('readonly', true);
			$("#mail").hide();
			console.log(name);
		}
	});
	 
	// 새로운 배송지 체크할 경우	
	 $(function(){
		 var empty = '';
	      $("input:radio[id=otheraddr]").click(function(){
	    	  $("input:radio[id=sameaddr]").prop("checked", false);
	    	  $('#m_Name').val(empty);   $('#m_Name').prop('readonly', false);
	    	  $('#postcode').val(empty); $('#postcode').prop('readonly', false);
			  $('#raddr1').val(empty);	 $('#raddr1').prop('readonly', false);
			  $('#tel').val(empty);		 $('#tel').prop('readonly', false);
			  $('#tel1').val(empty);	 $('#tel1').prop('readonly', false);
			  $('#tel2').val(empty);	 $('#tel2').prop('readonly', false);
			  $('#mail1').val(empty);	 $('#mail1').prop('readonly', false);
			  $('#mail2').val(empty);	 $('#mail2').prop('readonly', false);
			  $("#mail").show();
	    	  console.log(empty + "empty");
	      });
	});
	 
	// 사용자 동일에 체크할 경우
	 $(function(){
		 var name = '${Member.m_Name }';
	      $("input:radio[id=sameaddr]").click(function(){
	    	  $("input:radio[id=otheraddr]").prop("checked", false);
	    	  $('#m_Name').val(name);        $('#m_Name').prop('readonly', true);
	    	  $('#postcode').val(lastpost);	 $('#postcode').prop('readonly', true);
			  $('#raddr1').val(firstpost);	 $('#raddr1').prop('readonly', true);
			  $('#tel').val(tel);			 $('#tel').prop('readonly', true);
			  $('#tel1').val(tel1);			 $('#tel1').prop('readonly', true);
			  $('#tel2').val(tel2);			 $('#tel2').prop('readonly', true);
			  $('#mail1').val(mail1);		 $('#mail1').prop('readonly', true);
			  $('#mail2').val(mail2);		 $('#mail2').prop('readonly', true);
			  $("#mail").hide();	
	    	  console.log(name);
	      });
	});
	 
	
	// 셀렉트 박스 배송메시지
	$("#memo").on("change", function() {
	    var $select = $(this);
	    $("#omessage").val(function(i, val) {
	        return val = $select.val();
	    })
	});
	
	// 배송메시지 id값 dm에다 전달
	function memo1(){
		document.getElementById('pay_Deliverymemo').value=document.getElementById('memo').value;
		document.getElementById('dm').value=document.getElementById('pay_Deliverymemo').value;
		
	}
	
	// 주소 API
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(
							data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';
						if (data.bname !== ''
								&& /[동|로|가]$/g
										.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' ('
									+ extraRoadAddr
									+ ')';
						}
						document
								.getElementById('postcode').value = data.zonecode;
						document
								.getElementById('pay_Address1').value = roadAddr;
						document
								.getElementById("pay_Address2").value = data.jibunAddress;
						if (roadAddr !== '') {
							document
									.getElementById("pay_Address3").value = extraRoadAddr;
						} else {
							document
									.getElementById("pay_Address3").value = '';
						}
						var guideTextBox = document
								.getElementById("guide");
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr
									+ ')';
							guideTextBox.style.display = 'block';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr
									+ ')';
							
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
	
	function submit() {
		// 주소
		var address1 = document.getElementById('postcode').value;
		var address2 = document.getElementById('raddr1').value;
		var address3 = document.getElementById('raddr2').value;
		var address = address1 + address2 + address3;
		document.getElementById('Ad').value=address;
	
		document.pay_data.submit();
	}
	
	</script>
	
<%-- <footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer> --%>
</body>
</html>
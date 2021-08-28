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
.title {
background-color:#E6E6E6;
margin-right:0px;
margin-left:0px;
}
th, td {
padding:15px;
}
table {
 width: -webkit-fill-available;
 border-spacing: 10px;
 border-color: #cccccc;
 border-left-color: #FFFFFF;
 border-right-color: #FFFFFF;
      }
.order {
border-left:none;
}
.th {
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
.option {
   list-style:none;
   color:black;
   font-size:13px;
   background-color: #C8E6D1;
   padding-left:20px;
   margin-bottom: 4px;
   padding-top: 5px;
   border-bottom: 1px solid #cccccc;
   }
.ulborder {
   border-top: 1px solid #cccccc;
   border-bottom: 1px solid #cccccc;
   padding-top: 5px;
   margin-bottom:0px;
}
.optionH {
height: 25px;
}
.none {
   border-left-style: hidden;
   border-right-style: hidden;
}
.ulStep {
    list-style:none;
    margin:0;
    padding:0;
    display: inline-block;
}

.order1 {
    border : 0;
    float: left;
    border: 1px solid #E6E6E6;
    width:250px;
    height:60px;
    text-align: center; 
    display: inline-block;
    margin: 0;
    padding: 15px;
    
	
}
.orderStep {
	margin-bottom: 50px;
	margin-top: 50px;
	text-align: center;
}

.select {
font-weight:bold;
background-color:#E6E6E6;
}
.deliverinfo {
margin-top:50px;
}

.list{
font-weight:bold;
padding-left:0px;
}
.button{
margin-left:870px;
margin-top:2px;
}
.right{
text-align:right;
}
.img{
width:inherit;
max-width:100%;
height:auto;
}
.center{
text-align:center;
}
.bold{
color:black;
font-weight:bold;
}
.pay{
text-align:center;
height:150px;
border-bottom: 1px solid #cccccc;
background-color:#fbfafa;
padding-top:10px;
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
				<div class="orderStep">
			        <ul class="ulStep">
						<li class="order1">01 - 장바구니</li>
			            <li class="order1 select">02 - 주문서작성</li>
			            <li class="order1">03 - 결제완료</li>
			        </ul>
				</div>
			<br>
	
				<form:form commandName="payment" action="/pay" method="post" id="pay_data" name="pay_data">
				
				<input type="hidden" name="pay_Id" id="" value="${Member.m_Id}" />
				<ul class="option ulborder">
					<li class="optionH">&#10071;상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
				</ul>
		
				<!-- 국내배송상품 주문내역 -->
	<div class="order ">
        <div class="row title" style="margin-right:0px; margin-left:0px;">
            <span class="list">&nbsp;&nbsp;&nbsp;상품 주문내역</span>
            <span class="button">
            	<a href="javascript:window.history.back();" >
            		<img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_prev.gif" style="float:right; padding-left:30px" alt="이전페이지"/>
            	</a>
            </span>
            </div>
        		<!-- 선택상품 제어 버튼 -->
         <!-- 기본배송 -->
        <div class="ec-base-table typeList">
            <table border="1" summary="">
				<colgroup>
					<col style="width:27px" class=""/>
					<col style="width:130px"/>
					<col style="width:150px"/>
					<col style="width:75px"/>
					<col style="width:98px"/>
					<col style="width:98px"/>
					<col style="width:85px"/>
					<col style="width:98px"/>
				</colgroup>
				<thead>
					<tr class="center">
						<th scope="col">
							<input type="checkbox" onclick="EC_SHOP_FRONT_ORDERFORM_PRODUCT.proc.setCheckOrderList('chk_order_cancel_list_basic', this);"/>
						</th>
                        <th scope="col">이미지</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">작물가</th>
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
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_No" value="${p.b_Pno }"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Seed" value="${p.b_Seed}"/>
						<tr>
							<td>
								<input type="checkbox" id="chk_order_cancel_list0" name="chk_order_cancel_list_basic0" value="">
							</td>
							<td><a href="/productdetail"><img src="/resources/upload/product/1/${p.p_Img }" name="image" class="img" /></a></td>
							<td>
                				<a href="/productdetail" class="bold">${p.p_Title}</a>
                            	<div>${p.b_Seed}</div>
                        	</td>
							<td><input name="landprice" value="${ p.p_Landprice }" size="5" readonly/></td>
							<td><input name="paymentbeanList[${ps.index}].pay_Land" value="${p.b_Land}" size="5" readonly/></td>
							<td><input name="manpay" value="${ p.p_Manpay }" size="5" readonly/></td>
							<td><input name="delivery" value="3000원" size="5" readonly/></td>
							<td><input name="paymentbeanList[${ps.index}].pay_Totalprice" value="${ price }" size="5" readonly/></td>
							
								<c:set var= "total_price" value="${total_price + price}"/>
								<c:set var= "landtotal" value="${landtotal + p.b_Land}"/>
						</tr>
						</c:forEach>
						</c:when>
						
						<c:otherwise>
						<c:set var="landtotal" value="0" />
						<c:set var="deliverytotal" value="0" />
						
					 	<c:forEach var="p" varStatus="ps" items="${memBasketModel.getBasketbeanList() }" >
					 	
						<c:set var="landprice" value="${ p.p_Landprice * p.b_Land }" />
						<c:set var="manpay" value="${ p.p_Manpay * p.b_Land }" />
						<c:set var="delivery" value="3000" />
						<c:set var="price" value="${ landprice + manpay + delivery }" />
						<c:set var="price" value="${ landprice + manpay + delivery }" />
						
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Deliverymemo" id="dm" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Address" id="Ad" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_No" value="${p.b_Pno }"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Seed" value="${p.b_Seed}"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Land" value="${p.b_Land}"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Totalprice" value="${ price }"/>
						<tr class="center">
							<td>
								<input type="checkbox" id="chk_order_cancel_list0" name="chk_order_cancel_list_basic0" value="">
							</td>
							<td><a href="/productdetail"><img src="/resources/upload/product/1/${p.p_Img }" name="image" class="img" /></a></td>
							<td><a href="/productdetail" class="bold">${p.p_Title} - ${p.b_Seed}</a></td>
							<td><div>${p.b_Land}</div></td>
                        	<td><div>${ landprice }</div></td>
							<td><div>${ manpay }</div></td>
							<td><div>${ delivery }</div></td>
							<td><div>${ price }</div></td>
							
								<c:set var= "landtotal" value="${landtotal + price}"/>
								<c:set var= "deliverytotal" value="${deliverytotal + delivery}"/>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
					
                    
		<tfoot class="right">
			<tr>
				<td class=""></td>
		        <td colspan="8">
					<span class="gLeft">상품주문금액</span>  
					<span>${landtotal}</span> + 배송비 ${ deliverytotal }
					<span id="domestic_ship_fee"></span> = 합계 : 
					<strong>${landtotal + deliverytotal }</strong> 
					<span class="displaynone"></span>
					<c:set var= "total_price" value="${landtotal + deliverytotal }"/>
				</td>
				</tr>
				</tfoot>
				</table>
		   </div>
		</div>
		<ul class="option">
			<li class="optionH">&#10071;상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
		</ul>
					<div class="ec-base-button">
        	<span class="gLeft ">
            	<strong class="text">선택상품을</strong>
            	<a href="#none" id="btn_product_delete"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete2.gif" alt="삭제하기"/></a>
        	</span>
        </div>	
								
					
					
	<div class="deliverinfo">			
	<div class="row">			
		<div class="col-md-10" style="text-align:left; font-weight:bold">&nbsp;&nbsp;&nbsp;배송 정보</div>
		<div class="col-md-2" style="text-align:right"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/> 필수입력사항</div>
	</div>
		<table border=1 >
			<tbody class="">
				<tr class="">
					<th scope="row" class="th">배송지 선택</th>
					<td>
						<div class="address">
							<input id="sameaddr" name="sameaddr" value="M" type="radio" /><label for="sameaddr" >회원 정보와 동일</label>
							<input id="otheraddr" name="otheraddr" value="F" type="radio"  /><label for="otheraddr" >새로운 배송지</label> 
							<a href="#none" id="btn_shipp_addr" class="" ><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_address.gif" alt="주소록 보기"/></a>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th">받으시는 분<img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
					<td><input id="m_Name" name="m_Name" class="inputTypeText" size="15" value="" type="text" /></td>
				</tr>
				<tr>
					<th scope="row" class="th">주소 <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
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
					<th scope="row" class="th">전화번호 <span class=""><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></span></th>
					<td>
						<input id="tel" name="tel" maxlength="3" size="3" value="${fn:substring(Member.m_Tel,0,3) }" />
						-<input id="tel1" name="tel1" maxlength="4" size="4" value="${fn:substring(Member.m_Tel,3,7) }" />
						-<input id="tel2" name="tel2" maxlength="4" size="4" value="${fn:substring(Member.m_Tel,7,11) }" />
					</td>
                </tr>
                </tbody>
                <tbody class="email">
                	<tr>
                		<th scope="row" class="th">이메일 <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
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
				<th scope="row" class="th">배송메시지 <span class="displaynone" ></span>
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
        		</div>
                            	<div><input type="hidden" id="pay_Address1" name="pay_Address1" value="" /></div>
                            	<div><input type="hidden" id="pay_Address2" name="pay_Address2" value="" /></div>
                            	<div><input type="hidden" id="pay_Address3" name="pay_Address3" value="" /></div>
                        </form:form>
                        <div class="pay">
                        	<div class=""><span style="font-size:30px; font-weight:400px">총 결제금액 : ${ total_price }</span> <span style="font-size:20px;">원</span></div>
                                <input class="btn btn-primary" style="width:200px; height:60px; font-size:20px" type="button" onClick="submit()" id="kakao" value="결제하기" />
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
	
	

<jsp:include page="/WEB-INF/views/home/footer.jsp" />

</body>
</html>
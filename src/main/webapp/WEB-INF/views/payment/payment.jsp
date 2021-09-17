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
<title>EveryFarm : 결제</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
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
height:200px;
border-bottom: 1px solid #cccccc;
background-color:#fbfafa;
padding-top:10px;
}
.agree {
margin-bottom:10px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
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
					<li class="optionH"></li>
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
						<c:set var="landtotal" value="0" />
						<c:set var="deliverytotal" value="0" />
						<c:choose>
					 		<c:when test = "${memBasket != null}">  
					 		<c:forEach var="p" varStatus="ps" items="${memBasket}" >
						    <c:set var="landprice" value="${ p.p_Landprice * p.b_Land }" />
						<c:set var="manpay" value="${ p.p_Manpay * p.b_Land }" />
						<c:set var="delivery" value="3000" />
						<c:set var="price" value="${ landprice + manpay + delivery }" />
						<c:set var="price2" value="${ landprice + manpay }" />
						
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Name" id="pay_Name" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Tel" id="pay_Tel" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Email" id="pay_Email" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Deliverymemo" id="pay_Deliverymemo" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Address" id="Ad" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_No" value="${p.b_Pno }"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Seed" value="${p.b_Seed}"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Land" value="${p.b_Land}"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Totalprice" value="${ price }"/>
						<tr class="center">
							<td><a href="/productdetail"><img src="/resources/upload/product/1/${p.p_Img }" name="image" class="img" /></a></td>
							<td><a href="/productdetail" class="bold">${p.p_Title} - ${p.b_Seed}</a></td>
							<td><div>${p.b_Land}</div></td>
                        	<td><div>${ landprice }</div></td>
							<td><div>${ manpay }</div></td>
							<td><div>${ delivery }</div></td>
							<td><div>${ price }</div></td>
							
								<c:set var= "landtotal" value="${landtotal + price2}"/>
								<c:set var= "deliverytotal" value="${deliverytotal + delivery}"/>
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
						<c:set var="price2" value="${ landprice + manpay }" />
						
						
						
						
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Name" id="pay_Name" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Tel" id="pay_Tel" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Email" id="pay_Email" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Deliverymemo" id="pay_Deliverymemo" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Address" id="Ad" value=""/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_No" value="${p.b_Pno }"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Seed" value="${p.b_Seed}"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Land" value="${p.b_Land}"/>
						<input type="hidden" name="paymentbeanList[${ps.index}].pay_Totalprice" value="${ price }"/>
						<tr class="center">
							<td><a href="/productdetail"><img src="/resources/upload/product/1/${p.p_Img }" name="image" class="img" /></a></td>
							<td><a href="/productdetail" class="bold">${p.p_Title} - ${p.b_Seed}</a></td>
							<td><div>${p.b_Land}</div></td>
                        	<td><div>${ landprice }</div></td>
							<td><div>${ manpay }</div></td>
							<td><div>${ delivery }</div></td>
							<td><div>${ price }</div></td>
							
								<c:set var= "landtotal" value="${landtotal + price2}"/>
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
					<span id="ordercost">${landtotal}</span> + 배송비
					<span id="delcost"> ${ deliverytotal }</span> = 합계 : 
					<strong id="sumcost">${landtotal + deliverytotal }</strong> 
					<span class="displaynone"></span>
					<c:set var= "total_price" value="${landtotal + deliverytotal }"/>
				</td>
				</tr>
				</tfoot>
				</table>
		   </div>
		</div>
		<ul class="option">
			<li class="optionH"></li>
		</ul>
								
					
					
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
					<td><input id="Name1" name="Name1" class="inputTypeText" size="15" 
					value="" type="text" onKeyup="this.value=this.value.replace(/[^a-zA-Zㄱ-힣0-9]/gi,'');" required="required"/></td>
				</tr>
				<tr>
					<th scope="row" class="th">주소 <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
					<td>
                        <input id="postcode" name="postcode" size="6" maxlength="6" value="" type="text" />    
                                            
                        <a href="#none" id="zipcode" onclick="sample6_execDaumPostcode()">
                        	<img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_zipcode.gif" alt="우편번호"/>
                        </a>
                        
                        <br>
                        
                        <input id="raddr1" name="raddr1" size="60" value="${Member.m_Addr }" type="text"/> 기본주소
                        
                        <br>
                        
                        <input id="raddr2" name="raddr2" size="60" value="" type="text" onKeyup="this.value=this.value.replace(/[^a-zA-Zㄱ-힣0-9()]/gi,'');" required="required"/> 상세주소 (선택입력가능)
                    </td>
                </tr>		
				<tr class="">
					<th scope="row" class="th">전화번호 <span class=""><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></span></th>
					<td>
						<input id="tel" name="tel" maxlength="3" size="3" value="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" />
						-<input id="tel1" name="tel1" maxlength="4" size="4" value="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" />
						-<input id="tel2" name="tel2" maxlength="4" size="4" value="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"required="required" />
					</td>
                </tr>
                </tbody>
                <tbody class="email">
                	<tr>
                		<th scope="row" class="th">이메일 <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></th>
						<td>
							<input id="mail1" name="mail1" value="" type="text" onKeyup="this.value=this.value.replace(/[^a-zA-Z0-9()]/gi,'');" required="required"/>@
							<input id="mail2" name="mail2" value="" type="text" onKeyup="this.value=this.value.replace(/[^a-zA-Z0-9()]/gi,'');" required="required"/>
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
							<option value="">직접입력</option>
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
                        <textarea id="dm" name="dm" maxlength="255" cols="70" ></textarea> 
                        <div class="message displaynone"></div>
                        <select id="memo" name="memo" onChange="memo1()">
		                        <option value="">배송 시 요청사항을 선택해주세요</option>
		                        <option value="부재 시 경비실에 맡겨주세요" >부재 시 경비실에 맡겨주세요</option>
		                        <option value="부재 시 택배함에 넣어주세요" >부재 시 택배함에 넣어주세요</option>
		                        <option value="부재 시 집 앞에 놔주세요" >부재 시 집 앞에 놔주세요</option>
		                        <option value="배송 전 연락 바랍니다" >배송 전 연락 바랍니다</option>
		                        <option value="배송 시 주의해주세요" >파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
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
                        	<div class="agree"><input type="checkbox" id="agree" name="agree" /><label for="agree"> &nbsp;결제정보를 확인하였으며, 구매진행에 동의합니다.</label></div> 
                            	<input class="btn btn-primary" style="width:200px; height:60px; font-size:20px" type="button" onClick="submit()" id="kakao" value="결제하기" />
                        </div>
                        
			</div>
		</div>
	</div>
	<script>
	
function submit() {
	
	
	// 주소
			var address1 = document.getElementById('postcode').value;
			var address2 = document.getElementById('raddr1').value;
			var address3 = document.getElementById('raddr2').value;
			var address = address2 + ', ' + address3 + ' (' + address1 + ')';
			document.getElementById('Ad').value=address;
			console.log(address + 2);
	
	const payname = document.getElementById('Name1').value;
	document.getElementById('pay_Name').value = payname;
	console.log(payname + 1);
	console.log(payname);
	
	const paytel = document.getElementById('tel').value;
	const paytel1 = document.getElementById('tel1').value;
	const paytel2 = document.getElementById('tel2').value;
	const paytelmix = paytel + paytel1 + paytel2;
	document.getElementById('pay_Tel').value = paytelmix;
	console.log(paytelmix + 2);
	console.log(paytelmix);
	
	const payemail1 = document.getElementById('mail1').value;
	const payemail2 = document.getElementById('mail2').value;
	const payemail = mail1 + '@' + mail2;
	document.getElementById('pay_Email').value = payemail;
	console.log(payemail + 3);
	console.log(payemail);
	
	document.getElementById('pay_Deliverymemo').value=document.getElementById('dm').value;
	
		if(document.getElementById('Name1').value == "") {
			alert("받으시는 분의 이름을 입력해주세요.");
			document.getElementById('Name1').focus();
		} else if(document.getElementById('postcode').value == "") {
			alert("주소를 입력해주세요.");
		} else if(document.getElementById('tel').value == "") {
			alert("전화번호를 입력해주세요.");
			document.getElementById('tel').focus();
		} else if(document.getElementById('tel1').value == "") {
			alert("전화번호를 입력해주세요.");
			document.getElementById('tel1').focus();
		} else if(document.getElementById('tel2').value == "") {
			alert("전화번호를 입력해주세요.");
			document.getElementById('tel2').focus();
		} else if(document.getElementById('mail1').value == "") {
			alert("이메일을 입력해주세요.");
			document.getElementById('mail1').focus();	
		} else if(document.getElementById('mail2').value == "") {
			alert("이메일을 입력해주세요.");
			document.getElementById('mail2').focus();	
		} else if(document.getElementById('agree').checked == false) {
			alert("결제정보 확인 및 구매진행에 동의하셔야 주문이 가능합니다.");
		} else {
			document.pay_data.submit();
		}
	}
		
		
		// 구매동의 체크박스
			
	
			
			
			
	
/* var check = 0;
var allcheck = $("input:checkbox[id='list0']").length;
var $checkok = 0;
var arr = [];
var checktrue = false;

$(document).on('click','#all',function(){
console.log("전체 체크박스 개수" + allcheck);
	if($("#all").prop("checked")){
		$("input[id='list0']").prop("checked",true);
		} else {
		$("input[id='list0']").prop("checked",false);	
		}
	});
	
$(document).on('click','input[id=list0]',function(){
	if($('input[id=list0]:checked').length==$('input[id=list0]').length){
    	$('#all').prop('checked',true);
    }else{
        $('#all').prop('checked',false);
    }
});


function checkdelete() {
    	 var check = $("input:checkbox[name='list0']:checked").length;
    	 var allcheck = $("input:checkbox[name='list0']").length;
    	 console.log(check + "개");
    	 arr.length = 0;
    	 var check2 = $("input:checkbox[name='list0']:checked");
		 var pno = [];
		 if(check == 0) {
			 alert("선택하신 상품이 없습니다. 삭제를 원하시는 상품을 선택해주세요.");
		 } else {
			 if (confirm('선택하신 상품을 삭제하시겠습니까?')) {
				 for (const i = 0; i < check; i++) {
					 check2.parent().parent().remove();
					 $('#all').prop('checked',false);
					 var paylist = document.querySelectorAll("#list0");
					 console.log(paylist);
					 var paylistLength = paylist.length;
					 console.log(paylistLength);
				 }

			 } else {
				 return false;
			 }
		 } 
		console.log("체크가능개수" + allcheck);
	}	 */

	
	// 우편번호 자르기
	var post = '${Member.m_Addr }';
	var lastpost = post.slice(-6, -1);
	var firstpost = post.slice(0, -7);
	console.log(firstpost);
	console.log(lastpost);
	document.getElementById('postcode').value = lastpost;
	document.getElementById('raddr1').value = firstpost;
	
	
	// 이메일
	
	var email = '${Member.m_Id }';
	var strArray = email.split('@');
	console.log(email);
	console.log("이메일");
	console.log(strArray[0] + ', ' + strArray[1]);
	
	document.getElementById('mail1').value = strArray[0];
	var mail1 = document.getElementById('mail1').value;
	document.getElementById('mail2').value = strArray[1];
	var mail2 = document.getElementById('mail2').value;
	console.log(mail1 + mail2);
	
	// 전화번호
	var tel = '${fn:substring(Member.m_Tel,0,3) }';
	var tel1 = '${fn:substring(Member.m_Tel,3,7) }';
	var tel2 = '${fn:substring(Member.m_Tel,7,11) }';
	
	$(document).ready(function(){
		var name = '${Member.m_Name }';
		var empty = '';
		$("input:radio[id=sameaddr]").prop("checked", true); // 사용자동일에 체크되어있음
		if($("input:radio[id=sameaddr]").is(":checked")) {       // 사용자동일에 체크되어있으면 실행
			$("input:radio[id=otheraddr]").prop("checked", false);  // 새로운배송지에 체크 해제
			$('#Name1').val(name);       $('#Name1').prop('disabled', true);
			$('#postcode').val(lastpost); $('#postcode').prop('disabled', true);  
			$('#raddr1').val(firstpost);  $('#raddr1').prop('disabled', true);
			$('#raddr2').val(firstpost);  $('#raddr2').prop('disabled', true);
			$('#tel').val(tel);			  $('#tel').prop('disabled', true);
			$('#tel1').val(tel1);		  $('#tel1').prop('disabled', true);
			$('#tel2').val(tel2);		  $('#tel2').prop('disabled', true);
			$('#mail1').val(mail1);  	  $('#mail1').prop('disabled', true);
			$('#mail2').val(mail2);		  $('#mail2').prop('disabled', true);
			$('#dm').val(empty);		  $('#dm').prop('disabled', false); 		$('#memo option:eq(0)').prop('selected', true);
			$('#mail').hide();
			$('#zipcode').hide();
			console.log(name);
		}
		
	});
	 
	// 새로운 배송지 체크할 경우	
	 $(function(){
		 var empty = '';
	      $("input:radio[id=otheraddr]").click(function(){
	    	  $("input:radio[id=sameaddr]").prop("checked", false);
	    	  $('#Name1').val(empty);     $('#Name1').prop('disabled', false);
	    	  $('#postcode').val(empty); $('#postcode').prop('disabled', true);
			  $('#raddr1').val(empty);	 $('#raddr1').prop('disabled', true);
			  $('#raddr2').val(empty);	 $('#raddr2').prop('disabled', false);
			  $('#tel').val(empty);		 $('#tel').prop('disabled', false);
			  $('#tel1').val(empty);	 $('#tel1').prop('disabled', false);
			  $('#tel2').val(empty);	 $('#tel2').prop('disabled', false);
			  $('#mail1').val(empty);	 $('#mail1').prop('disabled', false);
			  $('#mail2').val(empty);	 $('#mail2').prop('disabled', false);
			  $('#dm').val(empty);		 $('#dm').prop('disabled', false); 		$('#memo option:eq(0)').prop('selected', true);
			  $("#mail").show();		 
			  $('#zipcode').show();		
	    	  console.log(empty + "empty");
	    	  
	    	  $("#mail").on("change", function() {
	    		  const $select = $(this);
	    		  $("#mail2").val(function(i, val) {
	    			  return val = $select.val();
	    			  
	    		  });
	    		  	if ($select.val() == "") {
	    		  	$("#mail2").prop("disabled", false);
	    		  	} else {
	    		  	$("#mail2").prop("disabled", true);	
	    		  	}
	    	  });
	    	  
	    	  $("#mail2").on("keypress", function() {
	    		 $("#mail option:eq(10)").prop("selected", true);
	    		  
	    	  });
	    	  $("#dm").on("keypress", function() {
		    		 $("#memo option:eq(6)").prop("selected", true);
	    	  });
	    	});
	     });
	// 사용자 동일에 체크할 경우
	 $(function(){
		 var name = '${Member.m_Name }';
		 var empty = '';
	      $("input:radio[id=sameaddr]").click(function(){
	    	  $("input:radio[id=otheraddr]").prop("checked", false);
	    	  $('#Name1').val(name);          $('#Name1').prop('disabled', true);
	    	  $('#postcode').val(lastpost);	 $('#postcode').prop('disabled', true);
			  $('#raddr1').val(firstpost);	 $('#raddr1').prop('disabled', true);
			  $('#raddr2').val(firstpost);	 $('#raddr2').prop('disabled', true);
			  $('#tel').val(tel);			 $('#tel').prop('disabled', true);
			  $('#tel1').val(tel1);			 $('#tel1').prop('disabled', true);
			  $('#tel2').val(tel2);			 $('#tel2').prop('disabled', true);
			  $('#mail1').val(mail1);		 $('#mail1').prop('disabled', true);
			  $('#mail2').val(mail2);		 $('#mail2').prop('disabled', true);
			  $('#dm').val(empty);		 $('#dm').prop('disabled', false); 		$('#memo option:eq(0)').prop('selected', true);
			  $("#mail").hide();
			  $('#zipcode').hide();
	    	  console.log(name);
	      });
	      $("#dm").on("keypress", function() {
	    		 $("#memo option:eq(6)").prop("selected", true);
	 	  });
	});
	 
	
	
	// 셀렉트 박스 배송메시지
	$("#memo").on("change", function() {
	    var $select = $(this);
	    $("#dm").val(function(i, val) {
	        return val = $select.val();
	    });
	    if ($select.val() == "") {
		  	$("#dm").prop("disabled", false);
		  	} else {
		  	$("#dm").prop("disabled", true);	
		  	}
	});
	
	// 배송메시지 id값 dm에다 전달
	function memo1(){
		document.getElementById('dm').value=document.getElementById('memo').value;
		
	}
	
	// 주소 API
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("raddr1").value = extraAddr;

							} else {
								document.getElementById("raddr1").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("raddr1").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("raddr1").focus();
						}
					}).open();
		}
	
	
	</script>
	
	

<jsp:include page="/WEB-INF/views/home/footer.jsp" />

</body>
</html>
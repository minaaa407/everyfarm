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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<script>

	function memo1(){
		document.getElementById('pay_Deliverymemo').value=document.getElementById('memo').value;
		
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
		var address1 = document.getElementById('pay_Address1').value;
		var address2 = document.getElementById('pay_Address2').value;
		var address3 = document.getElementById('pay_Address3').value;
		var address = address1 + address2 + address3;
		document.getElementById('pay_Address').value=address;
	
		document.pay_data.submit();
	}
		
</script>
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
					
						<form:form commandName="payment" action="/paycomplete" method="post" id="pay_data" name="pay_data">
							<input type="hidden" name="pay_Id" id="" value="${Member.m_Id}" />
							<div>
                				<hr>
                                <div class="col-xs-1">
                                    <div>
                                        <p>이름<span>*</span></p>
                                        <input type="text" name="m_Name" value="${Member.m_Name }"/>
                                    </div> 
                                </div>
                            </div>
                                <div class="col-xs-2">
                                    <div>
                                        <p>전화번호<span>*</span></p>
					                        <input name="tel" value="${fn:substring(Member.m_Tel,0,3) }" size="3" maxlength="3" />
				                        	- <input name="tel1" value="${fn:substring(Member.m_Tel,3,7) }" size="3" maxlength="4" /> -
					                        <input name="tel2" value="${fn:substring(Member.m_Tel,7,11) }" size="3" maxlength="4" />
                                    </div>
                                </div>
                            <div class="col-lg-4">
                            	<div>
                              	  	<p>주소<span>*</span></p>
                            	<div>
                            	<span><input id="postcode" placeholder="우편번호" name="postcode" value="${Member.m_Addr }" size="40"></span>
                            	<span><button class="submit" type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호 찾기">우편번호 찾기</button></span>
								</div>
                            	<div><input id="pay_Address1" placeholder="도로명주소" name="pay_Address1" value="${Member.m_Addr }" size="40" /></div>
                            	<div><input id="pay_Address2" placeholder="지번주소" name="pay_Address2" value="${Member.m_Addr }" size="40" /></div>
                            	<span id="guide" style="color: #999; display: none"></span>
                            	<div><input id="pay_Address3" placeholder="참고항목" name="pay_Address3" value="${Member.m_Addr }" size="40" /></div>
                                	 <input type="hidden" name="pay_Address" id="pay_Address" />
                            </div>
                            </div>
                     <br>
                     
    			<div>
    			배송 메모<br><br>
    				<input type="text" name="pay_Deliverymemo" id="pay_Deliverymemo" size=40 />
                    <select id="memo" name="memo" onChange="memo1()">
                        <option value="">배송 시 요청사항을 선택해주세요</option>
                        <option value="부재 시 경비실에 맡겨주세요" >부재 시 경비실에 맡겨주세요</option>
                        <option value="부재 시 택배함에 넣어주세요" >부재 시 택배함에 넣어주세요</option>
                        <option value="부재 시 집 앞에 놔주세요" >부재 시 집 앞에 놔주세요</option>
                        <option value="배송 전 연락 바랍니다" >배송 전 연락 바랍니다</option>
                        <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해주세요" >파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
                        <option value="">직접 입력</option>
                    </select>
        		</div>
        		<br>
        		 
        		<hr>
        		<table>
					<h2>상품정보</h2>
					<thead>
						<tr>
							<th scope="col">상품이미지</th>
							<th scope="col">상품정보</th>
							<th scope="col">상품번호</th>
							<th scope="col">땅평수</th>
							<th scope="col">씨앗</th>
							<th scope="col">땅가격</th>
							<th scope="col">인건비</th>
							<th scope="col">주문금액</th>
						</tr>
						
						<c:set var="total_price" value="0" />
						<c:set var="delivery" value="3000" />
						<c:forEach var="p" varStatus="ps" items="${memBasketModel.getBasketbeanList() }" >
						<c:set var="price" value="${ p.b_Totalprice + p.b_Land * p.p_Manpay }" />
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
					</thead>
				</table>
								<c:set var= "total_price1" value="${total_price}"/>
							<fmt:parseNumber  var="total_price2" value="${ (total_price1 + delivery) * 0.97 }" integerOnly="true"/>
					
					<div class="container">
						<div class="col">
							<div class="row">
							<div class="col">
								<span class="col-mb-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;합계</span>
								<span class="col-mb-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송비</span>
								<span class="col-mb-3">&nbsp;&nbsp;&nbsp;&nbsp;회원할인</span>
								<span class="col-mb-3">&nbsp;&nbsp;&nbsp;총금액</span>
							</div>
							<div class="col">
							    <span class="col-mb-3"><input name="price" value="${ total_price }" size="5" readonly/>원</span>
								<span class="col-mb-3"><input name="delivery" value="3000" size="5" readonly/>원</span>
								<span class="col-mb-3">&nbsp;&nbsp;&#8681; 3%</span>
								<span class="col-mb-3">&nbsp;&nbsp;&nbsp;<input name="payTotalprice" value="${ total_price2 }" size="5" readonly />원</span>
							</div>
							</div>
						</div>
					</div>
					<br>
				<hr>
                        
                        <h3>결제 정보</h3>
                       <input type="radio" name="pay_Method" value="신용카드"/>신용카드
                       <input type="radio" name="pay_Method" value="카카오페이"/>카카오페이
                       <input type="radio" name="pay_Method" value="네이버페이"/>네이버페이
                       <input type="radio" name="pay_Method" value="계좌이체"/>계좌이체
                       	
                        </form:form>
                        <div class="col">
                                <input type="button" onClick="submit()" value="${ total_price2 }원 결제하기" />
                        </div>
                        
			</div>
		</div>
	</div>
	
</body>
</html>
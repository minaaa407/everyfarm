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

</head>
<body>
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
					
						<form:form commandName="payment" action="/complete" method="post" id="pay_data">
						<input type="hidden" name="pay_Id" value="${Member.m_Id }">
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
                                        <div>
                    </div>
                                    </div>
                                </div>
                            <div class="col-lg-4">
                            <div>
                                <p>주소<span>*</span></p>
                                <input name="addr" value="${Member.m_Addr }" size="40"/>
                                <a href="">주소찾기</a>
                            </div>
                            
                            <br>
                                <input name="addr1" value="1층" size="40"/>
                            </div>
                            
                        <script>
                     
                     $(function(){	
                    		$(document).ready(function(){
                    			$('select[name=memo]').change(function() {
                    				if($(this).val()=='1'){
                    					$('#deliverymemo').val('');
                    				} else {
                    					$('#deliverymemo').val($(this).val());
                    					$('#deliverymemo').attr('readonly', true);
                    					
                    				}
                    			});
                    		});
                    	});
                     
                     </script>
                     <br>
                     <br>
                     
    			<div>
    			배송 메모<br><br>
    				<input type="text" class="" name="pay_Deliverymemo" id="deliverymemo" size=40 />
                    <select id="memo" name="memo">
                        <option value="1">배송 시 요청사항을 선택해주세요</option>
                        <option value="부재 시 경비실에 맡겨주세요" >부재 시 경비실에 맡겨주세요</option>
                        <option value="부재 시 택배함에 넣어주세요" >부재 시 택배함에 넣어주세요</option>
                        <option value="부재 시 집 앞에 놔주세요" >부재 시 집 앞에 놔주세요</option>
                        <option value="배송 전 연락 바랍니다" >배송 전 연락 바랍니다</option>
                        <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해주세요" >파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
                        <option value="etc">직접 입력</option>
                    </select>
        		</div>
        		<br>
        		 
        		<hr>
        		<table>
					<colgroup>
						<col>
						<col width="50px">
<!--					<col width="100px">-->
						<col width="80px">
						<col width="80px">
						<col width="70px" class="charge ">
						<col width="69px" class="charge ">
						<col width="100px" class="charge ">
					</colgroup>
					
					
					
					<c:set var="land" value="5" />
					<c:set var="seed" value="고구마" />
					
			        
					<c:set var="price" value="${ land * Product.p_Landprice + land * Product.p_Manpay }" />
					
					
					<fmt:parseNumber  var="total" value="${ price * 0.97 }" integerOnly="true"/>
					<c:set var="totalprice" value="${total }" />
					
					 
											
						 
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
							<th scope="col">배송비</th>
							<th scope="col">주문금액</th>
							<th scope="col">회원할인</th>
							<th scope="col">총금액</th>
						</tr>
						<tr>
							<th scope="col"><input name="image" value="${Product.p_Img }" readonly /></th>
							<th scope="col"><input name="title" value="${Product.p_Title}" readonly /></th>
							<th scope="col"><input name="pay_No" value="${Product.p_No }" readonly/></th>
							<th scope="col"><input type="text" name="pay_Land" value="${land}" readonly/></th>
							<th scope="col"><input type="text" name="pay_Seed" value="${seed}" readonly/></th>
							<th scope="col"><input name="landprice" value="${ land * Product.p_Landprice }" readonly/>원</th>
							<th scope="col"><input name="manpay" value="${ land * Product.p_Manpay }" readonly/>원</th>
							<th scope="col"><input name="pay_Delivery" value="3000" readonly/>원</th>
							<th scope="col"><input name="price" value="${ price }" readonly/>원</th>
							<th scope="col">&#8681; 3%</th>
							<th scope="col"><input name="pay_Totalprice" value="${ totalprice }" readonly />원</th>
						</tr>
					</thead>
				</table>
				<hr>
                        
                        <h3>결제 정보</h3>
                       <input type="radio" name="pay_Method" value="신용카드"/>신용카드
                       <input type="radio" name="pay_Method" value="카카오페이"/>카카오페이
                       <input type="radio" name="pay_Method" value="네이버페이"/>네이버페이
                       <input type="radio" name="pay_Method" value="계좌이체"/>계좌이체
                       
                       
                       	
                        <div class="col">
                                <button type="submit">${ totalprice }원 결제하기</button>
                        </div>
                        </form:form>
                        
			</div>
		</div>
	</div>
</body>
</html>
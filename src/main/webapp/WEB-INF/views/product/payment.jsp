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
					
						<form action="">	
							<div>
                				<hr>
                                <div class="col-xs-1">
                                    <div>
                                        <p>이름<span>*</span></p>
                                        <input type="text" name="name" value="${Member.m_Name }">
                                    </div> 
                                </div>
                            </div>
                                <div class="col-xs-2">
                                    <div>
                                        <p>전화번호<span>*</span></p>
					                        
					                        <input type="text" name="tel" value="${fn:substring(Member.m_Tel,0,3) }" size="3" maxlength="4" />
				                        	- <input type="text" name="tel" value="${fn:substring(Member.m_Tel,3,7) }" size="3" maxlength="4" /> -
					                        <input type="text" name="tel1" value="${fn:substring(Member.m_Tel,7,11) }" size="3" maxlength="4" />
                                        <div>
                    </div>
                                    </div>
                                </div>
                            <div class="col-lg-4">
                            <div>
                                <p>주소<span>*</span></p>
                                <input type="text" name="address" value="${Member.m_Addr }" size="40">
                                <a href="">주소찾기</a>
                            </div>
                            
                            <br>
                                <input type="text" name="address1" value="1층" size="40">
                            </div>
                            
                             
                     <br>
                     <br>           
    			<div>
    			배송 메모<br><br>
                    <select>
                        <option value="">배송 시 요청사항을 선택해주세요</option>
                        <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                        <option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
                        <option value="부재 시 집 앞에 놔주세요">부재 시 집 앞에 놔주세요</option>
                        <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
                        <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해주세요">파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
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
					
					<h2>상품정보</h2>
					<thead>
						<tr>
							<th scope="col">상품정보</th>
							<th scope="col">땅크기</th>
							<th scope="col">씨앗</th>
							<th scope="col">상품금액</th>
							<th scope="col">인건비</th>
							<th scope="col">배송비</th>
							<th scope="col">회원할인</th>
							<th scope="col">주문금액</th>
						</tr>
						<tr>
							<th scope="col">${Product.p_Image }</th>
							<th scope="col">${Product.p_Land }</th>
							<th scope="col">${Product.p_Sub }</th>
							<th scope="col">${Product.p_Landprice + Product.p_Seedprice }원</th>
							<th scope="col">${Product.p_Manpay }원</th>
							<th scope="col">${Product.p_Delivery }원</th>
							<th scope="col">&#8681; 3%</th>
							<th scope="col"><fmt:parseNumber value="${(Product.p_Landprice + Product.p_Seedprice + Product.p_Manpay + Product.p_Delivery)*0.97 }" integerOnly="true" />원</th>
						</tr>
					</thead>
				</table>
				<hr>
                        
                        <h3>결제 정보</h3>
                       <p>신용카드</p>
                       <p>카카오페이</p>
                       <p>네이버페이</p>
                       <p>휴대전화</p>
                       
                        <div class="col">
                                <button type="submit" onclick="window.location = 'WEB-INF/views/product/complete.jsp'"><fmt:parseNumber value="${(Product.p_Landprice + Product.p_Seedprice + Product.p_Manpay + Product.p_Delivery)*0.97 }" integerOnly="true" />원 결제하기</button>
                        </div>
                        </form>
                        
			</div>
		</div>
	</div>
</body>
</html>
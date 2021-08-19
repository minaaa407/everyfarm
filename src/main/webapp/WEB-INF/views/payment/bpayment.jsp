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
	<div clss="col-xs-3">
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
							
						<form>	
							<div>
                				<hr>
                                <div class="col-xs-1">
                                    <div>
                                        <p>이름<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                                <div class="col-xs-2">
                                    <div>
                                        <p>비밀번호<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <div>
                                        <p>전화번호<span>*</span></p>
					                        <select>
					                            <option value="">선택하세요</option>
					                            <option value="010" >010</option>
					                            <option value="011" >011</option>
					                            <option value="016" >016</option>
					                            <option value="017" >017</option>
					                            <option value="018" >018</option>
					                            <option value="019" >019</option>
					                        </select>
					                        - <input type="text" name="omobile2" value="" size="3" maxlength="4"/> -
					                        <input type="text" name="omobile3" value="" size="3" maxlength="4"/>
                                        <div>
                    </div>
                                    </div>
                                </div>
                            <div class="col-lg-4">
                            <div>
                                <p>주소<span>*</span></p>
                                <input type="text" name="address" value="" size="40">
                                <a href="">주소찾기</a>
                            </div>
                            <br>
                                <input type="text" name="address1" value="" size="40">
                            </div>
                            <div class="row">
                                <div class="col-xs-2">
                                    <div>
                                        <p>이메일<span>*</span></p>
                                        <input type="text">@
                    <input type="text" name="email" value="" maxlength="30"/>
                    <input type="text" name="email1" value="" style="display:none;" maxlength="20"/>
                    <select name="email2" onChange="inputDomain('email2','email1');">
                        <option value="etc" >직접 입력</option>
                        <option value="naver.com" >naver.com</option>
                        <option value="paran.com"  >paran.com</option>
                        <option value="hanmail.net"  >hanmail.net</option>
                        <option value="hotmail.com" >hotmail.com</option>
                        <option value="nate.com" >nate.com</option>
                    </select>
        		</div>
        		</div>
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
							<th scope="col">주문금액</th>
						</tr>
						<tr>
							<th scope="col">${Product.p_Image }</th>
							<th scope="col">${Product.p_Land }</th>
							<th scope="col">${Product.p_Sub }</th>
							<th scope="col">${Product.p_Landprice + Product.p_Seedprice }원</th>
							<th scope="col">${Product.p_Manpay }원</th>
							<th scope="col">${Product.p_Delivery }원</th>
							<th scope="col">${Product.p_Landprice + Product.p_Seedprice + Product.p_Manpay + Product.p_Delivery }원</th>
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
                                <button type="submit">${Product.p_Landprice + Product.p_Seedprice + Product.p_Manpay + Product.p_Delivery }원 결제하기</button>
                        </div>
                        </form>
			</div>
		</div>
	</div>
</body>
</html>
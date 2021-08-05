<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 : EveryFarm</title>
<meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/organi/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/organi/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/organi/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/organi/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/organi/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/organi/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/organi/css/style.css" type="text/css">
</head>
<body>
<div class="article-title">
				<h2 class="title-page"><span>결제</span></h2>
				<div class="page-sorting">
					<a href="/product/basket"><span>장바구니</span></a>
					<span>&gt;</span>
					<span class="current-page">주문서</span>
					<span>&gt;</span>
					<span>주문 완료</span>
				</div>
			</div>
			<div>
    <div>
        <div>
            <h3><span>구매자</span></h3>
        </div>
    </div>
			
<div class="checkout__form">
                <h4>결제</h4>
                
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>비밀번호<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>전화번호<span>*</span></p>
                                        <input type="text">
                                        <div style="display: none;">
                        <select name="rmobile1">
                            <option value="">선택하세요</option>
                            <option value="010" >010</option>
                            <option value="011" >011</option>
                            <option value="016" >016</option>
                            <option value="017" >017</option>
                            <option value="018" >018</option>
                            <option value="019" >019</option>
                        </select>
                    </div>
                                    </div>
                                </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                            </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이메일<span>*</span></p>
                                        <input type="text">
                                        <div>
                    <input type="text" name="email1" value="" maxlength="30" onkeyup="removeEmoji($(this));" />@
                    <input type="text" name="email_etc" value="" style="display:none;" maxlength="20" onkeyup="removeEmoji($(this));" />
                    <select name="email2" onChange="inputDomain('email2','email_etc');">
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
                            </div>
                        </div>
    			<div>
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
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>결제 머니</h4>
                                <div class="checkout__order__products">상품<span>합계</span></div>
                                <ul>
                                    <li>땅 5평<span>300000</span></li>
                                    <li>씨앗<span>50000</span></li>
                                </ul>
                                <div class="checkout__order__subtotal">인건비 <span>500000</span></div>
                                <div class="checkout__order__subtotal">배송비 <span>3000</span></div>
                                <div class="checkout__order__total"> <span>853000</span></div>
                            </div>
                                <button type="submit" class="site-btn">결제하기</button>
                        </div>
                        </div>
        		
        		
    </div>
							<span>상품번호</span>
							<span>상품명</span>
							<span>상품이미지</span>
							<span>땅 크기</span>
							<span>땅 가격</span>
							<span>씨앗수량</span>
							<span>씨앗가격</span>
							<span>인건비</span>
							<span>배송비</span>
							<script src="js/jquery-3.3.1.min.js"></script>
    
</body>
</html>
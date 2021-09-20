<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@page import="kr.co.everyfarm.basket.BasketBean"%>
    
<%
 	List<BasketBean> basketList = (List)request.getAttribute("basketList");
	int count = basketList.size();
	/* ArrayList<String> occurance = (ArrayList)request.getAttribute("occurance");  */
		
%> 


<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<!-- <link rel="stylesheet" href="/assets/css/style.css"> -->

	

<style type="text/css">

.fix{position:sticky;_position:absolute;width:100%; top:0;z-index:100}
/* fixed    max-width: 36.5%;*/

/*  style="width:300px;height:200px;font-size:30px;" */

/* input[type="text"]{
	border:0 solid black
}
 */
 
/* body {
	display:block;
	padding : 0px;
	margin : 0px;} */

.shopping-cart{
	padding-bottom: 50px;
	font-family: 'Montserrat', sans-serif;
}

.shopping-cart.dark{
	background-color: #fafbf9;  /* #f6f6f6 */
}

.shopping-cart .content{
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
	background-color: white;
}

.shopping-cart .block-heading{
    padding-top: 50px;
    margin-bottom: 40px;
    text-align: left;
}

.shopping-cart .block-heading p{
	text-align: center;
	max-width: 420px;
	margin: auto;
	opacity:0.7;
}

.shopping-cart .dark .block-heading p{
	opacity:0.8;
}

.shopping-cart .block-heading h1,
.shopping-cart .block-heading h2,
.shopping-cart .block-heading h3 {
	margin-bottom:1.2rem;
	color: #8a939a;/*  #3b99e0  */
	text-align: center;
}

.shopping-cart .items{
	margin: auto;
}

.shopping-cart .items .product{
	margin-bottom: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
}

.shopping-cart .items .product .info{
	padding-top: 0px;
	text-align: center;
}

.shopping-cart .items .product .info .product-name{
	font-weight: 600;
}

.shopping-cart .items .product .info .product-name .product-info{
	font-size: 14px;
	margin-top: 15px;
}

.shopping-cart .items .product .info .product-name .product-info .value{
	font-weight: 400;
}

.shopping-cart .items .product .info .quantity .quantity-input{
    margin: auto;
    width: 80px;
}

.shopping-cart .items .product .info .price{
	margin-top: 15px;
    font-weight: bold;
    font-size: 22px;
 }

.shopping-cart .summary{
	border-top: 2px solid #1c9242; /* #5ea4f3 */
    background-color :#fafffbf7; /* #f8fff78a   #f7fbff */
    height: 100%;
    padding: 30px;
}

.shopping-cart .summary h3{
	text-align: center;
	font-size: 1.3em;
	font-weight: 600;
	padding-top: 20px;
	padding-bottom: 20px;
}

.shopping-cart .summary .summary-item:not(:last-of-type){
	padding-bottom: 10px;
	padding-top: 10px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

.shopping-cart .summary .text{
	font-size: 1em;
	font-weight: 600;
}

.shopping-cart .summary .price{
	font-size: 1em;
	float: right;
}

.shopping-cart .summary button{
	margin-top: 20px;
}

@media (min-width: 768px) {
	.shopping-cart .items .product .info {
		padding-top: 25px;
		text-align: left; 
	}

	.shopping-cart .items .product .info .price {
		font-weight: bold;
		font-size: 22px;
		top: 17px; 
	}

	.shopping-cart .items .product .info .quantity {
		text-align: center; 
	}
	.shopping-cart .items .product .info .quantity .quantity-input {
		padding: 4px 10px;
		text-align: center; 
	}
}
.orderStep {
	margin-bottom: 50px;
	margin-top: 50px;
	text-align: center;
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
.select {
	font-weight:bold;
	background-color:#E6E6E6;
}	



.on {
  position: absolute;
  bottom: 350px;
}

	

</style>	
	
</head>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
<body>
	<main class="page">
	 	<section class="shopping-cart dark">
	 		<div class="container">
		        <div class="block-heading" style="margin-bottom: 0px;">
		  <!--       
		        <div class="orderStep">
			        <ul class="ulStep">
						<li class="order1 select">01 - 장바구니</li>
			            <li class="order1">02 - 주문서작성</li>
			            <li class="order1">03 - 결제완료</li>
			        </ul>
				</div>
		         -->
		        
		        	<h2 style="font-weight: bold;font-size: 40px;margin-top: 20px;margin-bottom: 0px;">장바구니</h2> 
		        		<c:choose>   
							<c:when test = "${empty basketList}">  
							</c:when> 
							<c:when test = "${basketList != null}">
		        			
		        			<br><br>
		        	
		         			<br>
		         			
		         			<div class="button3" style = "display: flex; flex-wrap: wrap; margin-top: 0px; margin-bottom: 5px;">
		         				<input type="button" id="submit" value="선택 삭제" class="btn btn-primary btn-lg btn-block" 
		         					style="width: 88px;font-size: 16px;padding-left: 10px;padding-right: 10px;" onclick="checkremove();" /> 
								<input type="button" id="zerodelete" value="장바구니 비우기" class="btn btn-primary btn-lg btn-block" 
							       style="width: 135px; font-size: 16px; padding-left: 8px; margin-top: 0px; margin-left: 5px;" onclick="allremove();"/>  
   				 				<input type="button" id="zerodelete" value="품절 상품 지우기" class="btn btn-primary btn-lg btn-block" 
   				 			       style="width: 135px; font-size: 16px; padding-left: 7px; margin-top: 0px; margin-left: 5px;" onclick="zeroremove();"/> 
   				 			
   				 			
							</div>
							
							</c:when>
							</c:choose>
		       </div>
		        <div class="content">
	 				<div class="row">
	 					<div class="col-5 col-sm-7 col-md-8 col-lg-9">
	 						<div class="items">
	 							<br>
								<div class="row">
									<div class="col-md-3"><input type="checkbox" id="checkall" name="checkall" value="전체 선택"/>  총 <%=count %>개</div>
									<div class="d-none d-sm-block col-md-9">
										<div class="row">
											<div class="d-none d-sm-block col-md-4" style="padding-left: 40px;">상품정보</div>
											<div class="d-none d-sm-block col-md-3" style="text-align: center;padding-right: 30px;padding-left: 0px;">수량</div>
											<div class="d-none d-sm-block col-md-3" style="text-align: center;padding-right: 50px;padding-left: 0px;">상품가격</div>
											<div class="d-none d-sm-block col-md-2" style="text-align: center;padding-right: 45px;padding-left: 0px;">배송비</div>
										</div>
									</div>
								</div>
							
								
								<!-- <table>
								<tr>
							  <th style="width: 350px; text-align: left";><input type="checkbox" id="checkall" name="checkall" value="전체 선택"/></th>
                              <th style="width: 600px; text-align: center";>상품정보</th>
                              <th style="width: 300px; text-align: center";>수량</th>
                              <th style="width: 370px; text-align: center";>상품 가격</th>
                              <th style="width: 250px; text-align: center";>배송비</th>
                         		 </tr>
                         		 </table> -->
                         		<hr>
                         		 
							<c:choose>   
								<c:when test = "${empty basketList}">  
									<div>내역이 없습니다.</div>
								</c:when>
								<c:when test = "${basketList != null}">
	
								<form:form action="basketTopayment" id="basket" name="basket" commandName="basketbean" method="post" onkeydown="return captureReturnKey(event)"> 
									<c:forEach items="${basketList }" var="b" varStatus="now">
										<c:set var="i" value="${i+1}"/>
		

				 				
				 							<div class="product">
				 								<div class="row">
					 								<div class="col-md-3">
														<c:choose>
															<c:when test="${b.p_Accept eq 'N'}">
																<div><label for="${i-1}"><input type="checkbox" id="${i-1}" name="choose" value="${b.b_No}" onchange="paybox()" disabled/></label></div>
															</c:when>
															<c:otherwise>
																<div><label for="${i-1}"><input type="checkbox" id="${i-1}" name="choose" value="${b.b_No}" onchange="paybox()"/></label></div>
															</c:otherwise>
														</c:choose>
					 									<label><a href="/productdetail?productno=${b.b_Pno}"><img src="resources/upload/product/${b.b_Pno}/${b.p_Img}" 
					 									 style="cursor: pointer; width:180px; height:150px; max-width: 100%;" alt="Image ${b.b_Pno}"></a></label>  <%-- ${b.p_Img} --%>
					 								</div>
					 								<div class="col-md-9">
					 									<div class="info">
						 									<div class="row">
							 									<div class="col-md-4 product-name" style="padding-right: 0px;">
							 										<div class="product-name">
																		<a href="/productdetail?productno=${b.b_Pno}">${b.p_Title}</a>
								 						
								 							
	<% String[] seed = {"감자", "고구마", "콩", "배추", "양상추", "상추", "수박",  "오이", "토마토",
 			        		"호박", "고추", "마늘", "파", "양파", "무", "당근", "깻잎"};
		List<String> list = Arrays.asList(seed);   %>
								 							
								 									<div class="product-info" style="text-align: left;">
								 									<label for="${i-1}">
																	<c:choose>
																		<c:when test="${b.p_Accept eq 'N'}">
 																			<div>씨앗: <span class="value"><select id="b_Seed${i-1}" name="basketbeanList[${now.index}].b_Seed" onFocus='this.initialSelect = this.selectedIndex;'
																						onChange='this.selectedIndex = this.initialSelect;' onchange="seedupdate(this.id)"> <!-- style="width:60%; float:right;" --> 
						 															  <option value="${b.b_Seed}" selected >${b.b_Seed} : 선택</option>
						 															  <% 	for(int i=0 ;i<seed.length;i++) {
																								if (!(seed[i].equals("basketList.getB_Seed()"))){       %>
																									<option value="<%=seed[i]%>"><%=seed[i]%></option>
																				 		<%    }
 			   																				}  %>
 			   																		</select></span></div> 
																		</c:when>
																		<c:otherwise>
																			<div>씨앗: <span class="value"><select id="b_Seed${i-1}" name="basketbeanList[${now.index}].b_Seed" onchange="seedupdate(this.id)"> <!-- style="width:60%; float:right;" --> 
																					  <option value="${b.b_Seed}" selected >${b.b_Seed} : 선택</option>
																					  <% 	for(int i=0 ;i<seed.length;i++) {
																								if (!(seed[i].equals("basketList.getB_Seed()"))){       %>
																									<option value="<%=seed[i]%>"><%=seed[i]%></option>
																				 		<%    }
 			   																				}  %>
 			   																		</select></span></div> 
 			   														  </c:otherwise>
																</c:choose>
																
																	<%-- <div>평당 가격: <span class="value" id="p_Landprice${i-1}">${b.p_Landprice}원</span></div> --%>
																	<fmt:formatNumber value="${b.p_Landprice }" pattern="#,###" var="landprice"/>
																	<div>평당 가격: <span class="value" id="Landprice${i-1}">${landprice}원</span></div>
																	
																	
																	<%-- <div>평당 노동력: <span class="value" id="p_Manpay${i-1}">${b.p_Manpay}원</span></div> --%>
																	<fmt:formatNumber value="${b.p_Manpay}" pattern="#,###" var="Manpay"/>
																	<div>평당 노동력: <span class="value" id="Manpay${i-1}">${Manpay}원</span></div>
																	</label>
																</div>
									 						</div>
							 							</div>
							 							<div class="col-md-3 quantity">
							 								<label for="land${i-1}"></label>
							 								<c:choose>
																<c:when test="${b.p_Accept eq 'N'}">
																	<input type="number" id="land${i-1}" min="1" max="" name="basketbeanList[${now.index}].b_Land" 
																			value="${b.b_Land}" disabled onchange="eachtotal(this.id)" class="form-control quantity-input"
																			style="width: 92px;">
																			<div>구매 불가. 품절</div>
 																</c:when>                                                                    
            													<c:otherwise>
            														<input type="number" id="land${i-1}" min="1" max="" name="basketbeanList[${now.index}].b_Land" 
            																value="${b.b_Land}" onchange="eachtotal(this.id)" class="form-control quantity-input"
            																style="width: 92px;">
            																
            														<input type="hidden" id="beforeland${i-1}" value="${b.b_Land}" />
            														
																</c:otherwise>
															</c:choose>
														
							 							</div>
							 							<div class="col-md-3 price" style="padding-right: 20px; padding-left: 00px; text-align: center;">
							 								<label for="${i-1}">
							 								<fmt:formatNumber value="${b.b_Totalprice}" pattern="#,###" var="ttotalprice"/>
															<span id="Totalprice${i-1}">${ttotalprice}원</span>
							 								<input type="hidden" id="p_Accept${i-1}" name="basketbeanList[${now.index}].p_Accept" value="${b.p_Accept}" />
 															<input type="hidden" id="b_Pno${i-1}" name="basketbeanList[${now.index}].b_Pno" value="${b.b_Pno}" />
 															<input type="hidden" id="b_Id${i-1}" name="basketbeanList[${now.index}].b_Id" value="${b.b_Id}" />
 															<input type="hidden" id="b_No${i-1}" name="basketbeanList[${now.index}].b_No" value="${b.b_No}" />
 															<input type="hidden" id="p_Img${i-1}" name="basketbeanList[${now.index}].p_Img" value="${b.p_Img}" />
 															<input type="hidden" id="p_Title${i-1}" name="basketbeanList[${now.index}].p_Title" value="${b.p_Title}" />
 															<input type="hidden" id="p_Manpay${i-1}" name="basketbeanList[${now.index}].p_Manpay" value="${b.p_Manpay}" />
 															<input type="hidden" id="p_Landprice${i-1}" name="basketbeanList[${now.index}].p_Landprice" value="${b.p_Landprice}" />
 															<input type="hidden" id="b_Totalprice${i-1}" name="basketbeanList[${now.index}].b_Totalprice" value="${b.b_Totalprice}" />
 															</label>
 														</div>
							 						
							 							<div class="col-md-2 price" style="padding-left: 0px; margin-left: 0px;">
							 								<c:set var = "title" value = "${b.p_Title}"/>
							 									<label for="${i-1}">
 																<div><span class="value" id="delivery${i-1}">3,000원</span></div>
 																</label>
 														</div>
							 						</div>
							 					</div>
					 						</div>
					 					</div>
				 					</div>
				 				</c:forEach>
				 			</form:form>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="col-7 col-sm-5 col-md-4 col-lg-3">  <!--   d-none d-sm-block-->
				<div class="summary" id="floatMenu" style="top: 130px; height: 420px;">  <!-- position: absolute;  width: 255px; max-width: 36.5% -->
			 		<h3>선택 합계</h3>
			 			<div class="summary-item"><span class="text">상품수</span><span class="price" id="choosecount" value="0">0개</span></div>
			 			<div class="summary-item"><span class="text">상품 금액</span><span class="price" id="producttotal" value="0">0원</span></div>
			 			<div class="summary-item"><span class="text">배송비</span><span class="price" id="deliverytotal" value="0">0원</span></div>
			 			<div class="summary-item"><span class="text">Total</span><span class="price" id="finaltotal" value="0">0원</span></div>
			 			<button type="submit" form="basket" value="구매하기" onclick="checkbuy();" class="btn btn-primary btn-lg btn-block">구매하기</button>
			 	</div>
			</div>
	<!-- 		<div class="d-block d-sm-none col 7">
				<div class="summary" id="floatMenu" style="top: 130px; height: 420px;">  position: absolute;  width: 255px; max-width: 36.5%
			 		<h3 style="font-size: 18px;">선택 합계</h3>
			 			<div class="summary-item" style="font-size: 13px;"><span class="text">상품수</span><span class="price" id="choosecount" value="0">0개</span></div>
			 			<div class="summary-item"><span class="text">상품 금액</span><span class="price" id="producttotal" value="0">0원</span></div>
			 			<div class="summary-item"><span class="text">배송비</span><span class="price" id="deliverytotal" value="0">0원</span></div>
			 			<div class="summary-item"><span class="text">Total</span><span class="price" id="finaltotal" value="0">0원</span></div>
			 			<button type="submit" form="basket" value="구매하기" onclick="checkbuy();" class="btn btn-primary btn-lg btn-block">구매하기</button>
			 	</div>
			</div> -->
			 	<!-- <span id="brr"></span> -->
			 </div> 
		   </div>
	 	</section>
	</main>
</body>
<script type="text/javascript">
	var check_length = 0;
	var allcheckbox_length = $("input:checkbox[name='choose']").length;
    var $checkok = 0; 
    var index_i_arr = [];
    var producttotal = 0;
    var delivery = "";
    var deliverytotal = 0;
    
    var onlynumber = 0;
	var eachtotalvar = 0;
	var checktrue = false;
	
	var product = "";
	var landprice = "";
	var manpay = "";
	var productalltotal = 0;
	var deliveryalltotal = 0;
	
    function paybox() {
        check_length = $("input:checkbox[name='choose']:checked").length;
        index_i_arr.length = 0;
        
        for (var j = 0; j < allcheckbox_length; j++) {
        	$checkok = $('#'+j);
        	if($checkok.prop('checked')) {
        		index_i_arr.push(j);
        	}
        }
        producttotal = 0;
        deliverytotal = 0;
        
     	for (var k = 0; k < check_length; k++) {
     		producttotal += ($('#b_Totalprice'+index_i_arr[k]).val() * 1);
     	
     		delivery = $('#delivery'+index_i_arr[k]).text().replace(/[^0-9]/g,'');
     		deliverytotal += (delivery * 1);
        }
     	var finaltotal = (producttotal + deliverytotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
     	
    /*  	producttotal = producttotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     	deliverytotal = deliverytotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); */
     	
     	
		document.getElementById("producttotal").innerHTML = producttotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		document.getElementById("deliverytotal").innerHTML = deliverytotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		document.getElementById("finaltotal").innerHTML = finaltotal + "원";
		document.getElementById("choosecount").innerHTML = check_length + "개";
    }
    
    function eachtotal(clicked_id) {
    	onlynumber = clicked_id.replace(/[^0-9]/g,'');
    	index_i_arr.length = 0;
    	check_length = $("input:checkbox[name='choose']:checked").length;
    	/* product = $('#b_Totalprice'+onlynumber).text().replace(/[^0-9]/g,'');
    	landprice = $('#p_Landprice'+onlynumber).text().replace(/[^0-9]/g,'');
    	manpay = $('#p_Manpay'+onlynumber).text().replace(/[^0-9]/g,''); */
    	
    	
    	if($('#'+clicked_id).val() <= 0) {
    		alert("주문 가능한 최소 수량은 1개 입니다.");
    		document.getElementById(clicked_id).value = $('#beforeland'+onlynumber).val();
    		return false;
    	}
    	
    	if($('#'+clicked_id).val().indexOf('.') !== -1) {
    		alert("숫자를 입력해주세요.");
    		document.getElementById(clicked_id).value = $('#beforeland'+onlynumber).val();
    		return false;
    	}
    	
        for (var j = 0; j < allcheckbox_length; j++) {
        	$checkok = $('#'+j);
          	if($checkok.prop('checked')) {
        		index_i_arr.push(j);
        	}
        }
    	for (var k = 0; k < check_length; k++) {
    		if (index_i_arr[k] == onlynumber) {
    			checktrue = true;
    		}
    	}
    	
    	var leftzerodelete = 0;
    	leftzerodeleteval = ($('#'+clicked_id).val().replace(/(^0+)/, "") * 1);
    	
    	if (checktrue) {
    		producttotal = producttotal - ($('#b_Totalprice'+onlynumber).val() * 1);
			eachtotalvar =(leftzerodeleteval * ($('#p_Landprice'+onlynumber).val() * 1)) +  (leftzerodeleteval *($('#p_Manpay'+onlynumber).val() * 1));
			document.getElementById("Totalprice"+onlynumber).innerHTML = eachtotalvar + "원";
			/* document.getElementById("Totalprice"+onlynumber).value = eachtotalvar;  */
			/* product = $('#b_Totalprice'+onlynumber).text().replace(/[^0-9]/g,''); */
			
			/* producttotal = producttotal + ($('#b_Totalprice'+onlynumber).val() * 1); */
			producttotal = producttotal + (eachtotalvar * 1);
			document.getElementById("producttotal").innerHTML = producttotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
			document.getElementById("finaltotal").innerHTML = (producttotal + deliverytotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
			checktrue = false;
		} else {
			eachtotalvar =(leftzerodeleteval * ($('#p_Landprice'+onlynumber).val() * 1)) +  (leftzerodeleteval *($('#p_Manpay'+onlynumber).val() * 1));
			document.getElementById("Totalprice"+onlynumber).innerHTML = eachtotalvar + "원";
			/* document.getElementById("Totalprice"+onlynumber).value = eachtotalvar; */
		}
		var bno = $('#'+onlynumber).val() * 1;
		var land = $('#land'+onlynumber).val() * 1;
		var price = eachtotalvar * 1;
		document.getElementById("beforeland"+onlynumber).value = land;
		window.location.href = "/basketUpdate?bno="+bno+"&land="+land+"&price="+price+"&checkindex="+index_i_arr;
	} 
    
    
    function seedupdate(clicked_id) {
    	onlynumber = clicked_id.replace(/[^0-9]/g,'');
    	index_i_arr.length = 0;
    	check_length = $("input:checkbox[name='choose']:checked").length;
    	
        for (var j = 0; j < allcheckbox_length; j++) {
        	$checkok = $('#'+j);
          	if($checkok.prop('checked')) {
        		index_i_arr.push(j);
        	}
        }
        var bno = $('#'+onlynumber).val() * 1;
        var seed = $('#b_Seed'+onlynumber).val();
        window.location.href = "/basketSeedUpdate?bno="+bno+"&seed="+seed+"&checkindex="+index_i_arr;
    	
    }
    
    $(document).on('click','#checkall',function(){
			if($("#checkall").prop("checked")){
        		$("input[name=choose]").prop("checked",true);
        		for (var i = 0; i < allcheckbox_length; i++) {
        			if($('#p_Accept'+i).val() == 'N') {
        				$('#'+i).prop("checked",false);
        			}
        		 }
        		check_length = $("input:checkbox[name='choose']:checked").length;
                index_i_arr.length = 0;
                for (var j = 0; j < allcheckbox_length; j++) {
                	$checkok = $('#'+j);
                	if($checkok.prop('checked')) {
                		index_i_arr.push(j);
                	}
                }
                producttotal = 0;
                deliverytotal = 0;
             	for (var k = 0; k < check_length; k++) {
             		/* product = $('#b_Totalprice'+index_i_arr[k]).text().replace(/[^0-9]/g,''); 
             		producttotal += (product * 1);*/
             		producttotal += ($('#b_Totalprice'+index_i_arr[k]).val() * 1);
             		
             		delivery = $('#delivery'+index_i_arr[k]).text().replace(/[^0-9]/g,'');
             		deliverytotal += (delivery * 1);
                }
        		document.getElementById("producttotal").innerHTML = producttotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
        		document.getElementById("deliverytotal").innerHTML = deliverytotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
        		document.getElementById("finaltotal").innerHTML = (producttotal + deliverytotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
        		document.getElementById("choosecount").innerHTML = check_length + "개";
        		
        		/* productalltotal = 0;
            	deliveryalltotal = 0;
            	for (var i = 0; i < allcheckbox_length; i++) {
            		productalltotal += ($('#b_Totalprice'+i).val() * 1);
            		deliveryalltotal += ($('#delivery'+i).val() * 1)
            		document.getElementById("producttotal").value = productalltotal;
            		document.getElementById("deliverytotal").value = deliveryalltotal;
            		document.getElementById("finaltotal").value = productalltotal - (productalltotal * 0.03) + deliveryalltotal; 
            	} */
            }else{
                $("input[name=choose]").prop("checked",false);
                document.getElementById("producttotal").innerHTML = 0 + "원";
        		document.getElementById("deliverytotal").innerHTML = 0 + "원";
        		document.getElementById("finaltotal").innerHTML = 0 + "원";
        		document.getElementById("choosecount").innerHTML = 0 + "개";
            }
        })
   /*  }) */
               
	$(document).on('click','input[name=choose]',function(){
    	if($('input[name=choose]:checked').length==$('input[name=choose]').length){
        	$('#checkall').prop('checked',true);
        }else{
            $('#checkall').prop('checked',false);
        }
	});
    
	window.onload = function () {
		var checkarr = [];
		<c:if test="${checkindex ne null}">
			<c:forEach items="${checkindex}" var="c"> 
				checkarr.push("${c}"); 
			</c:forEach>
			for(var i=0; i < checkarr.length; i++) {
				$('#'+checkarr[i]).prop("checked",true);
			}
			paybox();
		</c:if>
	} 
	
	$(document).ready(function () {
		if (localStorage.getItem("my_app_name_here-quote-scroll") != null) {
	        $(window).scrollTop(localStorage.getItem("my_app_name_here-quote-scroll"));
	       /*   alert("1:::: "+localStorage.getItem("my_app_name_here-quote-scroll")); */
	    }
		 $(window).on("scroll", function() {
	        localStorage.setItem("my_app_name_here-quote-scroll", $(window).scrollTop());
	    });
	});
	
	
	function checkbuy() {
		var check_length = $("input:checkbox[name='choose']:checked").length;
		if(check_length == 0){
			alert("주문하실 상품을 선택해주세요.");
			event.preventDefault();
		}else {
			return true;
		}
	}
	
	function checkremove() {
		var check_length = $("input:checkbox[name='choose']:checked").length;
		var allcheckbox_length = $("input:checkbox[name='choose']").length;
		index_i_arr.length = 0;
		var bno = [];
		if(check_length == 0){
			alert("선택하신 상품이 없습니다. 삭제를 원하시는 상품을 선택해주세요.");
		}else {
			if (confirm('선택하신 상품을 삭제하시겠습니까?')) {  
				  for (var j = 0; j < allcheckbox_length; j++) {
				    	var $checkok = $('#'+j);
				      	if($checkok.prop('checked')) {
				    		index_i_arr.push(j);
				    	}
				    }
				  for (var j = 0; j < check_length; j++) {
				 			bno.push($('#'+index_i_arr[j]).val() * 1);
				  }
				  window.location.href = "/basketdelete?bno="+bno;
			} else{   
				return false;
			}
		}
	}
	
	function allremove() {
		if (confirm('모든 상품을 삭제하시겠습니까?')) {  
			window.location = '/basketalldelete';
		} else{   
			return false;
		}
	}
	
	function zeroremove() {   
		var soldout = true;
		var allcheckbox_length = $("input:checkbox[name='choose']").length;
		var accept = [];
		
		for (var i = 0; i < allcheckbox_length; i++) {
			accept.push($('#p_Accept'+i).val());
		}
		if(soldout) {
			if(!(accept.includes('N'))){
				soldout = false;
			}
			if(soldout == false){
				alert("품절된 상품이 없습니다.");
			}
		}
		if(soldout) {
			if (confirm('품절된 상품을 모두 삭제하시겠습니까?')) {  
				window.location = '/basketzerodelete';
			} else{   
				return false;
			}
		}
	}
	

	function captureReturnKey(e) { 
	    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
	    return false; 
	} 

 
/* 	원본!! $(document).ready(function() {
		
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);
			 

			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500);

		}).scroll();

	}); */

	
	$(window).scroll(  
		    function(){  
		        //스크롤의 위치가 상단에서 450보다 크면  
		        if($(window).scrollTop() > 450){  
		        /* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */  
		            $("#floatMenu").addClass("fix");  
		            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		       
		        }else{
		        	  $("#floatMenu").removeClass("fix");  
			            //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
		        }
		    }     
		);
	
/* 	sticky 있어서 필요 없어짐.
	$(function() {

		  var $w = $(window),
		    footerHei = $('footer').outerHeight(),
		    $banner = $('#floatMenu');

		  $w.on('scroll', function() {

		    var sT = $w.scrollTop();
		    var val = $(document).height() - $w.height() - footerHei + 200;

		    if (sT >= val)
		        $banner.addClass('on')
		    else
		    	$banner.removeClass('on')

		  });

		}); */
	
	
</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<footer>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</footer>
</body>
</html>
    
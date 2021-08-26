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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="assets/css/style.css">

	

<style type="text/css">

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
	background-color: #f6f6f6;
}

.shopping-cart .content{
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
	background-color: white;
}

.shopping-cart .block-heading{
    padding-top: 50px;
    margin-bottom: 40px;
    text-align: center;
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
	color: #3b99e0;
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
	border-top: 2px solid #5ea4f3;
    background-color: #f7fbff;
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
</style>	
	
</head>
<body>
	<main class="page">
	 	<section class="shopping-cart dark">

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
    var deliverytotal = 0;
    
    var onlynumber = 0;
	var eachtotalvar = 0;
	var checktrue = false;
	
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
     		deliverytotal += ($('#delivery'+index_i_arr[k]).val() * 1);
        }
		document.getElementById("producttotal").value = producttotal;
		document.getElementById("deliverytotal").value = deliverytotal;
		document.getElementById("discount").value = producttotal * 0.03;
		document.getElementById("finaltotal").value = producttotal - (producttotal * 0.03) + deliverytotal;
		document.baskettotal.choosecount.value = check_length
    }
    
    function eachtotal(clicked_id) {
    	onlynumber = clicked_id.replace(/[^0-9]/g,'');
    	index_i_arr.length = 0;
    	check_length = $("input:checkbox[name='choose']:checked").length;
    	
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
    	if (checktrue) {
			producttotal = producttotal - ($('#b_Totalprice'+onlynumber).val() * 1);
			eachtotalvar = $('#'+clicked_id).val() * $('#p_Landprice'+onlynumber).val() * $('#p_Manpay'+onlynumber).val();
			document.getElementById("b_Totalprice"+onlynumber).value = eachtotalvar;
			producttotal = producttotal + ($('#b_Totalprice'+onlynumber).val() * 1);
			document.getElementById("producttotal").value = producttotal;
			document.getElementById("discount").value = producttotal * 0.03;
			document.getElementById("finaltotal").value = producttotal - (producttotal * 0.03) + deliverytotal;
			checktrue = false;
		} else {
			eachtotalvar = $('#'+clicked_id).val() * $('#p_Landprice'+onlynumber).val() * $('#p_Manpay'+onlynumber).val();
			document.getElementById("b_Totalprice"+onlynumber).value = eachtotalvar;
		}
		var bno = $('#'+onlynumber).val() * 1;
		var land = $('#land'+onlynumber).val() * 1;
		var price = $('#b_Totalprice'+onlynumber).val() * 1;
		window.location.href = "http://localhost:8090/basketUpdate?bno="+bno+"&land="+land+"&price="+price+"&checkindex="+index_i_arr;
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
        window.location.href = "http://localhost:8090/basketSeedUpdate?bno="+bno+"&seed="+seed+"&checkindex="+index_i_arr;
    	
    }
    
    $(document).on('click','#checkall',function(){
			if($("#checkall").prop("checked")){
        		$("input[name=choose]").prop("checked",true);
        		for (var i = 0; i < allcheckbox_length; i++) {
        			if(($('#p_Landavailable'+i).val() * 1) == 0 || $('#p_Accept'+i).val() == 'N') {
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
             		producttotal += ($('#b_Totalprice'+index_i_arr[k]).val() * 1);
             		deliverytotal += ($('#delivery'+index_i_arr[k]).val() * 1);
                }
        		document.getElementById("producttotal").value = producttotal;
        		document.getElementById("deliverytotal").value = deliverytotal;
        		document.getElementById("discount").value = producttotal * 0.03;
        		document.getElementById("finaltotal").value = producttotal - (producttotal * 0.03) + deliverytotal;
        		document.baskettotal.choosecount.value = check_length
        		/* productalltotal = 0;
            	deliveryalltotal = 0;
            	for (var i = 0; i < allcheckbox_length; i++) {
            		productalltotal += ($('#b_Totalprice'+i).val() * 1);
            		deliveryalltotal += ($('#delivery'+i).val() * 1)
            		document.getElementById("producttotal").value = productalltotal;
            		document.getElementById("deliverytotal").value = deliveryalltotal;
            		document.getElementById("discount").value = productalltotal * 0.03;
            		document.getElementById("finaltotal").value = productalltotal - (productalltotal * 0.03) + deliveryalltotal; 
            	} */
            }else{
                $("input[name=choose]").prop("checked",false);
                document.getElementById("producttotal").value = 0;
        		document.getElementById("deliverytotal").value = 0;
        		document.getElementById("discount").value = 0;
        		document.getElementById("finaltotal").value = 0;
        		document.getElementById("choosecount").value = 0;
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
			if (confirm('선택하신 상품을 삭제하시겠습니까??')) {  
				  for (var j = 0; j < allcheckbox_length; j++) {
				    	var $checkok = $('#'+j);
				      	if($checkok.prop('checked')) {
				    		index_i_arr.push(j);
				    	}
				    }
				  for (var j = 0; j < check_length; j++) {
				 			bno.push($('#'+index_i_arr[j]).val() * 1);
				  }
				  window.location.href = "http://localhost:8090/basketdelete?bno="+bno;
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
		var landavailable = [];
		var accept = [];
		
		for (var i = 0; i < allcheckbox_length; i++) {
			landavailable.push($('#p_Landavailable'+i).val() * 1);
			accept.push($('#p_Accept'+i).val());
		}
		if(soldout) {
			if(!(landavailable.includes(0)) || !(accept.includes('N'))){
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
	
</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
    
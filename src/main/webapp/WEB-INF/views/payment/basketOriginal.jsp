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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>장바구니</title>
</head>
<body>

<h2>장바구니</h2> <h4>전체 <%=count %></h4>

<c:choose>   
	<c:when test = "${empty basketList}">  
		<tr><td colspan="9">내역이 없습니다.</td></tr>
	</c:when>
	<c:when test = "${basketList != null}">

<%-- <form action="basketdelete" id="basket" name="basketdelete" method="post" >  --%>
<form:form action="PaymentInfo" id="basketbean" name="basketbean" commandName="basketbean" method="post" onkeydown="return captureReturnKey(event)">

<table border="1" cellpadding="0" cellspacing="0">
	<input type="button" id="submit" value="선택 삭제" onclick="checkremove();"/> 
    <input type="button" id="zerodelete" value="장바구니 비우기" onclick="allremove();"/>  
    <input type="button" id="zerodelete" value="품절 상품 지우기" onclick="zeroremove();"/> 
	<input type="submit" form="basketbean" value="구매하기" onclick="checkbuy();"/> 
	
	
	<thead>
		<tr>
 			<th><input type="checkbox" id="checkall" name="checkall" value="전체 선택"/></th>
 			<th>이미지</th>
 			<th>상품 이름</th>
 			<th>땅 사이즈</th>
 			<th>씨앗</th>
			<th>평당 가격</th>
			<th>평당 노동력</th>
			<th>총 가격</th>
			<th>배송비</th>
			
<!-- 		<th bgcolor="orange" width="200">상품 번호</th>
			<th bgcolor="orange" width="200">대종류</th>
			<th bgcolor="orange" width="200">상품 이름</th>
			<th bgcolor="orange" width="200">땅 사이즈</th>
			<th bgcolor="orange" width="200">땅 가격</th>
			<th bgcolor="orange" width="200">씨앗</th>
			<th bgcolor="orange" width="200">씨앗 가격</th>
			<th bgcolor="orange" width="200">씨앗 갯수</th>
			<th bgcolor="orange" width="200">유지비</th>
			<th bgcolor="orange" width="200">총 가격</th>
			<th bgcolor="orange" width="200">배송비</th> 			-->
		</tr>
	</thead>
	
	<tbody>
	<%-- 	<c:choose>   
        	<c:when test = "${empty basketList}">  
				<tr><td colspan="9">내역이 없습니다.</td></tr>
			</c:when>
			<c:when test = "${basketList != null}"> --%>
				
	<c:forEach items="${basketList }" var="b" varStatus="now">
	<%-- <c:forEach var=" i " begin=" 1 " end=" ${b.size()} " step=" 1 "> --%> 

	<c:set var="i" value="${i+1}"/> 
	   
		<tr>
			<c:choose>
				<c:when test="${b.p_Landavailable eq 0}">
					<td><label><input type="checkbox" id="${i-1}" name="choose" value="${b.b_No}" onchange="paybox()" disabled/></label></td>
				</c:when>
				<c:when test="${b.p_Accept eq 'N'}">
					<td><label><input type="checkbox" id="${i-1}" name="choose" value="${b.b_No}" onchange="paybox()" disabled/></label></td>
				</c:when>
				<c:otherwise>
					<td><label><input type="checkbox" id="${i-1}" name="choose" value="${b.b_No}" onchange="paybox()"/></label></td>
				</c:otherwise>
			</c:choose>
			
			<td><label><input type="text" id="img" name="basketbeanList[${now.index}].p_Img" class="form-control" value="${b.p_Img}, ${b.b_Pno}"/></label></td>
<%--        <td align="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td> --%>
 			<td><label><input type="text" id="title" name="basketbeanList[${now.index}].p_Title" class="form-control" value="${b.p_Title}"/></label></td>
 
 			<c:choose>
				<c:when test="${b.p_Landavailable eq 0 or b.p_Accept eq 'N'}">
					<td><input type="number" id="land${i-1}" min="1" max="${b.p_Landavailable }" name="basketbeanList[${now.index}].b_Land" value="${b.b_Land}" disabled onchange="eachtotal(this.id)">
 						<div>구매 불가. 품절</div></td>
 			  	</c:when>                                                                    
            	<c:otherwise>
            		<td><input type="number" id="land${i-1}" min="1" max="${b.p_Landavailable }" name="basketbeanList[${now.index}].b_Land" value="${b.b_Land}" onchange="eachtotal(this.id)">
            			<div>${b.p_Landavailable}까지 선택 가능</div></td>
            	</c:otherwise>
             </c:choose>
 			
 			<% String[] seed = {"감자", "고구마", "콩", "배추", "양상추",
 			        "상추", "수박",  "오이", "토마토",
 			        "호박", "고추", "마늘", "파", "양파", "무", "당근", "깻잎"};
				List<String> list = Arrays.asList(seed);   %>
 			
 			<c:choose>
				<c:when test="${b.p_Landavailable eq 0 or b.p_Accept eq 'N'}">
 					<td><select id="b_Seed${i-1}" name="basketbeanList[${now.index}].b_Seed" onFocus='this.initialSelect = this.selectedIndex;'
						onChange='this.selectedIndex = this.initialSelect;' onchange="seedupdate(this.id)"> <!-- style="width:60%; float:right;" --> 
						<option value="${b.b_Seed}" selected >${b.b_Seed} : 선택</option>
				</c:when>
				<c:otherwise>
					<td><select id="b_Seed${i-1}" name="basketbeanList[${now.index}].b_Seed" onchange="seedupdate(this.id)"> <!-- style="width:60%; float:right;" --> 
						<option value="${b.b_Seed}" selected >${b.b_Seed} : 선택</option>
			
				</c:otherwise>
			</c:choose>
			
			<% 	for(int i=0 ;i<seed.length;i++) {
				if (!(seed[i].equals("basketList.getB_Seed()"))){       %>
			
 						<option value="<%=seed[i]%>"><%=seed[i]%></option>
 				
 			<%  }
 			   }  %>
 			   		</select></td>
 			
			<%
                           DecimalFormat df = new DecimalFormat("###,###");
		
            %>
 			  
 			<td><label><input type="text" id="p_Landprice${i-1}" name="basketbeanList[${now.index}].p_Landprice" class="form-control" value="${b.p_Landprice}"/></label>원</td>
 			<td><label><input type="text" id="p_Manpay${i-1}" name="basketbeanList[${now.index}].p_Manpay" class="form-control" value="${b.p_Manpay}"/>원</label></td>
 			
 			<td><label><input type="text" id="b_Totalprice${i-1}" name="basketbeanList[${now.index}].b_Totalprice" class="form-control" value="${b.b_Totalprice}"/>원
 				<input type="hidden" id="p_Landavailable${i-1}" name="basketbeanList[${now.index}].p_Landavailable" value="${b.p_Landavailable}" />
 				<input type="hidden" id="p_Accept${i-1}" name="basketbeanList[${now.index}].p_Accept" value="${b.p_Accept}" />
 				<input type="hidden" id="b_Pno${i-1}" name="basketbeanList[${now.index}].b_Pno" value="${b.b_Pno}" />
 				<input type="hidden" id="b_Id${i-1}" name="basketbeanList[${now.index}].b_Id" value="${b.b_Id}" />
 				<input type="hidden" id="b_No${i-1}" name="basketbeanList[${now.index}].b_No" value="${b.b_No}" /></label></td>
 			
 			<c:set var = "title" value = "${b.p_Title}"/>
 			<c:choose>
 				<c:when test="${fn:contains(title, '제주도')}">
 					<td><label><input type="text" id="delivery${i-1}" name="delivery" class="form-control" value="5000"/>원</label></td>
 				</c:when>
 				<c:otherwise>
 					<td><label><input type="text" id="delivery${i-1}" name="delivery" class="form-control" value="3000"/>원</label></td>
 				</c:otherwise>
 			</c:choose>
 			
 			<%-- <c:out value="${b.p_Landavailable}" /> --%>
 			
					</tr>
				</c:forEach>
			<%-- </c:when>
		</c:choose> --%>
	</tbody>
</table>
</form:form>
<%-- </form> --%>
<br>
<br>

<hr>
<form action="basketdelete" id="baskettotal" name="baskettotal" method="post" >   
<table border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>상품수</th>
			<th>상품 금액</th>
			<th>- 할인금액</th>
			<th>+ 배송비</th>
			<th>결제 예정 금액</th>
		</tr>
	</thead>
	
		<tr>
			<td><input type="text" id="choosecount" name = "choosecount" value="0">개</td>
			<td><input type="text" id="producttotal" value="0">원</td>
			<td><input type="text" id="discount" value="0">원</td>
			<td><input type="text" id="deliverytotal" value="0">원</td>
			<td><input type="text" id="finaltotal" value="0">원</td>
		</tr>
		
</table>
</form>	

</c:when>
</c:choose>
<%-- <script type="text/javascript">
 	<% for(int i=0;i<basketList.size();i++){%> 
	var t = document.getElementById('img');

	t.addEventListener('change', function(event){

	    document.getElementById('title').innerHTML=event.img.value;

	});
	<% } %>
</script> --%>

<!-- style = "text-align:right;" -->
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


	
</body>
</html>
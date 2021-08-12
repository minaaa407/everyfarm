<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="kr.co.everyfarm.basket.BasketBean"%>


<%
 	List<BasketBean> basketList = (List)request.getAttribute("basketList"); 
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

<h2>장바구니</h2>

 <form action="basketdelete" name="basketdelete" method="post" >   
<table border="1" cellpadding="0" cellspacing="0">
	 <input type="submit" id="submit" value="선택 삭제">
            
	<thead>
		<tr>
 			<th><input type="checkbox" value="${i}"/></th>
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
	
	
				
 	<%-- <%
	  for(int i=0;i<basketList.size();i++){
	%> --%>
	<c:forEach items="${basketList }" var="b">
	<%-- <c:forEach var=" i " begin=" 1 " end=" ${b.size()} " step=" 1 "> --%> 

	<c:set var="i" value="${i+1}"/>    
		
		<tr>
			<td><label><input type="checkbox" id="${i-1}" name="choose" value="${b.b_No}" onchange="paybox()"/></label></td>
			<td><label><input type="text" id="img" name="p_Img" class="form-control" value="${b.p_Img}, ${b.b_No}"/></label></td>
<%--        <td align="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td> --%>
 			<td><label><input type="text" id="title" name="p_Title" class="form-control" value="${b.p_Title}"/></label></td>
 
 			<c:choose>
				<c:when test="${b.p_Landavailable eq 0}">
					<td><input type="number" id="land${i-1}" min="1" max="${b.p_Landavailable }" name="b_Land${i-1}" value="${b.b_Land}" disabled onchange="eachtotal(this.id)">
 						<div>구매 불가. 품절</div></td>
 			  	</c:when>
            	<c:when test="${b.p_Landavailable ne 0}">
            		<td><input type="number" id="land${i-1}" min="1" max="${b.p_Landavailable }" name="b_Land${i-1}" value="${b.b_Land}" onchange="eachtotal(this.id)">
            			<div>${b.p_Landavailable}까지 선택 가능</div></td>
            	</c:when>
             </c:choose>
 			
 			<% String[] seed = {"감자", "고구마", "콩", "배추", "양상추",
 			        "상추", "수박",  "오이", "토마토",
 			        "호박", "고추", "마늘", "파", "양파", "무", "당근", "깻잎"};

 				List<String> list = Arrays.asList(seed);   %>
 			
 			<td><select id="b_Seed" name="b_Seed" > <!-- style="width:60%; float:right;" --> 
				<option value="${b.b_Seed}" selected>${b.b_Seed} : 선택</option>
				
 			
 			<% 	for(int i=0 ;i<seed.length;i++) {
				if (!(seed[i].equals("basketList.getB_Seed()"))){       %>
			
 				<option value="<%=seed[i]%>"><%=seed[i]%></option>
 				
 			<%  }
 			   }  %>
 			   </select></td>
 			   
 			<td><label><input type="text" id="p_Landprice${i-1}" name="p_Landprice${i-1}" class="form-control" value="${b.p_Landprice}"/></label></td>
 			<td><label><input type="text" id="p_Manpay${i-1}" name="p_Manpay${i-1}" class="form-control" value="${b.p_Manpay}"/></label></td>
 			
 			<td><label><input type="text" id="b_Totalprice${i-1}" name="b_Totalprice${i-1}" class="form-control" value=" ${b.b_Totalprice}"/></label></td>
 			
 			<td><label><input type="text" id="delivery${i-1}" name="delivery" class="form-control" value="3000"/></label></td>
 			
 			<%-- <c:out value="p_Manpay${i-1}" /> --%>
 		
			</tr>

	</c:forEach>
	
	
		
</table>
</form>
<br>
<br>

<hr>

<table border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>상품 금액</th>
			<th>- 할인금액</th>
			<th>+ 배송비</th>
			<th>결제 예정 금액</th>
		</tr>
	</thead>
	
		<tr>
			<td><input type="text" id="producttotal" value="0"></td>
			<td><input type="text" id="discount" value="0"></td>
			<td><input type="text" id="deliverytotal" value="0"></td>
			<td><input type="text" id="finaltotal" value="0"></td>
		</tr>
</table>

<!-- <script type="text/javascript">
	var onlynumber = 0;
	var eachtotalvar = 0;

	function eachtotal(clicked_id) {
		onlynumber = clicked_id.replace(/[^0-9]/g,'');
		eachtotalvar = $('#'+clicked_id).val() * $('#p_Landprice'+onlynumber).val() * $('#p_Manpay'+onlynumber).val();
		document.getElementById("b_Totalprice"+onlynumber).value = eachtotalvar;
	}  
	
</script> -->
	
<%-- <script type="text/javascript">
 	<% for(int i=0;i<basketList.size();i++){%> 
	var t = document.getElementById('img');

	t.addEventListener('change', function(event){

	    document.getElementById('title').innerHTML=event.img.value;

	});
	<% } %>
</script> --%>


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
		
    }  
    
</script>


	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>장바구니</title>
</head>
<body>

<h2>장바구니</h2>

<table border="1" cellpadding="0" cellspacing="0">
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
			<td><label><input type="checkbox" value="${i}"/></label></td>
			<td><label><input type="text" id="img" name="p_Img" class="form-control" value="${b.p_Img}"/></label></td>
<%--        <td align="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td> --%>
 			<td><label><input type="text" id="title" name="p_Title" class="form-control" value="${b.p_Title}"/></label></td>
 			<td><input type="number" min="1" max="${b.p_Landavailable }" name="b_Land" value="${b.b_Land}"></td>
 			
 			
 			<td><label><input type="text" id="title" name="b_Seed" class="form-control" value="${b.b_Seed}"/></label></td>
 			<td><label><input type="text" id="title" name="p_Landprice" class="form-control" value="${b.p_Landprice}"/></label></td>
 			<td><label><input type="text" id="title" name="p_Manpay" class="form-control" value="${b.p_Manpay}"/></label></td>
 			<td><label><input type="text" id="title" name="b_Totalprice" class="form-control" value=" ${b.b_Totalprice}"/></label></td>
 			
 			<td><label><input type="text" id="title" name="delivery" class="form-control" value="3,000원"/></label></td>
 			
 			
 <%-- 	<%
	  for(int j=0;j<occurance[i];j++){
	%> --%>
 			
	
			<!--  <select>
             	<option value="ebony">에보니(흑단나무)</option>
              	<option value="cherry">체리(벚나무)</option>
                <option value="oak">오크(참나무)</option>
                <option value="alder" selected>앨더(오리나무)</option>
                <option value="chamaecyparis">편백(노송나무)</option>
             </select> -->
			
		</tr>
	<%-- </c:forEach> --%>
	</c:forEach>
	
		<%-- <%
	 		 }
		%> --%>
		
		
		
		
</table>

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
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
</table>



</body>
</html>
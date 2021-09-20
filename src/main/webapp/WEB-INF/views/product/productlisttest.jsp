<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<script>
function button_click(number,value) {
	

	var count = document.getElementById("t" + number).value;
	 //var seedcount = ${fn:split(p.p_Seedcount,',')[number]};
	// var seedprice = ${fn:split(p.p_Seedprice,',')[number]};


	 total = count * value;

	
	
	 document.getElementById("a" + number).innerText = ("총가격" + total);
	 document.getElementById("c" + number).innerText = ("갯수 :"+count );

     // 요소의 콘텐츠를 변경합니다.
     
	
	
}
</script>
</head>
<body>


                   	<c:forEach var="p" items="${productlist }">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                       
								${p.p_No} ${p.p_Title} ${p.p_Id}${p.p_Title} ${p.p_Content} ${p.p_Image} ${p.p_Imagedetail} ${p.p_Land}
									  ${p.p_Landprice} ${p.p_Main} ${p.p_Sub} ${p.p_Seedprice} ${p.p_Manpay} ${p.p_Delivery} ${p.p_Accept}
									  
									  <!--   ${p.p_Id}${p.p_Title} ${p.p_Content} ${p.p_Image} ${p.p_Imagedetail} ${p.p_Land}
									  ${p.p_Landprice} ${p.p_Main} ${p.p_Sub} ${p.p_Seedprice} ${p.p_Manpay} ${p.p_Delivery} ${p.p_Accept}
									  -->
							
	                        </div>
					 </c:forEach> 
					 
					 
					 <br/>
					  <br/>
					   <br/>
					    <br/>
					     <br/>
					     
                   	<c:forEach var="p" items="${productlist }" varStatus="st">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
								${p.p_No} ${p.p_Title} ${p.p_Id}${p.p_Title} ${p.p_Content} ${p.p_Image} ${p.p_Imagedetail} ${p.p_Land}
									  ${p.p_Landprice} ${p.p_Main} ${p.p_Sub} ${p.p_Seedprice} ${p.p_Manpay} ${p.p_Delivery} ${p.p_Accept}
								
									<c:forEach items="${fn:split(p.p_Seedprice, ',') }" var="item" varStatus="status">
										<br/>
												큰거 번호  ${st.index}
												    ${status.index}
												    ${p.p_Main}
										<p id = "a${st.index+1}${status.index}">총가격 :</p>
										
										<input id="b${st.index+1}${status.index}" type='button' 
										onclick="button_click(${st.index+1}${status.index},${item})" value="변경"/>
										
										<input id ="t${st.index+1}${status.index}" type="number">
										<p>가격 : ${item} </p>	
										<p>작물 : ${fn:split(p.p_Sub,',')[status.index]}</p>
										<p id = "c${st.index+1}${status.index}">갯수 : ${fn:split(p.p_Seedcount,',')[status.index]}</p>		    
										<br/>
									</c:forEach>



							
								
	                        </div>
					 </c:forEach> 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
</body>
</html>
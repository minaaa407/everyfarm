<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>EVERY FARM</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


 <!-- Css Styles -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/index/css/animate.css">

<link rel="stylesheet" href="resources/index/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/index/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/index/css/magnific-popup.css">

<link rel="stylesheet" href="resources/index/css/ionicons.min.css">
<link rel="stylesheet" href="resources/index/css/flaticon.css">
<link rel="stylesheet" href="resources/index/css/icomoon.css">
<link rel="stylesheet" href="resources/index/css/style.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">





<link rel="stylesheet" href="resources/product/css/style.css" type="text/css">




<jsp:include page="/WEB-INF/views/home/header.jsp" />
<style>
.over:hover, .over:focus {
    text-decoration: none;
    outline: none;
    color: #d8d57d;
}


#productspad{
	
	background-image : url("")
	
}
</style>
</head>
<body>


<script>
var idd = "<c:out value='${pagebeen.wherecolumn2}'/>";
function ptype(id){
	
	var i = document.getElementById(id).innerHTML;
	document.getElementById('where').value = "p_Main";
	document.getElementById('wherecolumn').value = i;
	document.getElementById('where2').value = "p_Sub";
	document.getElementById('wherecolumn2').value = "%%";
	document.myHiddenForm.submit();
}
function paging(i){
	var page = "page" + i;
	document.getElementById('selectpage').value = i;
	document.myHiddenForm.submit();
}
function psub(id){
	var i = document.getElementById(id).value;
	if(i =="모두"){
		document.getElementById('wherecolumn2').value = "%%";
	}else{
		document.getElementById('where2').value = "p_Sub";
		document.getElementById('wherecolumn2').value = "%"+i+"%";
	}
	document.myHiddenForm.submit();
}
function orderby(id){
	
	
	
	if(id=="orderbygrade"){
		
		document.getElementById('orderby').value = "p_Rate";
		document.getElementById('ascdesc').value = "DESC";
		
	}else if(id == "orderbyhighlandprice"){
		document.getElementById('orderby').value = "p_Landprice";
		document.getElementById('ascdesc').value = "ASC";
		
	}else if(id == "orderbylowlandprice"){
		document.getElementById('orderby').value = "p_Landprice";
		document.getElementById('ascdesc').value = "DESC";
		
	}else if(id =="orderbyview"){
		document.getElementById('orderby').value = "p_View";
		document.getElementById('ascdesc').value = "DESC";
	}
	document.myHiddenForm.submit();
	
}
function limitChange(){
	
	var limit = document.getElementById('productlist').value ;
	document.getElementById('limit').value = limit;
	document.myHiddenForm.submit();
}
//(function() { 
	//var psub = document.getElementById("psub1");
	//alert(psub);
	//var a = 0;
	//var aa = psub.options[a].value;
	//alert(aa);
	//alert(1);
	//for(i=0; i<psub.options.length; i++){
	//	alert(2);
	//	alert(psub.options[i].value);
	//	break;
	//}
	//
	
	//}());
window.onload = function(){
	var psub = document.getElementById("psub1");
		for(i=0; i<psub.options.length; i++){
			if(idd == "%%"){
				idd =="모두";
			}
			//alert(idd);
			//alert(psub.options[i].value);
			//alert(idd);
			//alert((idd.indexOf(document.getElementById("psub1").options[i].value)));
			//alert((idd.indexOf(document.getElementById("psub1").options[i].value)) != -1);
			if((idd.indexOf(document.getElementById("psub1").options[i].value))!=-1){
				psub.options[i].selected = "True";
			}else{
				psub.options[i].selected = "";
			}
		}

	}
	
	

document.getElementById('a1').className ='nav-item';
document.getElementById('a2').className ='nav-item active';
document.getElementById('a3').className ='nav-item';
document.getElementById('a4').className ='nav-item';

</script>


<script type="text/javascript">
		function testbutton(number) {
			
				var orderby = document.getElementById('orderby').value;
				var asc = document.getElementById('ascdesc').value;
				
				var limitnumber = document.getElementById("limit").value;
				var bean = {
					"selectpage" : number,
					"limit" : limitnumber,
					"orderby" : orderby,
					"ascdesc" : asc
				}
			
			$.ajax({
				type : "post", //요청 메소드 방식
				url : "/productlistpage",
				data : bean,
				dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
				success : function(result) {//성공시 동작하는 파트
					var page = result.pagebeen;
					var list123 = result.productlist;
					var pricecomma = result.pricecomma;
					var rateArray = result.rateArray;
					var abcd = document.getElementById("productlist1");
					var pagesystem = document.getElementById("pagesystem");
					var a = "";	//상품 리스트 처리파트 영역.
					for(var i =0; i < list123.length; i++){
						//a += "<div class='col-lg-4 col-md-6 col-sm-6'> <img id='product";
				        // a += list123[i].p_No + " 'src='/resources/upload/product/"+ list123[i].p_No + "/"+list123[i].p_Img+"' class='test1' width='250' height='auto' alt='Image " + list123[i].p_No+"'><br> <a href='/productdetail?productno=";
				       // a += list123[i].p_No+"'>"+list123[i].p_No+"</a> "+list123[i].p_Title + list123[i].p_Landprice + list123[i].p_Manpay + "</div>";
						a +="<div class='col-lg-4 col-md-6 col-sm-6'><a href='/productdetail?productno="+list123[i].p_No+"'>";
				        a +="<img id='product"+list123[i].p_No+"' src='/resources/upload/product/"+list123[i].p_No+"/"+list123[i].p_Img+"' class='test1' width='250' height='200' alt='Image "+list123[i].p_No+"'><br>";
				        a +=list123[i].p_Title+"</a><br>";
				        a +=" 평당 :<span> "+pricecomma[i]+"</span> 원 <br>";
						a +="조회수 : "+list123[i].p_View +"<br></div>";				        
				        
				        
					}
					abcd.innerHTML = a;
					var b="";
					if(page.pro == true){//페이징 처리 부분
						b += "<a id = 'page"+(page.pagestart-1)+"' style='cursor:pointer' onclick= 'testbutton("+(page.pagestart-1)+")' >이전 </a> ";
					}
					var i = page.pagestart;
					for(i; i < page.pageend+1; i++){
						if(page.selectpage == i){
							b += "<a id = 'page"+i+"' style='cursor:pointer;background: #88e44f;' onclick= 'testbutton("+i+")' >"+i+"</a> ";	
						}else{
							b += "<a id = 'page"+i+"' style='cursor:pointer;' onclick= 'testbutton("+i+")' >"+i+"</a> ";
						}
						
					}
					if(page.post == true){
						b += "<a id = 'page"+(page.pageend+1)+"' style='cursor:pointer' onclick= 'testbutton("+(page.pageend+1)+")' >다음 </a> ";
					}
					pagesystem.innerHTML = b;
				},
				error : function(a, b, c) {
					//통신 실패시 발생하는 함수(콜백)
					alert("a:" + a + "b:" + b + "c:" + c);
				}
			});
		}
		
		</script>
	
	    <!-- Product Section -->

	<!-- END nav -->
	<!-- main -->
	
	  <!-- Product Section Begin -->
    <section class="product spad" id="productspad">
        <div class="container">
                 	 <div class="row" style="float: right; margin-right: 55px;" >
                                <div  class="filter__option">
                                    	<a id = "orderbygrade" style="display:none" onclick="orderby(this.id)">평점 </a>
                                    	<a id = "orderbyhighlandprice" style="cursor:pointer" onclick="orderby(this.id)">낮은땅가격 </a>
                                    	<a id = "orderbylowlandprice" style="cursor:pointer" onclick="orderby(this.id)">높은땅가격 </a>
                                    	<a id = "orderbyview" style="cursor:pointer" onclick="orderby(this.id)">조회수 </a>
                                <select id ="productlist" name="productlist" class="productlist" onChange="limitChange()">
                                			<c:if test="${pagebeen.limit eq '3'}">
												<option value="3" selected>3</option>
												<option value="6">6</option>
												<option value="9" >9</option>
												<option value="12">12</option>
											</c:if>	 
											<c:if test="${pagebeen.limit eq '6'}">
												<option value="3">3</option>
												<option value="6" selected>6</option>
												<option value="9" >9</option>
												<option value="12">12</option>
											</c:if>	 
											<c:if test="${pagebeen.limit eq '9'}">
												<option value="3">3</option>
												<option value="6">6</option>
												<option value="9" selected>9</option>
												<option value="12">12</option>
											</c:if>	 
											
											<c:if test="${pagebeen.limit eq '12'}">
												<option value="3">3</option>
												<option value="6">6</option>
												<option value="9">9</option>
												<option value="12" selected>12</option>
											</c:if>	 
							    </select>
							    </div>
     				</div>
     				<br>
     				<br>
                    <div align="center" class="row" id="productlist1">
                    	<c:forEach var="p" items="${productlist }" varStatus="status">
                    	
                 	
	                        <div  class="col-lg-4 col-md-6 col-sm-6"><a class="over" href="/productdetail?productno=${p.p_No}">
	                        	<img id='product${p.p_No}' src="/resources/upload/product/${p.p_No}/${p.p_Img}"
	                        	 class="test1" width="250" height="200" alt="Image ${p.p_No}"><br>
									 ${p.p_Title}</a><br>
									 평당 :<span> ${pricecomma[status.index]}</span> 원 <br>
									 조회수 : ${p.p_View}<br>
	                        </div>
                       </c:forEach>
           

                    </div>
                    <div align="center" class="product__pagination" id="pagesystem">
                    
	                	<c:if test="${pagebeen.pro eq 'true' }">
						    <a id = "page${pagebeen.pagestart -1}" style="cursor:pointer" onclick="testbutton(${pagebeen.pagestart -1})">이전 </a>
						</c:if>	  

						<c:forEach var="i" begin="${pagebeen.pagestart}" end="${pagebeen.pageend}" step="1">
							<c:choose>
							
							 <c:when test="${pagebeen.selectpage eq i }">
							   <a id = "page${i}" style="cursor:pointer;background: #88e44f;" onclick="testbutton(${i })">${i }</a>  
							</c:when>
							<c:otherwise>
							   <a id = "page${i}" style="cursor:pointer;" onclick="testbutton(${i })">${i }</a>  
							</c:otherwise>
							</c:choose>
							   
						</c:forEach>
						    
					    <c:if test="${pagebeen.post eq 'true'}">
						    <a id = "page${pagebeen.pageend +1}" style="cursor:pointer" onclick="testbutton(${pagebeen.pageend +1})">다음 </a>
						</c:if>
						
                    </div>
                    <!-- form 해당 부분 scrip 이벤트 통해서 자동 전송 처리 -->
                    <form:form commandName="pagebeen" name = "myHiddenForm" action="/productlist" method="post">
							<input type="hidden" id = "selectpage" name="selectpage" value="1">
							<input type="hidden" id = "pagestart" name="pagestart" value="${pagebeen.pagestart}">
							<input type="hidden" id = "pageend" name="pageend" value="${pagebeen.pageend}">
							<input type="hidden" id = "endnumber" name="endnumber" value="${pagebeen.endnumber}">
							<input type="hidden" id = "limit" name="limit" value="${pagebeen.limit}">
							<input type="hidden" id = "offset" name="offset" value="${pagebeen.offset}">
							<input type="hidden" id = "tableindex" name="tableindex" value="${pagebeen.tableindex}">
							<input type="hidden" id = "pagingnumber" name="pagingnumber" value="${pagebeen.pagingnumber}">
							<input type="hidden" id = "pro" name="pro" value="${pagebeen.pro}">
							<input type="hidden" id = "post" name="post" value="${pagebeen.post}">
							<input type="hidden" id = "where" name="where" value="${pagebeen.where}">
							<input type="hidden" id = "wherecolumn" name="wherecolumn" value="${pagebeen.wherecolumn}">
							<input type="hidden" id = "where2" name="where2" value="${pagebeen.where2}">
							<input type="hidden" id = "wherecolumn2" name="wherecolumn2" value="${pagebeen.wherecolumn2}">
							<input type="hidden" id = "orderby" name="orderby" value="${pagebeen.orderby}">
							<input type="hidden" id = "ascdesc" name="ascdesc" value="${pagebeen.ascdesc}">
					</form:form>
                </div>
         		</section>
    <!-- Product Section End -->

	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />

	<script src="resources/index/js/jquery.min.js"></script>
	<script src="resources/index/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/index/js/popper.min.js"></script>
	<script src="resources/index/js/bootstrap.min.js"></script>
	<script src="resources/index/js/jquery.easing.1.3.js"></script>
	<script src="resources/index/js/jquery.waypoints.min.js"></script>
	<script src="resources/index/js/jquery.stellar.min.js"></script>
	<script src="resources/index/js/owl.carousel.min.js"></script>
	<script src="resources/index/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/index/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/index/js/google-map.js"></script>
	<script src="resources/index/js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>


	


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>everyfarm admin product</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<style>
	.table{
			text-align: center;
	}
	th {
    text-align: center;
	}
	.table {
			font-size: 12px;
		}
 a.category:link { color: #333333; text-decoration: none;  font-size: 24px;}
       a.category:visited { 
       color: #333333;; text-decoration: none;  font-size: 24px;
       }
       a.category:hover { color: #333333; text-decoration: underline;   font-size: 24px;}
	
      .categorylink{
      text-align: center;
      }
      
      .productLabel{
      text-align: center;
      font-weight: bold; 
      }
      
       a.category2:link { color: #333333; text-decoration: none;font-size: 16px;}
       a.category2:visited { color: #333333;; text-decoration: none;font-size: 16px;}
       a.category2:hover { color: #333333; text-decoration: underline;font-size: 16px; }
	
      .categorylink2{
      text-align: right;
      }
<c:choose>
         <c:when test="${empty param.ptype}">
          #ALL{
      	font-weight: bold;
     	 }
         </c:when>
         <c:when test="${not empty param.ptype}"> 
         #${param.ptype}{
      	font-weight: bold;
     	 }
         </c:when>
</c:choose>


<c:choose>
         <c:when test="${empty param.order}">
         </c:when>
         <c:when test="${not empty param.order}"> 
         #${param.order}2{
      	font-weight: bold;
     	 }
         </c:when>
</c:choose>

     
   #relative3{
   width: 100px;
   height:100px;
   background-color:red;
   position:fixed;
   top:800px;
   right : 100px;

   
   }   

@media screen and (max-width:768px) {

	
		.table {
			table-layout: fixed;
			width: 100%;
			text-align: center;
			font-size: 15px;
		}
		
		.table th {
			background: #ccc;
		}
		
		.table td, .table th {
			padding: 10px 20px;
			border-top: 1px solid #ccc;
			word-break: break-all;
		}
		/*block*/
		.table--block thead {
			display: none;
		}
		.table--block tr {
			display: block;
			margin-bottom: 14px;
			border-top: none;
		}
		.table--block th, .table--block tbody td {
			display: block;
			position: relative;
			padding: 10px 0;
			padding-left: 0%;
			border-width: 0 0 1px 0;
			text-align: left;
		}
		.table--block tbody td:before {
			display: block;
			position: absolute;
			left: 0;
			top: 0;
			width: 30%;
			padding: 10px 0;
			background: #ccc;
		}
		
		.table--block tbody td:nth-child(1):before {
         display: block;
         position: absolute;
         left: 0;
         top: 0;
         width: 30%;
         padding: 10px 0px 30% 0px;
         background: #ccc;
      }
      	.table--block tbody td:nth-child(4):before {
         display: block;
         position: absolute;
         left: 0;
         top: 0;
         width: 30%;
         padding: 10px 0px 40% 0px;
         background: #ccc;
      }
      
      	.table--block tbody td:nth-child(5):before {
         display: block;
         position: absolute;
         left: 0;
         top: 0;
         width: 30%;
         padding: 10px 0px 30% 0px;
         background: #ccc;
      }
      

		
		.table--block th, .table--block tbody td {
		    display: block;
		    position: relative;
		    padding: 10px 0;
		    padding-left: 0%;
		    border-width: 0 0 1px 0;
		    text-align: center; 

		}
		.table--block tbody td.content {
		    display: block;
		    position: relative;
		    padding: 10px 0;
		    padding-left: 30%;
		    border-width: 0 0 1px 0;
		    text-align: left; 
		     margin-right: 50px

		}
		.table--block td:nth-child(1):before {
			content: '';
		}
		.table--block td:nth-child(2):before {
			content: '상품번호';
		}
		.table--block td:nth-child(3):before {
			content: '아이디';
		}
		.table--block td:nth-child(4):before {
			content: '제목';
		}
		.table--block td:nth-child(5):before {
			content: '메인이미지';
		}
		.table--block td:nth-child(6):before {
			content: '땅사이즈';
		}
		.table--block td:nth-child(7):before {
			content: '대카테고리';
		}
		.table--block td:nth-child(8):before {
			content: '소카테고리';
		}
		.table--block td:nth-child(9):before {
			content: '등록날짜';
		}
		.table--block td:nth-child(10):before {
			content: '상품등록';
		}

		

	}
	
	
	.pageList {
    z-index: 1;
    padding-top: 0px;
    padding-bottom: 30px;
    text-align: center;
	}
	
	.buttonmenuadmin{
		color: #fff;
	    background-color: #0062cc;
	    border-color: #005cbf;
	    display: inline-block;
	    margin-bottom: 0;
	    font-weight: 400;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    touch-action: manipulation;
	    cursor: pointer;
	    background-image: none;
	    border: 1px solid transparent;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    border-radius: 4px;
	    user-select: none;
	}

	.pagination {
		  display: inline-block;
		}
		
		.pagination a {
		  color: black;
		  float: left;
		  padding: 4px 12px;
		  text-decoration: none;
		  transition: background-color .3s;
		  border: 1px solid #ddd;
		  margin: 0 4px;
		}
		
		.pagination a.active {
		  background-color: #f0c33c;
		  color: white;
		  border: 1px solid #f0c33c;
		}
		.pagination a:hover:not(.active) {background-color: #ddd;}
		.pagination label {
		  color: black;
		  float: left;
		  padding: 6px 14px;
		  text-decoration: none;
		  transition: background-color .3s;
		  border: 1px solid #ddd;
		  margin: 0 4px;
		}
	
</style>
<style>
.affix {
    position: fixed;
}

.navbar-inverse {
    background-color: #222;
    border-color: #080808;
}
@media (min-width: 768px)
.navbar {
    border-radius: 4px;
}


article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
    display: block;
}

* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}


body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}

html {
    font-size: 10px;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}
html {
    font-family: sans-serif;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}

.btn-group-vertical>.btn-group:after, .btn-group-vertical>.btn-group:before, .btn-toolbar:after, .btn-toolbar:before, .clearfix:after, .clearfix:before, .container-fluid:after, .container-fluid:before, .container:after, .container:before, .dl-horizontal dd:after, .dl-horizontal dd:before, .form-horizontal .form-group:after, .form-horizontal .form-group:before, .modal-footer:after, .modal-footer:before, .modal-header:after, .modal-header:before, .nav:after, .nav:before, .navbar-collapse:after, .navbar-collapse:before, .navbar-header:after, .navbar-header:before, .navbar:after, .navbar:before, .pager:after, .pager:before, .panel-body:after, .panel-body:before, .row:after, .row:before {
    display: table;
    content: " ";
}
:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.btn-group-vertical>.btn-group:after, .btn-toolbar:after, .clearfix:after, .container-fluid:after, .container:after, .dl-horizontal dd:after, .form-horizontal .form-group:after, .modal-footer:after, .modal-header:after, .nav:after, .navbar-collapse:after, .navbar-header:after, .navbar:after, .pager:after, .panel-body:after, .row:after {
    clear: both;
}
.btn-group-vertical>.btn-group:after, .btn-group-vertical>.btn-group:before, .btn-toolbar:after, .btn-toolbar:before, .clearfix:after, .clearfix:before, .container-fluid:after, .container-fluid:before, .container:after, .container:before, .dl-horizontal dd:after, .dl-horizontal dd:before, .form-horizontal .form-group:after, .form-horizontal .form-group:before, .modal-footer:after, .modal-footer:before, .modal-header:after, .modal-header:before, .nav:after, .nav:before, .navbar-collapse:after, .navbar-collapse:before, .navbar-header:after, .navbar-header:before, .navbar:after, .navbar:before, .pager:after, .pager:before, .panel-body:after, .panel-body:before, .row:after, .row:before {
    display: table;
    content: " ";
}
:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
ul,
ol {
  margin-top: 0;
  margin-bottom: (@line-height-computed / 2);
  ul,
  ol {
    margin-bottom: 0;
  }
}

</style>
<style>

.site-btn {
	padding: 2px 2px;
}
</style>
</head>

<script>
 window.onload = function(){
	 document.getElementById("showbutton").onclick = function(){
		 
		 if(document.getElementById("form").style.display=="none"){
			 document.getElementById("form").style.display="block";
		 }else{
			 document.getElementById("form").style.display="none";
		 }
		
	 }
	 document.getElementById("allbutton").onclick = function(){
			
		 }
 }
 var page = 1;
 function chageproductnoSelect(){ 
	 var productno = document.getElementById("productnooption");
	 page = productno.options[productno.selectedIndex].value;

 }
 
 function deletecheck(){
	if(confirm('상품 삭제시 내부 리뷰정보가 삭제됩니다. 삭제를 진행하시겠습니까?')){
		document.myhiddenform.submit();
		
	}else{
		
		
	}
	 
	 
	 
 }
 
 function fileUpload(){	
	 var subPathInput = document.querySelector('#product_sub_images');
	 var file = subPathInput.files;
	var aj=0;	

	var subfilenames="";
	
	for(aj = 0; aj<file.length; aj++){
		 if(aj != 0){
			
	      	   subfilenames += ',' + file[aj].name;
	          }else{
	          	
	          	subfilenames = file[aj].name;
	          }
			
		 }
	document.getElementById("prepsubpath").value=subfilenames;
	document.getElementById("subtextp").innerHTML=subfilenames;
	}
 
 
 function fileUploadmain(){	
	 var subPathInput = document.querySelector('#phto');
	 var file = subPathInput.files;
	var aj=0;	

	var subfilenames="";
	
	for(aj = 0; aj<file.length; aj++){
		 if(aj != 0){
			
	      	   subfilenames += ',' + file[aj].name;
	          }else{
	          	
	          	subfilenames = file[aj].name;
	          }
			
		 }
	document.getElementById("mainpath").value=subfilenames;
	document.getElementById("maintextp").innerHTML=subfilenames;
	
	}
		
	
	 
	 
 
 
 
</script>

<body>
<!-- Header Section Begin -->

<!-- Header End -->

   <div style="margin: 30px">
   <div class="container" style="font-size: 16px; width: 100%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-lg-12">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					 	<h2>상품관리</h2><br/><br/>
	</div>
		<form name="myhiddenform" id="myhiddenform" method="post" action="solarProductadmindelete.bo"></form>
		<div style="padding: 10px 0px; text-align:left;">
			<form method="post" name="productmenu" id="productmenu">
					<input type="submit" name="viewAll"
						class="btn btn-sm btn-outline-secondary site-btn" value="전체보기"
						formaction="solarProductadmin.bo"> <input type="button"
						name="viewAll" id="showbutton"
						class="btn btn-sm btn-outline-secondary site-btn" value="승인제품"> <input
						type="button" name="delete" id="delete"
						class="btn btn-sm btn-outline-secondary site-btn" value="승인전제품"
						onclick="deletecheck()">
				</form>
		</div>
		<div style="padding: 10px 0px; text-align:right;">
				<form method="post" name="productmenu" id="productmenu">
					<input type="submit" name="viewAll"
						class="btn btn-sm btn-outline-secondary site-btn" value="전체보기"
						formaction="solarProductadmin.bo"> <input type="button"
						name="viewAll" id="showbutton"
						class="btn btn-sm btn-outline-secondary site-btn" value="제품추가"> <input
						type="button" name="delete" id="delete"
						class="btn btn-sm btn-outline-secondary site-btn" value="삭제하기"
						onclick="deletecheck()">
				</form>
			</div>
	
		<div id="form" style="display: none" class="col-lg-12">
			<form method="post" action="solarProductadminoneinsert.bo" name="forminsert"
				enctype="multipart/form-data">
				<label for="ptype"> 타 &nbsp;&nbsp; 입 : </label> <select name="ptype"
					id="ptype">
					<option value="옷장">옷장</option>
					<option value="소파">소파</option>
					<option value="식탁">식탁</option>
					<option value="책장">책장</option>
					<option value="의자">의자</option>
					<option value="테이블">테이블</option>
					<option value="서랍">서랍</option>
				</select><br> <label for="pname">이 &nbsp;&nbsp; 름 : </label> <input
					type="text" id="pname" name="pname" size="30" maxlength='10'><br/>
				<label for="pprice">가 &nbsp;&nbsp; 격 : </label> <input type="text" id="pprice"
					name="pprice" size="30" maxlength='10' oninput="this.value = this.value.replaceAll(/\D/g, '')"><br/>
					<label for="pmaterial"> 재 &nbsp;&nbsp; 질 : </label> 
					<select name="pmaterial"
					id="pmaterial" autofocus>
					<option value="ork">ork</option>
					<option value="ebony">ebony</option>
					<option value="alder">alder</option>
					<option value="cherry">cherry</option>
					<option value="chamaecyparis">chamaecyparis</option>
					</select><br/>
					<label for="pcolor"> 색 &nbsp;&nbsp; 깔 : </label> 
					<select name="pcolor"
					id="pcolor" autofocus>
					<option value="brown">brown</option>
					<option value="gray">gray</option>
					<option value="white">ebony</option>
					<option value="alder">alder</option>
					<option value="cherry">cherry</option>
					<option value="chamaecyparis">chamaecyparis</option>
					</select><br> 
					<label for="psize">사이즈 : </label> <input type="text"
					name="psize" id="psize" size="30" maxlength='30'><br>
				<label for="phto">main 이미지 업로드</label> <br /> <input id="phto"
					type="file" name="phto" onchange="fileUploadmain(this)"
					accept="image/*" multiple="multiple"> <input type="hidden"
					name="mainpath" id="mainpath" value="">
				<p id="maintextp"></p>
				<label for="product_sub_images">sub 이미지 업로드</label> <br /> <input
					type="file" name="product_sub_images" id="product_sub_images"
					onchange="fileUpload(this)" accept="image/*" multiple="multiple">
				<input type="hidden" name="prepsubpath" id="prepsubpath" value="">
				<p id="subtextp"></p>
				<br /> <input type="submit" value="추가"><br />
			</form>
			<br />
		</div>

		<div class="table">
					<table class="table table-striped table-sm table--block" id="testab">
						<thead>
							<tr>
								<th class="one"></th>
								<th class="two">상품번호</th>
								<th>아이디</th>
								<th>제목</th>
								<th>메인이미지</th>
								<th>땅사이즈</th>
								<th>대카테고리</th>
								<th>소카테고리</th>
								<th>등록날짜</th>
								<th>상품등록</th>
								<th></th>
							</tr>
										</thead>
										<tbody>
										<c:forEach var="p" items="${productlist }">
											<tr>
												<td class="content"><input type="checkbox" name="check" value = "${p.p_No}" form="myhiddenform"></td>
												<td class="content">${p.p_No}</td>
												<td class="content"><a href="solarproduct.bo?ptype=${p.p_Id}">${p.p_Id}</a></td>
												<td class="content"><a href="solarProductUpdateForm.bo?product_no=${p.p_Title}">
												${p.p_Title}</a></td>
												<td class="content">${p.p_Image}</td>
												<td class="content">${p.p_Land}</td>
												<td class="content"> ${p.p_Main}</td>
												<td class="content">${p.p_Sub}</td>
												<td class="content">${p.p_Date}</td>
												<td><a href="solarProductUpdateForm.bo?product_no=${p.p_Accept}"><input class="buttonmenuadmin" type="button" value="${p.p_Accept}"></a></td>
											</tr>
												</c:forEach>
										</tbody>
					</table>
				</div>
	<section>
	<br/>
		<form method="get" action="solarProductadminsearch.bo" name="selectList">
			<select name="productselect" >
    			<option value="pno">상품번호</option>
    			<option value="ptype">카테고리</option>
    			<option value="pname">상품이름</option>
			</select>
			<input type="text" name="selectText">
			<input type="submit" value="검색">
		</form>
	</section>
	</div>
	</div>
	</div>
	</div>
	<!-- Shopping Cart Section End -->

	<!-- Partner Logo Section Begin -->

	<!-- Footer Section End -->

	<!-- Js Plugins -->
</body>

</html>
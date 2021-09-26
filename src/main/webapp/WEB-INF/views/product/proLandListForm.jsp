<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.everyfarm.farmer.FarmerBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	FarmerBean farmer = (FarmerBean) request.getSession().getAttribute("farmer");
%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
</head>

<style>

@media screen and (min-width: 950px){
	div#table100{
		display : "" ;
	}
	.mobiletalbe{
		display :none;
	}
}



td, th {
	border-color: #9ea4ca;
}

body {
	background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;
}

.limiter {
	width: 100%;
	margin: 0 auto;
}

.container-table100 {
	width: 100%;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	flex-direction: column;
}

.wrap-table100 {
width: 100%
}


table {
	border-spacing: 1;
	border-collapse: collapse;
	border-radius: 10px;
	overflow: hidden;
	width: 100%;
	margin: 0 auto;
	position: relative;
}

table * {
	position: relative;
}

table td, table th {
	padding-left: 8px;
}

table thead tr {
	height: 60px;
	background: #efefef
}

table tbody tr {
	height: 50px;
	background-color: rgba(255, 255, 255, 0.4);
}

table tbody tr:last-child {
	border: 0;
}

table td, table th {
	text-align: center;
}

#regSearch {
	text-align: center;
}

.pagination {
	display: inline-block;
	 justify-content: center;
}

.pagination a {
	float: left;
	padding: 8px 16px;
	border-radius: 20%;
}

.pagination a.active {
	background-color: #7971ea;
	color: white;
}
.pagination a:hover:not(.active) {
background-color: silver;
}
}




</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>



<script>
function LandDelete(p_No) {
	if (confirm('삭제하시겠습니까?')) {
		location.href='LandDelete?p_No=' + p_No;
	}
}



function search(){
	
	var select = document.getElementById('productselect').value;
	
	var text = document.getElementById('selectText').value;
	document.getElementById('where').value = select;
	document.getElementById('wherecolumn').value= text;
	
	document.myHiddenForm.submit();
}

function paging(i){
	
	document.getElementById('selectpage').value = i;
	document.myHiddenForm.submit();
	
}
window.onresize = function(event){
	  var innerWidth = window.innerWidth;
	  if(innerWidth <= "950"){
		  document.getElementById('table100').style.display ="none"
	  }else{
		  document.getElementById('table100').style.display =""
	  }

}



</script>

<title>EveryFarm 농부 | 상품관리</title>
</head>

<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
		id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/farmer/farmerSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>

	<br>
	<br>
<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
			<div class="col-lg-12" align="right">
				<br>
				<br>
				<br>
				<br>
					<a class="btn btn-sm btn-neutral" href="/ProNFlist">승인전 </a> 
					<a class="btn btn-sm btn-neutral" href="/ProYFList">승인후 </a> 
					<a href="/proLandListForm?" class="btn btn-sm btn-neutral">전체보기 </a>
				</div>
				<br>
				<div id ="table100" class="table100">
					<table border="1">
						<colgroup>
							<col style="width: 12%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
							<col style="width: 15%" />
							<col style="width: 12%" />
							<col style="width: 11%" />
							<col style="width: 10%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품번호</th>
								<th scope="col">메인이미지</th>
								<th scope="col">제목</th>
								<th scope="col">등록날짜</th>
								<th scope="col">승인여부</th>
								<th scope="col">상세보기</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${productlist}">
								<tr>
									<td class="content">${p.p_No}</td>
									<td class="content"><img id='product${p.p_No}'
										src="/resources/upload/product/${p.p_No}/${p.p_Img}"
										class="test1" width="120" height="80" alt="Image ${p.p_No}">
									</td>
									<td class="content">${p.p_Title}</td>
									<td class="content">${p.p_Date}</td>
									<td class="content">${p.p_Accept}</td>
									<td class="content"><a
										href="/productdetailfarmer?productno=${p.p_No}">상세보기</a></td>
									<td><button type="button" class="btn btn-sm btn-neutral"
											onclick="javascript:LandDelete(${p.p_No})">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<c:forEach var="p" items="${productlist}">
					<div class="mobiletalbe" >
							<table border="1" style="width:75%">
									<tbody>
										<tr>
											<td style="width: 15%;background: white;">상품 번호</td>
											<td style="width: 15%" class="content">${p.p_No}</td>
										</tr>
										<tr>
											<td style="background: white;">메인이미지</td>
											<td class="content"><img id='product${p.p_No}'
													src="/resources/upload/product/${p.p_No}/${p.p_Img}"
													class="test1" width="120" height="80" alt="Image ${p.p_No}">
												</td>
										</tr>
										<tr>
											<td style="background: white;">제목</td>
											<td class="content">${p.p_Title}</td>
										</tr>
										<tr>
											<td style="background: white;">등록날짜</td>
											<td class="content">${p.p_Date}</td>
										</tr>
										<tr>
											<td style="background: white;">승인여부</td>
											<td class="content">${p.p_Accept}</td>
										</tr>
										<tr>
											<td style="background: white;">상세보기</td>
											<td class="content"><a
													href="/productdetailfarmer?productno=${p.p_No}">상세보기</a></td>
										</tr>
										<tr>
											<td style="background: white;">삭제</td>
											<td><button type="button" class="btn btn-sm btn-neutral"
														onclick="javascript:LandDelete(${p.p_No})">삭제</button></td>
										</tr>
									</tbody>
								</table>
								<br>
								<br>
						</div>	
						</c:forEach>
					</div>
				
				
				
				
				
				<br>
				<div id="regSearch">
					<select name="productselect" id="productselect">
						<option value="p_No">상품번호</option>
					</select> <input type="text" name="selectText" id="selectText"> <input
						type="button" value="검색" onclick="search()">
				</div>
				<br>
				<div class="row">
					<div class="col btn-group pagination">
						<c:if test="${pagebeen.pro eq 'true' }">
							<a id="page${pagebeen.pagestart -1}" style="cursor: pointer;"
								onclick="paging(${pagebeen.pagestart -1})">이전 </a>
						</c:if>

						<c:forEach var="i" begin="${pagebeen.pagestart}"
							end="${pagebeen.pageend}" step="1">
							<c:choose>
								<c:when test="${pagebeen.selectpage eq i}">
									<a id="page${i}"
										style="cursor: pointer; background-color: #7971ea; color: white;"
										onclick="paging(${i })">${i }</a>
								</c:when>
								<c:otherwise>
									<a id="page${i}" style="cursor: pointer;"
										onclick="paging(${i })">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pagebeen.post eq 'true'}">
							<a id="page${pagebeen.pageend +1}" style="cursor: pointer;"
								onclick="paging(${pagebeen.pageend +1})">다음 </a>
						</c:if>
					</div>
				</div>
				<!-- form 해당 부분 scrip 이벤트 통해서 자동 전송 처리 -->
				<form:form commandName="pagebeen" name="myHiddenForm"
					action="/proLandListForm" method="post">
					<input type="hidden" id="selectpage" name="selectpage" value="1">
					<input type="hidden" id="pagestart" name="pagestart"
						value="${pagebeen.pagestart}">
					<input type="hidden" id="pageend" name="pageend"
						value="${pagebeen.pageend}">
					<input type="hidden" id="endnumber" name="endnumber"
						value="${pagebeen.endnumber}">
					<input type="hidden" id="limit" name="limit"
						value="${pagebeen.limit}">
					<input type="hidden" id="offset" name="offset"
						value="${pagebeen.offset}">
					<input type="hidden" id="tableindex" name="tableindex"
						value="${pagebeen.tableindex}">
					<input type="hidden" id="pagingnumber" name="pagingnumber"
						value="${pagebeen.pagingnumber}">
					<input type="hidden" id="pro" name="pro" value="${pagebeen.pro}">
					<input type="hidden" id="post" name="post" value="${pagebeen.post}">
					<input type="hidden" id="where" name="where"
						value="${pagebeen.where}">
					<input type="hidden" id="wherecolumn" name="wherecolumn"
						value="${pagebeen.wherecolumn}">
					<input type="hidden" id="where2" name="where2"
						value="${pagebeen.where2}">
					<input type="hidden" id="wherecolumn2" name="wherecolumn2"
						value="${pagebeen.wherecolumn2}">
					<input type="hidden" id="where3" name="where3"
						value="${pagebeen.where2}">
					<input type="hidden" id="wherecolumn3" name="wherecolumn3"
						value="${pagebeen.wherecolumn3}">
				</form:form>
				<br>
			</div>
		</div>
		</div>

		<br> <Br>
</body>
<script>

var innerWidth2 = window.innerWidth;

if(innerWidth2 <= "950"){
	  document.getElementById('table100').style.display ="none"
}else{
	  document.getElementById('table100').style.display =""
}

</script>

</html>
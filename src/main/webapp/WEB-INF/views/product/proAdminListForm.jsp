<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	width: 1170px;
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
  border-radius:20%;
}
.pagination a.active {
  background-color: #7971ea;
  color: white;
}
.pagination a:hover:not(.active) {
background-color: silver;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>



<script>

function proDelete(p_No) {
	if (confirm('삭제하시겠습니까?')) {
		location.href='ProDelete?p_No=' + p_No;
	}
}

function paging(i){
	var page = "page" + i;
	document.getElementById('selectpage').value = i;
	document.myHiddenForm.submit();
}

function search(){
	
	var select = document.getElementById('productselect').value;
	
	var text = document.getElementById('selectText').value;
	if(select == "p_Id"){
		text = "%" + text + "%";
	}else{
		text = text;
	}
	document.getElementById('where').value = select;
	document.getElementById('wherecolumn').value= text;
	
	document.myHiddenForm.submit();
}

</script>

<title>EVERY FARM 관리자 | 상품관리</title>
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
			<!-- User -->
			<ul class="nav align-items-center d-md-none">
				<li class="nav-item dropdown"><a class="nav-link nav-link-icon"
					href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="ni ni-bell-55"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right"
						aria-labelledby="navbar-default_dropdown_1">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img
								alt="Image placeholder"
								src="resources/admin/img/theme/team-1-800x800.jpg">
							</span>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-single-02"></i> <span>My profile</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-settings-gear-65"></i> <span>Settings</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-calendar-grid-58"></i> <span>Activity</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-support-16"></i> <span>Support</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
							<span>Logout</span>
						</a>
					</div></li>
			</ul>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="col-lg-12" align="right">
					<a class="btn btn-sm btn-neutral" href="/ProNList">승인전 </a> 
					<a class="btn btn-sm btn-neutral" href="/ProYList">승인후 </a> 
					<a href="/proAdminListForm?" class="btn btn-sm btn-neutral">전체보기 </a>
				</div>
				<br>
				<div class="table100">
					<table border="1">
						<colgroup>
							<col style="width: 50px" />
							<col style="width: 120px" />
							<col style="width: 100px" />
							<col style="width: 100px" />
							<col style="width: 80px" />
							<col style="width: 70px" />
							<col style="width: 70px" />
							<col style="width: 150px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">메인이미지</th>
								<th scope="col">아이디</th>
								<th scope="col">제목</th>
								<th scope="col">등록날짜</th>
								<th scope="col">승인여부</th>
								<th scope="col">상세확인</th>
								<th scope="col">수정,삭제</th>
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
									<td class="content">${p.p_Id}</td>
									<td class="content">${p.p_Title}</td>
									<td class="content">${p.p_Date}</td>
									<td class="content">${p.p_Accept}</td>
									<td class="content"><a
										href="/productdetailadmin?productno=${p.p_No}">상세보기</a></td>
									<td><a class="btn btn-sm btn-neutral"
										href="/proRegDetailForm?p_No=${p.p_No}">수정</a>
										<button type="button" class="btn btn-sm btn-neutral"
											onclick="javascript:proDelete(${p.p_No})">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br>
				<div id="regSearch">
					<select name="productselect" id="productselect">
						<option value="p_No">상품번호</option>
						<option value="p_Id">아이디</option>
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

					<c:forEach var="i" begin="${pagebeen.pagestart}" end="${pagebeen.pageend}" step="1">
						<c:choose>
							<c:when test="${pagebeen.selectpage eq i}">
								<a id="page${i}" style="cursor: pointer; background-color: #7971ea; color: white;" onclick="paging(${i })">${i }</a>
							</c:when>
							<c:otherwise>
							   <a id="page${i}" style="cursor: pointer;" onclick="paging(${i })">${i }</a>
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
					action="/proAdminListForm" method="post">
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

				</form:form>
				<br>
			</div>
		</div>
		</div>
		<br>
		<Br>
</body>
</html>
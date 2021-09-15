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
</head>

<style>
.top {
	text-align: center;
}

.top p {
	font-size: 0.8em;
	color: gray;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
}

thead th {
	padding-top: 15px;
	padding-bottom: 15px;
	font-weight: bold;
	vertical-align: top;
	color: black;
	border-bottom: 3px solid black;
	background: #dcdcdc;
}

tbody td {
	width: 350px;
	padding: 10px;
	font-size: 0.9em;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
}

tbody tr #num {
	width: 80px;
}

tbody tr #title {
	width: 420px;
	text-align: left;
}

tbody tr #name {
	width: 100px;
}

tbody tr #date {
	width: 100px;
}

tbody tr #readc {
	width: 80px;
}

#pageList {
	margin: auto;
	width: 50%;
	text-align: center;
}

#rezButton {
	text-align: right;
}

#regSearch {
	text-align: center;
}
</style>

<script>
function LandDelete(p_No) {
	if (confirm('삭제하시겠습니까?')) {
		location.href='LandDelete?p_No=' + p_No;
	}
}
</script>

<title></title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp" />

		<br>
		<div class="table" class="col-lg-12">
		<table>
			<thead>
				<tr>
					<th>상품번호</th>
					<th>메인이미지</th>
					<th>아이디</th>
					<th>제목</th>
					<th>등록날짜</th>
					<th>승인여부</th>
					<th>상세보기</th>
					<th>수정,삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${productlist}">
					<tr>
						<td class="content">${p.p_No}</td>
						<td class="content"><img id='product${p.p_No}'
							src="/resources/upload/product/${p.p_No}/${p.p_Img}"
							class="test1" width="90" height="auto" alt="Image ${p.p_No}">
						</td>
						<td class="content">${p.p_Id}</td>
						<td class="content">${p.p_Title}</td>
						<td class="content">${p.p_Date}</td>
						<td class="content">${p.p_Accept}</td>
						<td class="content"><a
							href="/productdetail?productno=${p.p_No}">상세보기</a></td>
						<td><a class="btn btn-dark" href="/proRegDetailForm?p_No=${p.p_No}">수정</a>
						<button type="button" class="btn btn-dark"
								onclick="javascript:LandDelete(${p.p_No})">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	color: #369;
	border-bottom: 3px solid #036;
	background: #f3f6f7;
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
</style>


<title></title>
</head>

<body>
	<div class="table">
	<h2>상품 리스트</h2>
		<table class="table table-striped table-sm table--block" id="testab">
			<thead>
				<tr>
					<th class="one"></th>
					<th class="two">상품번호</th>
					<th>아이디</th>
					<th>메인이미지</th>
					<th>제목</th>
					<th>토지 사이즈</th>
					<th>등록날짜</th>
					<th>상품등록</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${productlist}">
					<tr>
						<td class="content"><input type="checkbox" name="check"
							value="${p.p_No}" form="myhiddenform"></td>
						<td class="content">${p.p_No}</td>
						<td class="content">${p.p_Id}</td>
						<td class="content">${p.p_Img}</td>
						<td class="content">${p.p_Title}</td>
						<td class="content">${p.p_Land}</td>
						<td class="content">${p.p_Date}</td>
						<td><input class="buttonmenuadmin" type="button" value="${p.p_Accept}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</body>
</html>
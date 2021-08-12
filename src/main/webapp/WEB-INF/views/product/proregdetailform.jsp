<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<style>
table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

thead th {
	padding: 15px;
	font-weight: bold;
	vertical-align: top;
	color: black;
	border-bottom: 3px solid black;
	background: #dcdcdc;
}

tbody td {
	width: 200px;
	font-size: 0.9em;
	vertical-align: left;
	border-bottom: 1px solid #ccc;
}

#button {
	text-align: right;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th scope="row" colspan="4">승인 요청</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${productlist}">
			<tr>
			<td  style="width: 20%;"><label>작성자</label></td>	
			<td class="content">${p.p_Id}</td>	
			</tr>
			<tr>
			<td  style="width: 20%;"><label>제 목</label></td>	
			<td class="content">${p.p_Title}</td>	
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<input type="submit" class="btn btn-dark" value="승인 하기">&nbsp;&nbsp;
		<button class="btn btn-outline-dark" onclick="back()">뒤로가기</button>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>관리자 승인</h2>

<ul class="list-group">
  <li class="list-group"><a href="">승인전</a></li>
  <li class="list-group"><a href="">승인후</a></li>
  <li class="list-group"><a href="">모든 상품 보기</a></li>
</ul><br>

	<section id="listForm">
	<div id="main_article">
		<table class="revList">
			<thead>
			
			<tr id="tr_top">
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col" width=20%>작물</th>
				<th scope="col">씨앗</th>
				<th scope="col">작성자</th>
				<th scope="col">작성 일</th></tr>
			</thead>
			<tbody>
			
			<tr>
				<td id="num"></td>

				<td id="title"></td>
				<td id="name"></td>
				<td id="date"></td>
				<td id="date"></td>
				<td id="readc"></td>
			</tr>
			
			</tbody>
		</table><br><br>
<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
						<form action="#" class="searchform order-lg-last">
							<div class="form-group d-flex">
								<input type="text" class="form-control pl-3"
									placeholder="Search">
</body>
</html>
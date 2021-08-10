<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역-관리자 | EveryFarm</title>
</head>
<body>

<h2><span>구매내역</span></h2>

<hr>
 				 <table>
					<thead>
						<tr>
							<th scope="col">이름&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">주문번호&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">상품 &nbsp;&nbsp;&nbsp;</th>
							<th scope="col">상품금액&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">인건비&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">배송비&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">주문상태&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">주문날짜&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">비고&nbsp;&nbsp;&nbsp; </th>
						</tr>
						<tr>
							<th scope="col">권형준&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">20210806154687&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">강원도5평 고구마  감자&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">300,000원&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">500,000원&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">3,000원&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">농사중&nbsp;&nbsp;&nbsp; </th>
							<th scope="col">2021-08-06&nbsp;&nbsp;&nbsp; </th>
							<th scope="col"><input type="button" value="삭제">&nbsp;</th>
							<th scope="col"><input type="button" value="수정" onclick="location.href='WEB-INF/views/product/magShoppingListDetail.jsp'"></th>
						</tr>
					</thead>
				</table>
</body>
</html>
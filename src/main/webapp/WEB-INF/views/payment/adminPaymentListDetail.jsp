<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 수정 | EveryFarm</title>
</head>
<body>
	<h2><span>구매내역 수정</span></h2>

	<hr>
	
	<form>	
		<div>
			<div>
				<div>
					<p>이름<span></span></p>
					<input type="text" name="name" value="권형준" readonly>
				</div> 
			</div>
		</div>
		<div>
			<div>
				<div>
					<p>주문번호<span></span></p>
					<input type="text" name="name" value="20210806154687" readonly>
				</div> 
			</div>
		</div>
		<div>
			<div>
				<div>
					<p>상품<span></span></p>
					<input type="text" name="name" value="강원도 5평 고구마 감자">
				</div> 
			</div>
		</div>
		<div>
			<div>
				<div>
					<p>상품금액<span></span></p>
					<input type="text" name="name" value="300,000원" readonly>
				</div> 
			</div>
		</div>
		<div>
			<div>
				<div>
					<p>인건비<span></span></p>
					<input type="text" name="name" value="500,000원" readonly>
				</div> 
			</div>
		</div>
		<div>
			<div>
				<div>
					<p>배송비<span></span></p>
					<input type="text" name="name" value="3,000원" readonly>
				</div> 
			</div>
		</div>
		<div>
			<div>
				<div>
					<p>주문상태<span></span></p>
					<input type="text" name="name" value="농사중">
					<select>
                        <option>농사중</option>
                        <option>농사완료</option>
                        <option>배송준비중</option>
                        <option>배송완료</option>
                    </select>
				</div> 
			</div>
		</div>
		<div>
			<div>
				<div>
					<p>주문날짜<span></span></p>
					<input type="text" name="name" value="2021-08-06" readonly>
				</div> 
			</div>
		</div>
		
		<br>
		<hr>
		<br>
		
		<div class="col">
            <button type="submit" onclick="location.href='WEB-INF/views/product/magShoppingListDetail.jsp'">완료</button>
        </div>
	</form>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
Sub
</style>
<title>Insert title here</title>
</head>
<body>
	<h2>상품 등록</h2>
<form:form commandName="product" action="/ProductRegister" method="post">
	<div style="border: 1px solid black;">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="p_Id" size="20" maxlength="4"></td>
	</tr><br><br>
	<tr>
		<th>제 목</th>
		<td><input type="text" name="p_Title" size="20" maxlength="12"></td>
	</tr><br><br>
	<tr>
		<th>작물</th>
		<select name="Main">
			<option value="none">=== 선택 ===</option>
			<option value="A">뿌리</option>
			<option value="B">구황작물</option>
			<option value="C">벼</option>
		</select>
	<tr><br><br>
		<div style="border: 1px solid black;">
			<form method="Sub" action="CheckboxServlet">
				<input type="checkbox" name="item" value="감자">감자 <input
					type="checkbox" name="item" value="고구마">고구마 <input
					type="checkbox" name="item" value="옥수수">옥수수 <input
					type="checkbox" name="item" value="당근">당근 <input
					type="checkbox" name="item" value="마늘">마늘 <input
					type="checkbox" name="item" value="벼">벼 <br>
			</form>
		</div><br><br>
	<tr>
		<td class="td_left" style="width: 20%;"><label >
				메인 이미지 </label></td>
		<td class="td_right" style="text-align: left;">
		<input type="file" accept="image/*" /></td>
	</tr><br><br>
	<tr>
		<td class="td_left" style="width: 20%;"><label >
				서브 이미지 </label></td>
		<td class="td_right" style="text-align: left;">
		<input type="file" accept="image/*"  /></td>
	</tr><br><br>
	<tr>
		<td class="td_left" colspan="1"><label >상세 내용</label></td>
		<td colspan="3"><textarea class="form-control" 
			 rows="10" placeholder="* 내용을 입력하세요." required> 
		</textarea></td>
	</tr><br><br>
	</div><br><br>
	<td colspan="2" align="center"><input type="submit" value="등록">
		<input type="reset" value="취소"></td>
</form:form>
</body>
</html>
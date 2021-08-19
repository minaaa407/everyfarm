<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form:form enctype="multipart/form-data" commandName="product" action="/ProductRegister"
		method="post"> 
		<table>
			<thead>
				<tr>
					<th scope="row" colspan="4">상품 등록</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="1" style="width: 20%;"><label>작성자</label></td>
					<td colspan="3"><input type="text" style="text-align: left;"
						name="p_Id" placeholder="* 이름을 입력하세요." maxlength="50" required
						autofocus></td>
				</tr>
				<tr>
					<td colspan="1" style="width: 20%;"><label>제 목</label></td>
					<td colspan="3"><input type="text" name="p_Title"
						maxlength="50" required autofocus></td>
				</tr>
				<tr>
				<tr>
					<td style="width: 20%;"><label> 메인 이미지 </label></td>
					<td style="text-align: left;"><input name="p_Img1" type="file"
						accept="image/*" />
						<input type="hidden" name="p_Img" value="1111">
						
						</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지1 </label></td>
					<td style="text-align: left;"><input name="p_Subimg12"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Subimg1" value="1111">
						
						</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지2 </label></td>
					<td style="text-align: left;"><input name="p_Subimg22"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Subimg2" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지3 </label></td>
					<td style="text-align: left;"><input name="p_Subimg32"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Subimg3" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지4 </label></td>
					<td style="text-align: left;"><input name="p_Subimg42"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Subimg4" value="1111"></td>
				</tr>

				<tr>
					<td style="width: 20%;"><label> 디테일 이미지1 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail12"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지2 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail22"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지3 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail32"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지4 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail42"
						type="file" accept="image/*" />
						<input type="hidden" name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td colspan="1"><label>상세 내용</label></td>
					<td colspan="3"><textarea class="form-control"
							name="p_Content" rows="10" placeholder="* 내용을 입력하세요." required> 
            </textarea></td>
				</tr>
				<tr>
					<td colspan="1" style="width: 20%;"><label>토지 크기</label></td>
					<td colspan="3"><input type="text" name="p_Land"
						maxlength="50" required autofocus></td>
				</tr>
				<tr>
					<td colspan="1" style="width: 20%;"><label>토지 가격</label></td>
					<td colspan="3"><input type="text" name="p_Landprice"
						maxlength="50" required autofocus></td>
				</tr>
				<tr>
					<td colspan="1" style="width: 20%;"><label>유지 관리비</label></td>
					<td colspan="3"><input type="text" name="p_Manpay"
						maxlength="50" required autofocus></td>
				</tr>
			</tbody>
		</table>
		<br>
		<div>
			<input type="submit" class="btn btn-dark" value="글쓰기">&nbsp;&nbsp;
			<button class="btn btn-outline-dark" onclick="back()">뒤로가기</button>
		</div>
	</form:form>
</body>
</html>
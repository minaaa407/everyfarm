<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.co.everyfarm.farmer.FarmerBean"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>
<%
	FarmerBean farmer = (FarmerBean) request.getSession().getAttribute("farmer");
%>


<!DOCTYPE html>
<html lang="kr">
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
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

<script>
	function hideRowSub() {
		const row = document.getElementById('Subimg');
		row.style.display = 'none';
	}

	function showRowSub() {
		const row = document.getElementById('Subimg');
		row.style.display = '';
	}
	
	/* function openClose() {
		if ($('#post-box').css('display') == 'block') {
		$('#post-box').hide();  
		} else {
		$('#post-box').show();
		} */

	function hideRowDetail() {
		const row = document.getElementById('Imgdetail');
		row.style.display = 'none';
	}

	function showRowDetail() {
		const row = document.getElementById('Imgdetail');
		row.style.display = '';
	}
</script>

<style>
table {
	width: 52%;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	vertical-align: middle;
	margin: auto;
}

thead th {
	padding: 15px;
	font-weight: bold;
	vertical-align: top;
	color: black;
	border-bottom: 3px solid black;
}

tbody td {
	width: 200px;
	font-size: 0.9em;
	vertical-align: left;
	border-bottom: 1px solid #ccc;
}

#button {
	text-align: center;
	color: #4e9525;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp" />
	
	<form:form enctype="multipart/form-data" commandName="product"
		action="/ProductRegister" method="post">
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
						name="p_Id" value="<%=farmer.getF_Id()%>" maxlength="50" required
						autofocus></td>
				</tr>
				<tr>
					<td colspan="1" style="width: 20%;"><label>제 목</label></td>
					<td colspan="3"><input type="text" name="p_Title"
						maxlength="50" required autofocus></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 메인 이미지 </label></td>
					<td style="text-align: left;"><input name="p_Img1" type="file"
						accept="img/*" /> <input type="hidden" name="p_Img" value=""></td>
				</tr>
				<tr>
					<td style="width: 20%;"><input type='button' value='서브사진 등록'
						onclick="javascript:showRowSub();"/></td>
					<td></td>
				</tr>
			<tbody id="Subimg" style="display: none;">
				<tr>
					<td style="width: 20%;"><label> 서브 이미지1 </label></td>
					<td style="text-align: left;"><input name="p_Subimg12"
						type="file" accept="subimg1/image/*" /> <input type="hidden"
						name="p_Subimg1" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지2 </label></td>
					<td style="text-align: left;"><input name="p_Subimg22"
						type="file" accept="subimg2/image/*" /> <input type="hidden"
						name="p_Subimg2" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지3 </label></td>
					<td style="text-align: left;"><input name="p_Subimg32"
						type="file" accept="subimg3/image/*" /> <input type="hidden"
						name="p_Subimg3" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 서브 이미지4 </label></td>
					<td style="text-align: left;"><input name="p_Subimg42"
						type="file" accept="subimg4/image/*" /> <input type="hidden"
						name="p_Subimg4" value="1111"><input type='button'
						value='닫기' onclick='hideRowSub()' /></td>
				</tr>
			</tbody>


			<tr>
				<td style="width: 20%;"><input type='button' value='상세사진 등록'
					onclick='showRowDetail()' /></td>
				<td></td>
			</tr>
			<tbody id="Imgdetail" style="display: none;">
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지1 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail12"
						type="file" accept="imgdetail1/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지2 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail22"
						type="file" accept="imgdetail2/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지3 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail32"
						type="file" accept="imgdetail3/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><label> 디테일 이미지4 </label></td>
					<td style="text-align: left;"><input name="p_Imgdetail42"
						type="file" accept="imgdetail4/image/*" /> <input type="hidden"
						name="p_Imgdetail" value="1111"><input type='button'
						value='닫기' onclick='hideRowDetail()' /></td>
				</tr>

			</tbody>
			<tr>
				<td colspan="1"><label>상세 내용</label></td>
				<td colspan="3"><textarea class="form-control" name="p_Content"
						placeholder="* 내용을 입력하세요." rows="10" required> 
            </textarea></td>
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
		<div id="button">
			<input type="submit" class="btn btn-dark" value="글쓰기">&nbsp;&nbsp;
			<button class="btn btn-outline-dark" onclick="history.go(-1);">뒤로가기</button>
		</div>
	</form:form>
	<br>
	<br>
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />

</body>
</html>
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


<script>
	function psub() {
		var item = document.getElementsByName("item");
		var name = "";
		for (var i = 0; i < item.length; i++) {
			if (item[i].checked == true) {
				if (name == "") {
					name = item[i].value;
				} else {
					name = name + "," + item[i].value;
				}
			}
		}

		document.getElementById("p_Sub").value = name;
		alert(document.getElementById("p_Sub").value);
	}
</script>
</head>
<body>
	<h2>상품 등록</h2>
	<form:form commandName="product" action="/ProductRegister"
		method="post">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="p_Id" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="p_Title" size="20" maxlength="12"></td>
			</tr>
			<tr>
			
			<tr>
				<td class="td_left" style="width: 20%;"><label> 메인 이미지
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Img" type="file" accept="image/*" /></td>
			</tr>
			<tr>
				<td class="td_left" style="width: 20%;"><label> 서브 이미지
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Subimg1" type="file" accept="image/*" /></td>
			</tr>
				<tr>
				<td class="td_left" style="width: 20%;"><label> 서브 이미지2
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Subimg2" type="file" accept="image/*" /></td>
			</tr>
				<tr>
				<td class="td_left" style="width: 20%;"><label> 서브 이미지3
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Subimg3" type="file" accept="image/*" /></td>
			</tr>
				<tr>
				<td class="td_left" style="width: 20%;"><label> 서브 이미지4
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Subimg4" type="file" accept="image/*" /></td>
			</tr>
			
			<tr>
				<td class="td_left" style="width: 20%;"><label> 디테일 이미지1
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Imgdetail1" type="file" accept="image/*" /></td>
			</tr>
			<tr>
				<td class="td_left" style="width: 20%;"><label> 디테일 이미지2
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Imgdetail2" type="file" accept="image/*" /></td>
			</tr>
			<tr>
				<td class="td_left" style="width: 20%;"><label> 디테일 이미지3
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Imgdetail3" type="file" accept="image/*" /></td>
			</tr>
			<tr>
				<td class="td_left" style="width: 20%;"><label> 디테일 이미지4
				</label></td>
				<td class="td_right" style="text-align: left;"><input
					name="p_Imgdetail4" type="file" accept="image/*" /></td>
			</tr>		
		
			<tr>
				<td>상세 내용</td>
				<td><input type="text" name="p_Content" size="20"
					maxlength="20"></td>
			</tr>
			
			<tr>
				<td>토지 크기</td>
				<td><input type="text" name="p_Land" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>토지 가격</td>
				<td><input type="text" name="p_Landprice" size="20"
					maxlength="20"></td>
			</tr>
			<tr>
				<td>유지 관리비</td>
				<td><input type="text" name="p_Manpay" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
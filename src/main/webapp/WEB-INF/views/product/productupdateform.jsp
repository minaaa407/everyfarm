<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<title>Insert title here</title>
</head>
<body>
<h2>방명록 쓰기</h2>
<br>



<br>
${productonelist.p_Id}${productonelist.p_Title} ${productonelist.p_Content} ${productonelist.p_Image} ${productonelist.p_Imagedetail} ${productonelist.p_Land}
		  ${productonelist.p_Landprice} ${productonelist.p_Main} ${productonelist.p_Sub} ${productonelist.p_Seedprice} ${productonelist.p_Manpay}
		   ${productonelist.p_Delivery} ${productonelist.p_Accept}



<form:form commandName="product" action="/productupdate" method="post">
<table width="600"><tr>
<th>아이디</th>
<td><input type="text" name="p_Id" size="12" maxlength="4">
<input type="hidden" name="p_No" value="${productonelist.p_No}"></td>
</tr><tr>
<th>타이틀</th>
<td><input type="text" name="p_Title" size="12" maxlength="12"></td>
</tr><tr>
<th>내용</th>
<td><input type="text" name="p_Content" size="12" maxlength="12"></td>
</tr><tr>
<th>이미지경로</th>
<td><input type="text" name="p_Image" size="30" maxlength="30"></td>
</tr><tr>
<th>이미지세부경로</th>
<td><input type="text" name="p_Imagedetail" size="50" maxlength="50"></td>
</tr><tr>
<th>땅 숫자</th>
<td><input type="number" name="p_Land" size="50" maxlength="50"></td>
</tr><tr>
<th>땅 가격</th>
<td><input type="number" name="p_Landprice" size="12" maxlength="4"></td>
</tr><tr>
<th>대분류</th>
<td><input type="text" name="p_Main" size="12" maxlength="4"></td>
</tr><tr>
<th>소분류(씨앗</th>
<td><input type="text" name="p_Sub" size="12" maxlength="4"></td>
</tr><tr>
<th>씨앗가격</th>
<td><input type="number" name="p_Seedprice" size="12" maxlength="4"></td>
</tr><tr>
<th>인력비</th>
<td><input type="number" name="p_Manpay" size="12" maxlength="4"></td>
</tr><tr>
<th>배송비</th>
<td><input type="number" name="p_Delivery" size="12" maxlength="4"></td>
</tr><tr>
<th>승인여부 y,n</th>
<td><input type="text" name="p_Accept" size="12" maxlength="4"></td>
</tr>


<tr>
<td colspan="2" align="center">
<input type="submit" value="쓰기">
<input type="reset" value="취소">
<input type="button" value="리스트"  onclick="location.href='list.htm';"> </td>
</tr></table></form:form>

</body>
</html>
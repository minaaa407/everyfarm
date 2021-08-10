<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>방명록 쓰기</h2>
<form action="/productinsert" method="post">
<table width="600"><tr>
<th>아이디</th>
<td><input type="text" name="p_id" size="12" maxlength="4"></td>
</tr><tr>
<th>내용</th>
<td><input type="text" name="p_title" size="12" maxlength="12"></td>
</tr><tr>
<th>이미지경로</th>
<td><input type="text" name="p_image" size="30" maxlength="30"></td>
</tr><tr>
<th>이미지세부경로</th>
<td><input type="text" name="p_imagedetail" size="50" maxlength="50"></td>
</tr><tr>
<th>땅 숫자</th>
<td><input type="number" name="p_land" size="50" maxlength="50"></td>
</tr><tr>
<th>땅 가격</th>
<td><input type="number" name="p_landprice" size="12" maxlength="4"></td>
</tr><tr>
<th>대분류</th>
<td><input type="text" name="p_main" size="12" maxlength="4"></td>
</tr><tr>
<th>소분류(씨앗</th>
<td><input type="text" name="p_sub" size="12" maxlength="4"></td>
</tr><tr>
<th>씨앗가격</th>
<td><input type="number" name="p_seedprice" size="12" maxlength="4"></td>
</tr><tr>
<th>인력비</th>
<td><input type="number" name="p_manpay" size="12" maxlength="4"></td>
</tr><tr>
<th>배송비</th>
<td><input type="number" name="p_delivery" size="12" maxlength="4"></td>
</tr><tr>
<th>승인여부 y,n</th>
<td><input type="text" name="p_accept" size="12" maxlength="4"></td>
</tr>


<tr>
<td colspan="2" align="center">
<input type="submit" value="쓰기">
<input type="reset" value="취소">
<input type="button" value="리스트"  onclick="location.href='list.htm';"> </td>
</tr></table></form>

</body>
</html>
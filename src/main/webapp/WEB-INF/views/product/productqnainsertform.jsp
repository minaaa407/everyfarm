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
<form:form commandName="productqna" action="/productqnainsert" method="post">
<table width="600"><tr>
<th>아이디</th>
<td><input type="text" name="c_Id" size="12" maxlength="4"></td>
</tr><tr>
<th>번호</th>
<td><input type="number" name="c_No" size="12" maxlength="12"></td>
</tr><tr>
<th>내용</th>
<td><input type="text" name="c_Content" size="12" maxlength="12"></td>
</tr><tr>
<th>큰번호</th>
<td><input type="number" name="c_Mainno" size="30" maxlength="30"></td>
</tr><tr>
<th>작은번호</th>
<td><input type="number" name="c_Subno" size="50" maxlength="50"></td>
</tr><tr>
<th>비밀 YN</th>
<td><input type="text" name="c_Secret" size="50" maxlength="50"></td>
</tr>


<tr>
<td colspan="2" align="center">
<input type="submit" value="쓰기">
<input type="reset" value="취소">
<input type="button" value="리스트"  onclick="location.href='list.htm';"> </td>
</tr></table></form:form>

</body>
</html>
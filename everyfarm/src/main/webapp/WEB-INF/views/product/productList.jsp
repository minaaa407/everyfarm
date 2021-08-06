<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList</title><style>
	body{ font-size: 11pt; color: teal;}
	div{ margin: 0 auto;}
</style>
</head><div>
	<h2>사원정보 리스트</h2>
	<c:forEach var="p" items="${productlist }">
		 <a href="/productupdateform?no=${p.p_No}">${p.p_No}</a>  ${p.p_Id}${p.p_Title} ${p.p_Content} ${p.p_Image} ${p.p_Imagedetail} ${p.p_Land}
		  ${p.p_Landprice} ${p.p_Main} ${p.p_Sub} ${p.p_Seedprice} ${p.p_Manpay} ${p.p_Delivery} ${p.p_Accept}
		
<br/>
	</c:forEach>
<p>테스트 진행 중...</p>
</div>
<body>

</body>
</html>
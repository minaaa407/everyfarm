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
	<c:forEach var="p" items="${productqnalist }">
		${p.c_Seq } ${p.c_Id } ${p.c_No } ${p.c_Date } ${p.c_Mainno } ${p.c_Subno } ${p.c_Secret } 
	</c:forEach>
<p>테스트 진행 중...</p>
</div>
<body>

</body>
</html>
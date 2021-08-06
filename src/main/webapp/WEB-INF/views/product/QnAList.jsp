
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

<link rel="stylesheet" href="resources/index/css/animate.css">
<link rel="stylesheet" href="resources/index/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/index/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/index/css/magnific-popup.css">
<link rel="stylesheet" href="resources/index/css/ionicons.min.css">
<link rel="stylesheet" href="resources/index/css/flaticon.css">
<link rel="stylesheet" href="resources/index/css/icomoon.css">
<link rel="stylesheet" href="resources/index/css/style.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<title>QnA : EveryFarm</title>
</head>
<body>
<div class="container">
			<div class="row">
			<a class="list-group-item list-group-item-action group">
			<div class="row">
			<div class="col">
			<div class="row TextCenter">
			
      <span class="col-md-2">번호</span>
      <span class="col-md-2">아이디</span>
      <span class="col-md-2">제목</span>
   	  <span class="col-md-2">내용</span>
      <span class="col-md-4">날짜</span>
      		
  </div>
  </div>
  </div>
  </a>
  
  <a class="list-group-item list-group-item-action">
			<div class="row">
			<div class="col">
			<div class="row" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true" aria-controls="collapseExample">
			<c:forEach var="Q" items="${QnAList }">
      <span class="col-md-2">${Q.q_No }</span>
      <span class="col-md-2">${Q.q_Id }</span>
          
   	  <span class="col-md-2">${Q.q_Title }</span>
      <span class="col-md-2">${Q.q_Content }</span>
      <span class="col-md-4">${Q.q_Date }</span>
  	  </c:forEach>
  	  <div class="collapse" id="collapseExample"><br>
 	  	<div class="col-md-5">Test</div> 
 	  	
 		<hr>
 		
    <div class="row">
     <div class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;관리자 답변 :</div>
  <div class="col-md-5">Test</div>
  </div>
 	
  </div>
  </div>
  </div>
  </div>
  </a>
  </div>
  </div>
</body>
</html>
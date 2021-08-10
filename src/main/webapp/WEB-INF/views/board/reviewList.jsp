<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
   
    <link rel="stylesheet" href="resources/review/reviewList/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/ss/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/style.css" type="text/css">

   
</head>

<body>
    <!-- Page Preloder -->

    <div id="preloder">
        <div class="loader"></div>
    </div>
    

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table style=" border: 1px solid #444444;">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th></th> <!-- 이미지 -->
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>내용</th>
                                    <th></th> <!-- 별점 -->
                                    <th>조회수</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                           <c:choose>
                           		<c:when test="${empty revList}">
                           			<tr><td colspan="8" align="center">게시글이 없습니다.</td></tr>
                           		</c:when>
                           		<c:when test="${!empty revList}">
                            		<c:forEach var="re" items="${revList}">
                            		 <tr>
                            			<td>${re.rev_No}</td>
                            			<td><a href="#">${re.rev_Image}</a></td> <!-- 상세보기  -->
                            			<td><a href="#">${re.rev_Title}</a></td><!-- 상세보기  -->
                            			<td>${re.rev_Id}</td>
                            			<td>${re.rev_Cont}</td>
                            	 		<td>${re.rev_Rate}</td>
                            			<td>${re.rev_Readcount}</td>
                            			<td>${re.rev_Date}</td>
                            		</tr>
                            		</c:forEach>
                            	</c:when>
                           </c:choose>
		 
		 
                            </tbody>
                        </table>
                        <button type="button" id="revWrite" class="btn btn-outline-success" onclick="location.href='/reviewWrite'">글쓰기 </button>
                    </div>
                </div>
              </div>
            </div>
    </section>
<!-- 	<script type="text/javascript">
	('#revWrite').click(function() {
		var sesCheck = session.getAttribute("member");
		if(sesCheck == null){
			alert("로그인 후 이용 가능합니다.");
		}else{
			
		}
	});
	</script> -->

    <!-- Js Plugins -->
    <script src="resources/review/reviewList/js/jquery-3.3.1.min.js"></script>
    <script src="resources/review/reviewList/js/bootstrap.min.js"></script>
    <script src="resources/review/reviewList/js/jquery.nice-select.min.js"></script>
    <script src="resources/review/reviewList/js/jquery-ui.min.js"></script>
    <script src="resources/review/reviewList/js/jquery.slicknav.js"></script>
    <script src="resources/review/reviewList/js/mixitup.min.js"></script>
    <script src="resources/review/reviewList/js/owl.carousel.min.js"></script>
    <script src="resources/review/reviewList/js/main.js"></script>


</body>

</html>
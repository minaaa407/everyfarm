<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="widtd=device-widtd, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>REVIEW</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<!-- 
    <link rel="stylesheet" href="resources/review/reviewList/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/ss/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/review/reviewList/css/style.css" type="text/css">
    -->
<link rel="stylesheet"
	href="https://stackpatd.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/animate.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/owl.tdeme.default.min.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/review/reviewList/css/flaticon.css">
<link rel="stylesheet" href="resources/review/reviewList/css/style.css">
<link rel="stylesheet" href="resources/review/style.css">

<style type="text/css">
/* CSS 작업중 삭제 XXXXXXXX */
.container{
	margin: auto;
	
}
.bb {
	border-left: 0px solid rgba(0, 0, 0, 0.05);
	border-right: 0px solid rgba(0, 0, 0, 0.05);
	border-radius: 5px;
	border-bottom: 0px;
	border-collapse: separate;
    border-spacing: 0 20px;
    margin: auto;
}

.ff {
	background: #389d29 !important;
	margin-bottom: 20px;
	font-weight: 600;
	border-radius: 11px;
	padding: 0;
	border: 0;
	text-align: left;
}

.cc {

	text-align: center;
	padding: 20px 25px;
	color: #fff;
	font-size: 14px;
	font-weight: 700;
}

.bef-list {
text-align: center;
	margin-bottom: 20px;
	border-top: 0px;
	border-radius: 11px;
	padding: 0;
	margin: 0;
}

.list {
	border-right: 1px solid rgba(0, 0, 0, 0.05);
	margin-bottom: 20px;
	align-items: center;
	align-items: stretch;
	padding: 0;
	margin: 0;
	background: #F3F3F3;
}

.list-end {
border-right: 1px solid rgba(0, 0, 0, 0.05);
	border-bottom-left-radius: 11px;
	border-top-left-radius: 11px;
	margin-bottom: 20px;
	padding: 0;
	margin: 0;
	background: #F3F3F3;
}

.list-start {
	border-top-right-radius: 11px;
	border-bottom-right-radius: 11px;
	margin-bottom: 20px;
	padding: 0;
	margin: 0;
	background: #F3F3F3;
}
 /* a 태그 CSS 하는중 */
 a:link  {color: black; text-decoration: none;}
 a:visited  {color: black; text-decoration: none;}
 a:hover   {color: black; text-decoration: underline;}

	

/* CSS 작업중 삭제 XXXXXXXX */
</style>
</head>
<body>
	<!-- Shoping Cart Section Begin -->
	<section class="ftco-section">
		<div class="container">
			<div class="row flex-direction:row-reverse justify-content-center">
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text">

								<table class="bb">
									<thead>
										<tr class="ff">
											<td class="cc">번호</td>
											<td class="cc">제목</td>
											<td class="cc"></td>
											<td class="cc">작성자</td>
											<td class="cc">조회수</td>
											<td class="cc">작성일</td>
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${empty revList}">
											<tbody>
												<tr>
													<td align="center"><p>게시글이 없습니다</p></td>
												</tr>
											</tbody>
										</c:when>
										<c:when test="${!empty revList}">
											<c:forEach var="re" items="${revList}">
												<tr class="bef-list">
													<td class="list-end">${re.rev_No}</td>
													<td class="list"><a href="reviewDetail?rev_No=${re.rev_No}">${re.rev_Title}</a>
													<td class="list"><c:if test="${re.rev_Rate eq 0.5}">
															<img alt="0.5점"
																src="resources/review/reviewList/img/half.png" />
														</c:if> <c:if test="${re.rev_Rate eq 1}">
															<img alt="1점"
																src="resources/review/reviewList/img/one.png" />
														</c:if> <c:if test="${re.rev_Rate eq 1.5}">
															<img alt="1.5점"
																src="resources/review/reviewList/img/one-half.png" />
														</c:if> <c:if test="${re.rev_Rate eq 2}">
															<img alt="2점"
																src="resources/review/reviewList/img/two.png" />
														</c:if> <c:if test="${re.rev_Rate eq 2.5}">
															<img alt="2.5점"
																src="resources/review/reviewList/img/two-half.png" />
														</c:if> <c:if test="${re.rev_Rate eq 3}">
															<img alt="3점"
																src="resources/review/reviewList/img/three.png" />
														</c:if> <c:if test="${re.rev_Rate eq 3.5}">
															<img alt="3.5점"
																src="resources/review/reviewList/img/three-half.png" />
														</c:if> <c:if test="${re.rev_Rate eq 4}">
															<img alt="4점"
																src="resources/review/reviewList/img/four.png" />
														</c:if> <c:if test="${re.rev_Rate eq 4.5}">
															<img alt="4.5점"
																src="resources/review/reviewList/img/four-half.png" />
														</c:if> <c:if test="${re.rev_Rate eq 5}">
															<img alt="5점"
																src="resources/review/reviewList/img/five.png" />
														</c:if></td>
													<td class="list">${re.rev_Name}</td>
													<td class="list"><span class="fa fa-eye"></span>&nbsp;${re.rev_Readcount}</td>
													<td class="list-start"><fmt:formatDate
															pattern="yyyy/MM/dd" value="${re.rev_Date}" /></td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
								</table>
							<button type="button" id="revWrite"
								class="btn btn-outline-success"
								onclick="location.href='/reviewWrite'">글쓰기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
        <script type="text/javascript">
            $(document).ready(function(){
                 
                //--페이지 셋팅
                var totalPage = ${totalPage}; //전체 페이지
                var startPage = ${startPage}; //현재 페이지
                 
                var pagination = "";
                 
                //--페이지네이션에 항상 10개가 보이도록 조절
                var forStart = 0;
                var forEnd = 0;
                 
                if((startPage-5) < 1){
                    forStart = 1;
                }else{
                    forStart = startPage-5;
                }
                 
                if(forStart == 1){
                     
                    if(totalPage>9){
                        forEnd = 10;
                    }else{
                        forEnd = totalPage;
                    }
                     
                }else{
                     
                    if((startPage+4) > totalPage){
                         
                        forEnd = totalPage;
                         
                        if(forEnd>9){
                            forStart = forEnd-9
                        }
                         
                    }else{
                        forEnd = startPage+4;
                    }
                }
                //--페이지네이션에 항상 10개가 보이도록 조절
                 
                //전체 페이지 수를 받아 돌린다.
                for(var i = forStart ; i<= forEnd ; i++){
                    if(startPage == i){
                        pagination += ' <button name="page_move" start_page="'+i+'" disabled>'+i+'</button>';
                    }else{
                        pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >'+i+'</button>';
                    }
                }
                 
                //하단 페이지 부분에 붙인다.
                $("#pagination").append(pagination);
                //--페이지 셋팅
                 
                 
                $("a[name='subject']").click(function(){
                     
                    location.href = "/board/view?id="+$(this).attr("content_id");
                     
                });
                 
                $("#write").click(function(){
                    location.href = "/board/edit";
                });
                                 
                $(document).on("click","button[name='page_move']",function(){
                     
                    var visiblePages = 10;//리스트 보여줄 페이지
                     
                    $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
                    $('#visiblePages').val(visiblePages);
                     
                    $("#frmSearch").submit();
                     
                });
                 
            });
        </script>
	<script src="resources/review/reviewList/js/jquery.min.js"></script>
	<script
		src="resources/review/reviewList/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/review/reviewList/js/popper.min.js"></script>
	<script src="resources/review/reviewList/js/bootstrap.min.js"></script>
	<script src="resources/review/reviewList/js/jquery.easing.1.3.js"></script>
	<script src="resources/review/reviewList/js/jquery.waypoints.min.js"></script>
	<script src="resources/review/reviewList/js/jquery.stellar.min.js"></script>
	<script src="resources/review/reviewList/js/owl.carousel.min.js"></script>
	<script
		src="resources/review/reviewList/js/jquery.magnific-popup.min.js"></script>
	<script
		src="resources/review/reviewList/js/jquery.animateNumber.min.js"></script>
	<script src="resources/review/reviewList/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/review/reviewList/js/google-map.js"></script>
	<script src="resources/review/reviewList/js/main.js"></script>
	<script type="text/javascript">
		
	</script>
	<%-- 	
	<%@include file ="/WEB-INF/views/home/header.jsp" %>
	<%@include file ="/WEB-INF/views/home/footer.jsp" %> --%>
</body>

</html>
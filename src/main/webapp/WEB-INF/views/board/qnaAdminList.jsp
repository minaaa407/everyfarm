<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Foodeiblog Template">
    <meta name="keywords" content="Foodeiblog, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Foodeiblog | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Unna:400,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/qna/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/qna/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/qna/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/qna/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/qna/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/qna/css/style.css" type="text/css">
</head>

<body>
   <!-- Categories Section Begin -->
    <section class="categories categories-grid spad">
        <div class="categories__post">
            <div class="container">
                <div class="categories__grid__post">
                    <div class="row">
                        
                   
                        
                      <div class="col-lg-10 col-md-10">
                      
                       <c:choose>   
                 		<c:when test = "${empty productQlist}">
                 		</c:when>
                 		<c:when test = "${productQlist != null}">
                      
                         <div class="breadcrumb__text">
                                <h2><span>상품 문의 </span>게시판</h2>
                                <div class="breadcrumb__option">
                                   <form action="adminQnasearch" method="post">
         								<select name="searchBox"> <!-- style="padding: 7px 11px;" -->
              								<option value="all">전체 검색</option>
              								<option value="pno">상품번호</option>
         									<option value="ptitle">상품명</option>
         									<option value="content">내용</option>
         									<option value="id">아이디</option>
         								</select> 
         								
            							<input type="text" name="searchText">
            							
            							<select name="searchAnswer"> <!-- style="padding: 7px 11px;" -->
              								<option value="all">답글 여부</option>
              								<option value="o">답글 O</option>
             								<option value="x">답글 X</option>
            							</select> 
            							
            							<button type="submit" class="btn btn-primary">검색</button>
        							</form>
        							  <!-- <a href="#">Home</a>
                                   	  <span>Recipes</span> -->
                                   	  
        								<button type="submit" class="site-btn" onClick="location.href='/adminQnaList'">전체보기</button>
        								
                 						
                                </div>
                            </div>
                            
                            </c:when>
                         </c:choose>
                            
                     <!--   <form method="post" name="qnamodify" action="reservationUpdate.bo">      -->
                       
                       <%-- 
                            <c:choose>   
                  <c:when test = "${empty buylist}">   
                     <td colspan="12">내역이 없습니다.</td>
                  </c:when>
                  <c:when test = "${buylist != null}">
                   </c:when>
                     </c:choose> --%>
                     
           <%--  <c:when test = "${empty qnamylist}">   --%>            
                       
                        <c:choose>   
                 		<c:when test = "${empty productQlist}">
                 			<div>내역이 없습니다.</div>
                 		</c:when>
                 		<c:when test = "${productQlist != null}">
                            <c:forEach items="${productQlist}" var="q">
                         	<c:set var="i" value="${i+1}"/> 
                            
                 
                        	<div class="categories__list__post__item">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3">
                                        <div class="categories__post__item__pic set-bg"
                                            data-setbg="q_Img">
                                            <div class="post__meta">
                                                <%-- <h4>${q.q_No}</h4> --%>
                                               <h4>${i}</h4>
                                               <input type="hidden" id="" name="" value="${q.q_No}" />
                                                <span>QnA</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-9">
                                        <div class="categories__post__item__text">
                                        	<c:choose>
												<c:when test="${q.q_Secret == true}">
                                           			<ul class="post__label--large">
                                               	 		<li>비밀글</li>
                                                		<li>${q.q_Pno} : ${q.q_Ptitle}</li>
                                            		</ul>
                                            	</c:when>	
												<c:otherwise>
													<span class="post__label">${q.q_Pno} : ${q.q_Ptitle}</span>
												</c:otherwise>
											</c:choose>
                                           	 	<h3>${q.q_Title}</h3>
                                            		<ul class="post__widget">
                                                		<li><span>${q.q_Id}</span></li>
                                                		<li>${q.q_Date}</li>
                                                		
                                        	<c:choose>
												<c:when test="${q.q_Answer == false}">
											  		<li><button data-toggle="collapse" href="#collapseExample${i-1}" aria-expanded="false" 
                                                		aria-controls="collapseExample">내용 더보기</button></li>
												</c:when>
												<c:when test="${q.q_Answer == true}">
                                                	<li><button data-toggle="collapse" href="#collapseExample${i-1}" aria-expanded="false" 
                                                		aria-controls="collapseExample">내용 더보기 +답글</button></li>
                                            	</c:when>
                                         	</c:choose>
                                         
                                         <%--  <div class="collapse" id="collapseExample${i-1}"> --%>
                                           			 </ul>
                                           <%--  <p>${q.q_Content}</p> --%>
                                        </div>
                                        
                                        <div class="collapse" id="collapseExample${i-1}">
                                        
                                       		<p>${q.q_Content}</p>
                                         		<button type="button"  class="btn btn-primary" 
                                         			onclick="location.href='/adminMemQnaModify/${q.q_No}'">수정하기</button>
                                          		
										
                                        <%--  <button type="button"  class="btn btn-primary" 
                                         	onclick="location.href='/qnamodify?no=${q.q_No}'">수정하기</button> --%>
                                         			
														
                                 <c:choose>
                   								<c:when test="${q.q_Magdate != null}">
                   						               				<div class="single-post__leave__comment">
                     								
           											<form action="/adminFarmerQnaUpdate" name="adminFarmerQnaUpdate" method="post">
                     									<div class="input-list">
                           									<input type="text" name="q_Pid" value="${q.q_Pid}" readonly>
                            								<input type="hidden" name="q_No" value="${q.q_No}">
                        								</div>
                        									<textarea required id="q_magcontent" name="q_Magcontent">${q.q_Magcontent}</textarea>
               												<button type="submit" class="site-btn">답글 수정하기</button>
               												<br>
               												<button type="submit" class="site-btn" onclick="javascript: form.action='adminQnadelete/${q.q_No}';">QnA 삭제하기</button>
                         	
                   									</form>
      											</div> 	
                         						</c:when>
                         	 					<c:when test="${empty q.q_Magdate}">
                         	 					</c:when>
                         					</c:choose>
			                         	</div>
                        			 </div>
                      			</div>
                  			</div>
                  <!-- </div> -->  
               
                   <br>
    
                </c:forEach>
                </c:when>
             </c:choose>
            </div>
          </div>
         </div>
       </div>
     </div>
   </section>
   
<script type="text/javascript">

function qnadelete() {
	if (confirm('정말 삭제하시겠습니까?')) {  
		return true;
	} else {   
		event.preventDefault();
		return false;
	}
}
</script>
                  
    
    <!-- Js Plugins -->
    <script src="/resources/qna/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/qna/js/bootstrap.min.js"></script>
    <script src="/resources/qna/js/jquery.slicknav.js"></script>
    <script src="/resources/qna/js/owl.carousel.min.js"></script>
    <script src="/resources/qna/js/main.js"></script>
    
    
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kr.co.everyfarm.user.MemberBean"%>
<% MemberBean member  = (MemberBean) request.getSession().getAttribute("member"); %>
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
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
    <!-- Categories Section Begin -->
    <section class="categories categories-grid spad">
        <div class="categories__post">
            <div class="container">
                <div class="categories__grid__post">
                    <div class="row">
                       <div class="col-lg-10 col-md-10">
                      
                       <c:choose>   
                 		<c:when test = "${empty productQlist}">
                 			<div class="breadcrumb__text">
                                <h2><span>QnA </span>게시판</h2>
                           	</div>
                           		<button type="submit" class="site-btn" onClick="location.href='/qnalist'">전체보기</button>
        						<button type="submit" class="site-btn" onClick="location.href='/qnamylist'">내가 쓴 글</button>
        						<button type="submit" class="site-btn" onClick="location.href='/qnawrite'">문의하기</button>
                 		</c:when>
                 		<c:when test = "${productQlist != null && paging.f_Id != null}">
                 			<div class="breadcrumb__text">
                                <h2><span>QnA </span>게시판</h2>
                           	</div>
                           		<button type="submit" class="site-btn" onClick="location.href='/qnalist'">전체보기</button>
        						<button type="submit" class="site-btn" onClick="location.href='/qnamylist'">내가 쓴 글</button>
        						<button type="submit" class="site-btn" onClick="location.href='/qnawrite'">문의하기</button>
                 		</c:when>
                 		<c:when test = "${productQlist != null && empty paging.f_Id }">
                      
                         <div class="breadcrumb__text">
                                <h2><span>QnA </span>게시판</h2>
                                <div class="breadcrumb__option">
                                   <form action="searchqna" method="post">
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
                                   	  
        								<button type="submit" class="site-btn" onClick="location.href='/qnalist'">전체보기</button>
        								<button type="submit" class="site-btn" onClick="location.href='/qnamylist'">내가 쓴 글</button>
        								<button type="submit" class="site-btn" onClick="location.href='/qnawrite'">문의하기</button>
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
                            
                            <c:choose>
                             <c:when test="${sessionScope.member.getM_Id() ne q.q_Id && q.q_Secret == true}">
                                       <div class="categories__list__post__item">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3">
                                        <div class="categories__post__item__pic set-bg">
                                            <%-- data-setbg="${q.q_Img}" --%>
                                            <img data-imgbigurl="resources/upload/qna/${q.q_No}/${q.q_Img}"
												 src="resources/upload/qna/${q.q_No}/${q.q_Img}"
												 alt=""
											     name="resources/upload/qna/${q.q_No}/${q.q_Img}"
												 style="cursor: pointer" >
                                            
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
                                       
                                           <!--  <span class="post__label">비밀글</span> -->
                                            
                                             <ul class="post__label--large">
                                                <li>비밀글</li>
                                                <li>${q.q_Pno} : ${q.q_Ptitle}</li>
                                            </ul>
                               				 	<h3>비밀글 입니다.</h3>
                                            <ul class="post__widget">
                                                <li><span>${q.q_Id}</span></li>
                                                <li>${q.q_Date}</li>
                                     
                                                <li></li>
                                         	 </ul>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
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
                                        
                                          		<c:choose>
													<c:when test="${sessionScope.member.getM_Id() eq q.q_Id}"> 
										
                                        <%--  <button type="button"  class="btn btn-primary" 
                                         	onclick="location.href='/qnamodify?no=${q.q_No}'">수정하기</button> --%>
                                         				<c:choose>
															<c:when test="${q.q_Answer == false}">
                                        						 <button type="button"  class="btn btn-primary" 
                                         							onclick="location.href='/qnamodify/${q.q_No}'">수정하기</button>
                                         					</c:when>
															<c:when test="${q.q_Answer == true}">
                                       						</c:when>
                                       					</c:choose>
                                       						<form action="/qnadelete/${q.q_No}" id="delete" name="delete" class="btn btn-primary" method="post" >
                                        						<button type="submit"  class="btn btn-primary" onclick="qnadelete();">삭제하기</button>
                                        					</form>
                                    				</c:when>
					                                <c:when test="${sessionScope.member.getM_Id() ne q.q_Id}">
													</c:when>
											</c:choose>
											
					                        <c:choose>
                   								<c:when test="${q.q_Magdate != null}">
								                    <div class="single-post__author__profile">
                                 						<div class="single-post__author__profile__text">
                                 							<div class="widget__title">
                            									<h4>by ${q.q_Pid}</h4>
                        									</div>
	                            								<sapn>${q.q_Magdate}</sapn>
                               									<p>${q.q_Magcontent}</p>
              					 						</div>
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
                       </c:otherwise>
                    </c:choose>
                   
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
   
   	<div style="display: block; text-align: center;">	
   	
   		<c:choose>
   			<c:when test="${paging.startPage != 1 && paging.q_Content != null}">	
   				<a href="/searchqna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchBox=${paging.q_Ptitle}&searchText=${paging.q_Content}&searchAnswer=${paging.q_Answer}"">&lt;</a>
   			</c:when>
			<c:when test="${paging.startPage != 1 && empty paging.q_Content && empty paging.f_Id}">	
				<a href="/qnalist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:when>
			<c:when test="${paging.startPage != 1 && paging.f_Id != null}">	
				<a href="/qnamylist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:when>
		</c:choose>
		
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage && paging.q_Content != null}">
					<a href="/searchqna?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchBox=${paging.q_Ptitle}&searchText=${paging.q_Content}&searchAnswer=${paging.q_Answer}">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage && empty paging.q_Content && empty paging.f_Id}">
					<a href="/qnalist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage && paging.f_Id != null}">
					<a href="/qnamylist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${paging.endPage != paging.lastPage && paging.q_Content != null}">
				<a href="/searchqna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchBox=${paging.q_Ptitle}&searchText=${paging.q_Content}&searchAnswer=${paging.q_Answer}">&gt;</a>
			</c:when>
			<c:when test="${paging.endPage != paging.lastPage && empty paging.q_Content && empty paging.f_Id}">
				<a href="/qnalist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:when>
			<c:when test="${paging.endPage != paging.lastPage && paging.f_Id != null}">
				<a href="/qnamylist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:when>
		</c:choose>
		
	</div>
   
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
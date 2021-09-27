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
    <title>EVERY FARM | Q&A</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
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
    <link rel="stylesheet" href="/resources/qna/css/style.css?2" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">


<style type="text/css">

#qnaimg:hover {opacity: 0.6;}

.innerbutton {
    background: #ffffff !important;
    border: 2px solid #a7aba7 !important;
    color: #060606 !important;
    font-weight: 500;
    padding-top: 2px;
}

</style>
</head>

<body>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
    <!-- Categories Section Begin -->
    <section class="categories categories-grid spad" style="padding-top: 0; background-color: #fafbf9;">
        <div class="categories__post" style="min-height: 100vh">
            <div class="container">
                <div class="categories__grid__post">
                    <div class="row" >
                       <div class="col-lg-12 col-md-12">
                      
                       <c:choose>   
                 		<c:when test = "${empty productQlist}">
                 			<div class="breadcrumb__text">
                                 <h2 style="color:#988d8d; display: flex; justify-content: center; margin-top: 10px; margin-bottom: 80px; font-size: 40px; font-weight: bold;"><span style="padding-right: 10px;">QnA </span>게시판</h2>
                           	</div>
                           	 <div style="display: flex;justify-content: flex-end;margin-bottom: 10px;">
                           		<button type="submit" class="site-btn" style="border-radius: 5px; margin-right: 4px;" onClick="location.href='/qnalist'">전체보기</button>
        						<button type="submit" class="site-btn" style="border-radius: 5px; margin-right: 4px;" onClick="location.href='/qnamylist'">내가 쓴 글</button>
        						<button type="submit" class="site-btn" style="border-radius: 5px;" onClick="location.href='/qnawrite'">문의하기</button>
                 			</div>
                 		</c:when>
                 		<c:when test = "${productQlist != null && paging.f_Id != null}">  <!-- 내가 쓴 글  -->
                 			<div class="breadcrumb__text" style="margin-bottom: 10px;">
                                <h2 style="color:#988d8d; display: flex; justify-content: center; margin-top: 10px; margin-bottom: 80px; font-size: 40px; font-weight: bold;"><span style="padding-right: 10px;">QnA </span>게시판</h2>
                           	
                           	<div style="display: flex;justify-content: flex-end;">
                           		<button type="submit" class="site-btn" style="border-radius: 5px; margin-right: 5px;" onClick="location.href='/qnalist'">전체보기</button>
        						<button type="submit" class="site-btn" style="border-radius: 5px; margin-right: 5px;" onClick="location.href='/qnamylist'">내가 쓴 글</button>
        						<button type="submit" class="site-btn" style="border-radius: 5px;" onClick="location.href='/qnawrite'">문의하기</button>
                 			</div>
                 			</div>
                 		</c:when>
                 		<c:when test = "${productQlist != null && empty paging.f_Id }">
                      	
                         <div class="breadcrumb__text" style="margin-bottom: 10px;">
                         		  <h2 style="color:#988d8d; display: flex; justify-content: center; margin-top: 10px; margin-bottom: 80px; font-size: 40px; font-weight: bold;"><span style="padding-right: 10px;">QnA </span>게시판</h2>
                         	<div class="breadcrumb__option">
                         		<div style="display: flex; justify-content: space-between;">
                                   <form action="searchqna" method="post">
         								<select name="searchBox" style="height: 35px;"> <!-- style="padding: 7px 11px;" -->
              								<option value="all">전체 검색</option>
              								<option value="pno">상품번호</option>
         									<option value="ptitle">상품명</option>
         									<option value="content">내용</option>
         									<option value="id">아이디</option>
         								</select> 
         								
            							<input type="text" name="searchText">
            							
            							<select name="searchAnswer" style="height: 35px;"> <!-- style="padding: 7px 11px;" -->
              								<option value="all">답글 여부</option>
              								<option value="o">답글 Y</option>
             								<option value="x">답글 N</option>
            							</select> 
            							
            							<button type="submit" class="btn btn-primary" style="height: 35px;">검색</button>
            							
        							</form>
        							  <!-- <a href="#">Home</a>
                                   	  <span>Recipes</span> -->
                                   	  <div>
        								<button type="submit" class="site-btn" style="border-radius: 5px;" onClick="location.href='/qnalist'">전체보기</button>
        								<button type="submit" class="site-btn" style="border-radius: 5px;" onClick="location.href='/qnamylist'">내가 쓴 글</button>
        								<button type="submit" class="site-btn" style="border-radius: 5px;" onClick="location.href='/qnawrite'">문의하기</button>
                               		  </div>
                               	</div>
                             </div>
                         </div>
                            
                            </c:when>
                          </c:choose>
                            
                     
                       <div class="row" style="box-shadow: 0px 2px 10px rgb(0 0 0 / 8%); background-color: white;">
                        <div class="col-lg-12 col-md-12" style="padding-top: 50px;">
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
                        	<div class="d-block d-sm-none" style="border-top: 2px solid #000000;"></div> <!-- 1px solid #dee2e6; -->
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3">
                                        <div class="categories__post__item__pic set-bg" style="margin-bottom: 0px;">
                                             <a href="https://www.flaticon.com/kr/authors/surang" title="surang">
                                             <img data-imgbigurl="resources/qna/img/lock.png"
                                             		src="resources/qna/img/lock.png"
                                             		style="padding-left: 100px; opacity:0.7"></a>
                                            
                                            <div class="post__meta">
                                                	 <h4>${i}</h4>
                                               <input type="hidden" id="" name="" value="${q.q_No}" />
                                                <span>QnA</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                         <div class="categories__post__item__text">
                                       
                                             <ul class="post__label--large" style="margin-bottom: -10px; padding-left: 10px;">
                                                <li style="border-bottom: 0px;">비밀글</li>
                                                <li>${q.q_Pno} : ${q.q_Ptitle}</li>
                                            </ul>
                               				 	<h3 style="padding-left: 10px;">비밀글 입니다.</h3>
                                            <ul class="post__widget" style="display: flex; justify-content: flex-end;">
                                                <li style="font-size: 13px; margin-right: 0px;"><span>${q.q_Id}</span></li>
                                                <li style="margin-right: 10px;margin-left: 0px;font-size: 13px;padding-left: 20px;">${q.q_Date}</li>
                                         	 </ul>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                        	<div class="categories__list__post__item">
                        	<div class="d-block d-sm-none" style="border-top: 2px solid #000000;"></div> <!-- 1px solid #dee2e6; -->
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3">
                                        <div class="categories__post__item__pic set-bg" style="margin-bottom: 0px;">
                                            <%-- data-setbg="${q.q_Img}" --%>
                                             <c:choose>
                                              <c:when test="${ !(empty q.q_Img)}">
                                              
                                               <a href="resources/upload/qna/${q.q_No}/${q.q_Img}" data-toggle="lightbox" data-title="${q.q_Title}" data-footer="${q.q_Id}">
                								<img data-imgbigurl="resources/upload/qna/${q.q_No}/${q.q_Img}" 
												 src="resources/upload/qna/${q.q_No}/${q.q_Img}"
												 alt="${q.q_No}" title="이미지를 클릭하면 커집니다."
											     name="resources/upload/qna/${q.q_No}/${q.q_Img}"
												 style="cursor: pointer;  max-height: 300px;" id="qnaimg"
												 class="img-fluid rounded">
            								</a>
                                            </c:when>
                                           <c:otherwise>
                                          
                                           </c:otherwise>
                                         </c:choose>
                                            
                                            <div class="post__meta">
                                                <%-- <h4>${q.q_No}</h4> --%>
                                               <h4>${i}</h4>
                                               <input type="hidden" id="" name="" value="${q.q_No}" />
                                                <span>QnA</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <div class="categories__post__item__text">
                                        	<c:choose>
												<c:when test="${q.q_Secret == true}">
                                           			<ul class="post__label--large" style="margin-bottom: -10px; padding-left: 10px;">
                                               	 		<li style="border-bottom: 0px;">비밀글</li>
                                                		<li>${q.q_Pno} : ${q.q_Ptitle}</li>
                                            		</ul>
                                            	</c:when>	
												<c:otherwise>
													<%-- <span class="post__label">${q.q_Pno} : ${q.q_Ptitle}</span> --%>
													<ul class="post__label--large" style="margin-bottom: 10px; padding-left: 10px;">
                                                		<li>${q.q_Pno} : ${q.q_Ptitle}</li>
                                            		</ul>
												</c:otherwise>
											</c:choose>
                                           	 	<h3 style="padding-left: 10px;">${q.q_Title}</h3>
                                            		<ul class="post__widget" style="display: flex; justify-content: flex-end;">
                                            		<div class="d-none d-sm-block">
                                                		<li style="font-size: 13px; margin-right: 0px;"><span>${q.q_Id}</span></li>
                                                		<li style="margin-right: 10px;margin-left: 0px;font-size: 13px;padding-left: 20px;">${q.q_Date}</li>
                                                	</div>
                                                	<div class="d-block d-sm-none">	
                                                		<li style="font-size: 13px;margin-right: 0px; border-bottom: 0px solid #dee2e6;"><span>${q.q_Id}</span></li>
                                                		<li style="margin-right: 10px;margin-left: 0px;font-size: 13px;padding-left: 20px; border-bottom: 0px solid #dee2e6;">${q.q_Date}</li>
                                   
                                                	</div>
                                        		<c:choose>
													<c:when test="${q.q_Answer == false}">
											  			<li style="margin-left: 5px;margin-right: 10px;"><button class="innerbutton" data-parent="#accordion" data-toggle="collapse" data-target="#collapseExample${i-1}" aria-expanded="false" 
                                                			aria-controls="collapseExample">더보기</button></li>
													</c:when>
													<c:when test="${q.q_Answer == true}">
                                                		<li style="margin-left: 5px;margin-right: 10px;"><button class="innerbutton" data-parent="#accordion" data-toggle="collapse" data-target="#collapseExample${i-1}" aria-expanded="false" 
                                                			aria-controls="collapseExample">더보기 + 답글</button></li>
                                            		</c:when>
                                         		</c:choose>
                                         		
                                         		
                                         		
                                         		<c:choose>
													<c:when test="${sessionScope.member.getM_Id() eq q.q_Id}"> 
														<c:choose>
															<c:when test="${q.q_Answer == false}">
                                        						<li style="margin-right: 10px;"><button type="button"  class="innerbutton" 
                                         							onclick="location.href='/qnamodify/${q.q_No}'">수정</button></li>
                                         					</c:when>
															<c:when test="${q.q_Answer == true}">
                                       						</c:when>
                                       					</c:choose>
                                       						<form action="/qnadelete/${q.q_No}" id="delete" name="delete" method="post" >
                                        						<li><button type="submit" style="padding-top: 2.5; padding-bottom: 0px; padding-top: 2px;" class="innerbutton" onclick="qnadelete();">삭제</button></li>
                                        					</form>
                                    				</c:when>
					                                <c:when test="${sessionScope.member.getM_Id() ne q.q_Id}">
													</c:when>
											</c:choose>
                                         		 </ul>
                                     
                                        </div>
                                        
                                        <div class="collapse in" id="collapseExample${i-1}">
                                        	<div style="font-size: 15px; margin-left: 15px; margin-bottom: 30px;">
                                       		${q.q_Content}
                                       		</div>
                                         <c:choose>
                   								<c:when test="${q.q_Magdate != null}">
								                    <div class="single-post__author__profile" style="border-radius: 10px;">
                                 						<div class="single-post__author__profile__text">
                                 							<div class="widget__title" style="margin-bottom: 30px;">
                            									<h4 style="margin-right: 8px;">by ${q.q_Pid}</h4>
                            									<span style="font-size: 14px;">${q.q_Magdate}</span>
                        									</div>
	                            								
                               									<span>${q.q_Magcontent}</span>
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
       </div>
     </div>
   </section>
   
   	<div style="display: block; text-align: center; background-color: #fafbf9;">	
   	
   		<c:choose>
   			<c:when test="${paging.startPage != 1 && paging.q_Content != null}">	
   				<a href="/searchqna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchBox=${paging.q_Ptitle}&searchText=${paging.q_Content}&searchAnswer=${paging.q_Answer}">&lt;</a>
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

$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});

document.getElementById('a1').className ='nav-item';
document.getElementById('a2').className ='nav-item';
document.getElementById('a3').className ='nav-item';
document.getElementById('a4').className ='nav-item active';

</script>
                  
    
    
<jsp:include page="/WEB-INF/views/home/footer.jsp" /> 
</body>
    <!-- Js Plugins -->
    <script src="/resources/qna/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/qna/js/bootstrap.min.js"></script>
    <script src="/resources/qna/js/jquery.slicknav.js"></script>
    <script src="/resources/qna/js/owl.carousel.min.js"></script>
    <script src="/resources/qna/js/main.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

</html>
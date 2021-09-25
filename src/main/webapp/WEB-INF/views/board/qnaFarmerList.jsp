<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kr.co.everyfarm.farmer.FarmerBean"%>
<% FarmerBean farmer  = (FarmerBean) request.getSession().getAttribute("farmer"); %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Foodeiblog Template">
    <meta name="keywords" content="Foodeiblog, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EVERY FARM 농부 | Q&A 관리</title>

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
    <link rel="stylesheet" href="/resources/qna/css/style.css?1" type="text/css">

	<!-- 이미지 클릭시 확대 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">

<style type="text/css">
body{
background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;
}
.paging{
	padding: 8px 16px;
    border-radius: 20%;
}
</style>

</head>

<body style="overflow-x: hidden">


 <!-- Navigation -->
      <nav
      class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
      id="sidenav-main" style="z-index: 1;">
      <div class="container-fluid">
         <!-- Toggler -->
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <!-- User -->
         <ul class="nav align-items-center d-md-none">
            <li class="nav-item dropdown"><a class="nav-link nav-link-icon"
               href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="ni ni-bell-55"></i>
            </a>
               <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right"
                  aria-labelledby="navbar-default_dropdown_1">
                  <a class="dropdown-item" href="#">Action</a> <a
                     class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
               </div></li>
            <li class="nav-item dropdown"><a class="nav-link" href="#"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false">
                  <div class="media align-items-center">
                     <span class="avatar avatar-sm rounded-circle"> <img
                        alt="Image placeholder"
                        src="resources/admin/img/theme/team-1-800x800.jpg">
                     </span>
                  </div>
            </a>
               <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                  <div class=" dropdown-header noti-title">
                     <h6 class="text-overflow m-0">Welcome!</h6>
                  </div>
                  <a href="./examples/profile.html" class="dropdown-item"> <i
                     class="ni ni-single-02"></i> <span>My profile</span>
                  </a> <a href="./examples/profile.html" class="dropdown-item"> <i
                     class="ni ni-settings-gear-65"></i> <span>Settings</span>
                  </a> <a href="./examples/profile.html" class="dropdown-item"> <i
                     class="ni ni-calendar-grid-58"></i> <span>Activity</span>
                  </a> <a href="./examples/profile.html" class="dropdown-item"> <i
                     class="ni ni-support-16"></i> <span>Support</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
                     <span>Logout</span>
                  </a>
               </div></li>
         </ul>
         <!-- Collapse -->
         <div class="collapse navbar-collapse" id="sidenav-collapse-main">
            <!-- Collapse header -->
            <div class="navbar-collapse-header d-md-none">
               <div class="row">
                  <div class="col-6 collapse-brand">
                     <a href="./index.html"> <img
                        src="resources/admin/img/brand/blue.png">
                     </a>
                  </div>
                  <div class="col-6 collapse-close">
                     <button type="button" class="navbar-toggler"
                        data-toggle="collapse" data-target="#sidenav-collapse-main"
                        aria-controls="sidenav-main" aria-expanded="false"
                        aria-label="Toggle sidenav">
                        <span></span> <span></span>
                     </button>
                  </div>
               </div>
            </div>
            <!-- Navigation -->
            <jsp:include page="/WEB-INF/views/farmer/farmerSideMenu.jsp"></jsp:include>
         </div>
      </div>
   </nav>

    <!-- Categories Section Begin -->
    <section class="categories categories-grid spad">
        <div class="categories__post">
         <div class="container">
                <div class="categories__grid__post">
                    <div class="row">
					 <div class="col-lg-12 col-md-12">
                      	<c:choose>   
                 			<c:when test = "${empty productQlist}">
                 				<div class="breadcrumb__text">
<!--                                  <h2 style="color:#988d8d; display: flex; justify-content: center; margin-top: 10px; margin-bottom: 80px; font-size: 40px; font-weight: bold;"><span style="padding-right: 10px;">QnA </span>게시판</h2>
 -->                           		</div>
                           		<div style="display: flex;justify-content: flex-end;margin-bottom: 10px;">
                                   	  <button type="submit" class="site-btn" style="border-radius: 5px; background-color: #5e72e4;" onClick="location.href='/farmerQnaList'">전체보기</button>
        						</div>
                 			</c:when>
                 			<c:when test = "${productQlist != null}">
                      
                         	<div class="breadcrumb__text" style="margin-bottom: 10px;">
<!--                                  <h2 style="color:#988d8d; display: flex; justify-content: center; margin-top: 10px; margin-bottom: 80px; font-size: 40px; font-weight: bold;"><span style="padding-right: 10px;">QnA </span>게시판</h2>
 -->                                <div class="breadcrumb__option">
                                  <div style="display: flex; justify-content: space-between;">
                                   <form action="farmerQnasearch" method="post">
         								<select name="searchBox" style="height: 35px;"> <!-- style="padding: 7px 11px;" -->
              								<option value="all">전체 검색</option>
              								<option value="pno">상품번호</option>
         									<option value="ptitle">상품명</option>
         									<option value="content">내용</option>
         									<option value="id">아이디</option>
         								</select> 
         								
            							<input type="text" name="searchText" style="height: 35px;">
            							
            							<select name="searchAnswer" style="height: 35px;"> <!-- style="padding: 7px 11px;" -->
              								<option value="all">답글 여부</option>
              								<option value="o">답글 Y</option>
             								<option value="x">답글 N</option>
            							</select> 
            							<button type="submit" class="btn btn-primary" 	style="height: 35px;font-size: 15px;padding-left: 12px;
            							 padding-right: 12px;padding-bottom: 6px;padding-top: 6px;border-bottom-width: 0px;margin-bottom: 5px;">검색</button>
            						</form>

                                   	 <div>
                                   	  <button type="submit" class="site-btn" style="border-radius: 5px; background-color: #5e72e4;" onClick="location.href='/farmerQnaList'">전체보기</button>
        							</div>
        						</div>
        					   </div>
                            </div>
                          </c:when>
                       </c:choose>
                            
                  
				<c:choose>   
                 	<c:when test = "${empty productQlist}">
                 	 <div class="row" style="box-shadow: 0px 2px 10px rgb(0 0 0 / 8%); background-color: white; margin-bottom: 140px;padding-bottom: 50px;">
              			<div class="col-lg-12 col-md-12" style="padding-top: 50px;">
                 		<div>내역이 없습니다.</div>
                 	</c:when>
                 	<c:when test = "${productQlist != null}">
                 	 <div class="row" style="box-shadow: 0px 2px 10px rgb(0 0 0 / 8%); background-color: white;">
              			<div class="col-lg-12 col-md-12" style="padding-top: 50px;">
                      <c:forEach items="${productQlist }" var="q">
                      	<c:set var="i" value="${i+1}"/> 
                            <div class="categories__list__post__item">
                              <div class="d-block d-sm-none" style="border-top: 2px solid #000000;"></div> <!-- 1px solid #dee2e6; -->
                               
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3">
                                        <div class="categories__post__item__pic set-bg" style="margin-bottom: 0px;">
                                           <c:choose>
                                            <c:when test="${ !(empty q.q_Img)}">
                                            <a href="resources/upload/qna/${q.q_No}/${q.q_Img}" data-toggle="lightbox" data-title="${q.q_Title}" data-footer="${q.q_Id}">
                								<img data-imgbigurl="resources/upload/qna/${q.q_No}/${q.q_Img}" 
												 src="resources/upload/qna/${q.q_No}/${q.q_Img}"
												 alt="${q.q_No}" title="이미지를 클릭하면 커집니다."
											     name="resources/upload/qna/${q.q_No}/${q.q_Img}"
												 style="cursor: pointer" id="qnaimg"
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
                                           			<ul class="post__label--large" style="padding-left: 10px;">
                                               	 		<li>비밀글</li>
                                                		<li>${q.q_Pno} : ${q.q_Ptitle}</li>
                                            		</ul>
                                           		</c:when>	
												<c:otherwise>
													<ul class="post__label--large" style="margin-bottom: 10px; padding-left: 10px;">
                                                		<li>${q.q_Pno} : ${q.q_Ptitle}</li>
                                            		</ul>												
                                            	</c:otherwise>
											</c:choose>
											
                                           <h3 style="padding-left: 10px;">${q.q_Title}</h3>
                                           <ul class="post__widget" style="display: flex; justify-content: flex-end;">
                                                		<li style="margin-right: 20px; font-size: 13px;"><span>${q.q_Id}</span></li>
                                                		<li style="margin-right: 10px; margin-left: 10px; font-size: 13px;">${q.q_Date}</li>
                                                		
                                        	<c:choose>
												<c:when test="${q.q_Answer == false}">
													<li style="margin-left: 20px; margin-right: 10px;"><button data-parent="#accordion" data-toggle="collapse" data-target="#collapseExample${i-1}" aria-expanded="false" 
                                                		aria-controls="collapseExample" style="background: #ffffff; border-color: #a79e9e;">내용 더보기 + 답글 쓰기</button></li>
												</c:when>
												<c:when test="${q.q_Answer == true}">
                                                	<li style="margin-left: 20px; margin-right: 10px;"><button data-parent="#accordion" data-toggle="collapse" data-target="#collapseExample${i-1}" aria-expanded="false" 
                                                		aria-controls="collapseExample" style="background: #ffffff; border-color: #a79e9e;">내용 더보기 + 답글 보기</button></li>
                                           		</c:when>
                                         	</c:choose>
                                         
                                         <%--  <div class="collapse" id="collapseExample${i-1}"> --%>
                                            </ul>
                                           <%--  <p>${q.q_Content}</p> --%>
                                        </div>
                                        
                                        <div class="collapse" id="collapseExample${i-1}">
                                        	<div style="font-size: 15px; padding-bottom: 40px; padding-left: 12px;">
                                       		${q.q_Content}
                                       		</div>
                                        
                                        <c:choose>
                   							<c:when test="${q.q_Magcontent != null}">
                     							<div class="single-post__leave__comment">
                     								<div class="widget__title" style="margin-bottom: 10px;">
                        								<h4>답글 수정하기</h4>
                     								</div>
                     							
           											<form action="farmerQnaWriteUpdate" name="farmerQnaWriteUpdate" method="post">
                     									<div class="input-list">
                           									<input type="hidden" name="q_Pid" value="<%=farmer.getF_Id()%>" readonly>
                            								<input type="hidden" name="q_No" value="${q.q_No}">
                        								</div>
                        									<textarea required id="q_magcontent" name="q_Magcontent">${q.q_Magcontent}</textarea>
               												<button type="submit" class="site-btn" style="background-color: #5e72e4;">답글 수정하기</button>
                         	
                   									</form>
      											</div> 
                         					</c:when>
                         				<c:when test="${empty q.q_Magcontent}">
                         	 
                  						<div class="single-post__leave__comment">
                    						<div class="widget__title" style="margin-bottom: 10px;">
                         						<h4>답글 등록하기</h4>
                     						</div>
           									<form action="farmerQnaWrite" name="farmerQnaWrite" method="post">
				                     			<div class="input-list">
                           							<input type="hidden" name="q_Pid" value="<%=farmer.getF_Id()%>" readonly>
                               						<input type="hidden" name="q_No" value="${q.q_No}">
                               					</div>
                        	   						<textarea required id="q_magcontent" name="q_Magcontent"></textarea>
               				   						<button type="submit" class="site-btn" style="background-color: #5e72e4;">답글 등록하기</button>
					                         </form>
								      </div> 
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

   
  <div style="display: block; text-align: center; padding-bottom: 10px; width: 1130px; padding-left: 0px;">		
		<c:choose>
   			<c:when test="${paging.startPage != 1 && paging.q_Content != null}">	
   				<a class="paging" href="/farmerQnasearch?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchBox=${paging.q_Ptitle}&searchText=${paging.q_Content}&searchAnswer=${paging.q_Answer}">&lt;</a>
   			</c:when>
			<c:when test="${paging.startPage != 1 && empty paging.q_Content}">	
				<a class="paging" href="/farmerQnaList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:when>
		</c:choose>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b class="paging" style="background-color: #7971ea; color: white;">${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage && paging.q_Content != null}">
					<a class="paging" href="/farmerQnasearch?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchBox=${paging.q_Ptitle}&searchText=${paging.q_Content}&searchAnswer=${paging.q_Answer}">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage && empty paging.q_Content}">
					<a class="paging" href="/farmerQnaList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${paging.endPage != paging.lastPage && paging.q_Content != null}">
				<a class="paging" href="/farmerQnasearch?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchBox=${paging.q_Ptitle}&searchText=${paging.q_Content}&searchAnswer=${paging.q_Answer}">&gt;</a>
			</c:when>
			<c:when test="${paging.endPage != paging.lastPage && empty paging.q_Content}">
		<%-- <c:if test="${paging.endPage != paging.lastPage}"> --%>
				<a class="paging" href="/farmerQnaList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:when>
		</c:choose>
		
 	</div>
	</div>
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
</script>
                  
    
    <!-- Js Plugins -->
    <script src="/resources/qna/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/qna/js/bootstrap.min.js"></script>
    <script src="/resources/qna/js/jquery.slicknav.js"></script>
    <script src="/resources/qna/js/owl.carousel.min.js"></script>
    <script src="/resources/qna/js/main.js"></script>
    
      
     <!-- 이미지 클릭시 확대 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

</body>

</html>
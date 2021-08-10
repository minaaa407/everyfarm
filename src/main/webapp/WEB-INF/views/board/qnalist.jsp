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
    <link rel="stylesheet" href="resources/qna/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/qna/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/qna/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/qna/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/qna/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/qna/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="./index.html"><img src="img/humberger/humberger-logo.png" alt=""></a>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="./index.html">Home</a></li>
                <li><a href="#">Recipes</a></li>
                <li><a href="#">Dinner</a></li>
                <li><a href="#">Desserts</a></li>
                <li class="dropdown"><a href="#">Pages</a>
                    <ul class="dropdown__menu">
                        <li><a href="./categories-grid.html">Categories Grid</a></li>
                        <li><a href="./categories-list.html">Categories List</a></li>
                        <li><a href="./single-post.html">Single Post</a></li>
                        <li><a href="./signin.html">Sign In</a></li>
                        <li><a href="./404.html">404</a></li>
                        <li><a href="./typography.html">Typography</a></li>
                    </ul>
                </li>
                <li><a href="./about.html">About</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="humberger__menu__about">
            <div class="humberger__menu__title sidebar__item__title">
                <h6>About me</h6>
            </div>
            <img src="img/humberger/humberger-about.jpg" alt="">
            <h6>Hi every one! I,m Lena Mollein.</h6>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua.</p>
            <div class="humberger__menu__about__social sidebar__item__follow__links">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube-play"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-envelope-o"></i></a>
            </div>
        </div>
        <div class="humberger__menu__subscribe">
            <div class="humberger__menu__title sidebar__item__title">
                <h6>Subscribe</h6>
            </div>
            <p>Subscribe to our newsletter and get our newest updates right on your inbox.</p>
            <form action="#">
                <input type="text" class="email-input" placeholder="Your email">
                <label for="agree-check">
                    I agree to the terms & conditions
                    <input type="checkbox" id="agree-check">
                    <span class="checkmark"></span>
                </label>
              
            </form>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-1 col-6 order-md-1 order-1">
                        <div class="header__humberger">
                            <i class="fa fa-bars humberger__open"></i>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-10 order-md-2 order-3">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="./index.html">Home</a></li>
                                <li><a href="#">Recipes</a>
                                    <div class="header__megamenu__wrapper">
                                        <div class="header__megamenu">
                                            <div class="header__megamenu__item">
                                                <div class="header__megamenu__item--pic set-bg"
                                                    data-setbg="img/megamenu/p-1.jpg">
                                                    <div class="label">Vegan</div>
                                                </div>
                                                <div class="header__megamenu__item--text">
                                                    <h5><a href="#">How to Make a Milkshake With Any Ice Cream ...</a>
                                                    </h5>
                                                </div>
                                            </div>
                                            <div class="header__megamenu__item">
                                                <div class="header__megamenu__item--pic set-bg"
                                                    data-setbg="img/megamenu/p-2.jpg">
                                                    <div class="label">Vegan</div>
                                                </div>
                                                <div class="header__megamenu__item--text">
                                                    <h5><a href="#">How to Make a Milkshake With Any Ice Cream ...</a>
                                                    </h5>
                                                </div>
                                            </div>
                                            <div class="header__megamenu__item">
                                                <div class="header__megamenu__item--pic set-bg"
                                                    data-setbg="img/megamenu/p-3.jpg">
                                                    <div class="label">Vegan</div>
                                                </div>
                                                <div class="header__megamenu__item--text">
                                                    <h5><a href="#">How to Make a Milkshake With Any Ice Cream ...</a>
                                                    </h5>
                                                </div>
                                            </div>
                                            <div class="header__megamenu__item">
                                                <div class="header__megamenu__item--pic set-bg"
                                                    data-setbg="img/megamenu/p-4.jpg">
                                                    <div class="label">Vegan</div>
                                                </div>
                                                <div class="header__megamenu__item--text">
                                                    <h5><a href="#">How to Make a Milkshake With Any Ice Cream ...</a>
                                                    </h5>
                                                </div>
                                            </div>
                                            <div class="header__megamenu__item">
                                                <div class="header__megamenu__item--pic set-bg"
                                                    data-setbg="img/megamenu/p-5.jpg">
                                                    <div class="label">Vegan</div>
                                                </div>
                                                <div class="header__megamenu__item--text">
                                                    <h5><a href="#">How to Make a Milkshake With Any Ice Cream ...</a>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li><a href="#">Dinner</a></li>
                                <li><a href="#">Desserts</a></li>
                                <li><a href="#">Vegan</a></li>
                                <li><a href="./about.html">About</a></li>
                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-2 col-md-1 col-6 order-md-3 order-2">
                        <div class="header__search">
                            <i class="fa fa-search search-switch"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__btn">
                        <a href="./signin.html" class="primary-btn">Subscribe</a>
                        <button type="submit" class="site-btn" onClick="location.href='/qnawrite'">글쓰기</button>
                 		<button type="submit" class="site-btn" onClick="location.href='/qnamylist'">내글 보기</button>
                    </div>           <!--  http://localhost:8090/qnalist  -->          
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-youtube-play"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-envelope-o"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Categories Section Begin -->
    <section class="categories categories-grid spad">
        <div class="categories__post">
            <div class="container">
                <div class="categories__grid__post">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                        
                        
                      
                        
                            <div class="breadcrumb__text">
                                <h2>Categories: <span>Recipes</span></h2>
                                <div class="breadcrumb__option">
                                    <a href="#">Home</a>
                                    <span>Recipes</span>
                                </div>
                            </div>
                            
                     <!--   <form method="post" name="qnamodify" action="reservationUpdate.bo">      -->
                       
                       <%-- 
                            <c:choose>   
                  <c:when test = "${empty buylist}">   
                     <td colspan="12">내역이 없습니다.</td>
                  </c:when>
                  <c:when test = "${buylist != null}">
                   </c:when>
                     </c:choose> --%>
                       
                        <c:choose>   
                 		 <c:when test = "${empty qnamylist}">  
                            <c:forEach items="${qnalist }" var="q">
                            
                            <div class="categories__list__post__item">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="categories__post__item__pic set-bg"
                                            data-setbg="q_Img">
                                            <div class="post__meta">
                                                <h4>${q.q_No}</h4>
                                               
                                                <span>Aug</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="categories__post__item__text">
                                            <span class="post__label">${q.q_Secret}</span>
                                            <h3><a href="#">${q.q_Title}</a></h3>
                                            <ul class="post__widget">
                                                <li><span>${q.q_Id}</span></li>
                                                <li>${q.q_Date}</li>
                                                <li>${q.q_Answer}</li>
                                            </ul>
                                            <p>${q.q_Content}</p>
                                        </div>
                                        
                                          <c:choose>
								
										 <c:when test="${sessionScope.member.getM_Id() eq q.q_Id}"> 
										
                                        <%--  <button type="button"  class="btn btn-primary" 
                                         	onclick="location.href='/qnamodify?no=${q.q_No}'">수정하기</button> --%>
                                         <button type="button"  class="btn btn-primary" 
                                         	onclick="location.href='/qnamodify/${q.q_No}'">수정하기</button>
                                         <button type="button"  class="btn btn-primary" 
                                         	onclick="location.href='/qnadelete/${q.q_No}'">삭제하기</button>
                                    </c:when>
                                    
        							<c:when test="${sessionScope.member.getM_Id() ne q.q_Id}">
									</c:when>
									</c:choose>
                                    
                                    </div>
                                </div>
                            </div>
                            
                            
                  <div class="single-post__leave__comment">
                     <div class="widget__title">
                         <h4>Leave a comment</h4>
                     </div>
                        <form action="#">
                            <div class="input-list">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <input type="text" placeholder="Website">
                            </div>
                        	<textarea placeholder="Message"></textarea>
                         	<button type="submit" class="site-btn">Submit</button>
                        </form>
                  </div>  
                  
                  
                   <br>
                   <br>
                   <br>   
                            
                         </c:forEach>
                    </c:when>
                  <c:when test = "${qnamylist != null}">
                      <c:forEach items="${qnamylist }" var="q">
                            
                            <div class="categories__list__post__item">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="categories__post__item__pic set-bg"
                                            data-setbg="q_Img">
                                            <div class="post__meta">
                                                <h4>${q.q_No}</h4>
                                               
                                                <span>Aug</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="categories__post__item__text">
                                            <span class="post__label">${q.q_Secret}</span>
                                            <h3><a href="#">${q.q_Title}</a></h3>
                                            <ul class="post__widget">
                                                <li><span>${q.q_Id}</span></li>
                                                <li>${q.q_Date}</li>
                                                <li>${q.q_Answer}</li>
                                            </ul>
                                            <p>${q.q_Content}</p>
                                        </div>
                                        
                                       <button type="button"  class="btn btn-primary" 
                                         	onclick="location.href='/qnamodify/my/${q.q_No}'">수정하기</button>
                                         <button type="button"  class="btn btn-primary" 
                                         	onclick="location.href='/qnadelete/my/${q.q_No}'">삭제하기</button>
                                
                                    
                                    </div>
                                </div>
                            </div>
                            
                            
                  <div class="single-post__leave__comment">
                     <div class="widget__title">
                         <h4>Leave a comment</h4>
                     </div>
                        <form action="#">
                            <div class="input-list">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <input type="text" placeholder="Website">
                            </div>
                        	<textarea placeholder="Message"></textarea>
                         	<button type="submit" class="site-btn">Submit</button>
                        </form>
                  </div>  
                  
                  
                   <br>
                   <br>
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
                              
                           
 
    <!-- Js Plugins -->
    <script src="resources/qna/js/jquery-3.3.1.min.js"></script>
    <script src="resources/qna/js/bootstrap.min.js"></script>
    <script src="resources/qna/js/jquery.slicknav.js"></script>
    <script src="resources/qna/js/owl.carousel.min.js"></script>
    <script src="resources/qna/js/main.js"></script>
</body>

</html>
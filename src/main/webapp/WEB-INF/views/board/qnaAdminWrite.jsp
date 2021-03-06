<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.everyfarm.user.MemberBean"%>
<%@page import="kr.co.everyfarm.board.QnABean"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% 
   List<QnABean> qnamodifyrecord = (List)request.getAttribute("qnamodifyrecord");
   List<QnABean> pnoTitleList = (List)request.getAttribute("pnoTitleList");
   int count = pnoTitleList.size();
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Foodeiblog Template">
    <meta name="keywords" content="Foodeiblog, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EVERY FARM 관리자 | Q&A 리스트</title>

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
    <link rel="stylesheet" href="/resources/qna/css/style.css" type="text/css">
    
	<!-- 썸머노트  	<link rel="stylesheet" href="/resources/editor/css/summernote-lite.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->

<style type="text/css">

.errorMsg {
	color: red;
	font-style: italic;
} 

input::placeholder {
  color: red;
  font-style: italic;
}

.my-control {
    display: block;
    outline:none;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143; 
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%); */
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
     transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s; 
}

.c-control {
	display: block;
    outline:none;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 16px;
    line-height: 1.42857143; 
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%); */
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
     transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s; 
    
    
}
</style>

</head>

<body style="overflow-x: hidden">


 <!-- Navigation -->
	<nav
		class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
		id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>

<div class="color" style="background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;">
    <!-- Categories Section Begin -->
    <section class="categories categories-grid spad">
        <div class="categories__post">
         <div class="container">
                <div class="categories__grid__post">
                    <div class="row" style="background: #ffffff; margin-top: 52px;">
					 <div class="col-lg-12 col-md-12" style="margin-top: 15px;">
					 
                      <form action="/adminMemQnaupdate" id="qna" name="qna" method="post" enctype="multipart/form-data">
    				<c:forEach items="${qnamodifyrecord}" var="q">    
						<table class="table table-striped">
             				<tr>
                				<td><label for="secret" style="font-weight: 500; font-size: 20px;">비밀글 <input type="hidden" name="q_No" value="${q.q_No}"/></label></td>
                				<td><label for="secret" style="font-weight: 500;font-size: 18px;margin-top: 5px;"><input onClick="return false;" type="checkbox" name="q_Secret" value="1" 
                            		<c:if test="${q.q_Secret eq 'true'}">checked</c:if>>비밀글</label></td>
            				</tr>
            				
              				<tr>                                       
             					<td style="font-size: 20px;">상품</td>                                    
                                <td><select id="" name="q_Pno" style="width: 180px;font-size: 16px;margin-top: 5px;" readonly onFocus="this.initialSelect = this.selectedIndex;" 
       								 onChange="this.selectedIndex = this.initialSelect;"> 
              							<option value="${q.q_Pno}" selected>${q.q_Pno} : ${q.q_Ptitle}</option>
	        						
						             </select></td>
            				</tr>
				            
				            <tr>
                				<td style="font-size: 20px;">제목</td>
                				<td><input type="text" id="title" name="q_Title" class="c-control" value="${q.q_Title}" required></td>
           				 	</tr>
            
           	 				<tr>
                				<td style="font-size: 20px;">작성자</td>
                				<td><input type="text" id="q_Id" name="q_Id" value="${q.q_Id}" class="c-control" readonly></td>
            				</tr>
 
            				<tr>
               					<td style="width: 84px; font-size: 20px;">첨부 파일</td>
               					<td><div style="width:500px;font-size: 16px;">기존 : ${q.q_Img}</div>
               					<span style="display: flex; align-items: center;font-size: 16px;">수정 : <input type="file" id="file" name="img" accept="image/*" style="padding-left: 5px; width: 450px"/></span>
            					</td>
    							
            				</tr> 
             				<tr>
							<td style="font-size: 20px;">삭제 원인</td>
							<td><select id="q_Content" onChange="select(this)"
								size="1" style="font-size: 16px;margin-top: 5px;">
									<option value="선택해주세요.">선택해주세요.</option>
									<option value="욕설">욕설글</option>
									<option value="광고">광고성 글</option>
									<option value="음란물">음란물</option>
							</select></td>
						</tr>
            				<tr>
                				<td style="font-size: 20px;">글내용</td>
                				<td style="background: #ffffff;background-clip: content-box;"><textarea id="summernote"  name="q_Content" rows="30" style="width:100%;font-size: 16px;height: 500px;" required="required">${q.q_Content}</textarea></td>
            				</tr>
            				
            				<tr>
                				<td colspan="2"  class="text-center">
                    				<input type="submit" value="글 수정하기" class="site-btn" style="border-radius: 5px; background-color: #5e72e4;">
                    				<button type="button"  class="site-btn" style="border-radius: 5px; background-color: #5e72e4;" onclick="location.href='/adminQnaList'">목록으로 돌아가기</button>
                				</td>
           					</tr>
            
						</table>
         		 	</c:forEach>
        		</form>   
  
                   </div>
                  </div>
  				</div>
              </div>
			</div>
</section>
	
 	</div>
	</div>
	</div>
   
<script type="text/javascript">
$(document).ready(function () {   
    $('ul.navbar-nav li:nth-child(7)').children().css('background','#dae39b');
}); 

function select(e) {
	// 선택된 데이터의 텍스트값 가져오기
	const text = e.options[e.selectedIndex].text;
	const delText = text + " 기재로 인하여 수정되었습니다.";
	
	// 선택한 텍스트 출력
	document.getElementById('summernote').innerHTML = delText;
}
     
        $('#summernote').summernote({
         /*  placeholder: '욕설,음란성 리뷰는 관리자에의해 제재될 수 있습니다.', */
          height: 600,
          minHeight: null,
          maxHeight: null,
          focus: false,
          toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
          
	 });
</script>
                  
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>

</html>
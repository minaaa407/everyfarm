<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.everyfarm.user.MemberBean"%>
<%@page import="kr.co.everyfarm.board.QnABean"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% MemberBean member  = (MemberBean) request.getSession().getAttribute("member"); 
   String url = (String) request.getAttribute("javax.servlet.forward.request_uri");
   
   List<QnABean> qnamodifyrecord = (List)request.getAttribute("qnamodifyrecord");
   List<QnABean> pnoTitleList = (List)request.getAttribute("pnoTitleList");
   int count = pnoTitleList.size();
%>

<!-- ArrayList<QnABean> qnamodifyrecord = (ArrayList)request.getAttribute("qnamodifyrecord");
String p_No = request.getParameter("no");
 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 썸머노트 -->
<link rel="stylesheet" href="/resources/editor/css/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">



<link rel="stylesheet" href="/resources/review/style.css">


<title>QnA 글쓰기</title>

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



</style>

</head>
<header>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</header>
<body>


<div class="row">
    <div class="col-md-2"></div>
    	<div class="col-md-8">
        	<h2 class="text-center">게시글 쓰기</h2>
        
        <%  if(url.matches(".*[0-9].*")) { %>
           
    			<form action="/qnaupdate" id="qna" name="qna" method="post" enctype="multipart/form-data">
    				<c:forEach items="${qnamodifyrecord}" var="q">    
						<table class="table table-striped">
             				<input type="hidden" name="q_No" value="${q.q_No}" />
             
             				<tr>
                				<td>비밀글</td>
                				<label><td><input type="checkbox" name="q_Secret" value="1" 
                            		<c:if test="${q.q_Secret eq 'true'}">checked</c:if> ></td></label>
            				</tr>
            				
              				<tr>                                       
             					<td>상품 선택</td>                                    
                                <td><select id="" name="q_Pno" > 
              							<option value="${q.q_Pno}" selected>${q.q_Pno} : ${q.q_Ptitle}</option>
	        							<%  for(int i=0 ;i<count;i++) {
              								if(qnamodifyrecord.get(0).getQ_Pno() != pnoTitleList.get(i).getQ_Pno()) {
             							%>
                 						<option value="<%=pnoTitleList.get(i).getQ_Pno()%>"><%=pnoTitleList.get(i).getQ_Pno()%> : <%=pnoTitleList.get(0).getQ_Ptitle()%></option>
						                <%  }
                     					 }  %>
						             </select></td>
            				</tr>
				            
				            <tr>
                				<td>제목</td>
                				<td><input type="text" id="title" name="q_Title" class="form-control" value="${q.q_Title}" required></td>
           				 	</tr>
            
           	 				<tr>
                				<td>작성자</td>
                				<td><input type="text" id="q_Id" name="q_Id" value="<%=member.getM_Id()%>"  class="form-control" readonly></td>
            				</tr>
 
            			<!-- <tr>
               					<td></td>
                				<td><input  type="file" name="q_Img" accept="image/gif, image/jpg, image/jpeg, image/png"/></td>
            				</tr> -->
            				<!-- multiple="multiple" -->
             
            				<tr>
                				<td>글내용</td>
                				<td><textarea id="summernote"  name="q_Content" rows="30" style="width:100%;" required="required">${q.q_Content}</textarea></td>
            				</tr>
            				
            				<tr>
                				<td colspan="2"  class="text-center">
                    				<input type="submit" value="글 수정하기" class="btn btn-success">
                   					<!--  <input type="reset" value="다시작성" class="btn btn-warning"> -->
                    				<button type="button"  class="btn btn-primary" onclick="location.href='/qnalist'">목록으로 돌아가기</button>
                				</td>
           					</tr>
            
						</table>
         		 	</c:forEach>
        		</form>   
        
      
         
         <% }else { %>
    		  	<form action="/qnainsert" id="qna" name="qna" method="post" enctype="multipart/form-data">
					<table class="table table-striped">
					
             		<tr>
                		<td>비밀글</td>
                		<label><td><input type="checkbox" name="q_Secret" value="1">비밀글</td></label>
             		</tr>
             		
             		<tr>
                		<td>상품 선택</td>
                		<td><select name="q_Pno">
                   				<c:forEach items="${pnoTitleList}" var="q" varStatus="now">
                        	 		<option value="${q.q_Pno}">${q.q_Pno} : ${q.q_Ptitle}</option>
                        		</c:forEach>
                  			</select>
               			</td>
             		</tr>
             		
            		<tr>
            			<spring:bind path="qna.q_Title">
                			<td>제목</td>
               		 		<td><input type="text" id="title" name="q_Title" class="my-control" placeholder="${status.errorMessage }"></td>
                		</spring:bind>
            		</tr>
            
            		<tr>
                		<td>작성자</td>
                		<td><input type="text" id="q_Id" name="q_Id" value="<%=member.getM_Id()%>"  class="form-control" readonly></td>
            		</tr>
             
       		    	<tr>
                		<td></td>
               		 		<td><input  type="file" name="img" accept="image/*"/></td>
            		</tr>
            		<!-- q_Img  multiple="multiple"  accept="image/gif, image/jpg, image/jpeg, image/png"-->
             
            		<tr>
						<spring:bind path="qna.q_Content">
                			<td>글내용</td>
                			<td><div class="errorMsg">${status.errorMessage }</div>
                				<textarea id="summernote"  name="q_Content" rows="30" style="width:100%;" ></textarea></td>
                		</spring:bind>
            		</tr>
            		
            		<tr>
                		<td colspan="2"  class="text-center">
                    		<input type="submit" value="글 등록하기" class="btn btn-success" >  <!-- onclick="write();" -->
                	 <!--    <input type="reset" value="다시작성" class="btn btn-warning"> -->
                    		<button type="button"  class="btn btn-primary" onclick="location.href='/qnalist'">목록으로 돌아가기</button>
                		</td>
            		</tr>
             
          		</table>
        	</form>
         
     <% } %>
     
    </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 썸머노트 -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/editor/js/summernote-lite.js"></script>
<script src="/resources/editor/js/lang/summernote-ko-KR.js"></script>





<script type="text/javascript">

     
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
        
        funtion 
        
        /* toolbar: [
    	    ['style', ['bold', 'italic', 'underline', 'clear']],
    	    ['font', ['strikethrough', 'superscript', 'subscript']],
    	    ['fontsize', ['fontsize']],
    	    ['color', ['color']],
    	    ['para', ['ul', 'ol', 'paragraph']],
    	    ['height', ['height']]
    	  ]
      */
      
    
  </script>






</body>
</html>
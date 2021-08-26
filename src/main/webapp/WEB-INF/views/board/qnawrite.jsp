<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.everyfarm.user.MemberBean"%>
<%@page import="kr.co.everyfarm.board.QnABean"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% MemberBean member  = (MemberBean) request.getSession().getAttribute("member"); 
   String url = (String) request.getAttribute("javax.servlet.forward.request_uri");
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



	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
<!-- 에디터 시도중 -->
<script src="resources/editor/js/summernote-lite.js"></script>
<script src="resources/editor/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/editor/css/summernote-lite.css">
<!-- 에디터 시도중 -->


<link rel="stylesheet" href="resources/review/style.css">


<title>Insert title here</title>
</head>
<body>


<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 쓰기</h2>
        
        
        <%  if(url.matches(".*[0-9].*")) { %>
        	
    
      <%--   <c:choose>
					<c:when test="${empty param.no}"><!--  q_No --> --%>
					
		<c:forEach items="${qnamodifyrecord}" var="q"> 			
					
		<form action="qnaupdate" method="post" enctype="multipart/form-data">

		 <table class="table table-striped">
             
             <input type="hidden" name="q_No" value="${q.q_No}" />
             
             <tr>
                <td>비밀글</td>
                <label><td><input type="checkbox" name="q_Secret" value="1" 
                				<c:if test="${q.q_Secret eq 'true'}">checked</c:if> ></td></label>
      		 </tr>
      		 
      		 <c:choose>
					<c:when test="${q.q_About eq 'p'}">
      		 <tr>
      		 	<td>글종류</td>
      		 	<td><select name="q_About">
      		 		<!-- <option value="not check">옵션을 선택해주세요</option> -->
             		<option value="p" selected>상품문의</option>
              		<option value="d">배송문의</option>
               		<option value="o">기타문의</option>
            	</select></td>
             </tr>
             </c:when>
             <c:when test="${q.q_About eq 'd'}">
      		 <tr>
      		 	<td>글종류</td>
      		 	<td><select name="q_About">
      		 		<!-- <option value="not check">옵션을 선택해주세요</option> -->
             		<option value="p">상품문의</option>
              		<option value="d" selected>배송문의</option>
               		<option value="o">기타문의</option>
            	</select></td>
             </tr>
             </c:when>
             <c:when test="${q.q_About eq 'o'}">
      		 <tr>
      		 	<td>글종류</td>
      		 	<td><select name="q_About">
      		 		<!-- <option value="not check">옵션을 선택해주세요</option> -->
             		<option value="p">상품문의</option>
              		<option value="d">배송문의</option>
               		<option value="o" selected>기타문의</option>
            	</select></td>
             </tr>
             </c:when>
             </c:choose>
            <tr>
                <td>제목</td>
                <td><input type="text" id="title" name="q_Title" class="form-control" value="${q.q_Title}" ></td>
            </tr>
            
            <tr>
                <td>작성자</td>
                <td><input type="text" id="title" name="q_Id" value="<%=member.getM_Id()%>"  class="form-control" readonly></td>
            </tr>
            
<!--             <tr>
                <td>별점??</td>
                <td> 
<fieldset class="rating">
    <input type="radio" id="star5" name="rev_Rate" value="5" /><label class = "full" for="star5" ></label>
    <input type="radio" id="star4half" name="rev_Rate" value="4.5" /><label class="half" for="star4half" ></label>
    <input type="radio" id="star4" name="rev_Rate" value="4" /><label class = "full" for="star4" ></label>
    <input type="radio" id="star3half" name="rev_Rate" value="3.5" /><label class="half" for="star3half" ></label>
    <input type="radio" id="star3" name="rev_Rate" value="3" /><label class = "full" for="star3" ></label>
    <input type="radio" id="star2half" name="rev_Rate" value="2.5" /><label class="half" for="star2half"></label>
    <input type="radio" id="star2" name="rev_Rate" value="2" /><label class = "full" for="star2" ></label>
    <input type="radio" id="star1half" name="rev_Rate" value="1.5" /><label class="half" for="star1half" ></label>
    <input type="radio" id="star1" name="rev_Rate" value="1" /><label class = "full" for="star1" ></label>
    <input type="radio" id="starhalf" name="rev_Rate" value="0.5" /><label class="half" for="starhalf" ></label>
</fieldset>
</td>
            </tr> -->
             
            <tr>
                <td></td>
                <td><input multiple="multiple" type="file" name="q_Img" accept="image/gif, image/jpg, image/jpeg, image/png"/></td>
            </tr>
             
            <tr>
                <td>글내용</td>
                <td>
   				 <textarea id="summernote"  name="q_Content" rows="30" style="width:100%;">${q.q_Content}</textarea>
              </td>
            </tr>
            
              <% if(url.contains("my")) { %>  
            <tr>
             	<td colspan="2"  class="text-center">
                    <input type="submit" value="수정하기" class="btn btn-success">
                    <input type="reset" value="다시작성" class="btn btn-warning">
                    <button type="button"  class="btn btn-primary" onclick="location.href='/qnalist'">게시글 목록</button>
                </td>
            </tr>
            	<% }else {%>
             <tr>
             	<td colspan="2"  class="text-center">
                    <input type="submit" value="수정하기" class="btn btn-success">
                    <input type="reset" value="다시작성" class="btn btn-warning">
                    <button type="button"  class="btn btn-primary" onclick="location.href='/qnalist'">게시글 목록</button>
                </td>
            </tr>
            	<% } %>
          </table>
        </form>	
        </c:forEach>
		
   		
   		<% }else { %>
   		
      <%--   </c:when>
        	<c:when test="${ !empty param.no }"> <!-- q_No --> --%>
			
 			<c:forEach items="${qnalist}" var="q"> 
 			
		<form action="qnainsert" method="post" enctype="multipart/form-data">


          <table class="table table-striped">
             <tr>
                <td>비밀글</td>
                <label><td><input type="checkbox" name="q_Secret" value="1">비밀글</td></label>
      		 </tr>
      		 <tr>
      		 	<td>글종류</td>
      		 	<td><select name="q_About">
      		 		<!-- <option value="not check">옵션을 선택해주세요</option> -->
             		<option value="p">상품문의</option>
              		<option value="d">배송문의</option>
               		<option value="o">기타문의</option>
            	</select></td>
             </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="title" name="q_Title" class="form-control" ></td>
            </tr>
            
            <tr>
                <td>작성자</td>
                <td><input type="text" id="title" name="q_Id" value="<%=member.getM_Id()%>"  class="form-control" readonly></td>
            </tr>
            
<!--             <tr>
                <td>별점??</td>
                <td> 
<fieldset class="rating">
    <input type="radio" id="star5" name="rev_Rate" value="5" /><label class = "full" for="star5" ></label>
    <input type="radio" id="star4half" name="rev_Rate" value="4.5" /><label class="half" for="star4half" ></label>
    <input type="radio" id="star4" name="rev_Rate" value="4" /><label class = "full" for="star4" ></label>
    <input type="radio" id="star3half" name="rev_Rate" value="3.5" /><label class="half" for="star3half" ></label>
    <input type="radio" id="star3" name="rev_Rate" value="3" /><label class = "full" for="star3" ></label>
    <input type="radio" id="star2half" name="rev_Rate" value="2.5" /><label class="half" for="star2half"></label>
    <input type="radio" id="star2" name="rev_Rate" value="2" /><label class = "full" for="star2" ></label>
    <input type="radio" id="star1half" name="rev_Rate" value="1.5" /><label class="half" for="star1half" ></label>
    <input type="radio" id="star1" name="rev_Rate" value="1" /><label class = "full" for="star1" ></label>
    <input type="radio" id="starhalf" name="rev_Rate" value="0.5" /><label class="half" for="starhalf" ></label>
</fieldset>
</td>
            </tr> -->
             
            <tr>
                <td></td>
                <td><input multiple="multiple" type="file" name="q_Img" accept="image/gif, image/jpg, image/jpeg, image/png"/></td>
            </tr>
             
            <tr>
                <td>글내용</td>
                <td>
   				 <textarea id="summernote"  name="q_Content" rows="30" style="width:100%;"></textarea>
              </td>
            </tr>
            <tr>
                <td colspan="2"  class="text-center">
                    <input type="submit" value="확인" class="btn btn-success">
                    <input type="reset" value="다시작성" class="btn btn-warning">
                    <button type="button"  class="btn btn-primary" onclick="location.href='/qnalist'">게시글 목록</button>
                </td>
            </tr>
             
          </table>
        </form>
        
	 	</c:forEach>
	 	
	 <%--  </c:when>
	 	 </c:choose> --%>
	 	 
	  <% } %>
	  
    </div>
</div>


<script type="text/javascript">
      $(document).ready(function() {
        $('#summernote').summernote({
          placeholder: '욕설,음란성 리뷰는 관리자에의해 제재될 수 있습니다.',
          height: 600,
          minHeight: null,
          maxHeight: null,
          focus: true,
/*  사진 업로드 후  DB에 준비중            callbacks: {
            onImageUpload: function(files, editor, welEditable) {
              for (var i = files.length - 1; i >= 0; i--) {
                sendFile(files[i], this);
              }
            }
          } */
        });
      });
      
/*  사진 업로드 후  DB에 준비중     function sendFile(file, el) {
        var form_data = new FormData();
        form_data.append('file', file);
        $.ajax({
          data: form_data,
          type: "POST",
          url: '/image',
          cache: false,
          contentType: false,
          enctype: 'multipart/form-data',
          processData: false,
          success: function(url) {
            $(el).summernote('insertImage', url);
            $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
          }
        });
      } */
  </script>






</body>
</html>
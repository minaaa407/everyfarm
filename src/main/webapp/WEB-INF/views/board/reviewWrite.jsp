<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="resources/editor/css/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">



<link rel="stylesheet" href="resources/review/style.css">



<title>Insert title here</title>
</head>
<body>


<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 쓰기</h2>
        <form action="/reviewInsert" method="post">


          <table class="table table-striped">
            <tr>
                <td>작성자</td>
                <td><input type="text" value="${member.m_Name}"  class="form-control" name="rev_Id" readonly></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="title" name="rev_Title"   class="form-control" ></td>
            </tr>
            <tr>
                <td>별점</td>
                <td> 
<fieldset class="rating">
    <input type="radio" id="star5" name="rev_Rate" value="5" readonly="readonly"/><label class = "full" for="star5" ></label>
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
            </tr>
             
             
            <tr>
                <td>글내용</td>
                <td>
   				 <textarea id="summernote"  name="rev_Cont" rows="30" style="width:100%;"></textarea>
              </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-center">
                    <input type="submit" value="확인" class="btn btn-success">
                    <input type="reset" value="다시작성" class="btn btn-warning">
                    <button type="button"  class="btn btn-primary" onclick="location.href='/reviewList'">게시글 목록</button>
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 썸머노트 -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="resources/editor/js/summernote-lite.js"></script>
<script src="resources/editor/js/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
      $(document).ready(function() {
        $('#summernote').summernote({
          placeholder: '욕설,음란성 리뷰는 관리자에의해 제재될 수 있습니다.',
          height: 600,
          minHeight: null,
          maxHeight: null,
          focus: true,
        });
      });
      
    
  </script>

</body>
</html>
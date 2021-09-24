<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 썸머노트 -->
<link rel="stylesheet" href="resources/editor/css/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">



<link rel="stylesheet" href="resources/review/style.css">
<style type="text/css">
/* 부트스트랩 자체 CSS때문에  th 위치 재 조정한거 삭제 X */
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	vertical-align: middle;
}

.note-modal-title{
	visibility: hidden;
}
.note-modal-title:before{
	visibility:visible;
	display: block;
	content: '이미지 업로드';
}

/* 제목  CSS*/
.tit {
	margin-top: 50px;
}
/* 작성 폼 CSS */
.form- {
	margin-top: 10px;
	border-top: 1px solid #000;
}

th {
	width:15%;
	text-align: center;
	padding-left: 30px;
	font-size: 14px;
	font-weight: normal;
	background: #f8f8f8;
	vertical-align: inherit;
}

td {
	text-align: center;
	background: white;
}

input {
	padding: 0 0 0 5px;
	background: white;
}

.btn4 {
    border-radius: 4.7px;
	color: #fff;
	text-align: center;
	border: 1px solid #231f20;
	background: #231f20;
	padding: 5px 10%;
	transition: background, color 1s;
}

.btn4:hover {
	color: #000;
	background: #fff;
}

.btn2 {
	border-radius: 4.7px;
	color: #000;
	text-align: center;
	border: 1px solid #231f20;
	background: #fff;
	padding: 5px 10%;
	transition: background, color 1s;
}
.btn2:hover {
	border-radius: 4.7px;
	color: #fff;
	background: #000;
}
.pro{
	border-bottom: 1px solid #ddd;
    border-left: 1px solid #ddd;
}
.proNum{
	border-bottom: 1px solid #ddd;
}
</style>



<title>EVERY FARM | 리뷰 수정</title>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</head>
<body>

<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 tit">
        <h2 class="text-center">게시글 수정</h2>
        <form action="/reviewUpdate1" method="post" class="form-">


           <input type="hidden" class="form-control" value="${revList.rev_No}" name="rev_No"  readonly/>
           <input type="hidden"class="form-control" value="${revList.rev_Rate}" name="rev_Rate">
          <table class="table table-striped">
            <tr>
                <th><div>작성자</div></th>
                <td><input type="text"  class="form-control" value="${revList.rev_Name}" name="rev_Id" readonly></td>
            </tr>
            <tr>
                <th><div>제목</div></th>
                <td><input type="text" id="title" name="rev_Title" value="${revList.rev_Title}"  class="form-control" ></td>
            </tr>
             
            <tr>
                <th><div>글내용</div></th>
                <td>
   				 <textarea id="summernote"  name="rev_Cont" rows="30" style="width:100%;">${revList.rev_Cont}</textarea>
              </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-center">
                    <button type="submit" id="Btn"  class="btn4">수정하기</button>
                    <button type="button"  class="btn4" onclick="location.href='/reviewList'">게시글 목록</button>
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
	
	var no = ${revList.rev_No}
	$('#Btn').click(function() {
		var result = confirm('수정하시겠습니까?');
		if(result) { //yes 
			 alert("수정되었습니다.");
			  location.href="/reviewUpdate1";
			   return true;
		} 
		else {
			return false;
				} 
		});

     
        var  toolbar = [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['view', ['fullscreen', 'help']]
			  ];
        
        var setting = {
        		placeholder: '욕설,음란성 리뷰는 관리자에의해 제재될 수 있습니다.', 
                height: 600,
                minHeight: null,
                maxHeight: null,
                focus: false,
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
    			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
                callbacks : { 
                	onImageUpload : function(files, editor, welEditable) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                uploadSummernoteImageFile(files[i],
                this);
                		}
                	}
                }
             };
        
            $('#summernote').summernote(setting);
            });
            
            function uploadSummernoteImageFile(file, el) {
    			data = new FormData();
    			data.append("file", file);
    			$.ajax({
    				data : data,
    				type : "POST",
    				url : "uploadSummernoteImageFile",
    				contentType : false,
    				enctype : 'multipart/form-data',
    				processData : false,
    				success : function(data) {
    					$(el).summernote('editor.insertImage', data.url);
    				}
    			});
    		}
  </script>
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</body>
</html>
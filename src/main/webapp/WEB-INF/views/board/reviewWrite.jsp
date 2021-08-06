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
       <link rel="stylesheet" href="resources/review/style.css">
<title>Insert title here</title>
</head>
<body>


<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 쓰기</h2>
        <form action="reviewInsert" method="post" enctype="multipart/form-data">


          <table class="table table-striped">
            <tr>
                <td>작성자</td>
                <td><input type="text"  class="form-control" name="rev_Id"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="title" name="rev_Title" value=""  class="form-control" ></td>
            </tr>
            <tr>
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
            </tr>
             
            <tr>
                <td></td>
                <td><input multiple="multiple" type="file" name="file" /></td>
            </tr>
             
            <tr>
                <td>글내용</td>
                <td>
                <div class="contentDiv">
   				 <textarea id="txtContent" name="rev_Cont" rows="30" style="width:100%;"></textarea>
  			   </div>
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
<script type="text/javascript">

var oEditors = [];

 nhn.husky.EZCreator.createInIFrame({

 oAppRef: oEditors,

 elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id 입니다.

 sSkinURI: "resources/se/SmartEditor2Skin.html",  // html editor가 skin url 입니다.

 fOnAppLoad: function () { 

        //수정모드를 구현할 때 사용할 부분입니다. 로딩이 끝난 후 값이 체워지게 하는 구현을 합니다.

         var title = localStorage.getItem("title");                      

         var contents = localStorage.getItem("contents");        //db에서 불러온 값은 여기에서 체워넣습니다.

         document.getElementById("title").value = title;     

         oEditors.getById["txtContent"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 txtContent에 넣습니다.

     },

     fCreator: "createSEditor2"

 });

 

var onWrite = function(){

 oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용합니다.

 

  var contents = document.getElementById("txtContent").value;

  var title = document.getElementById("title").value;

  localStorage.setItem("contents", contents);

  localStorage.setItem("title", title);             //localStorage에 제목과 내용을 저장.

  

 var boardWriteForm = document.getElementById("boardWriteForm");  

 //boardWriteForm.action ="writeSubmit";  //저장할 페이지로 쏩니다. db를 쓰지 않으니 사용하지 않았습니다.

 boardWriteForm.submit();  

};

 

var pasteHTML = function(filename){                     //업로드한 사진을 화면에 보여주게 만드는 스크립트입니다.

    var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">'; //사진이 저장된 경로입니다.

    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);

};

</script>
</body>
</html>
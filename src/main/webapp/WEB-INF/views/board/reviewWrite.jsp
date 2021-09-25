<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<!--  CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!--  테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 썸머노트 -->
<link rel="stylesheet" href="/resources/editor/css/summernote-lite.css">
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

.btn {
	color: #fff;
	text-align: center;
	border: 1px solid #231f20;
	background: #231f20;
	padding: 5px 10%;
	transition: background, color 1s;
}

.btn:hover {
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
<title>EVERY FARM | 리뷰 등록</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/header.jsp" />

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 tit">
			<h3>구매후기</h3>
			<div class="form-">
				<form action="/reviewInsert" method="post" id="frm">
					<input type="hidden" value="${member.m_Id}" class="form-control"
						name="rev_Id" readonly>

					<table class="table table-striped">
						<colgroup>
							<col width="15%">
							<col width="50%">
							<col width="15%">
							<col width="*">
						</colgroup>
						<tr>
							<th><div>작성자</div></th>
							<td><input type="text" value="${member.m_Name}"
								class="form-control" name="rev_Name" readonly></td>
							<th class="pro"><div>상품</div></th>
							<td class="proNum"><select required="required" id ="rev_ProNum" name="rev_ProNum" onchange="chageLangSelect()">
									<option value="">상품을 선택해주세요.</option>
									<c:forEach items="${myPayList}" var="mp" varStatus="status">
										<option value="${mp.pay_Orderno}" >주문 번호 : <c:out value="${mp.pay_Orderno}"></c:out> ${myProductList[status.index].p_Title} 
										<fmt:formatDate value="${mp.pay_Date}" type="date"/></option>
									</c:forEach>
							</select>
							<input type="hidden" name="pay_No" id="pay_No" value="" />
							</td>
						</tr>
						<tr>
							<th><div>제목</div></th>
							<td><input type="text" id="title" name="rev_Title"
								class="form-control"></td>
						</tr>
						<tr>
							<th><div>별점</div></th>
							<td>
								<fieldset class="rating">
									<input type="radio" id="star5" name="rev_Rate" value="5"
										readonly="readonly" /><label class="full" for="star5"></label>
									<input type="radio" id="star4half" name="rev_Rate" value="4.5" /><label
										class="half" for="star4half"></label> <input type="radio"
										id="star4" name="rev_Rate" value="4" /><label class="full"
										for="star4"></label> <input type="radio" id="star3half"
										name="rev_Rate" value="3.5" /><label class="half"
										for="star3half"></label> <input type="radio" id="star3"
										name="rev_Rate" value="3" /><label class="full" for="star3"></label>
									<input type="radio" id="star2half" name="rev_Rate" value="2.5" /><label
										class="half" for="star2half"></label> <input type="radio"
										id="star2" name="rev_Rate" value="2" /><label class="full"
										for="star2"></label> <input type="radio" id="star1half"
										name="rev_Rate" value="1.5" /><label class="half"
										for="star1half"></label> <input type="radio" id="star1"
										name="rev_Rate" value="1" /><label class="full" for="star1"></label>
									<input type="radio" id="starhalf" name="rev_Rate" value="0.5" /><label
										class="half" for="starhalf"></label>
								</fieldset>
							</td>
						</tr>


						<tr>
							<th><div>내용</div></th>
							<td colspan="3"><textarea id="summernote" rows="10" cols="30"
									name="rev_Cont" required style="width: 100%;"></textarea></td>
						</tr>
						<tr>

							<td colspan="2" class="text-center"><button type="submit"
								id="save"  class="btn2">작성완료</button> <button type="reset"
								 class="btn2">다시작성</button>
								<button type="button" class="btn2"
									onclick="location.href='/reviewList'">게시글 목록</button></td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<!-- 썸머노트 -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/editor/js/summernote-lite.js"></script>
<script src="/resources/editor/js/lang/summernote-ko-KR.js"></script>


<script type="text/javascript">
     
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
            
            
function chageLangSelect(){
	
	var pno = document.getElementById('rev_ProNum').value;
	document.getElementById('pay_No').value = pno;
}
  </script>


</body>
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</html>
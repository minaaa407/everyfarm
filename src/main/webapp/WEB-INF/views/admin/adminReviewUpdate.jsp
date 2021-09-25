<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/editor/connn.ico" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<title>EVERY FARM | 리뷰 상세</title>
<style type="text/css">
.center {
	text-align: center;
	color: #000;
	font-size: 15px;
	font-weight: normal;
}

.for-thead {
	padding: 15px 0;
	border-top: 1.2px solid #000;
	border-bottom: 1px solid #e9e9e9;
}

.tit2 {
	padding: 15px 0;
}

.cont {
	padding: 20px 0 40px 0;
}

.board_view {
	padding-top: 5%;
	width: 85%;
	margin: auto;
}

.board_view2 {
	border-top: 1px solid;
	padding-top: 1%;
	width: 85%;
	margin: auto;
}

em {
	font-weight: bold;
	font-style: normal;
}

span {
	margin-right: 15px;
}

.btn2 {
	border-radius: 4.7px;
	position: relative;
	left: 93%;
	color: #fff;
	text-align: center;
	border: 1px solid #231f20;
	background: #231f20;
	transition: background, color 1s;
}

.btn2:hover {
	color: #000;
	background: #fff;
}

.btn3 {
	border-radius: 4.7px;
	color: #000;
	text-align: center;
	border: 1px solid #231f20;
	background: #fff;
	padding: 5px 1%;
	transition: background, color 1s;
}

.btn3:hover {
	border-radius: 4.7px;
	color: #fff;
	background: #000;
}

.re_cont {
	margin-top: 7px
}

.texta {
	padding: 1px 0;
	width: 100%;
	height: 118px;
	border: 1px solid #ddd;
}

.2bo {
	border-bottom: 1px solid #e9e9e9;
}

.link {
	text-align: center;
	position: relative;
	padding: 20px 0;
}

.das {
	border-top: 1.4px dashed #e9e9e9;
	padding-top: 1.5%;
}

.noneMember {
	font-size: 15px;
	font-weight: bold;
}

.testing {
	padding-top: 1.5%;
	padding-bottom: 3%;
	border-bottom: 1.4px dashed #e9e9e9;
}

.date {
	color: #b8b8b8;
}

.cont2 {
	padding-top: 1%;
}

.form {
	padding-top: 3%;
}
</style>
</head>
<body>
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
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 tit">
			<h2 class="text-center">게시글 수정</h2>
			<form action="/adminReviewDelete?rev_No=${revList.rev_No}" method="post" name="todel">


				<input type="hidden" class="form-control" value="${revList.rev_No}"
					name="rev_No" id="rev_No" readonly /> <input type="hidden"
					class="form-control" value="${revList.rev_Rate}" name="rev_Rate">
				<table class="table table-striped">
					<tr>
						<th><div>작성자</div></th>
						<td><input type="text" class="form-control" value="관리자"
							name="rev_Name" readonly></td>
					</tr>
					<tr>
						<th><div>제목</div></th>
						<td><input type="text" id="title" name="rev_Title"
							value="관리자에 의해  삭제되었습니다." readonly class="form-control"></td>
					</tr>
					<tr>
						<td>삭제 원인</td>
						<td><select id="q_Content" onChange="select(this)" size="1" required>
								<option value="선택해주세요.">선택해주세요.</option>
								<option value="욕설">욕설글</option>
								<option value="광고">광고성 글</option>
								<option value="음란물">음란물</option>
						</select></td>
					</tr>
					<tr>
						<th><div>글내용</div></th>
						<td><textarea id="summernote" name="rev_Cont" rows="30"
								style="width: 100%;" readonly>${revList.rev_Cont}</textarea></td>
					</tr>
					<tr>

						<td colspan="2" class="text-center">
						<c:choose>
						<c:when test="${empty rep}">
							<input type="button" id="Btn" class="btn4" onclick="del()" value="삭제"/>
							</c:when>
							<c:otherwise>
							<input type="button" onclick="reDel()" value="삭제">
							</c:otherwise>
							</c:choose>
							<button type="button" class="btn4"
								onclick="location.href='/adminReviewList'">게시글 목록</button>
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		function select(e) {
			// 선택된 데이터의 텍스트값 가져오기
			const text = e.options[e.selectedIndex].text;
			const delText = text + " 기재로 인하여 삭제되었습니다.";

			// 선택한 텍스트 출력
			document.getElementById('summernote').innerHTML = delText;
		}
	</script>
	<script type="text/javascript">
		function reDel() {
			if(confirm("댓글이 존재하는 글입니다. 정말 삭제 하시겠습니까?") == true){
				document.todel.submit();
			}else{
				return;
			}
		}
	
		function del() {
			if(confirm("정말 삭제하시겠습니까?") == true){
				document.todel.submit();
			}else {
				return;
			}			
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var no = $
			{
				revList.rev_No
			}
			$('#Btn').click(function() {
				var result;
				result = confirm("삭제하시겠습니까?");
				alert(result)
				if (result) { //yes 
					alert("삭제되었습니다.");
					location.href = "/adminReviewDelete?rev_No=" + no;
					return true;
				} else {
					return false;
				}
			});
		});
	</script>

</body>
<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</html>
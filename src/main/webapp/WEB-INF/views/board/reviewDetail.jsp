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
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn').click(function() {
			var rep_Cont = $("#rep_Cont").val();
			var rep_Id = $("#rep_Id").val();
			var rev_No = $("#rev_No").val();
			var rep_Secret = "N";
			var rep_Subno = 0;

			if ($("#rep_Secret").is(":checked")) {
				rep_Secret = "Y";
			}

			$.ajax({
				url : "/replyWrite",
				type : "POST",
				data : {
					rep_Id : rep_Id,
					rev_No : rev_No,
					rep_Cont : rep_Cont,
					rep_Secret : rep_Secret,
					rep_Subno : rep_Subno
				},
				success : function(result) {
					if (result == "OK") {
						alert("댓글이 등록되었습니다.");
						$('#btn').val("");
					}
				}
			});
		});
	});
</script>
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
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</head>
<body>
	<form method="post" action="/replyWrite" class="form">
		<table class="board_view">
			<thead>
				<tr>
					<th class="for-thead"><div class="center">${revList.rev_Title}</div></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td class="tit2">
						<div>
							<div>
								<span> <em>작성일 :</em> <fmt:formatDate
										pattern="yyyy/MM/dd" value="${revList.rev_Date}" />
								</span>
							</div>
							<div>
								<span> <em>작성자 :</em> ${revList.rev_Name}
								</span> <span> <em>조회수 :</em> ${revList.rev_Readcount}
								</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<div class="cont">${revList.rev_Cont}</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="board_view2">
			<colgroup width="*" />
			<tbody>
				<c:forEach items="${repList}" var="repList">
					<tr>
						<td class="testing"><span><em>${repList.rep_Id}</em></span> <span
							class="date"><fmt:formatDate pattern="yy-MM-dd hh:mm"
									value="${repList.rep_Date}" /></span>
							<div class="cont2">${repList.rep_Cont}</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="board_view">
			<colgroup width="*" />
			<tbody>
				<tr>
					<td class="das">
						<div>
							<c:choose>
								<c:when test="${!empty member.m_Id}">
									<div>
										<label><i class="fas fa-caret-right"></i> 이름 : </label> <span>${member.m_Name}<input
											type="hidden" name="rep_Id" value="${member.m_Name}"></span>
										<input type="checkbox" name="rep_Secret" id="rep_Secret"
											value="Y"> <input type="hidden" id="rev_No"
											name="rev_No" value="${revList.rev_No}">
									</div>
									<div class="re_cont">
										<textarea class="texta" name="rep_Cont"
											placeholder="내용을 입력해주세요."></textarea>
										<button type="submit" name="btn" id="btn" class="btn2">댓글
											쓰기</button>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<label><i class="fas fa-caret-right"></i> 이름 : </label>
									</div>
									<div class="re_cont">
										<textarea class="texta" class="noneMember" name="rep_Cont"
											disabled="disabled" placeholder="로그인후 이용가능합니다."></textarea>
										<button name="" id="reply" class="btn2" disabled="disabled">댓글
											쓰기</button>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<div class="link">
		<div>
			<c:choose>
				<c:when test="${member.m_Id  eq revList.rev_Id}">
					<a href="/reviewUpdate?rev_No=${revList.rev_No}" id="modify"
						class="btn3">수정하기</a>
					<a class="btn3" onclick="yes()" id="Btn">삭제하기</a>
					<a href="/reviewList" id="list" class="btn3">목록으로</a>
				</c:when>
				<c:otherwise>
					<a href="/reviewList" id="list" class="btn3">목록으로</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			var no = $
			{
				revList.rev_No
			}
			$('#Btn').click(function() {
				var result = confirm('삭제하시겠습니까?');
				if (result) { //yes 
					alert("삭제되었습니다.");
					location.href = "/reviewDelete?rev_No=" + no;
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="keywords" content="Ogani, unica, creative, html">
<title>EVERY FARM 농부 | 리뷰내역</title>

<link rel="shortcut icon" type="image/x-icon"
	href="/resources/editor/connn.ico" />
<!-- Google Font -->

<style type="text/css">
/* CSS 작업중 삭제 XXXXXXXX */
td, th {
	border-color: #9ea4ca;
}

body {
	background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;
}

.limiter {
	width: 100%;
	margin: 0 auto;
}

.container-table100 {
	width: 100%;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	flex-direction: column;
}

.wrap-table100 {
	width: 1170px;
	padding-bottom: 20px;
}

table {
	border-spacing: 1;
	border-collapse: collapse;
	border-radius: 10px;
	overflow: hidden;
	width: 100%;
	margin: 0 auto;
	position: relative;
}

table * {
	position: relative;
}

table td, table th {
	padding-left: 8px;
}

table thead tr {
	height: 60px;
	background: #efefef
}

table tbody tr {
	height: 50px;
	background-color: rgba(255, 255, 255, 0.4);
}

table tbody tr:hover {
	height: 50px;
	color: white;
	background-color: #7971ea;
}

table tbody tr:last-child {
	border: 0;
}

table td, table th {
	text-align: center;
}

.bef-list {
	text-align: center;
	margin-bottom: 20px;
	border-top: 0px;
	border-radius: 11px;
	padding: 0;
	margin: 0;
}

.list-end {
	border-right: 1px solid rgba(0, 0, 0, 0.05);
	border-bottom-left-radius: 11px;
	border-top-left-radius: 11px;
	margin-bottom: 20px;
	padding: 0;
	margin: 0;
	color: #000000;
}

.list-start {
	border-top-right-radius: 11px;
	border-bottom-right-radius: 11px;
	margin-bottom: 20px;
	padding: 0;
	margin: 0;
	color: #000000;
}
/* a 태그 CSS 하는중 */
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}
/* 페이징 버튼 꾸미는중 0902~ */
.pageInfo li {
	float: left;
	font-size: 13px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

.pageInfo_btn {
	padding: 8px 16px;
	border-radius: 20%;
	color: #555555;
	margin: 3px;
	font: 8pt verdana;
	list-style-type: none;
}

.pageInfo_btn  a {
	color: #5e72e4;
	font-size: 18px;
	padding: 8px 15px;
	border-radius: 20%;
}

.pageInfo_btn active {
	background-color: #7971ea;
	color: white;
}

.search {
	position: relative;
	left: 30%;
	cursor: pointer;
	width: 50px;
	border: 0px solid #c3c3c3;
	background-color: white;
}

.txt {
	font-size: 13px;
	color: #939393;
}

.star {
	width: 8%;
}

.read {
	width: 10%;
}

.writer {
	width: 10%;
}

.title {
	text-align: left;
	padding-left: 3%;
}

.tdname {
	width: 17%;
}

.tdStar {
	width: 13%;
}

.type {
	position: relative;
	margin: auto;
	left: 30%;
	width: 10%;
}

.keyword {
	position: relative;
	margin: auto;
	left: 30%;
	width: 20%;
	height: 27px;
}

.searchBtn {
	top: -20px;
	margin: auto;
	position: absolute;
}

.btn1 {
	position: relative;
	left: 32%;
	top: 1%;
}

.pageInfo_area {
	position: relative;
	left: 38%;
}

.pageInfo_btn:hover {
	background-color: silver;
	transition: all ease 0.5s 0s;
}

.pageInfo_btn {
	color: #5e72e4;
}

.active a {
	background-color: #7971ea;
	color: white;
}

.site-btn {
	border-radius: 5px;
	position: relative;
	left: 31%;
	font-size: 15px;
	color: #000000;
	font-weight: 800;
	text-transform: uppercase;
	display: inline-block;
	padding: 13px 26px 12px;
	border: none;
	padding-left: 13px;
	padding-right: 13px;
	padding-bottom: 10px;
	padding-top: 10px;
	margin-right: 10px;
}

.btn.btn-primary {
	background: #4e9525 !important;
	border: 1px solid #4e9525 !important;
	color: #fff !important;
	position: relative;
	left: 30%;
	top: 1%;
	width: 60px;
	height: 32px;
	text-align: center;
}

.search_wrap {
	position: relative;
	/* right: 27%; */
	top: 20px;
}

.ttc {
	position: relative;
	top: 13.5%;
	left: 80%;
}
/* 페이징 버튼 꾸미는중 0902~ */


/* CSS 작업중 삭제 XXXXXXXX */
</style>
</head>
<body>


	<!-- Shoping Cart Section Begin -->
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

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table border="1">
						<colgroup>
							<col style="width: 30px" />
							<col style="width: 100px" />
							<col style="width: 80px" />
							<col style="width: 130px" />
							<col style="width: 80px" />
							<col style="width: 80px" />
						</colgroup>
						<thead>
							<tr>
								<td scope="col">번호</td>
								<td scope="col">제목</td>
								<td scope="col">작성자</td>
								<td scope="col">작성일</td>
								<td scope="col">조회수</td>
								<td scope="col">평점</td>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty revList}">
									<tbody>
										<tr>
											<td align="center"><p>게시글이 없습니다</p></td>
										</tr>
									</tbody>
								</c:when>
								<c:when test="${!empty revList}">
									<c:forEach var="re" items="${revList}" varStatus="status">
										<tr class="bef-list">
											<td class="list-end">${(total - status.index) -((pageMaker.cri.pageNum -1) * 10)}</td>
											<td class="list title"><a 
												href="/adminReviewDetail?rev_No=${re.rev_No}">${re.rev_Title}</a>
											<td class="list tdname">${re.rev_Name}</td>
											<td class="list-start txt"><fmt:formatDate
													pattern="yyyy/MM/dd" value="${re.rev_Date}" /></td>
											<td class="list txt"><span class="fa fa-eye"></span>&nbsp;${re.rev_Readcount}</td>
											<td class="list tdStar"><c:if
													test="${re.rev_Rate eq 0.5}">
													<img alt="0.5점"
														src="resources/review/reviewList/img/half.png" />
												</c:if> <c:if test="${re.rev_Rate eq 1}">
													<img alt="1점" src="resources/review/reviewList/img/one.png" />
												</c:if> <c:if test="${re.rev_Rate eq 1.5}">
													<img alt="1.5점"
														src="resources/review/reviewList/img/one-half.png" />
												</c:if> <c:if test="${re.rev_Rate eq 2}">
													<img alt="2점" src="resources/review/reviewList/img/two.png" />
												</c:if> <c:if test="${re.rev_Rate eq 2.5}">
													<img alt="2.5점"
														src="resources/review/reviewList/img/two-half.png" />
												</c:if> <c:if test="${re.rev_Rate eq 3}">
													<img alt="3점"
														src="resources/review/reviewList/img/three.png" />
												</c:if> <c:if test="${re.rev_Rate eq 3.5}">
													<img alt="3.5점"
														src="resources/review/reviewList/img/three-half.png" />
												</c:if> <c:if test="${re.rev_Rate eq 4}">
													<img alt="4점"
														src="resources/review/reviewList/img/four.png" />
												</c:if> <c:if test="${re.rev_Rate eq 4.5}">
													<img alt="4.5점"
														src="resources/review/reviewList/img/four-half.png" />
												</c:if> <c:if test="${re.rev_Rate eq 5}">
													<img alt="5점"
														src="resources/review/reviewList/img/five.png" />
												</c:if></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>

					<div class="search_wrap">
						<div class="search_area">
							<select name="type" class="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
									+ 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
									+ 작성자</option>
								<option value="TCW"
									<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목
									+ 내용 + 작성자</option>
							</select> <input type="text" name="keyword" class="keyword"
								value="${pageMaker.cri.keyword }">
							<button class="site-btn">검색</button>
							<button type="submit" class="site-btn"
								style="border-radius: 5px;"
								onclick="location.href='/adminReviewList'">전체보기</button>
						</div>
					</div>

					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">

								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="${pageMaker.startPage-1}">◀ 이전</a></li>
								</c:if>

								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
										href="${num}">${num}</a></li>
								</c:forEach>

								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a
										href="${pageMaker.endPage + 1 }">다음 ▶</a></li>
								</c:if>

							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
	<!-- 페이징 및 검색!!!!  -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		let moveForm = $("#moveForm");
		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();

							moveForm
									.append("<input type='hidden' name='rev_no' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/get");
							moveForm.submit();
						});
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/adminReviewList");
			moveForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
		document.getElementById('a1').className = 'nav-item';
		document.getElementById('a2').className = 'nav-item';
		document.getElementById('a3').className = 'nav-item active';
		document.getElementById('a4').className = 'nav-item';
	</script>
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />
</html>
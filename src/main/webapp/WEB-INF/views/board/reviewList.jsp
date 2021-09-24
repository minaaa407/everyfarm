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
<title>EVERY FARM | 리뷰 </title>

<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<!-- Google Font -->

<style type="text/css">
/* CSS 작업중 삭제 XXXXXXXX */
table {
	width: 95%;
}

td {
	border-bottom: 1px solid #ebebeb;
	padding: 8px 10px 7px;
}

.container {
	margin: auto;
}

.bb {
	border-left: 0px solid rgba(0, 0, 0, 0.05);
	border-right: 0px solid rgba(0, 0, 0, 0.05);
	border-radius: 5px;
	border-bottom: 0px;
	border-collapse: separate;
	border-spacing: 0 20px;
	margin: auto;
}

.ff {
	margin-bottom: 20px;
	font-weight: 600;
	border-radius: 11px;
	padding: 0;
	border: 0;
	text-align: left;
}

.cc {
	text-align: center;
	padding: 10px 0px;
	color: #a6a6a6;
	font-size: 14px;
	font-weight: 700;
	border-top: 1px solid #252525;
	border-bottom: 1px solid #ebebeb;
}

.bef-list {
	text-align: center;
	margin-bottom: 20px;
	border-top: 0px;
	border-radius: 11px;
	padding: 0;
	margin: 0;
}

background-color: #FFFFFF ; color: #000000 ; .list {
	border-right: 1px solid rgba(0, 0, 0, 0.05);
	margin-bottom: 20px;
	align-items: center;
	align-items: stretch;
	padding: 0;
	margin: 0;
	background-color: #FFFFFF;
	color: #000000;
}

.list-end {
	border-right: 1px solid rgba(0, 0, 0, 0.05);
	border-bottom-left-radius: 11px;
	border-top-left-radius: 11px;
	margin-bottom: 20px;
	padding: 0;
	margin: 0;
	background-color: #FFFFFF;
	color: #000000;
}

.list-start {
	border-top-right-radius: 11px;
	border-bottom-right-radius: 11px;
	margin-bottom: 20px;
	padding: 0;
	margin: 0;
	background-color: #FFFFFF;
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
	border: #AAAAAA 1px solid;
	background-color: #FFFFFF;
	color: #555555;
	padding: 3px 6px;
	margin: 3px;
	font: 8pt verdana;
	list-style-type: none;
}

.pageInfo_btn active {
	font-weight: bold;
	color: #555555;
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

.tit {
	border-bottom: 2px solid #221e1f;
	padding-bottom: 5px;
	font-size: 20px;
	font-weight: bold;
	font-size: 20px;
}

.tit-conf {
	text-align: center;
	position: relative;
	top: -30px;
}

.btn {
	left: 73%;
	top: -50px;
	position: relative;
	border-radius: 4.7px;
}

.pageInfo_area {
	position: relative;
	left: 38%;
}

.pageInfo_btn:hover {
	background: #7fad39;
	border-color: #7fad39;
	transition: all ease 0.5s 0s;
}
.pageInfo_btn .active{
	background-color: blue;
}

/* 페이징 버튼 꾸미는중 0902~ */

/* CSS 작업중 삭제 XXXXXXXX */
</style>
<jsp:include page="/WEB-INF/views/home/header.jsp" />
</head>
<body>


	<!-- Shoping Cart Section Begin -->
	<section class="ftco-section">
		<div class="container">
			<div class="text">
				<div id="product_order_list" class="tit-conf">
					<p>
						<font class="tit">리뷰게시판</font>
					</p>
				</div>
				<table class="bb">
					<thead>
						<tr class="ff">
							<td class="cc">번호</td>
							<td class="cc">제목</td>
							<td class="cc writer">작성자</td>
							<td class="cc writer">작성일</td>
							<td class="cc read">조회수</td>
							<td class="cc star">평점</td>
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
											href="reviewDetail?rev_No=${re.rev_No}">${re.rev_Title}</a>
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
												<img alt="4점" src="resources/review/reviewList/img/four.png" />
											</c:if> <c:if test="${re.rev_Rate eq 4.5}">
												<img alt="4.5점"
													src="resources/review/reviewList/img/four-half.png" />
											</c:if> <c:if test="${re.rev_Rate eq 5}">
												<img alt="5점" src="resources/review/reviewList/img/five.png" />
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
						<button class="search">
							<img class="searchBtn"
								src="https://image.makeshop.co.kr/makeshop/d3/basic_simple/bbs/btn_bbs_sch.gif" />
						</button>
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

				<button type="button" id="revWrite" class="btn btn-outline-success"
					onclick="location.href='/reviewWrite'">글쓰기</button>
			</div>
		</div>
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>
	</section>
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
			moveForm.attr("action", "/reviewList");
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
		document.getElementById('a1').className ='nav-item';
		document.getElementById('a2').className ='nav-item';
		document.getElementById('a3').className ='nav-item active';
		document.getElementById('a4').className ='nav-item';
	</script>
	<jsp:include page="/WEB-INF/views/home/footer.jsp" />
	
</html>
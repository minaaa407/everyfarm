<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link href="/css/test/test.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>

<body>
	<div class="container">
		<h1>게시판List</h1>
		<div class="testlist">
			<form id="boardForm" name="boardForm" method="post">
				<table class="table table-hover">
					<colgroup>
						<col width="20%" />
						<col width="50%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<tbody id="dataSection"></tbody>
				</table>
			</form>
		</div>


		<div>
			<button id="btn_write" type="button">글작성</button>
		</div>

		<br>


		<!-- pagination{s} -->
		<div class="pagination1">
			<ul id="paginationBox" class="pagination">

			</ul>
		</div>
		<!-- pagination{e} -->

		<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right: 10px">
				<select class="form-control form-control-sm" id="keywordType">
					<option value="testTitle">제목</option>
					<option value="testContent">본문</option>
					<option value="testName">작성자</option>
				</select>
			</div>

			<div class="w300" style="padding-right: 10px">
				<input type="text" class="form-control form-control-sm"
					name="keyword" id="keyword">
			</div>

			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">검색</button>
			</div>
		</div>
		<!-- search{e} -->

		<!-- 페이지 목록 갯수   -->
		<div class="form-group row justify-content-center">
			<p>게시판 목록 갯수</p>
			<div class="w100" style="padding-right: 10px">
				<select id="listSize" class="form-control form-control-sm">
					<option value="10">10 개</option>
					<option value="15">15 개</option>
					<option value="20">20 개</option>
				</select>
			</div>
		</div>

	</div>
	<input type="hidden" id="searchInput" value="" />
	<input type="hidden" id="searchType" value="testTitle" />
</body>


<script type="text/javascript">
	$(document).ready(function() {
		getPage();
	})

	$("#listSize").change(function() {
		getPage();
	});

	//	글조회
	//	어떤 게시물을 클릭했는지 게시물의 번호(testId)를 넘겨 줘야 함 따라서 게시물 클릭 이벤트에서 게시물의 번호를 인자 값으로 받습니다.
	//  get 방식으로 데이터를 전송합니다. 따라서 ? 연산자를 사용해 testId를 주소 뒤에 붙여 줍니다
	function showDetail(testId) {

		var form = document.getElementById("boardForm");
		var url = "<c:url value='/testDetail.do'/>";
		url = url + "?testId=" + testId;

		form.action = url;
		form.submit();
	}

	//글 작성 버튼 클릭 시 testRegister로 이동
	$("#btn_write").click(function javascript_onclikc() {
		$(location).attr('href', 'testRegister.do');
	});

	$("#btnSearch").click(function() {
		const search = $("#keyword").val();
		const searchType = $("#keywordType").val();

		$("#searchInput").val(search);
		$("#searchType").val(searchType);
		getPage();
	});

	function getPage(page) {
		var listSize = $("#listSize").val();
		var searchType = $("#searchType").val();
		var search = $("#searchInput").val();
		$
				.ajax({
					url : "getTestList.do", //서비스 주소 
					data : { //서비스 처리에 필요한 인자값
						page : page,
						searchType : searchType,
						keyword : search,
						listSize : listSize
					},
					success : function(res) {
						const list = res['list'];
						const pagination = res['pagination'];
						var data = "";
						var block = "";

						console.log(pagination);
						// 테이블의 row를 삽입하는 부분
						for (var i = 0; i < list.length; i++) {
							data += "<tr style='cursor:pointer' onclick='showDetail("
									+ list[i]['testId'] + ")'>";
							data += "<td>" + list[i]['testId'] + "</td>";
							data += "<td>" + list[i]['testTitle'] + "</td>";
							data += "<td>" + list[i]['testName'] + "</td>";
							data += "<td>" + list[i]['testDate'] + "</td>";
							data += "</tr>";
						}

						// 이전버튼 활성화 여부를 결정하는 부분
						if (pagination['prev']) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getPage("
									+ (pagination['startPage'] - 1)
									+ ")'> < </a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
						}

						// 번호를 표시하는 부분
						for (var i = pagination['startPage']; i < pagination['endPage']; i++) {
							if (page !== i) {
								block += "<li class='page-item'><a class='page-link' href='javascript:getPage("
										+ i + ")'>" + (i + 1) + "</a></li>";
							} else {
								block += "<li class='page-item disabled'><a class='page-link'>"
										+ (i + 1) + "</a></li>";
							}
						}

						if (pagination['next']) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getPage("
									+ (pagination['endPage'])
									+ ")'>  > </a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
						}
						$("#dataSection").html(data);
						$("#paginationBox").html(block);
					}
				})
	}
</script>

</html>
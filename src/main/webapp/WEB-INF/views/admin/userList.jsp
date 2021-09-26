<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>EVERY FARM 관리자 | 회원 리스트</title>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />

<style>
td, th {
border-color:#9ea4ca;
}
body{
background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;
}
.limiter {
  margin: 0 auto;
}

.container-table100 {
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
  margin: 0 auto;
  position: relative;
  width: 1170px;
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
.pagination {
  display: inline-block;
}
.pagination a {
  float: left;
  padding: 8px 16px;
  border-radius:20%;
}
.pagination a.active {
  background-color: #7971ea;
  color: white;
}
.pagination a:hover:not(.active) {
background-color: silver;
}
</style>
</head>
<body>
	<!-- Navigation -->
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
				<div>
					<input class="btn btn-sm btn-neutral" type="button" id="submit"
						value="선택 삭제" onclick="uDelete()" /> <input
						onclick="location.href='/userAdd'" type="button" id="submit"
						class="btn btn-sm btn-neutral" value="계정 추가">
				</div>
				<div class="table100">
					<table id="userTable" border="1">
						<colgroup>
							<col style="width: 5%"/>
							<col style="width: 25%"/>
							<col style="width: 10%"/>
							<col style="width: 30%"/>
							<col style="width: 10%"/>
							<col style="width: 10%"/>
							<col style="width: 10%"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" id="allCheck"
									name="all" onclick="allChk(this);" /></th>
								<th scope="col">아이디</th>
								<th scope="col">성명</th>
								<th scope="col">주소</th>
								<th scope="col">전화번호</th>
								<th scope="col">생년월일</th>
								<th scope="col">가입일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty member}">
									<div>
										<p align="center">회원이 존재하지 않습니다.</p>
									</div>
								</c:when>
								<c:when test="${!empty member}">
									<c:forEach var="member" items="${member}">
										<tr>
											<td><input type="checkbox" name="RowCheck"
												value="${member.m_Id}"></td>
											<td>${member.m_Id}</td>
											<td>${member.m_Name}</td>
											<td>${member.m_Addr}</td>
											<td>${member.m_Tel}</td>
											<td>${member.m_Birth}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${member.m_Date}" /></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
					<br>
					<div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>ID</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>이름</option>
							</select> <input type="text" name="keyword"
								value="${pageMaker.cri.keyword }"
								onKeypress="javascript:if(event.keyCode==13)">
							<button>검색</button>
						</div>
					</div>
					<div class="pageInfo_wrap">
							<div id="pageInfo" class="pageInfo btn-group pagination">
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<span class="pageInfo_btn previous"><a
										href="${pageMaker.startPage-1}">[이전]</a></span>
								</c:if>

								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<span class="pageInfo_btn  ${pageMaker.cri.pageNum == num ? "active":"" }"><a
										href="${num}" style="background-color: #7971ea; color: white;">${num}</a></span>
								</c:forEach>

								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<span class="pageInfo_btn next"><a
										href="${pageMaker.endPage + 1 }">[다음]</a></span>
								</c:if>
							</div>
					</div>
					<form id="moveForm" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount }"> <input
							type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 페이징 및 검색!!!!  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		let moveForm = $("#moveForm");
		$(".move").on("click", function(e) {
			e.preventDefault();
			moveForm.attr("action", "/get");
			moveForm.submit();
		});
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/userList");
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
		function allChk(obj) {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length - 1;
			var check = obj.checked;
			if (check) {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox")
						chkObj[i].checked = true;
				}
			} else {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox") {
						chkObj[i].checked = false;
					}
				}
			}
		}
		function uDelete() {
			var checkArr = [];
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) {
					checkArr.push(list[i].value);
				}
			}
			if (checkArr.length == 0) {
				alert("선택된 계정이 없습니다.");
			} else {
				var chk = confirm("해당 계정을 삭제하시겠습니까?");
				if (!chk) {
					return false;
				} else {
					$.ajax({
						url : "/userDelete",
						type : "POST",
						dataType : "json",
						data : {
							checkArr : checkArr
						},
						success : function(result) {
							if (result.error == true) {
								alert("삭제 성공.");
								location.href ="/userList";
							} else {
								alert("삭제 실패.");
								location.href ="/userList";
							}
						}
					});
				}
			}
		}
	</script>
	<!-- 페이징 및 검색!!!!  -->
</body>
</html>
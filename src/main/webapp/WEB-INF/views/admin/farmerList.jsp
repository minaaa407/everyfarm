<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>EVERY FARM 관리자 | 농부 리스트</title>
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

.pageInfo li {
	float: left;
	font-size: 13px;
	font-weight: 500;
}

.pageInfo_btn {
	border-radius: 20%;
	list-style-type: none;
	padding: 8px 1px;
}

.pageInfo_btn  a {
	color: #5e72e4;
	font-size: 18px;
	padding: 8px 15px;
	border-radius: 20%;
}

.pageInfo_btn:hover {
	background-color: silver;
}


.active a {
	background-color: #7971ea;
	color: white;
}
.cen{
    display: flex;
    flex-direction: column;
    align-items: center;
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
						value="선택 삭제" onclick="fDelete()" />
					<input onclick="location.href='/farmerAdd'" type="button" id="submit"
						class="btn btn-sm btn-neutral" value="계정 추가">
					<input onclick="fSign()" type="button" id="submit"
						class="btn btn-sm btn-neutral" value="가입 승인">
				</div>
				<div class="table100">
					<table id="farmerTable" border="1">
						<colgroup>
							<col style="width:3%"/>
							<col style="width:18%"/>
							<col style="width:7%"/>
							<col style="width:20%"/>
							<col style="width:10%"/>
							<col style="width:10%"/>
							<col style="width:7%"/>
							<col style="width:10%"/>
							<col style="width:10%"/>
							<col style="width:5%"/>
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
								<th scope="col">별점</th>
								<th scope="col">가입일</th>
								<th scope="col">인증서</th>
								<th scope="col">승인여부</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty farmer}">
									<div>
										<p align="center">회원이 존재하지 않습니다.</p>
									</div>
								</c:when>
								<c:when test="${!empty farmer}">
									<c:forEach var="farmer" items="${farmer}">
										<tr>
											<td><input type="checkbox"
												name="RowCheck" value="${farmer.f_Id}"></td>
											<td>${farmer.f_Id}</td>
											<td>${farmer.f_Name}</td>
											<td>${farmer.f_Addr}</td>
											<td>${farmer.f_Tel}</td>
											<td>${farmer.f_Birth}</td>
											<td>${farmer.f_Rate}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${farmer.f_Date}" /></td>
											<td>${farmer.f_Auth}</td>
											<td>${farmer.f_Sign}</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
					<br>
					<div class="cen">
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
			moveForm.attr("action", "/farmerList");
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
	</script>
	
	<!-- 페이징 및 검색!!!!  -->

	<script type="text/javascript">
	$(document).ready(function () {   
	     $('ul.navbar-nav li:nth-child(5)').children().css('background','#dae39b');
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
		function fDelete() {
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
						url : "/farmerD",
						type : "POST",
						dataType : "json",
						data : {
							checkArr : checkArr
						},
						success : function(result) {
							if (result.error == true) {
								alert("삭제 되었습니다.");
								location.href = "/farmerList"
							} else {
								alert("삭제에 실패하셨습니다.");
								location.href = "/farmerList"
							}
						}
					});
				}
			}
		}
		
		function fSign() {
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
				var chk = confirm("해당 계정의 가입을 승인하시겠습니까?");
				if (!chk) {
					return false;
				} else {
					$.ajax({
						url : "/farmerY",
						type : "POST",
						dataType : "json",
						data : {
							checkArr : checkArr
						},
						success : function(result) {
							if (result.error == true) {
								alert("승인 완료.");
								location.href = "/farmerList"
							} else {
								alert("승인 실패.");
								location.href = "/farmerList"
							}
						}
					});
				}
			}
		}
	</script>
</body>
</html>
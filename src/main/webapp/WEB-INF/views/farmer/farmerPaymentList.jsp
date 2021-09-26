<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />


<title>EVERY FARM 농부 | 결제내역 </title>
<style>


@media screen and (min-width: 950px){
	div#table100{
		display : "" ;
	}
	.mobiletalbe{
		display :none;
	}
}

td, th {
border-color:#9ea4ca;
}
body{
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
  width: 100%;
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
<script>
window.onresize = function(event){
	  var innerWidth = window.innerWidth;
	  if(innerWidth <= "950"){
		  document.getElementById('table100').style.display ="none"
	  }else{
		  document.getElementById('table100').style.display =""
	  }

}


</script>
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
				<jsp:include page="/WEB-INF/views/farmer/farmerSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>
		<div class="limiter">
 			<div class="container-table100">
 				<div class="wrap-table100">
 					<div class="table100">
 						<div id ="table100" class="table100">
						<table border="1">
						<colgroup>
							<col style="width:10%"/>
							<col style="width:8%"/>
							<col style="width:5%"/>
							<col style="width:5%"/>
							<col style="width:8%"/>
							<col style="width:15%"/>
							<col style="width:10%"/>
							<col style="width:22%"/>
							<col style="width:7%"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">농장명</th>
								<th scope="col">주문자명</th>
								<th scope="col">땅평수</th>
								<th scope="col">씨앗</th>
								<th scope="col">금액</th>
								<th scope="col">배송메시지</th>
								<th scope="col">전화번호</th>
								<th scope="col">배송지</th>
								<th scope="col">주문날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							<c:when test="${empty farmerpaymentlist}">
									<div>
										<p align="center">결제내역이 존재하지 않습니다.</p>
									</div>
							</c:when>
							<c:when test="${!empty farmerpaymentlist}">
							<c:forEach var="farmerpay" items="${farmerpaymentlist}">
							<script>
							</script>
							<fmt:formatDate var="pay_Date" value="${farmerpay.pay_Date }" pattern="yyyy-MM-dd"/>
								<tr>
									<td>${farmerpay.p_Title }</td>
									<td>${farmerpay.pay_Name }</td>
									<td>${farmerpay.pay_Land }평</td>
									<td>${farmerpay.pay_Seed }</td>
									<td>${farmerpay.pay_Totalprice }원</td>
									<td>${farmerpay.pay_Deliverymemo }</td>
									<td>${farmerpay.pay_Tel }</td>
									<td>${farmerpay.pay_Address }</td>
									<td><c:out value="${pay_Date }"/></td>
									<%-- <button type="button" class="btn btn-primary mr-md-2 py-1 px-2" onclick="location.href='/farmerPaymentListDetail/${pay.pay_Orderno}'">상세</button> --%>
								</tr>
							</c:forEach>
								</c:when>
						</c:choose>
						</tbody>
					</table>
					</div>
				</div>
			</div>
			<div>
			<c:forEach var="farmerpay" items="${farmerpaymentlist}">
					<div class="mobiletalbe" >
							<table border="1" style="width:75%">
									<tbody>
										<tr>
											<td style="width: 15%;background: white;">농장명</td>
											<td style="width: 15%" class="content">${farmerpay.p_Title}</td>
										</tr>
										<tr>
											<td style="background: white;">주문자명</td>
											<td>${farmerpay.pay_Name }</td>
										</tr>
										<tr>
											<td style="background: white;">땅평수</td>
											<td>${farmerpay.pay_Land }평</td>
										</tr>
										<tr>
											<td style="background: white;">씨앗</td>
											<td>${farmerpay.pay_Seed }</td>
										</tr>
										<tr>
											<td style="background: white;">금액</td>
											<td>${farmerpay.pay_Totalprice }원</td>
										</tr>
										<tr>
											<td style="background: white;">배송메시지</td>
											<td>${farmerpay.pay_Deliverymemo }</td>
										</tr>
										<tr>
											<td style="background: white;">전화번호</td>
											<td>${farmerpay.pay_Tel }</td>
										</tr>
										<tr>
											<td style="background: white;">배송지</td>
											<td>${farmerpay.pay_Address }</td>
										</tr>
										<tr>
											<td style="background: white;">주문날짜</td>
											<td><c:out value="${pay_Date }"/></td>
										</tr>
									</tbody>
								</table>
								<br>
								<br>
						</div>	
			</c:forEach>
			</div>
			
			
			<form id="sort" name="rentSearch" method="post"
                                 action="/farmerpaymentlist">

                              <select id="searchType" name="searchType">
                                    <option value="">전체검색</option>
                                    <option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>농장명</option>
                                    <option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>주문자명</option>
                                    <option value="f" <c:if test="${pageMaker.cri.searchType eq 'f'}"> selected </c:if>>농작물명</option>
                                 </select>&nbsp;
                                 <input type="text" id="keyword" name="keyword"  
                                    value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />&nbsp;
                        
                                 <button id="button" class="btn waves-effect waves-light btn-outline">검색</button>&nbsp;
                                 <input type="button" id="button" class="btn waves-effect waves-light btn-outline" value="전체보기" onClick="location.href='/farmerpaymentlist';">&nbsp;
                              </form>
                              
                              <br>
			<!-- 페이징 start -->
				<div class="row">
                    	<div class="col btn-group pagination">
                        	<c:if test="${pageMaker.prev }">
                            	<a href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>[이전]</a>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                            	<c:if test="${pageNum eq pageMaker.cri.page}">
                            		<a class="active" href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageNum)}"/>'>
                                		<span id="pagingCur" style="background-color: #7971ea; color: white;">${pageNum}</span>
                                	</a>
                            	</c:if>
                                <c:if test="${pageNum ne pageMaker.cri.page}">
                                	<a href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageNum)}"/>'>
                               			<span>${pageNum}</span>
                               		</a>
                               	</c:if>
                            </c:forEach>
                            <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                            	<a href='<c:url value="/farmerpaymentlist${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                                	<span style="font-weight: bold;">[다음]</span>
                                </a>
                            </c:if>
                        </div>
				</div>
				<!-- 페이징 end -->
				</div>
			</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

function modal() {
	alert(1);
	$.ajax({
		type: "POST",
		url: "/modal/modal_view",
		data : {
			searchCode1: $('#search-code-1').val(),
			searchCode2: $('#search-code-2').val()
		},
		beforeSend: function() {
			$.loading(true);
		},
		success: function(data) {
			$.modal(data, 'l'); // modal창 호출
		},
		complete: function() {
			$.loading(false);
		},
		error: function(e) {
			// TODO 에러 화면
		}
		
	});
}
var innerWidth2 = window.innerWidth;

if(innerWidth2 <= "950"){
	  document.getElementById('table100').style.display ="none"
}else{
	  document.getElementById('table100').style.display =""
}

</script>
</body>
</html>
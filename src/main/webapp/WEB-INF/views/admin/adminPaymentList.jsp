<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.everyfarm.admin.AdminBean"%>
<% AdminBean admin  = (AdminBean) request.getSession().getAttribute("admin"); %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />

<title>EVERY FARM 관리자 | 결제내역</title>
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
  width: 90%
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
				<div><input class="btn btn-sm btn-neutral" type="button" id="submit" value="선택 삭제" onclick="checkremove()" /></div>
					<div id="table100" class="table100">
					<table border="1">
				<colgroup>
					<col style="width:5%" />
					<col style="width:20%"/>
					<col style="width:10%"/>
					<col style="width:15%"/>
					<col style="width:10%"/>
					<col style="width:25%"/>
					<col style="width:15%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">
							<input type="checkbox" id="all" name="all"/>
						</th>
						<th scope="col">주문번호</th>
						<th scope="col">주문자명</th>
						<th scope="col">상품명</th>
						<th scope="col">금액</th>
						<th scope="col">농부ID</th>
						<th scope="col">주문날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pay" items="${paymentlist}" varStatus="mo">
						<fmt:formatDate var="pay_Date" value="${pay.pay_Date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="pay_order" value="${pay.pay_Date }" pattern="yyyyMMddkkmmss"/>
						<tr>
							<td><input type="checkbox" id="list0" name="list0" value="${pay.pay_Orderno}"></td>
							<td onclick="window.location='/adminListDetail/${pay.pay_Orderno}'">${pay_order}${pay.pay_Orderno }</td>
							<td onclick="window.location='/adminListDetail/${pay.pay_Orderno}'">${pay.pay_Name }</td>
							<td onclick="window.location='/adminListDetail/${pay.pay_Orderno}'">${pay.p_Title }</td>
							<td onclick="window.location='/adminListDetail/${pay.pay_Orderno}'">${pay.pay_Totalprice }원</td>
							<td onclick="window.location='/adminListDetail/${pay.pay_Orderno}'">${pay.p_Id }</td>
							<td onclick="window.location='/adminListDetail/${pay.pay_Orderno}'"><c:out value="${pay_Date }"/></td>
						</tr>
					</c:forEach>
				</tbody>
						</table>
					</div>
						</div>

				
				<form id="sort" name="rentSearch" method="post"
                                 action="/adminPaymentList">

                              <select id="searchType" name="searchType">
                                    <option value="">전체검색</option>
                                    <option value="t" <c:if test="${pageMaker.cri.searchType eq 't'}">selected </c:if>>농부명</option>
                                    <option value="c" <c:if test="${pageMaker.cri.searchType eq 'c'}"> selected </c:if>>주문자명</option>
                                 </select>&nbsp;
                                 <input type="text" id="keyword" name="keyword"  
                                    value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />&nbsp;
                        
                                 <button id="button" class="btn waves-effect waves-light btn-outline">검색</button>&nbsp;
                                 <input type="button" id="button" class="btn waves-effect waves-light btn-outline" value="전체보기" onClick="location.href='/adminPaymentList';">&nbsp;
                              </form>
                              
                              <br>
                              
				<!-- 페이징 start -->
				<div class="row">
                    	<div class="col btn-group pagination">
                        	<c:if test="${pageMaker.prev }">
                            	<a href='<c:url value="/adminPaymentList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>이전</a>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                            	<c:if test="${pageNum eq pageMaker.cri.page}">
                            		<a class="active" href='<c:url value="/adminPaymentList${pageMaker.makeQuery(pageNum)}"/>'>
                                		<span id="pagingCur" style="background-color: #7971ea; color: white;">${pageNum}</span>
                                	</a>
                            	</c:if>
                                <c:if test="${pageNum ne pageMaker.cri.page}">
                                	<a href='<c:url value="/adminPaymentList${pageMaker.makeQuery(pageNum)}"/>'>
                               			<span>${pageNum}</span>
                               		</a>
                               	</c:if>
                            </c:forEach>
                            <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                            	<a href='<c:url value="/adminPaymentList${pageMaker.makeQuery(pageMaker.endPage+1)}"/>'>
                                	<span style="font-weight: bold;">다음</span>
                                </a>
                            </c:if>
                        </div>
				</div>
				<!-- 페이징 end -->
					</div>
				</div>
				
				
				
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
var check = 0;
var allcheck = $("input:checkbox[name='all']").length;
var $checkok = 0;
var arr = [];
var checktrue = false;

$(document).on('click','#all',function(){
	if($("#all").prop("checked")){
		$("input[name='list0']").prop("checked",true);
		} else {
		$("input[name='list0']").prop("checked",false);	
		}
	});
	
$(document).on('click','input[name=list0]',function(){
	if($('input[name=list0]:checked').length==$('input[name=list0]').length){
    	$('#all').prop('checked',true);
    }else{
        $('#all').prop('checked',false);
    }
});


function checkremove() {
	 var checkArr = [];     // 배열 초기화
     $("input[id='list0']:checked").each(function(i) {
          checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
      });
	if(checkArr.length == 0){
		alert("상품을 선택해주세요.");
	} else {
		if (confirm('선택하신' + checkArr.length + '건의 내역을 삭제하시겠습니까?')) {  
			  window.location.href = "http://localhost:8090/adminPayListDelete?payno=" + checkArr;
		} else{   
			return false;
		}
	}
}

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



</script>


</body>
</html>
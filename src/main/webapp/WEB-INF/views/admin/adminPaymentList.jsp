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

<title>결제내역-관리자 | EveryFarm</title>
<style>

.modal { 
	position:absolute; 
	width:50%; 
	height:50%; 
	background: rgba(0,0,0,0.8); 
	top:0; 
	left:0; 
	display:none; 
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
  width: 1170px;
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
			<!-- Brand -->
			<a class="navbar-brand pt-0" href="/admin"> <img
				src="resources/admin/img/brand/brand.jpg" class="navbar-brand-img"
				alt="...">
			</a>
			<!-- User -->
			<ul class="nav align-items-center d-md-none">
				<li class="nav-item dropdown"><a class="nav-link nav-link-icon"
					href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="ni ni-bell-55"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right"
						aria-labelledby="navbar-default_dropdown_1">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img
								alt="Image placeholder"
								src="resources/admin/img/theme/team-1-800x800.jpg">
							</span>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-single-02"></i> <span>My profile</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-settings-gear-65"></i> <span>Settings</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-calendar-grid-58"></i> <span>Activity</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i
							class="ni ni-support-16"></i> <span>Support</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
							<span>Logout</span>
						</a>
					</div></li>
			</ul>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="./index.html"> <img
								src="resources/admin/img/brand/blue.png">
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler"
								data-toggle="collapse" data-target="#sidenav-collapse-main"
								aria-controls="sidenav-main" aria-expanded="false"
								aria-label="Toggle sidenav">
								<span></span> <span></span>
							</button>
						</div>
					</div>
				</div>
				<!-- Navigation -->
				<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"></jsp:include>
			</div>
		</div>
	</nav>
	
		<div class="limiter">
 			<div class="container-table100">
 			<div class="wrap-table100">
				<div><input class="btn btn-sm btn-neutral" type="button" id="submit" value="선택 삭제" onclick="checkremove()" /></div>
					<div class="table100">
					<table border="1">
				<colgroup>
					<col style="width:30px" />
					<col style="width:100px"/>
					<col style="width:80px"/>
					<col style="width:130px"/>
					<col style="width:80px"/>
					<col style="width:80px"/>
					<col style="width:80px"/>
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
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pay" items="${paymentlist}" varStatus="mo">
						<fmt:formatDate var="pay_Date" value="${pay.pay_Date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="pay_order" value="${pay.pay_Date }" pattern="yyyyMMddkkmmss"/>
						<tr>
							<td><input type="checkbox" id="list0" name="list0" value="${pay.pay_Orderno}"></td>
							<td>${pay_order}${pay.pay_Orderno }</td>
							<td>${pay.pay_Name }</td>
							<td>${pay.p_Title }</td>
							<td>${pay.pay_Totalprice }</td>
							<td>${pay.p_Id }</td>
							<td><c:out value="${pay_Date }"/></td>
						</tr>
					</c:forEach>
				</tbody>
						</table>
					</div>
					<br>
						</div>
					<%-- <button type="button" class="btn btn-primary mr-md-2 py-1 px-2" data-target="#layerpop${mo.index}" data-toggle="modal">상세</button> --%>
										<div class="modal fade" id="layerpop${mo.index}" >
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <!-- header -->
				      <div class="modal-header">
				        <!-- header title -->
				        <h4 class="modal-title">상세정보</h4>
				      </div>
				      <!-- body -->
				      <div class="modal-body">
				      		<div class="container">
				      			<div class="col">
				      				<div class="row">
										<div class="col-md-6 form-group">
											<label for="1">주문번호</label>
											<input name="name" class="form-control" id="1" value="${pay_order}${pay.pay_Orderno }" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="2">주문자 성명</label>
											<input name="name" class="form-control" id="2" value="${pay.pay_Name }" readonly>
										</div>
									</div>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<label for="3">상품번호</label>
											<input name="name" class="form-control" id="3" value="${pay.p_No }" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="4">상품명</label>
											<input name="name" class="form-control" id="4" value="${pay.p_Title}""${pay.pay_Land + pay.pay_Seed}" readonly>
										</div>
									</div>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<label for="5">상품금액</label>
											<input name="name" class="form-control" id="5" value="${pay.pay_Totalprice }원" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="6">농장주ID</label>
											<input name="name" class="form-control" id="6" value="${pay.p_Id }" readonly>
										</div>
									</div>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<label for="7">배송비</label>
											<input name="name" class="form-control" id="7" value="3,000원" readonly>
										</div> 
										<div class="col-md-6 form-group">
											<label for="8">주문날짜</label>
											<input name="name" class="form-control" id="8" value="${pay_Date }" readonly>
										</div>
									</div> 
									<div class="form-group"> 
										<label for="9">배송메시지</label>
										<textarea name="name" class="form-control" id="9" readonly>${pay.pay_Deliverymemo}</textarea>
									</div>
									<label for="10">주문상태</label>
									<div class="row"> 
										<div class="col-md-6 form-group">
											<input name="name" class="form-control" id="10" value="농사중">
										</div>
										<div class="col-md-6">
											<select class="form-control" id="10">
							                    <option>농사중</option>
							                    <option>농사완료</option>
							                    <option>배송준비중</option>
							                    <option>배송완료</option>
							                </select>
						                </div>
									</div>
				      			</div>
				      		</div>
				      	</div>
				      <!-- Footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- 페이징 start -->
				<div class="row">
                    	<div class="col btn-group pagination">
                        	<c:if test="${pageMaker.prev }">
                            	<a href='<c:url value="/adminPaymentList${pageMaker.makeQuery(pageMaker.startPage-1)}"/>'>[이전]</a>
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
                                	<span style="font-weight: bold;">[다음]</span>
                                </a>
                            </c:if>
                        </div>
				</div>
				<!-- 페이징 start -->
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
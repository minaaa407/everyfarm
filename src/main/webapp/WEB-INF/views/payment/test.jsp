<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
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
	<div class="main-content">
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid">
				<div class="header-body">
					<!-- Card stats -->
					<div class="row">
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Traffic</h5>
											<span class="h2 font-weight-bold mb-0">350,897</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-danger text-white rounded-circle shadow">
												<i class="fas fa-chart-bar"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-success mr-2"><i
											class="fa fa-arrow-up"></i> 3.48%</span> <span class="text-nowrap">Since
											last month</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">New
												users</h5>
											<span class="h2 font-weight-bold mb-0">2,356</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-warning text-white rounded-circle shadow">
												<i class="fas fa-chart-pie"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-danger mr-2"><i
											class="fas fa-arrow-down"></i> 3.48%</span> <span
											class="text-nowrap">Since last week</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Sales</h5>
											<span class="h2 font-weight-bold mb-0">924</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-yellow text-white rounded-circle shadow">
												<i class="fas fa-users"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-warning mr-2"><i
											class="fas fa-arrow-down"></i> 1.10%</span> <span
											class="text-nowrap">Since yesterday</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Performance</h5>
											<span class="h2 font-weight-bold mb-0">49,65%</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-info text-white rounded-circle shadow">
												<i class="fas fa-percent"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-success mr-2"><i
											class="fas fa-arrow-up"></i> 12%</span> <span class="text-nowrap">Since
											last month</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
							<!-- Chart -->
							<div id="canvas-holder" style="width:30%">
								<canvas id="myChart" class="chart-canvas"></canvas>
								<input hidden="mMonth" id="mMonth" var="mMonth" name="mMonth"
									items="">
							</div>
							
		<input type="hidden" id="array0" value="${array0 }" >
	    <input type="hidden" id="array1" value="${array1 }" >
	    <input type="hidden" id="array2" value="${array2 }" >
	    <input type="hidden" id="array3" value="${array3 }" >
	    <input type="hidden" id="array4" value="${array4 }" >
	    <input type="hidden" id="array5" value="${array5 }" >
	    <input type="hidden" id="array6" value="${array6 }" >
	    <input type="hidden" id="array7" value="${array7 }" >
	    <input type="hidden" id="array8" value="${array8 }" >
	    <input type="hidden" id="array9" value="${array9 }" >
	    <input type="hidden" id="array10" value="${array10 }" >
	    <input type="hidden" id="array11" value="${array11 }" >
	    <input type="hidden" id="array12" value="${array12 }" >
	    <input type="hidden" id="array13" value="${array13 }" >
	    <input type="hidden" id="array14" value="${array14 }" >
    
		<input type="hidden" id="sarray0" value="${sarray0 }" >
	    <input type="hidden" id="sarray1" value="${sarray1 }" >
	    <input type="hidden" id="sarray2" value="${sarray2 }" >
	    <input type="hidden" id="sarray3" value="${sarray3 }" >
	    <input type="hidden" id="sarray4" value="${sarray4 }" >
	    <input type="hidden" id="sarray5" value="${sarray5 }" >
	    <input type="hidden" id="sarray6" value="${sarray6 }" >
	    <input type="hidden" id="sarray7" value="${sarray7 }" >
	    <input type="hidden" id="sarray8" value="${sarray8 }" >
	    <input type="hidden" id="sarray9" value="${sarray9 }" >
	    <input type="hidden" id="sarray10" value="${sarray10 }" >
	    <input type="hidden" id="sarray11" value="${sarray11 }" >
	    <input type="hidden" id="sarray12" value="${sarray12 }" >
	    <input type="hidden" id="sarray13" value="${sarray13 }" >
	    <input type="hidden" id="sarray14" value="${sarray14 }" >
    <div>
    	<input type="hidden" id="selmonth" value="" />
    	<select id="month" name="month" onchange="javascript:myListener(this);">
    		<option id="monthago" value="${monthago}">${monthago}월</option>
    		<option value="${date}" selected="selected">${date}월</option>
    	</select>
    </div>
    
          
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/dist/Chart.bundle.js"></script>
<script src="resources/dist/utils.js"></script>

<script>
alert(1);
console.log('시작');
const seeds = ["감자", "고구마", "콩", "배추", "상추", "수박", "오이", "토마토", "호박", "고추", "마늘", "파", "양파", "무", "당근"];
console.log(seeds);
var a = document.getElementById('array0').value;
var b = document.getElementById('array1').value;
var c = document.getElementById('array2').value;
var d = document.getElementById('array3').value;
var e = document.getElementById('array4').value;
var f = document.getElementById('array5').value;
var g = document.getElementById('array6').value;
var h = document.getElementById('array7').value;
var i = document.getElementById('array8').value;
var j = document.getElementById('array9').value;
var k = document.getElementById('array10').value;
var l = document.getElementById('array11').value;
var m = document.getElementById('array12').value;
var n = document.getElementById('array13').value;
var o = document.getElementById('array14').value;
//월별 셀렉트

function myListener(month) {
    alert(month.value); // 선택된 option의 value가 출력된다!
    const month1 = month.value;
    document.getElementById('selmonth').value=document.getElementById('month').value;
    console.log(typeof month1);
    console.log(month1);
    $.ajax({
    	url : "/admin1",
    	type : "POST",
    	dataType: "json",
    	data : {
    		selectmonth : month1
    	},
    	success : function(result) {
			if(result.error == false){
			alert("실패");
		}else{
			alert("성공");
			}
		}
	});
if (document.getElementById('selmonth').value == month1) {
	a = document.getElementById('sarray0').value;
	b = document.getElementById('sarray1').value;
	c = document.getElementById('sarray2').value;
	d = document.getElementById('sarray3').value;
	e = document.getElementById('sarray4').value;
	f = document.getElementById('sarray5').value;
	g = document.getElementById('sarray6').value;
	h = document.getElementById('sarray7').value;
	i = document.getElementById('sarray8').value;
	j = document.getElementById('sarray9').value;
	k = document.getElementById('sarray10').value;
	l = document.getElementById('sarray11').value;
	m = document.getElementById('sarray12').value;
	n = document.getElementById('sarray13').value;
	o = document.getElementById('sarray14').value;
}

console.log(document.getElementById('sarray0').value);
console.log(document.getElementById('sarray1').value);
console.log(document.getElementById('sarray2').value);
console.log(document.getElementById('sarray3').value);
console.log(a);
console.log(b);
console.log(c);
console.log(d);
    
}


console.log(1);
console.log(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o);

var seeds2 = ['감자' + a, '고구마' + b, '콩' + c, '배추' + d, '상추' + e,
			 '수박' + f, '오이' + g, '토마토' + h, '호박' + i, '고추' + j,
	 		 '마늘' + k, '파' + l, '양파' + m, '무' + n, '당근' + o];
/* var yseed = ['감자','고구마','콩','배추','상추','수박','오이','토마토','호박','고추','마늘','파','양파','무','당근']; */
var seeds3 = [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o];
var colors = ['rgba(255, 99, 132, 0.5)', 'rgba(156, 232, 102, 0.5)', 'rgba(26, 206, 107, 0.5)', 'rgba(232, 202, 102, 0.5)', 'rgba(143, 150, 235, 0.5)',
			  'rgba(107, 242, 180, 0.5)', 'rgba(242, 160, 107, 0.5)', 'rgba(217, 102, 232, 0.5)', 'rgba(100, 211, 211, 0.5)', 'rgba(245, 205, 195, 0.5)',
			  'rgba(180, 235, 215, 0.5)', 'rgba(100, 245, 186, 0.5)', 'rgba(6, 14, 117, 0.5)', 'rgba(84, 219, 66, 0.5)', 'rgba(235, 81, 61, 0.5)'];

/* var now = new Date().getMonth()+1;
var parray = new Array(); */

var context = document.getElementById('myChart').getContext('2d');
var mychart = new Chart(context, { 
			  type: 'polarArea',
			  data: {
				  labels: seeds2,
				  datasets: [{
					    backgroundColor: colors,
					    hoverBackgroundColor : [ 'rgba(255, 99, 132)', 'rgba(156, 232, 102)', 'rgba(26, 206, 107)', 'rgba(232, 202, 102)', 'rgba(143, 150, 235)',
					    						 'rgba(107, 242, 180)', 'rgba(242, 160, 107)', 'rgba(217, 102, 232)', 'rgba(100, 211, 211)', 'rgba(245, 205, 195)',
					    						 'rgba(180, 235, 215)', 'rgba(100, 245, 186)', 'rgba(6, 14, 117)', 'rgba(84, 219, 66)', 'rgba(235, 81, 61)'],
					    data: seeds3,
			}]
		},
		options : {
			responsive : true,
			legend: {
                position: 'right',
            },
			title: {
			      display: true,
			      text: "2021년 씨앗별 구매현황"
			    },
			    scale: {
		              ticks: {
		                beginAtZero: true
		              },
		              reverse: false
			    },
			    animation: {
	                animateRotate: true,
	                animateScale: true
	            }
		}
});



		  
</script>
</body>
</html>
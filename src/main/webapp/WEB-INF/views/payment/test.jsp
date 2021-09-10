<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col-xl-8 mb-5 mb-xl-0">
					<div class="card bg-gradient-default shadow">
						<div class="card-body">
							<!-- Chart -->
							<div class="chart">
								<!-- Chart wrapper -->
								<canvas id="myChart" class="chart-canvas"></canvas>
								<input hidden="mMonth" id="mMonth" var="mMonth" name="mMonth"
									items="">
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-muted ls-1 mb-1">Performance</h6>
									<h2 class="mb-0">Total orders</h2>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- Chart -->
							<div class="chart">
								<canvas id="myChart" width="400" height="400"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			
	<input type="hidden"  id="array0" value="${array0 }" >
    <input type="hidden"  id="array1" value="${array1 }" >
    <input type="hidden"  id="array2" value="${array2 }" >
    <input type="hidden"  id="array3" value="${array3 }" >
    <input type="hidden"  id="array4" value="${array4 }" >
    <input type="hidden"  id="array5" value="${array5 }" >
    <input type="hidden"  id="array6" value="${array6 }" >
    <input type="hidden"  id="array7" value="${array7 }" >
    <input type="hidden"  id="array8" value="${array8 }" >
    <input type="hidden"  id="array9" value="${array9 }" >
    <input type="hidden"  id="array10" value="${array10 }" >
    <input type="hidden"  id="array11" value="${array11 }" >
    <input type="hidden"  id="array12" value="${array12 }" >
    <input type="hidden"  id="array13" value="${array13 }" >
    <input type="hidden"  id="array14" value="${array14 }" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" integrity="sha512-mf78KukU/a8rjr7aBRvCa2Vwg/q0tUjJhLtcK53PHEbFwCEqQ5durlzvVTgQgKpv+fyNMT6ZQT1Aq6tpNqf1mg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
console.log('시작');
const xseed = ["감자", "고구마", "콩", "배추", "상추", "수박", "오이", "토마토", "호박", "고추", "마늘", "파", "양파", "무", "당근"];

var a = $('#array0').val();
var b = $('#array1').val();
var c = $('#array2').val();
var d = $('#array3').val();
var e = $('#array4').val();
var f = $('#array5').val();
var g = $('#array6').val();
var h = $('#array7').val();
var i = $('#array8').val();
var j = $('#array9').val();
var k = $('#array10').val();
var l = $('#array11').val();
var m = $('#array12').val();
var n = $('#array13').val();
var o = $('#array14').val();

console.log(1);
console.log(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o);

var yseed = [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o];
var colors = ["#7971ea", "#00aba9", "#2b5797", "#e8c3b9", "#1e7145"
			  "#DB3249", "#EBDA94", "#A22CF2", "#2A5DE8", "#8DEB69"
			  "#6AEB70", "#61B0ED", "#DCACBB", "#F5AF7A", "#EBDD94"];

var now = new Date().getMonth()+1;
var parray = new Array();

var context = document.getElementById('myChart').getContext('2d');
var mychart = new Chart(context, { 
			  type: 'polarArea',
			  data: {
				  labels: seed,
				  datasets: [{
					    backgroundColor: colors,
					    hoverBackgroundColor : [ '#A6a6a6', '#A6a6a6', '#A6a6a6', '#A6a6a6', '#A6a6a6',
					    						 '#A6a6a6', '#A6a6a6', '#A6a6a6', '#A6a6a6', '#A6a6a6',
					    						 '#A6a6a6', '#A6a6a6', '#A6a6a6', '#A6a6a6', '#A6a6a6'],
					    data: yseed,
			}]
		},
		options : {
			title: {
			      display: true,
			      text: "2021년 씨앗별 구매현황"
			    }
			responsive : false
		}
});
		  
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>EVERYFARM</title>

	
	<!-- 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body class="">
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
			<a class="navbar-brand pt-0" href="/farmer"> <img
				src="resources/farmer/img/brand/brand.jpg" class="navbar-brand-img"
				alt="...">
			</a>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
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
				<jsp:include page="/WEB-INF/views/farmer/farmerSideMenu.jsp"></jsp:include>
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
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-light ls-1 mb-1">Overview</h6>
									<h2 class="text-white mb-0">Sales value</h2>
								</div>
								<div class="col">
									<ul class="nav nav-pills justify-content-end">
										<li class="nav-item mr-2 mr-md-0" data-toggle="chart"
											data-target="#chart-sales"
											data-update='{"data":{"datasets":[{"data":[0, 20, 10, 30, 15, 40, 20, 60, 60]}]}}'
											data-prefix="$" data-suffix="k"><a href="#"
											class="nav-link py-2 px-3 active" data-toggle="tab"> <span
												class="d-none d-md-block">Month</span> <span
												class="d-md-none">M</span>
										</a></li>
										<li class="nav-item" data-toggle="chart"
											data-target="#chart-sales"
											data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}'
											data-prefix="$" data-suffix="k"><a href="#"
											class="nav-link py-2 px-3" data-toggle="tab"> <span
												class="d-none d-md-block">Week</span> <span
												class="d-md-none">W</span>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- Chart -->
							<div class="chart">
								<!-- Chart wrapper -->
								<canvas id="chart-sales" class="chart-canvas"></canvas>
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
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
									<h2 id="productyeartext" class="mb-0">Total orders <c:out value="${year}"/> </h2>
								</div>									
								<div class="col text-right">
									<input class="btn btn-sm btn-primary" onclick="pretowyear()" type="button" value="<c:out value="${year-2}" />"/>
									<input class="btn btn-sm btn-primary" onclick="preoneyear()" type="button" value="<c:out value="${year-1}" />"/>
									<input class="btn btn-sm btn-primary" onclick="nowyear()" type="button" value="<c:out value="${year}" />"/>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- Chart -->
							<div id = "productchart" class="chart">
								<canvas id="chart-orders2" class="chart-canvas"></canvas>
							</div>
							
							
								<script src="resources/farmer/js/argon-dashboard.min.js?v=1.1.2"></script>
								<script>
								function nowyear(){
									var productchar = document.getElementById("productchart");
									var text = "<canvas id='chart-orders2' class='chart-canvas'>";
									productchar.innerHTML=text;
									text = "Total orders <c:out value='${year}'/>";
									document.getElementById("productyeartext").innerHTML=text;
									
									OrdersChart=function(){var e,a,t=$("#chart-orders2");$('[name="ordersSelect"]');
									t.length&&(e=t,a=new Chart(e,{type:"bar",options:{scales:{yAxes:[{gridLines:{lineWidth:1,color:"#dfe2e6",zeroLineColor:"#dfe2e6"},
										ticks:{callback:function(e){if(!(e%10))return e}}}]},tooltips:{
											callbacks:{label:function(e,a){var t=a.datasets[e.datasetIndex].label||"",o=e.yLabel,n="";
											return 1<a.datasets.length&&(n+='<span class="popover-body-label mr-auto">'+t+"</span>"),n+='<span class="popover-body-value">'+o+"</span>"}}}},data:{labels:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],datasets:[{label:"Sales",data:[${payment[0]},${payment[1]},${payment[2]},${payment[3]},${payment[4]},${payment[5]},${payment[6]},${payment[7]},${payment[8]},${payment[9]},${payment[10]},${payment[11]}]}]}}),e.data("chart",a))}();

								}
								
								function preoneyear(){
									var productchar = document.getElementById("productchart");
									var text = "<canvas id='chart-orders2' class='chart-canvas'>";
									productchar.innerHTML=text;
									text = "Total orders <c:out value='${year-1}'/>";
									document.getElementById("productyeartext").innerHTML=text;
									
									OrdersChart=function(){var e,a,t=$("#chart-orders2");$('[name="ordersSelect"]');
									t.length&&(e=t,a=new Chart(e,{type:"bar",options:{scales:{yAxes:[{gridLines:{lineWidth:1,color:"#dfe2e6",zeroLineColor:"#dfe2e6"},
										ticks:{callback:function(e){if(!(e%10))return e}}}]},tooltips:{
											callbacks:{label:function(e,a){var t=a.datasets[e.datasetIndex].label||"",o=e.yLabel,n="";
											return 1<a.datasets.length&&(n+='<span class="popover-body-label mr-auto">'+t+"</span>"),n+='<span class="popover-body-value">'+o+"</span>"}}}},data:{labels:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],datasets:[{label:"Sales",data:[${payment1pre[0]},${payment1pre[1]},${payment1pre[2]},${payment1pre[3]},${payment1pre[4]},${payment1pre[5]},${payment1pre[6]},${payment1pre[7]},${payment1pre[8]},${payment1pre[9]},${payment1pre[10]},${payment1pre[11]}]}]}}),e.data("chart",a))}();

								}
								
								function pretowyear(){
									var productchar = document.getElementById("productchart");
									var text = "<canvas id='chart-orders2' class='chart-canvas'>";
									productchar.innerHTML=text;
									text = "Total orders <c:out value='${year-2}'/>";
									document.getElementById("productyeartext").innerHTML=text;
									
									OrdersChart=function(){var e,a,t=$("#chart-orders2");$('[name="ordersSelect"]');
									t.length&&(e=t,a=new Chart(e,{type:"bar",options:{scales:{yAxes:[{gridLines:{lineWidth:1,color:"#dfe2e6",zeroLineColor:"#dfe2e6"},
										ticks:{callback:function(e){if(!(e%10))return e}}}]},tooltips:{
											callbacks:{label:function(e,a){var t=a.datasets[e.datasetIndex].label||"",o=e.yLabel,n="";
											return 1<a.datasets.length&&(n+='<span class="popover-body-label mr-auto">'+t+"</span>"),n+='<span class="popover-body-value">'+o+"</span>"}}}},data:{labels:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],datasets:[{label:"Sales",data:[${payment2pre[0]},${payment2pre[1]},${payment2pre[2]},${payment2pre[3]},${payment2pre[4]},${payment2pre[5]},${payment2pre[6]},${payment2pre[7]},${payment2pre[8]},${payment2pre[9]},${payment2pre[10]},${payment2pre[11]}]}]}}),e.data("chart",a))}();

								}
								</script>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-xl-8 mb-5 mb-xl-0">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">Page visits</h3>
								</div>
								<div class="col text-right">
									<a href="#!" class="btn btn-sm btn-primary">See all</a>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">Page name</th>
										<th scope="col">Visitors</th>
										<th scope="col">Unique users</th>
										<th scope="col">Bounce rate</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">/argon/</th>
										<td>4,569</td>
										<td>340</td>
										<td><i class="fas fa-arrow-up text-success mr-3"></i>
											46,53%</td>
									</tr>
									<tr>
										<th scope="row">/argon/index.html</th>
										<td>3,985</td>
										<td>319</td>
										<td><i class="fas fa-arrow-down text-warning mr-3"></i>
											46,53%</td>
									</tr>
									<tr>
										<th scope="row">/argon/charts.html</th>
										<td>3,513</td>
										<td>294</td>
										<td><i class="fas fa-arrow-down text-warning mr-3"></i>
											36,49%</td>
									</tr>
									<tr>
										<th scope="row">/argon/tables.html</th>
										<td>2,050</td>
										<td>147</td>
										<td><i class="fas fa-arrow-up text-success mr-3"></i>
											50,87%</td>
									</tr>
									<tr>
										<th scope="row">/argon/profile.html</th>
										<td>1,795</td>
										<td>190</td>
										<td><i class="fas fa-arrow-down text-danger mr-3"></i>
											46,53%</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">Social traffic</h3>
								</div>
								<div class="col text-right">
									<a href="#!" class="btn btn-sm btn-primary">See all</a>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">Referral</th>
										<th scope="col">Visitors</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Facebook</th>
										<td>1,480</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2">60%</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-danger"
															role="progressbar" aria-valuenow="60" aria-valuemin="0"
															aria-valuemax="100" style="width: 60%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">Facebook</th>
										<td>5,480</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2">70%</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-success"
															role="progressbar" aria-valuenow="70" aria-valuemin="0"
															aria-valuemax="100" style="width: 70%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">Google</th>
										<td>4,807</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2">80%</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-primary"
															role="progressbar" aria-valuenow="80" aria-valuemin="0"
															aria-valuemax="100" style="width: 80%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">Instagram</th>
										<td>3,678</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2">75%</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-info"
															role="progressbar" aria-valuenow="75" aria-valuemin="0"
															aria-valuemax="100" style="width: 75%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">twitter</th>
										<td>2,645</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2">30%</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-warning"
															role="progressbar" aria-valuenow="30" aria-valuemin="0"
															aria-valuemax="100" style="width: 30%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<footer class="footer">
				<div class="row align-items-center justify-content-xl-between">
					<div class="col-xl-6">
						<div class="copyright text-center text-xl-left text-muted">
							&copy; 2018 <a href="https://www.creative-tim.com"
								class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
						</div>
					</div>
					<div class="col-xl-6">
						<ul
							class="nav nav-footer justify-content-center justify-content-xl-end">
							<li class="nav-item"><a href="https://www.creative-tim.com"
								class="nav-link" target="_blank">Creative Tim</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/presentation"
								class="nav-link" target="_blank">About Us</a></li>
							<li class="nav-item"><a href="http://blog.creative-tim.com"
								class="nav-link" target="_blank">Blog</a></li>
							<li class="nav-item"><a
								href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
								class="nav-link" target="_blank">MIT License</a></li>
						</ul>
					</div>
				</div>
			</footer>
		</div>
	</div>
</body>
<!--   Core   -->
<script src="resources/farmer/js/plugins/jquery/dist/jquery.min.js"></script>
<script
	src="resources/farmer/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<script src="resources/farmer/js/plugins/chart.js/dist/Chart.min.js"></script>
<script
	src="resources/farmer/js/plugins/chart.js/dist/Chart.extension.js"></script>
<!--   Argon JS   -->
<script src="resources/farmer/js/argon-dashboard.min.js?v=1.1.2">

</script>
<script>
OrdersChart=function(){var e,a,t=$("#chart-orders2");$('[name="ordersSelect"]');
t.length&&(e=t,a=new Chart(e,{type:"bar",options:{scales:{yAxes:[{gridLines:{lineWidth:1,color:"#dfe2e6",zeroLineColor:"#dfe2e6"},
	ticks:{callback:function(e){if(!(e%10))return e}}}]},tooltips:{
		callbacks:{label:function(e,a){var t=a.datasets[e.datasetIndex].label||"",o=e.yLabel,n="";
		return 1<a.datasets.length&&(n+='<span class="popover-body-label mr-auto">'+t+"</span>"),n+='<span class="popover-body-value">'+o+"</span>"}}}},data:{labels:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],datasets:[{label:"Sales",data:[${payment[0]},${payment[1]},${payment[2]},${payment[3]},${payment[4]},${payment[5]},${payment[6]},${payment[7]},${payment[8]},${payment[9]},${payment[10]},${payment[11]}]}]}}),e.data("chart",a))}();

</script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>

<script>



</script>







</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>EVERYFARM</title>
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
								<canvas id="userNfarmer" class="chart-canvas"></canvas>
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
								<canvas id="chart-orders" class="chart-canvas"></canvas>
							</div>
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


<script>
      var mMonth = ${mMonth};
      var mChart = mMonth.reverse();

      var fMonth = ${fMonth};
      var fChart = fMonth.reverse();

      var date = new Date();
      var year = date.getFullYear();
      var month = ('0' + (date.getMonth() + 1)).slice(-2);
      var monStr = new Array;

      for (var i = 0; i < 12; i++) {
         month = date.setMonth(date.getMonth() - i);
         monStr[i] = year + '-' + month;
      }
      var monLb = monStr.reverse();

      new Chart("userNfarmer", {
         type : "line",
         data : {
            labels : monLb,
            datasets : [{
               data : mChart,
               borderColor : "yellow",
               fill : false
            }, {
               data : fChart,
               borderColor : "gray",
               fill : false
            } ]
         },
         options : {
            legend : {
               display : false
            }
         }
      });
   </script>





</body>
<!--   Core   -->
<script src="resources/admin/js/plugins/jquery/dist/jquery.min.js"></script>
<script
	src="resources/admin/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<script src="resources/admin/js/plugins/chart.js/dist/Chart.min.js"></script>
<script
	src="resources/admin/js/plugins/chart.js/dist/Chart.extension.js"></script>
<!--   Argon JS   -->
<script src="resources/admin/js/argon-dashboard.min.js?v=1.1.2"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>

</html>
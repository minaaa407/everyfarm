<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
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
 
	    <input type="hidden" id="year" value="${year}" >
    <div>
    	<input type="hidden" id="selmonth" value="" />
    	<select id="month" name="month" onchange="javascript:myListener(this);">
    		<option id="monthago12" value="${monthago12}">${monthago12}???</option>
    		<option id="monthago11" value="${monthago11}">${monthago11}???</option>
    		<option id="monthago10" value="${monthago10}">${monthago10}???</option>
    		<option id="monthago9" value="${monthago9}">${monthago9}???</option>
    		<option id="monthago8" value="${monthago8}">${monthago8}???</option>
    		<option id="monthago7" value="${monthago7}">${monthago7}???</option>
    		<option id="monthago6" value="${monthago6}">${monthago6}???</option>
    		<option id="monthago5" value="${monthago5}">${monthago5}???</option>
    		<option id="monthago4" value="${monthago4}">${monthago4}???</option>
    		<option id="monthago3" value="${monthago3}">${monthago3}???</option>
    		<option id="monthago2" value="${monthago2}">${monthago2}???</option>
    		<option id="monthago1" value="${monthago1}">${monthago1}???</option>
    		<option value="${date}" selected="selected">${date}???</option>
    	</select>
    </div>
    
          
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/dist/Chart.bundle.js"></script>
<script src="resources/dist/utils.js"></script>

<script>
console.log(1);
console.log('??????');

var myChart;

const seeds = ["??????", "?????????", "???", "??????", "??????", "??????", "??????", "?????????", "??????", "??????", "??????", "???", "??????", "???", "??????"];
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

var year = document.getElementById('year').value;
console.log(year);

var seeds2 = ['??????', '?????????', '???', '??????', '??????',
			  '??????', '??????', '?????????', '??????', '??????',
			  '??????', '???', '??????', '???', '??????'];
var seeds3 = [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o];


console.log(1);
console.log(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o);

var sa = 0; 	var sb = 0; 	var sc = 0;		var sd = 0; 	var se = 0;
var sf = 0; 	var sg = 0;		var sh = 0; 	var si = 0; 	var sj = 0;
var sk = 0; 	var sl = 0; 	var sm = 0; 	var sn = 0; 	var so = 0;



console.log("array" + a,b,c,d,e,f,g,h,i,j,k,l,m,n,o);
/* console.log("sarray" + sa,sb,sc,sd,se,sf,sg,sh,si,sj,sk,sl,sm,sn,so); */
console.log(seeds2);
console.log(seeds3);
//?????? ?????????

function myListener(month) {
	console.log('---???????????????---');
    console.log(month.value); // ????????? option??? value??? ????????????!
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
			alert("??????");
		}else{
			console.log("??????");
			console.log("sarray0 = " + result.sarray0);
			sa = result.sarray0; 	sb = result.sarray1; 	sc = result.sarray2;
			sd = result.sarray3; 	se = result.sarray4; 	sf = result.sarray5;
			sg = result.sarray6; 	sh = result.sarray7; 	si = result.sarray8;
			sj = result.sarray9; 	sk = result.sarray10; 	sl = result.sarray11;
			sm = result.sarray12; 	sn = result.sarray13; 	so = result.sarray14;
			
			console.log(sa,sb,sc,sd,se,sf,sg,sh,si,sj,sk,sl,sm,sn,so);
			
    		seeds2 = ['??????', '?????????', '???', '??????', '??????',
			 		  '??????', '??????', '?????????', '??????', '??????',
	 				  '??????', '???', '??????', '???', '??????'];
			seeds3 = [sa,sb,sc,sd,se,sf,sg,sh,si,sj,sk,sl,sm,sn,so];
			console.log("seed2 = " + seeds2);
			console.log("seed3 = " + seeds3);
			if (myChart) {
	            myChart.destroy()
	        }
			context = document.getElementById('myChart').getContext('2d');
			myChart = new Chart(context, { 
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
							labels: {
		                        fontColor: 'rgba(0,0,0,1)',
		                        fontSize: 16,
		                        fontStyle: "bold"
		                    },
			                position: 'right',
			            },
						title: {
						      display: true,
						      text: year + "??? ?????? ?????? ?????????",
						      fontSize: 25,
						      fontColor: '#4e9525'
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
			}
		},
		error : function(request,status,error) {
			//?????? ????????? ???????????? ??????(??????)
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
    console.log('---ajax ???---');


    
}



var colors = ['rgba(255, 99, 132, 0.5)', 'rgba(156, 232, 102, 0.5)', 'rgba(26, 206, 107, 0.5)', 'rgba(232, 202, 102, 0.5)', 'rgba(143, 150, 235, 0.5)',
			  'rgba(107, 242, 180, 0.5)', 'rgba(242, 160, 107, 0.5)', 'rgba(217, 102, 232, 0.5)', 'rgba(100, 211, 211, 0.5)', 'rgba(245, 205, 195, 0.5)',
			  'rgba(180, 235, 215, 0.5)', 'rgba(100, 245, 186, 0.5)', 'rgba(6, 14, 117, 0.5)', 'rgba(84, 219, 66, 0.5)', 'rgba(235, 81, 61, 0.5)'];

var context = document.getElementById('myChart').getContext('2d');
myChart = new Chart(context, { 
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
				labels: {
                    fontColor: 'rgba(0,0,0,1)',
                    fontSize: 16,
                    fontStyle: "bold"
                },
                position: 'right',
            },
			title: {
			      display: true,
			      text: year + "??? ?????? ?????? ?????????",
			      fontSize: 25,
			      fontColor: '#4e9525'
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
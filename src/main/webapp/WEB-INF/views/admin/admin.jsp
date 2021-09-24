<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Every Farm : 관리자</title>
	<style>
	body{
	background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;
	}
	canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    .chartD {
    background-color: white;
    box-shadow: 1px 1px 10px grey;
        display: flex;
    flex-direction: column;
    justify-content: center;
    }
    .chartA {
    background-color: white;
    box-shadow: 1px 1px 10px grey;
        display: flex;
    flex-direction: column;
    }
    .main-content{
    margin-top: 200px;
    margin-bottom: 200px;
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
	<div class="main-content" >
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col-xl-8 mb-5 mb-xl-0">
					<div>
						<div class="chartA" style="width: 1600px; height:500px">
							<!-- Chart -->
							<div class="chart">
							<div class="card-header bg-transparent">
									<h6 class="text-uppercase text-muted ls-1 mb-1">Every Farm</h6>
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
									<h2 class="productyeartext" class="mb-0">월별 가입자 수 </h2>
								</div>
								<!-- Chart wrapper -->
								<canvas id="userNfarmer" class="chart-canvas" width="1600" height="350"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-5 ">
			<div class="col-xl-6">
					<div class="card shadow" style="height: 510px; ">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-muted ls-1 mb-1">Every Farm</h6>
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
									<h2 id="productyeartext" class="mb-0"> <c:out value="${year}"/>&nbsp;월별 매출액 </h2>
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
								<canvas id="chart-orders2" class="chart-canvas" width="700" height="350"></canvas>
							</div>
						</div>
					</div>
				</div>
			
				<!-- Chart -->
							<div class="chartD col-xl-6" id="canvas-holder">
								<div class="card-header bg-transparent">
									<h6 class="text-uppercase text-muted ls-1 mb-1">Every Farm</h6>
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
									<h2 class="productyeartext" class="mb-0"><c:out value="${year}"/>&nbsp;월별 씨앗 판매 수 </h2>
								</div>
								<canvas id="myChart" class="chart-canvas" width="700" height="350"></canvas>
							<span style="width: 80px;">
    	<input type="hidden" id="selmonth" value="" />
    	<select id="month" name="month" onchange="javascript:myListener(this);">
    		<option id="monthago8" value="${monthago8}">${monthago8}월</option>
    		<option id="monthago7" value="${monthago7}">${monthago7}월</option>
    		<option id="monthago6" value="${monthago6}">${monthago6}월</option>
    		<option id="monthago5" value="${monthago5}">${monthago5}월</option>
    		<option id="monthago4" value="${monthago4}">${monthago4}월</option>
    		<option id="monthago3" value="${monthago3}">${monthago3}월</option>
    		<option id="monthago2" value="${monthago2}">${monthago2}월</option>
    		<option id="monthago1" value="${monthago1}">${monthago1}월</option>
    		<option value="${date}" selected="selected">${date}월</option>
    	</select>
    </span>
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
    
    <!-- Chart -->
			</div>
		</div>
	</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/dist/Chart.bundle.js"></script>
<script src="resources/dist/utils.js"></script>


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
	   month = ((date.getMonth() - i)+1);
	
	   if(month == '0'){
	  	 monStr[i] = (year-1) + '-' + '12';
	   }else if(month == '-1'){
	  	 monStr[i] = (year-1) + '-' + '11';
	   }else if(month == '-2'){
	  	 monStr[i] = (year-1) + '-' + '10';
	   }else if(month == '-3'){
	  	 monStr[i] = (year-1) + '-' + '09';
	   }else if(month == '-4'){
	  	 monStr[i] = (year-1) + '-' + '08';
	   }else if(month == '-5'){
	  	 monStr[i] = (year-1) + '-' + '07';
	   }else if(month == '-6'){
	  	 monStr[i] = (year-1) + '-' + '06';
	   }else if(month == '-7'){
	  	 monStr[i] = (year-1) + '-' + '05';
	   }else if(month == '-8'){
	  	 monStr[i] = (year-1) + '-' + '04';
	   }else if(month == '-9'){
	  	 monStr[i] = (year-1) + '-' + '03';
	   }else if(month == '-10'){
	  	 monStr[i] = (year-1) + '-' + '02';
	   }else if(month == '-11'){
	  	 monStr[i] = (year-1) + '-' + '01';
	   }
	   else{
	  	 month = ('0' +( (date.getMonth() - i)+1 )).slice(-2);
	  	 monStr[i] = year + '-' + month;
	   }
	   
	}
	var monLb = monStr.reverse();
		
	new Chart("userNfarmer", {
	   type : "line",
	   data : {
	      labels : monLb,
	      datasets : [{
	    	  label: '회원',
	         data : mChart,
	         borderColor : "red",
	         fill : false
	      }, {
	    	  label: '농부',
	         data : fChart,
	         borderColor : "blue",
	         fill : false
	      } ]
	   },
	   options : {
		   responsive: false,
	      legend : {
	         display : true
	      }
	   }
	});
	      
    	 /*  씨앗 판매개수 chart */
      console.log(1);
      console.log('시작');

      var myChart;

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

      var year = document.getElementById('year').value;
      console.log(year);

      var seeds2 = ['감자', '고구마', '콩', '배추', '상추',
      			  '수박', '오이', '토마토', '호박', '고추',
      			  '마늘', '파', '양파', '무', '당근'];
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
      //월별 셀렉트

      function myListener(month) {
      	console.log('---셀렉트시작---');
          console.log(month.value); // 선택된 option의 value가 출력된다!
          const month1 = month.value;
          document.getElementById('selmonth').value=document.getElementById('month').value;
          console.log(typeof month1);
          console.log(month1);
          $.ajax({
          	url : "/admin",
          	type : "POST",
          	dataType: "json",
          	data : {
          		selectmonth : month1
          	},
          	success : function(result) {
      			if(result.error == false){
      			alert("실패");
      		}else{
      			console.log("성공");
      			console.log("sarray0 = " + result.sarray0);
      			sa = result.sarray0; 	sb = result.sarray1; 	sc = result.sarray2;
      			sd = result.sarray3; 	se = result.sarray4; 	sf = result.sarray5;
      			sg = result.sarray6; 	sh = result.sarray7; 	si = result.sarray8;
      			sj = result.sarray9; 	sk = result.sarray10; 	sl = result.sarray11;
      			sm = result.sarray12; 	sn = result.sarray13; 	so = result.sarray14;
      			
      			console.log(sa,sb,sc,sd,se,sf,sg,sh,si,sj,sk,sl,sm,sn,so);
      			
          		seeds2 = ['감자', '고구마', '콩', '배추', '상추',
      			 		  '수박', '오이', '토마토', '호박', '고추',
      	 				  '마늘', '파', '양파', '무', '당근'];
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
      						responsive : false,
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
      			//통신 실패시 발생하는 함수(콜백)
      			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
      			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
      		}
      	});
          console.log('---ajax 끝---');


          
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
      			responsive : false,
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
      
      /* 씨앗 판매개수 chart */
      
   </script>
   
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<!--   Core   -->
				<script src="resources/farmer/js/plugins/jquery/dist/jquery.min.js"></script>
				<script
					src="resources/farmer/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
				<!--   Optional JS   -->
				<script src="resources/farmer/js/plugins/chart.js/dist/Chart.min.js"></script>
				<script
					src="resources/farmer/js/plugins/chart.js/dist/Chart.extension.js"></script>
				<!--   Argon JS   -->
				<script src="resources/farmer/js/argon-dashboard.min.js?v=1.1.2"></script>
				<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>	

								<script>
									OrdersChart=function(){var e,a,t=$("#chart-orders2");$('[name="ordersSelect"]');
									t.length&&(e=t,a=new Chart(e,{type:"bar",options:{scales:{yAxes:[{gridLines:{lineWidth:1,color:"#dfe2e6",zeroLineColor:"#dfe2e6"},
										ticks:{callback:function(e){if(!(e%10))return e}}}]},tooltips:{
											callbacks:{label:function(e,a){var t=a.datasets[e.datasetIndex].label||"",o=e.yLabel,n="";
											return 1<a.datasets.length&&(n+='<span class="popover-body-label mr-auto">'+t+"</span>"),n+='<span class="popover-body-value">'+o+"</span>"}}}},data:{labels:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],datasets:[{label:"Sales",data:[${payment[0]},${payment[1]},${payment[2]},${payment[3]},${payment[4]},${payment[5]},${payment[6]},${payment[7]},${payment[8]},${payment[9]},${payment[10]},${payment[11]}]}]}}),e.data("chart",a))}();
								
								</script>
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

</body>
</html>
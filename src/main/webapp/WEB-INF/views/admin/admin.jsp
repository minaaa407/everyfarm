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
<title>EVERY FARM | 관리자</title>
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
    .pad {
    padding-left: 0px;
    padding-right: 0px;
    padding-top: 0px;
    padding-bottom: 0px;
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
	
	<div class="main-content" style="margin-left:0px;">
		<div class="container-fluid">
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
					<div class="card shadow" style="height: 510px;  ">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-muted ls-1 mb-1">Every Farm</h6>
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
									<h2 id="productyeartext" class="mb-0"> <c:out value="${year}"/> 월별 매출 통계</h2>
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
							<div class="chartD col-xl-6" style="padding-left: 0px; padding-right: 0px; width: 800px;">
								<iframe src="http://everyfarm.shop/iTest" width="800" height="505"></iframe>
							</div>
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
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
								<script>
									OrdersChart=function(){var e,a,t=$("#chart-orders2");$('[name="ordersSelect"]');
									t.length&&(e=t,a=new Chart(e,{type:"bar",options:{scales:{yAxes:[{gridLines:{lineWidth:1,color:"#dfe2e6",zeroLineColor:"#dfe2e6"},
										ticks:{callback:function(e){if(!(e%10))return e}}}]},tooltips:{
											callbacks:{label:function(e,a){var t=a.datasets[e.datasetIndex].label||"",o=e.yLabel,n="";
											return 1<a.datasets.length&&(n+='<span class="popover-body-label mr-auto">'+t+"</span>"),n+='<span class="popover-body-value">'+o+"</span>"}}}},data:{labels:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],datasets:[{label:"Sales",data:[${payment[0]},${payment[1]},${payment[2]},${payment[3]},${payment[4]},${payment[5]},${payment[6]},${payment[7]},${payment[8]},${payment[9]},${payment[10]},${payment[11]}]}]}}),e.data("chart",a))}();
								
								</script>
								<script>
								$(document).ready(function () {   
									$('ul.navbar-nav li:nth-child(1)').children().css('background','#dae39b');
								}); 
								
								function nowyear(){
									var productchar = document.getElementById("productchart");
									var text = "<canvas id='chart-orders2' class='chart-canvas'>";
									productchar.innerHTML=text;
									text = "<c:out value='${year}'/> 월별 매출 통계";
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
									text = "<c:out value='${year-1}'/> 월별 매출 통계";
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
									text = "<c:out value='${year-2}'/> 월별 매출 통계";
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

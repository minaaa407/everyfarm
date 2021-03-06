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

<title>Every Farm : 농부</title>
   <link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
                     

<style>
@media only screen 
    and (max-width: 760px), (min-device-width: 768px) 
    and (max-device-width: 1024px)  {
      .bodyH{
      margin-top:150px;
      }
   }
body{
	background: linear-gradient(#a6cc55 0, #e6d45e 100%) !important;
	}
.height {
height: 602px;
}
.center {
    justify-content: center;
}
.margin {
    margin-top: 50px;
    }
    .bodyH{
    height: 968px;
    display: flex;
    align-items: center;
    }
</style>
</head>

<body class="">
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
   <div class="bodyH">
      <div class="container-fluid" style="display: flex; justify-content: space-around;">
         <div class="row">
            <div class="col-xl-4 mb-5 mb-xl-0">
               <div class="card bg-gradient-default shadow height chartcenter" style="width: 400px; height: 550px;">
                  <!-- Chart -->
                  <div >
                     <canvas id="myChart" style="width:400px; height:400px; max-width:400px; margin-top: 50px;"></canvas>
                  </div>
               </div>
            </div>
         
            <div class="col-xl-8 ">
               <div class="card shadow height" style="height: 550px;">
                  <div class="card-header bg-transparent">
                     <div class="row align-items-center">
                        <div class="col">
                           <h6 class="text-uppercase text-muted ls-1 mb-1">EVERY FARM</h6>
                              <c:set var="today" value="<%=new java.util.Date()%>" />
                              <c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
                           <h2 id="productyeartext" class="mb-0"> <c:out value="${year}"/> 월별 매출 통계 </h2>
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
                     <div id = "productchart" class="chart ">
                        <canvas id="chart-orders2" class="chart-canvas margin" style="margin-top: 50px;"></canvas>
                     </div>
                  </div>
               </div>
                     
                  </div>
               </div>
            </div>
         </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <!-- 차트    -->
<script type="text/javascript">
var seedName = ${seedName};
var seedSum = ${seedSumTotal}; 
/* var xValues = ["Italy", "France", "Spain", "USA", "Argentina"]; */
/* var yValues = [55, 49, 44, 24, 15]; */
var barColors = [
  "#dda0dd",
  "#b0e0e6",
  "#800080",
  "#ff0000",
  "#bc8f8f",
  "#4169e1",
  "#8b4513",
  "#fa8072",
  "#f4a460",
  "#2e8b57",
  "#ffff5ee",
  "#6a5acd",
  "#708090",
  "#00ff7f",
  "#4682b4",
  "#d2b48c",
  "#008080"
];

new Chart("myChart", {
  type: "doughnut", /* doughnut */
  data: {
    labels: seedName,
    datasets: [{
      backgroundColor: barColors,
      data: seedSum
    }]
  },
  options: {
    title: {
      display: true,
      text: "이달의 판매량",
         fontSize: 20,
            fontColor: '#4e9525'
    }

  }
});
</script>
                     <!-- 차트 -->
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
                     
                        
 <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>




                              
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
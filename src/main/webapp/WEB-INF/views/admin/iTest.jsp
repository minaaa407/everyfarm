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
	<link href="/resources/admin/css/argon-dashboard.css?v=1.1.2"
	rel="stylesheet" />
<title>EVERY FARM | 관리자</title>
	<style>
    .chartD {
    background-color: white;
    box-shadow: 1px 1px 10px grey;
        display: flex;
    flex-direction: column;
    justify-content: center;
    }
    </style>
</head>

<body>
				<!-- Chart --><div class="pad chartD">
								<div class="card-header bg-transparent">
									<h6 class="text-uppercase text-muted ls-1 mb-1">EVERY FARM</h6>
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
									<h2 class="productyeartext" class="mb-0"><c:out value="${year}"/>&nbsp;월별 판매량</h2>
								<canvas id="myChart" class="chart-canvas" width="750" height="380"></canvas>
								</div>
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
    </div>
    <!-- Chart -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/dist/Chart.bundle.js"></script>
<script src="resources/dist/utils.js"></script>


<script>
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
          	url : "/iTest",
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
</body>
</html>

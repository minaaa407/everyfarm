<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="kr.co.everyfarm.product.ProductBean"%>
<%@page import="kr.co.everyfarm.user.MemberBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>EVERY FARM</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 아이콘링크 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" 
integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<link rel="stylesheet" href="resources/index/css/animate.css">


<link rel="stylesheet" href="resources/index/css/magnific-popup.css">

<link rel="stylesheet" href="resources/index/css/ionicons.min.css">

<link rel="stylesheet" href="resources/index/css/flaticon.css">
<link rel="stylesheet" href="resources/index/css/icomoon.css">
<link rel="stylesheet" href="resources/index/css/style.css">





<!-- Css Styles -->
<!-- Google Font -->



<link rel="stylesheet" href="resources/product/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/product/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/product/css/dd.css"
	type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
//script 전부 다 박살 에정. 방법 없다.
//여기아래부분 정말로 잘 보존해서 어떻게든 우려먹기는 안되겠네
//응용해서 처리해보자. 일단 그대로 가져가는건 현재 불가능하다. 코드 잘못짰네. 의존도 겁내 높다. ㅎㅎ
function productaccept(accept) {
			if(!(accept == 'Y' && ${not empty farmer}) ){
				var bean = {
					"p_No" : ${oneproduct.p_No},
					"p_Accept" : accept
				}
					$.ajax({
					type : "post", //요청 메소드 방식
					url : "/productaccept",
					data : bean,
					success : function(result) {//성공시 동작하는 파트
						
						var resultaccept = result;
						var resultext="";
						var resultdiv = document.getElementById("productaccept");
						
						if(result =='Y'){
							resultext += "승인처리상태 <input class='mybtn' style='width: 60px;' type='button' name='N' value='승인' onClick='productaccept(this.name)'/>"
						}else{
							resultext += "미승인처리상태 <input class='mybtn2' style='width: 60px;' type='button' name='Y' value='미승인' onClick='productaccept(this.name)'/>"
						}
					
						resultdiv.innerHTML = resultext;
						
						},
						error : function(a, b, c) {
							//통신 실패시 발생하는 함수(콜백)
							alert("a:" + a + "b:" + b + "c:" + c);
						}
					});
			}else{
				alert("승인권한이 없습니다.")
			}

}

function selectimg(name){

	document.getElementById('selectimg').src=name;
	
}

function basket(){
	
	document.getElementById('myHiddenForm').action="/productbasketchoice";
	document.myHiddenForm.submit();
}

function payment(){
	if($('table1').children()){
		document.getElementById('myHiddenForm').action="/PaymentInfo";
		document.myHiddenForm.submit();
	}else{
		alert("상품을 선택해주세요.");
	}
	
}




function selectproduct(){
	var product = $('#productname').text();//선택 작물 리스트 값 저장.
	var amout = document.getElementById('iniamout').value;//소비자 선택 값.
	var rowid = "product"+product;
	var pnum = "pnum"+product;
	var total = "total"+product;
	
	 var oneprice = ${oneproduct.p_Landprice} * amout;
	 var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 var cn1 = cn1 +'원';
	
	 if(!(document.getElementById(rowid))){
			var text="";	
				text += document.getElementById('table1').innerHTML
			
			    text += '<table id="'+rowid+'"style="width: 100%;">';
				text += '<tr><td>'+product+ '</td><td></td></tr>' ;
				text += '<tr><td><i class="fas fa-minus-circle" style="font-size:24px; vertical-align: middle;"></i>';
				text += '<input class="onlyNumber" type=text min=1  name=productamout value='+amout+' size=10>';
				text += '<i class="fas fa-plus-circle" style="font-size:24px; vertical-align: middle;"></i>';	
				text += '</td><td>'+cn1+'</td>';
				text += '<td><i class="fas fa-times" style="vertical-align: middle;"></i></td></tr></table>';
				document.getElementById('table1').innerHTML=text;
				var size = document.getElementsByName("productamout").length;
				var a1 = 0;
				
					for(var i = 0; i < size; i++){				
						a2 = document.getElementsByName("productamout")[i].value;
						a1 = parseInt(a2) + parseInt(a1);
					}
					
					var oneprice = (${oneproduct.p_Manpay} * a1);
					var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var cn1 = cn1 +'원';
					
					var totalprice = ((${oneproduct.p_Manpay} * a1)+ (${oneproduct.p_Landprice} * a1));
					var cn2 = totalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var cn2 = cn2 +'원';
					var totalproduct = (${oneproduct.p_Landprice} * a1);
					var c3 = totalproduct.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var c3 = c3 +'원';
					
					
					document.getElementById("totalproduct").innerHTML = c3;
					document.getElementById("totalmanpay").innerHTML = cn1;
					document.getElementById("total").innerHTML = cn2;
					document.getElementById("totaltable").style.display = "";
					//아래 값 전달하기.
					var b_Pno = ("b_Pno" + product);
					var b_Id = ("b_Id" + product);
					var b_Land = ("b_Land" + product);
					var b_Totalprice = ("b_Totalprice" + product);
					document.getElementById(b_Land).value= amout;
					document.getElementById(b_Totalprice).value= totalprice;
		
			
				
	 }else{
		 alert("동일 제품이 존재합니다. 수량을 조절해주십시요.")
	 }
		
				
				
			
	

	
	
		//if(!(document.getElementById(rowid))){
		//	var cartlisttableinnertext = document.getElementById("cartlisttable").innerText
			
			
		//}
		
	    
	  //  if(!(document.getElementById(rowid))){ // 중복 씨앗 없을 때
	    	
	    //	var cartlist = document.getElementById('cartlist');		
		//	var totalproduct = 0;
	    //	for (var i = 2; i < cartlist.rows.length; i++) {
	    //	      var userName = cartlist.rows[i].cells[2].innerText;
	    	      
	    //	      totalproduct = parseInt(totalproduct) + parseInt(userName);
	    //	}
	    //				totalproduct = parseInt(totalproduct) + parseInt(amout)
					    //const table = document.getElementById('cartlist');
					  //  const totalRowCnt = table.rows.length;
					   // const newRow = table.insertRow();
					   // newRow.id = rowid;
					    
					    
					    //const newCell1 = newRow.insertCell(0);//씨앗
					    //const newCell2 = newRow.insertCell(1);//한개 가격
					    //const newCell3 = newRow.insertCell(2);//땅 갯수
					    //const newCell4 = newRow.insertCell(3);//총 가격
					    //const newCell5 = newRow.insertCell(4);//삭제버튼
					   //newCell4.id=total;
					    //newCell1.innerText = product;
					  	//var product2="'"+product+"'";
					    //newCell2.innerText = ${oneproduct.p_Landprice };
					    //newCell3.innerHTML ='<input name = "' + product + '" type="button" onclick="count1(this.name)" value="-"/>' + 
					    //'&nbsp&nbsp&nbsp'+'<span value="'+amout+'"name="productprice" id ="'+ pnum+'">' + amout+'</span> &nbsp&nbsp&nbsp'+'<input name = "'+product +'"type="button" onclick="count2(this.name)" value="+"/>';
					    //newCell3.innerText = amout;
					    //newCell4.innerText = (${oneproduct.p_Landprice} * amout);
					    //newCell5.innerHTML = '<i class="fas fa-window-close"  onclick="deleteRow(this,'+product2+')" ></i>';
					   // newCell5.innerHTML = '<input name = ' + product + ' type="button" onclick="deleteRow(this,this.name)" value="삭제"/>';
						//var b_Pno = ("b_Pno" + product);
						//var b_Id = ("b_Id" + product);
						//var b_Land = ("b_Land" + product);
						//var b_Totalprice = ("b_Totalprice" + product);
					    //document.getElementById('b_Pno').value = "farmers";
						//document.getElementById('b_Id').value= "farmers";
						//document.getElementById(b_Id).value= uid;
						//document.getElementById(b_Land).value= amout;
						//document.getElementById(b_Totalprice).value= (${oneproduct.p_Landprice} * amout);
						//전체 수량 처리하기.
						//	var a1 = 0;
						//	var a2;
						//	var size = document.getElementsByName("productprice").length;
							//	for(var i = 0; i < size; i++){				
							//		a2 = document.getElementsByName("productprice")[i].innerText;
							//		a1 = parseInt(a2) + parseInt(a1);
							//	}
							//	document.getElementById("totalmanpay").innerText = "인건비"+(${oneproduct.p_Manpay} * a1);
							//	document.getElementById("total").innerText = "총 가격 "+((${oneproduct.p_Manpay} * a1)+ (${oneproduct.p_Landprice} * a1));

						
	    //}else{
	    //	alert("동일 제품이 존재합니다. 수량을 조절해주십시요.")
	   // }
	    

	
}

function count1(name)  {
	   
	  var total = "total"+name;
	  name = "pnum"+name;
	  const resultElement = document.getElementById(name);
	  let number = resultElement.innerText;
	  var b_Land = ("b_Land" + name);
	  var b_Totalprice = ("b_Totalprice" + name);
	
	  number = parseInt(number) - 1;
	  if(number>0){
		  resultElement.innerText = number;
		  document.getElementById(total).innerText = (number)*(${oneproduct.p_Landprice});
		 
		  document.getElementById(b_Land).value= number;
		  document.getElementById(b_Totalprice).value = (number)*(${oneproduct.p_Landprice});
	  }
	  
}

function count2(name)  {
	  var b_Land = ("b_Land" + name);
	  var b_Totalprice = ("b_Totalprice" + name);
	  var total = "total"+name;
	  name = "pnum"+name;
	  const resultElement = document.getElementById(name);
	  let number = resultElement.innerText;
	  number = parseInt(number) + 1;
	  if(number>0){
		  resultElement.innerText = number;
		  document.getElementById(total).innerText = (number) * (${oneproduct.p_Landprice});
		  document.getElementById(b_Land).value= number;
		  document.getElementById(b_Totalprice).value = (number) * (${oneproduct.p_Landprice});
	  }
}






function deleteRow(btndel,name){
	var b_Land = ("b_Land" + name);
	var b_Totalprice = ("b_Totalprice" + name);
	
	
    if (typeof(btndel) == "object") {
        $(btndel).closest("tr").remove();
        document.getElementById(b_Land).value= 0;
		document.getElementById(b_Totalprice).value = 0;
		const table = document.getElementById('cartlist');
	    const totalRowCnt = table.rows.length;
	   
	    var a1 = 0;
		var a2;
		var size = document.getElementsByName("productprice").length;
			
		if(totalRowCnt<=2){
			$('#cartlisttable').css("display","none");
			
			
			document.getElementById("totalproduct").innerText = "";
			document.getElementById("totalmanpay").innerText = "";
			document.getElementById("total").innerText = "";
		}else{
			for(var i = 0; i < size; i++){				
				a2 = document.getElementsByName("productprice")[i].innerText;
				a1 = parseInt(a2) + parseInt(a1);
			}
			var oneprice = (${oneproduct.p_Manpay} * a1);
			var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			alert("11");
			var cn1 = cn1 +'원';
			var totalproduct = (${oneproduct.p_Landprice} * a1);
			var c3 = totalproduct.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			var c3 = c3 +'원';
			
			
			document.getElementById("totalproduct").innerHTML = c3;
			
			document.getElementById("totalmanpay").innerText = cn1;
			document.getElementById("total").innerText = ((${oneproduct.p_Manpay} * a1)+ (${oneproduct.p_Landprice} * a1));
			document.getElementById("totaltable").style.display = "";
			
		}
		
		
    } else {
        return false;
    }
    
}

function check(){
	document.getElementById("myhiddenform");
	document.getElementById("myhiddenform").submit();
	document.myhiddenform.submit();
	
}


function listChange(){
	$('#iniamout').val('1');
}


</script>
<style>

.product__details__pic__item--large {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 340px;
}

.product__details__tab__desc {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: auto;
}

.mybtn {
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #00BC4B;
	color: #fff;
	margin-top: 20px;
	border: solid 0.5px #212529;
	transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover {
	background: #4CAF00;
	color: #fff;
	text-decoration: none;
}

.mybtn2 {
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #FF0000;
	color: #fff;
	margin-top: 20px;
	border: solid 0.5px #212529;
	transition: all 0.5s ease-in-out 0s;
}
.mybtn2:hover {
	background: #C40000;
	color: #fff;
	text-decoration: none;
}


.fa, .fab, .fad, .fal, .far, .fas {
	cursor: pointer;
	
}

i.fa-minus-circle:hover{
	color : #119300;
}

i.fa-minus-circle:active{
	color : #21AF23;
}

i.fa-minus-circle{
	color : green;
}


i.fa-plus-circle:hover{
	color : #119300;
}

i.fa-plus-circle:active{
	color : #21AF23;
}

i.fa-plus-circle{
	color : green;
}

.owl-item img{

height:60px;

}


a.sidenav{
	color: #FFFFFF;
	font-size: 14px;
    padding-left: 20px;
    padding-right: 20px;
    text-transform: uppercase;
}

a.sidenav:hover, focus {
    color: yellow;
}

.owl-carousel .owl-item img{
	width:115%;
}

<!--메뉴바 -->


#header{width: 100%; height:600px; line-height: 600px; font-size: 60px; background:red; transition: background 0.6s; text-align: center;}
#lnb.fixed{position: fixed; left: 0; top: 0; width: 100%; z-index:99;}
#lnb ul{font-size:0; line-height: 0; background: #4e9525;}
#lnb li{display: inline-block; vertical-align: top; padding: 20px 0; font-size: 25px; text-align: center;}
#container{width:100%; height:1500px; line-height: 1500px; font-size: 60px; background: blue; text-align: center;}




</style>


<!-- select 선택 문 -->



<style>
.select  a {
	display: block;
	border: 1px solid #ccc;
	padding: 0 8px;
}

.select  a:after, .select  ul>li:first-child:after {
	display: block;
	float: right;
}

.select  a:after {
	content: '▼';
}

.select  ul {
	position: absolute;
	width: 100%;
	top: 0px;
	background: #fff;
	display: none;
}

.select  ul>li {
	cursor: pointer;
	padding: 0 8px;
	border: 1px solid #ccc;
}

.select  ul>li:first-child:after {
	content: '▲';
}

ul {
	list-style: none;
	padding-left: 0px;
}

td .mybtn{
	width: 100pt;
}

@media screen and (max-width: 768px) {
	div.select{
	width: 250px;
	}
	.onlyNumber{
	  width: 50px;
	}
	td{
	font-size: 90%
	}
	td .mybtn{
	width: 80pt;
	}

}


</style>

<script>
			$(document).ready(function () {
				  $("div.select > a").click(function () {
					  $(this).next("ul").toggle();
					  $(this).parent("div.select").css("overflow","auto");
					  $(this).parent("div.select").css("height","400px");
					  $(this).parent("div.select").css("position","absolute");
					  $(this).parent("div.select").css("z-index","999");
					  $("#area").css("display","block");
					    return false;
				  });
		  
				$("div.select > ul > li").click(function() {
					  $(this).parent().hide().parent("div.select").children("a").children("img").attr("src",$(this).children("img").attr("src"));
					  $(this).parent().hide().parent("div.select").children("a").children("span").text($(this).text());
					  $(this).parent().hide().parent("div.select").css("overflow","");
					  $(this).parent().hide().parent("div.select").css("height","");
					  $(this).parent().hide().parent("div.select").css("position","relative");
					  $(this).parent().hide().parent("div.select").css("z-index","9");
					  $("#area").css("display","none");
					    // alert( $(this).children("img").attr("src")   );
					    //$(this).parent().hide().parent("div.select").children("a").text($(this).text());
					    //$("#my_image").attr("src","second.jpg");
					    //$(this).prependTo($(this).parent());
					    //overflow: auto; height: 400px;
				});
			  $(document).on("keyup","td > .onlyNumber",function (event){//테이블 안에 input 값 처리하기.
			        var str;
			        if(event.keyCode != 8){
			            if (!(event.keyCode >=37 && event.keyCode<=40)) {
			                var inputVal = $(this).val();
			                str = inputVal.replace(/[^-0-9]/gi,'');
			                if((str.indexOf("-")>=0)){ //중간에 -가 있다면 replace
			                    	str = str.replace(/[-]/gi,'');
			                }
			                if(str.indexOf("0")==0){
			                	str="1";
			                }
			                if(str==""){
			                	str="1";
			                }
			                $(this).val(str);
			            }                    
			        }else if(event.keyCode == 8){
			        	var inputVal = $(this).val();
			        	if(inputVal ==""){
			        		str="1";
			        		$(this).val(str);
			        	}
			        }
			        var number = str;
			        var oneprice = ${oneproduct.p_Landprice} * number;
					var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var cn1 = cn1 +'원';
					$(this).parent().next().html(cn1);//수정위치지워라.
					
					
					  var size = document.getElementsByName("productamout").length;
					  var a1 = "0";
					  for(var i = 0; i < size; i++){				
							a2 = document.getElementsByName("productamout")[i].value;
							a1 = parseInt(a2) + parseInt(a1);
						}
					  
					    oneprice = (${oneproduct.p_Manpay} * a1);
						 cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						 cn1 = cn1 +'원';
						var totalprice = ((${oneproduct.p_Manpay} * a1)+ (${oneproduct.p_Landprice} * a1));
						 cn2 = totalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						 cn2 = cn2 +'원';
					
						if(size>0){
							var totalproduct = (${oneproduct.p_Landprice} * a1);
							var c3 = totalproduct.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							var c3 = c3 +'원';
							document.getElementById("totalproduct").innerHTML = c3;
							document.getElementById("totalmanpay").innerHTML = cn1;
							document.getElementById("total").innerHTML = cn2;
							document.getElementById("totaltable").style.display = "";
							  
						}
					
					
					
					
					
					
			    });
			   
			   $(document).on("click","div > input",function (){//테이블 안에 input 값 처리하기.
				      var sign = $(this).val();
					  var number = $(this).siblings('.onlyNumber').val();
					  
						  if( (sign=="+")&&(number>0) ){
								number = parseInt(number) + 1;
							}else if((sign=='-')&&(number>1)){
								number = parseInt(number) - 1;
							}
					 	  
					  $(this).siblings('.onlyNumber').val(number);
				  });
		   
			   $(document).on("click",'.fa-plus-circle',function () {//테이블 안에 input 값 처리하기.
				   var sign = $(this).val();
					  var number = $(this).siblings('.onlyNumber').val();
					  number = parseInt(number) + 1;
					  		
					  $(this).siblings('.onlyNumber').val(number);
					  $(this).siblings('.onlyNumber').attr('value',number);
					  var oneprice = ${oneproduct.p_Landprice} * number;
					  var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					  var cn1 = cn1 +'원';
					  $(this).parent().next().html(cn1);
					  
					  //하단 총 가격 인건비 교체.
					  var size = document.getElementsByName("productamout").length;
					  var a1 = "0";
					  for(var i = 0; i < size; i++){				
							a2 = document.getElementsByName("productamout")[i].value;
							a1 = parseInt(a2) + parseInt(a1);
						}
					  
					    oneprice = (${oneproduct.p_Manpay} * a1);
						 cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						 cn1 = cn1 +'원';
						var totalprice = ((${oneproduct.p_Manpay} * a1)+ (${oneproduct.p_Landprice} * a1));
						 cn2 = totalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						 cn2 = cn2 +'원';
					
						if(size>0){
							var totalproduct = (${oneproduct.p_Landprice} * a1);
							var c3 = totalproduct.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							var c3 = c3 +'원';
							
							
							document.getElementById("totalproduct").innerHTML = c3;
							document.getElementById("totalmanpay").innerHTML = cn1;
							document.getElementById("total").innerHTML = cn2;
							document.getElementById("totaltable").style.display = "";
							  
						}
						
						
				  });
			  
		    	$(document).on("click",'.fa-minus-circle',function () {
				  var sign = $(this).val();
				  var number = $(this).siblings('.onlyNumber').val();
				   
				  if((number>1)){
						number = parseInt(number) - 1;
					}
				  $(this).siblings('.onlyNumber').attr('value',number);
				  $(this).siblings('.onlyNumber').val(number);
				  var oneprice = ${oneproduct.p_Landprice} * number;
				  var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				  var cn1 = cn1 +'원';
				  $(this).parent().next().html(cn1);
				  
				  var size = document.getElementsByName("productamout").length;
				  var a1 = "0";
				  for(var i = 0; i < size; i++){				
						a2 = document.getElementsByName("productamout")[i].value;
						a1 = parseInt(a2) + parseInt(a1);
					}
				 
				    oneprice = (${oneproduct.p_Manpay} * a1);
					 cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					 cn1 = cn1 +'원';
					var totalprice = ((${oneproduct.p_Manpay} * a1)+ (${oneproduct.p_Landprice} * a1));
					 cn2 = totalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					 cn2 = cn2 +'원';
				
					if(size>0){
						var totalproduct = (${oneproduct.p_Landprice} * a1);
						var c3 = totalproduct.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						var c3 = c3 +'원';
						
						
						document.getElementById("totalproduct").innerHTML = c3;
						document.getElementById("totalmanpay").innerHTML = cn1;
						document.getElementById("total").innerHTML = cn2;
						document.getElementById("totaltable").style.display = "";
					}
				  
				  
			});
		    	
		    	
		    	$(document).on("click",'.fa-times',function () {
					  $(this).parent().parent().parent().parent().remove();
					  var size = document.getElementsByName("productamout").length;
					  var a1 = "0";
					  for(var i = 0; i < size; i++){				
							a2 = document.getElementsByName("productamout")[i].value;
							a1 = parseInt(a2) + parseInt(a1);
						}
					
					   var oneprice = (${oneproduct.p_Manpay} * a1);
						var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						var cn1 = cn1 +'원';
						var totalprice = ((${oneproduct.p_Manpay} * a1)+ (${oneproduct.p_Landprice} * a1));
						var cn2 = totalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						var cn2 = cn2 +'원';
						
						if(size>0){
							var totalproduct = (${oneproduct.p_Landprice} * a1);
							var c3 = totalproduct.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							var c3 = c3 +'원';
							
							
							document.getElementById("totalproduct").innerHTML = c3;
							document.getElementById("totalmanpay").innerHTML = cn1;
							document.getElementById("total").innerHTML = cn2;
							document.getElementById("totaltable").style.display = "";
						}else{
							document.getElementById("totalmanpay").innerHTML = "";
							document.getElementById("total").innerHTML = "";
							document.getElementById("totaltable").style.display = "none";
						}
				});
	});
			
			
	//메뉴바 중간
	$(function() {
        var lnb = $("#lnb").offset().top;
        $(window).scroll(function() {
          var window = $(this).scrollTop();
          
          if(lnb <= window) {
            $("#lnb").addClass("fixed");
          } else {
            $("#lnb").removeClass("fixed");
          }
        })
      });


			
			
	</script>

</head>
<body>


	<div class="container pt-5 pb-4">
		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">
					<div class="col-md-6 text-center">
						<a class="navbar-brand" href="index.jsp">EVERY <span>FARM</span></a>
					</div>
					<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
						<form action="#" class="searchform order-lg-last">
							<div class="form-group d-flex">
								<input type="text" class="form-control pl-3"
									placeholder="Search">
								<button type="submit" placeholder="" class="form-control search">
									<span class="fa fa-search"></span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container-fluid">

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav m-auto">
					<li class="nav-item active"><a href="index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">농장</a></li>
					<li class="nav-item"><a href="services.html" class="nav-link">농장
							등록</a></li>
					<li class="nav-item"><a href="gallery.html" class="nav-link">REVIEW</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Q&A</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<!-- 여기서부터 내용 -->

	<!-- Product Details Section Begin -->
	<br>
	<br>

	<!-- 씨앗 초기화 등 초기 설정. -->
	<c:set var="seedlist"
		value="감자,고구마,콩,배추,상추,수박,오이,토마토,호박,고추,마늘,파,양파,무,당근" />

	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<!--승인 여부 해당 파트 관리자만 보이게 만들어야됨. 차후 수정 예정.-->
				
					<c:if test="${not empty farmer || not empty admin}">


						<div align="right" class="col-lg-12" id="productupdate">
							<input type="button" value="수정" onclick="p" />
						</div>
						
						<div align="right" class="col-lg-12" id="productaccept">
							<c:choose>
								<c:when test="${oneproduct.p_Accept eq 'Y'}">
									승인처리상태 <input style="width: 60px;" class='mybtn' name='N' type="button" value="승인"
										onclick="productaccept('N')" />
								</c:when>
								<c:otherwise>
								미승인처리상태  <input style="width: 60px;" class='mybtn2' name='Y' type="button" value="미승인"
										onclick="productaccept('Y')" />
		
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
				
				<div class="col-lg-6 col-md-6" id="maindiv">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large" id="selectimg"
								src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Img}"
								alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
							<img
								data-imgbigurl="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg1}"
								src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg1}"
								alt=""
								name="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg1}"
								style="cursor: pointer" onclick="selectimg(this.name)"> 
							<img
								data-imgbigurl="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg2}"
								src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg2}"
								alt=""
								name="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg2}"
								style="cursor: pointer" onclick="selectimg(this.name)"> 
							<img
								data-imgbigurl="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg3}"
								src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg3}"
								alt=""
								name="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg3}"
								style="cursor: pointer" onclick="selectimg(this.name)"> 
							<img
								data-imgbigurl="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg4}"
								src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg4}"
								alt=""
								name="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Subimg4}"
								style="cursor: pointer" onclick="selectimg(this.name)"> 
							<img
								data-imgbigurl="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Img}"
								src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Img}"
								alt=""
								name="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Img}"
								style="cursor: pointer" onclick="selectimg(this.name)">
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h2>${oneproduct.p_Title}</h2>
						<hr>
						<h3>평점 : ${f_rate}</h3>
						
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
						</div>
						
						<div>
							<h4>
								1평 작물가 :
								<fmt:formatNumber value="${oneproduct.p_Landprice }"
									pattern="#,###" />
								원
							</h4>
						</div>
						<div>
							<h4>
								1평 노동비 :
								<fmt:formatNumber value="${oneproduct.p_Manpay }"
									pattern="#,###" />
								원
							</h4>
						</div>
						<hr>
						<p>${oneproduct.p_Content}</p>

						<div>

							<!-- 상품 리스트 선택 -->

							<div class="select"
								style="position: relative; line-height: 35px; width: 250px">
								<a href="#" id="aaa" onClick="test()"> <img height="50px"
									width="50px" src="/resources/product/img/감자.png"><span
									id="productname">감자</span></a>

								<ul>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/감자.png" />감자</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/고구마.png" />고구마</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/콩.png" />콩</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/배추.png" />배추</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/상추.png" />상추</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/수박.png" />수박</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/오이.png" />오이</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/토마토.png" />토마토</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/호박.png" />호박</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/고추.png" />고추</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/마늘.png" />마늘</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/파.png" />파</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/양파.png" />양파</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/무.png" />무</li>
									<li onClick="listChange()"><img height="50px" width="50px"
										src="/resources/product/img/당근.png" />당근</li>
								</ul>

							</div>
						</div>
						<br>

						<form>

							<i class="fas fa-minus-circle" style='font-size:24px; vertical-align: middle;'>
							</i><input class="onlyNumber" id="iniamout" type=text min=1  name=amount value=1 size=10><i class="fas fa-plus-circle" style='font-size:24px; vertical-align: middle;'></i>
							<input style="width: 50px;" type=button class="mybtn" value="선택" onClick="selectproduct()">
						</form>

						<ol id="productbasket" style="display:none;">


						</ol>

						<br/><br/>
						<div id="area" class="col-lg-12" style="height: 52px; display: none"></div>
								

						
							<div id="table1" class="table1">
							</div>
						<br>
					    <table id="totaltable" style="width: 100%;display: none; table-layout:fixed;">
					    <tr style="border: 0.1px;border-top: solid #9e9c9c;">
						    <td style="width:30%; text-align: left;font-size: 16px;">
							<span>구입작물</span>
							</td>
							<td style="width:70%;text-align:right">
							<span style="font-size: 16px;" id="totalproduct"></span>
							</td>
						</tr>
					    
					    <tr>
						    <td style="text-align: left;font-size: 16px;">
							<span>인건비</span>
							</td>
							<td style="text-align:right">
							<span style=" font-size: 16px;" id="totalmanpay"></span>
							</td>
						</tr>
						<tr style="border: 0.1px;border-top: solid #9e9c9c;">
							<td style="text-align: left;font-size: 24px;">
							<span>총 가격</span>
							</td>
							<td style="text-align:right">
							<span style="font-size: 24px;" id="total"></span>
							</td>
						</tr>
						 <tr>
					    <td>
						<button type="button" class="mybtn"
							style=" cursor: pointer;" onClick="basket()"
							value="장바구니">장바구니</button>
						</td>
						<td style="text-align:right">
						<button type="button" class="mybtn"
							style=" cursor: pointer;" type="button"
							onClick="payment()" value="결제">결제</button>
						</td>
						</tr>	
						</table>
						<!-- 
                    <input type="button" onClick="document.myHiddenForm.submit()" value="장바구니"/>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    <input type="button" onClick="document.myHiddenForm2.submit()" value="결제"/>
                     -->
					</div>
					<div id="lnbposition"></div>
					
					<form:form commandName="basketbean" id="myHiddenForm"
							name="myHiddenForm" action="/productbasketchoice" method="post">
							<c:forTokens var="seed" items="${seedlist}" delims=","
								varStatus="num">
								<input type="hidden" id="b_Id${seed}"
									name="basketbeanList[${num.index}].b_Id" value="${mid}">
								<input type="hidden" id="b_Pno${seed}"
									name="basketbeanList[${num.index}].b_Pno"
									value="${oneproduct.p_No}">
								<input type="hidden" id="b_Land${seed}"
									name="basketbeanList[${num.index}].b_Land" value="0">
								<input type="hidden" id="b_Seed${seed}"
									name="basketbeanList[${num.index}].b_Seed" value="${seed}">
								<input type="hidden" id="b_Totalprice${seed}"
									name="basketbeanList[${num.index}].b_Totalprice" value="0">
								<input type="hidden" id="p_Img${seed}"
									name="basketbeanList[${num.index}].p_Img"
									value="${oneproduct.p_Img}">
								<input type="hidden" id="p_Title${seed}"
									name="basketbeanList[${num.index}].p_Title"
									value="${oneproduct.p_Title}">
								<input type="hidden" id="p_Manpay${seed}"
									name="basketbeanList[${num.index}].p_Manpay"
									value="${oneproduct.p_Manpay}">
								<input type="hidden" id="p_Landprice${seed}"
									name="basketbeanList[${num.index}].p_Landprice"
									value="${oneproduct.p_Landprice}">
							</c:forTokens>

						</form:form>
				</div>
		</div>
		
	</div>
				<!-- 메뉴바?? -->
				<div id="lnb" style="text-align: center;">
				   <ul>
				     <li><a href="#lnbposition" class="sidenav">설명2</a></li>
				     <li><a href="#" class="sidenav">덧글</a></li>
				   </ul>
				 </div>
				 <br><br>
		<div class="container">
			<div class="row">				 
				<div class="col-lg-12">
					<div class="product__details__tab">
						
						
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc"
									style="text-align: center;">

									<c:if test="${not empty oneproduct.p_Imgdetail1}">
										<img style="max-width: 100%;"
											src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Imgdetail1}"
											alt="${oneproduct.p_Imgdetail1}"
											title="${oneproduct.p_Imgdetail1}">
										<br>
									</c:if>

									<c:if test="${not empty oneproduct.p_Imgdetail2}">
										<img style="max-width: 100%;"
											src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Imgdetail2}"
											alt="${oneproduct.p_Imgdetail1}"
											title="${oneproduct.p_Imgdetail1}">
										<br>
									</c:if>

									<c:if test="${not empty oneproduct.p_Imgdetail3}">
										<img style="max-width: 100%;"
											src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Imgdetail3}"
											alt="${oneproduct.p_Imgdetail1}"
											title="${oneproduct.p_Imgdetail1}">
										<br>
									</c:if>

									<c:if test="${not empty oneproduct.p_Imgdetail4}">
										<img style="max-width: 100%;"
											src="resources/upload/product/${oneproduct.p_No}/${oneproduct.p_Imgdetail4}"
											alt="${oneproduct.p_Imgdetail1}"
											title="${oneproduct.p_Imgdetail1}">
										<br>
									</c:if>


								</div>
							</div>
							
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">

									<h6>댓 글</h6>
									<hr>
									<form:form commandName="productQna" action="/productqnainsert"
										method="post">
										<table>
											<tr>
												<td colspan="1" style="width: 20%;"><label>작성자</label></td>
												<td colspan="3"><input type="text"
													style="text-align: left;" name="p_Id"
													placeholder="* 이름을 입력하세요." maxlength="50" required
													></td>
											</tr>
											<tr>
												<td colspan="1"><label>댓글 내용</label></td>
												<td><textarea rows="2" cols="150" class="form-control"
														name="p_Content" placeholder="* 내용을 입력하세요." required></textarea></td>
											</tr>
											<tr>
											<td><input type="submit" class="btn btn-dark" value="댓글 작성">&nbsp;&nbsp;</td>
											</tr>
										</table>
									</form:form>
								</div>
								<hr>
								<br>
								<c:forEach var="c" items="${productQnalist}">
									<table>

										<td class="content">${c.c_Nd}</td>
										<td class="content">${c.c_Id}</td>
										<td class="content">${c.c_Title}</td>
										<td class="content">${c.c_Date}</td>
									</table>

								</c:forEach>

								<section id="emptyArea">등록된 댓글이 없습니다.</section>

							</div>
						</div>
					
				</div>
				
			</div>
		</div>
		
	</section>


	<!-- footer -->


	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4">
						<h2 class="logo">
							<a href="#">EVERY <span>FARM</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Services</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Garden Care</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Lawn mowing</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Lawn Care</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>Gutter Cleaning</a></li>
							<li><a href="#" class="py-1 d-block"><span
									class="ion-ios-arrow-forward mr-3"></span>New Lawn Installation</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Contact information</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Business Hours</h2>
						<div class="opening-hours">
							<h4>Opening Days:</h4>
							<p class="pl-3">
								<span>Monday â Friday : 9am to 20 pm</span> <span>Saturday
									: 9am to 17 pm</span>
							</p>
							<h4>Vacations:</h4>
							<p class="pl-3">
								<span>All Sunday Days</span> <span>All Official Holidays</span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>







	<script src="resources/index/js/jquery.min.js"></script>
	<script src="resources/index/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/index/js/popper.min.js"></script>
	<script src="resources/index/js/bootstrap.min.js"></script>
	<script src="resources/index/js/jquery.easing.1.3.js"></script>
	<script src="resources/index/js/jquery.waypoints.min.js"></script>
	<script src="resources/index/js/jquery.stellar.min.js"></script>
	<script src="resources/index/js/owl.carousel.min.js"></script>
	<script src="resources/index/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/index/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/index/js/google-map.js"></script>
	<script src="resources/index/js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>


	<!-- Js Plugins 상품 추가 -->
	<script src="resources/product/js/jquery-3.3.1.min.js"></script>
	<script src="resources/product/js/bootstrap.min.js"></script>

	<script src="resources/product/js/jquery-ui.min.js"></script>
	<script src="resources/product/js/jquery.slicknav.js"></script>
	<script src="resources/product/js/mixitup.min.js"></script>
	<script src="resources/product/js/owl.carousel.min.js"></script>
	<script src="resources/product/js/main.js"></script>
	<script src="resources/product/js/jquery.dd.min.js"></script>



</body>
</html>
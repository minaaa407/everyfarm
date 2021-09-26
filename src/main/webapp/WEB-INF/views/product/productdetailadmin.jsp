<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="kr.co.everyfarm.product.ProductBean"%>
<%@page import="kr.co.everyfarm.user.MemberBean"%>
<%@page import="kr.co.everyfarm.farmer.FarmerBean"%>
<%@page import="kr.co.everyfarm.admin.AdminBean"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>EVERY FARM</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" type="image/x-icon" href="/resources/editor/connn.ico" />
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

var nowpage= "1";
var lnb = $("#lnb").offset().top;
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


//아래 댓글임

function qnainsert(page){
	var uid = '<%=(MemberBean)session.getAttribute("member")%>';
	var fid = '<%=(FarmerBean)session.getAttribute("farmer")%>';
	var aid = '<%=(AdminBean)session.getAttribute("admin")%>';
	if((uid == "null") &&(fid == "null")&&(aid == "null")){
		alert("로그인 후 댓글을 달 수 있습니다.");
		
	}else{
		var content = document.getElementById("c_Content").value;
		var bean = {
					"c_No" : ${p_No },
					"c_Content" : content,
					"page" : page
					}
		var urlpath = "/productdetailinsertqna";
		document.getElementById("c_Content").value="";
		ajax(urlpath,bean);
	}
}

function pagebutton(pagenumber){
	nowpage = pagenumber;
	var bean = {
				"c_No" : ${p_No},
				"page" : pagenumber
				}
	var urlpath = "/productdetailpaging";
	ajax(urlpath,bean);
}

function qnaupdateexit(){
	
	var bean = {
				"c_No" : ${p_No},
				"page" : nowpage
				}
	var urlpath = "/productdetailpaging";
	ajax(urlpath,bean);
	
	
}

function qnaupdate(c_seq){
	
	var content = document.getElementById("c_Contentupdate").value;
	var bean = {
			"c_Seq": c_seq,
			"c_No" : ${p_No},
			"c_Content" : content,
			"page" : nowpage
			}
	var urlpath = "/productdetailqnaupdate";
	ajax(urlpath,bean);
	
}


function qnadeletebutton(c_seq){
	var content = "삭제된 댓글입니다.";
	var c_Id = "삭제";
	var bean = {
			"c_Seq": c_seq,
			"c_Id" : c_Id,
			"c_No" : ${p_No},
			"c_Content" : content,
			"page" : nowpage
			}
	var urlpath = "/productdetailqnadelete";
	ajax(urlpath,bean);
	
}


function subqnainsert(number){
	var content = document.getElementById("c_Content2").value;
	var bean = {
			"c_No" : ${p_No},
			"page" : nowpage,
			"c_Content" : content,
			"c_Seq": number
			}
	
	var urlpath = "/productdetailsubqnainsert";
	ajax(urlpath,bean);
	
	
}


function oneqna(qnaid){
	var number = 1;
	if(qnaid.length > 0 ){
		number = qnaid.attr('name');
	}
	
	var table =$("#qnaupdateexit").parent().parent().parent().parent();
	var bean = {
			"c_No" : ${p_No},
			"page" : nowpage,
			"c_Seq": number
			}
	var urlpath="/productdetailoneqna"
		$.ajax({
			type : "post", //요청 메소드 방식
			url : urlpath,
			data : bean,
				success : function(result) {//성공시 동작하는 파트
						var onelist = result.onelist;		
						var a = "";
							
								a +="<tr>";
								if(onelist.c_Subno > 0){
									a +="<td style='padding-left: 20px;'>";
									a +="<span style='font-size:20px'>└</span>"+onelist.c_Content+"<br><span style='font-size:8px'>"
									+onelist.c_Date+" "+onelist.c_Id+"</span></td>";
								}else{
									a +="<td style=''>"+onelist.c_Content +"<br><span style='font-size:8px'>"
									+onelist.c_Date+" "+onelist.c_Id+"</span></td>";
									
								}
								a +="</tr><tr><td>";
								if( ((onelist.c_Subno==0)&&(${(not empty farmer || not empty admin)}))&&onelist.c_Id !='삭제' ){
									a +="<input name ='"+onelist.c_Seq+"' class='qnasubbutton' type='button' value='답글' onclick='qnasubbutton(this.name)' />";
								}
														
								//뒤로가기 방지&& ${member.m_Id} == qnalist[i].c_Id
								if( ( ${(not empty farmer || not empty admin)} ) && (onelist.c_Id !='삭제')||('${member.m_Id}'==onelist.c_Id)  ){
									var seq= onelist.c_Seq;
									//a+="<input type='button' value='수정' onclick='updatebutton("+seq+")'/>"
									//a+="&nbsp;&nbsp;<input type='button' value='삭제' onclick='qnadeletebutton("+seq+")'/>";
									a+="<input type='button' class='updatebutton' name='"+seq+"' value='수정' onclick='updatebutton(this.name)'/>";
									a+="&nbsp;&nbsp;<input type='button' class='qnadeletebutton' name='"+seq+"' value='삭제' onclick='qnadeletebutton(this.name)'/>";
								}
								a+="</td></tr>";
							
							table.html(a);

				
				},
				error : function(a, b, c) {
					//통신 실패시 발생하는 함수(콜백)
					alert("a:" + a + "b:" + b + "c:" + c);
				}
				
				
			});
	
}

	
function ajax(urlpath,bean){
	
	$.ajax({
		type : "post", //요청 메소드 방식
		url : urlpath,
		data : bean,
		success : function(result) {//성공시 동작하는 파트
				var qnalist = result.qnalist;
				var page = result.pagebeen;
				var pagesystem = document.getElementById("pagesystem");
				var a = "";
					for(var i =0; i < qnalist.length; i++){
						a +="<table style='width:100%'><tr>";
						if(qnalist[i].c_Subno > 0){
							a +="<td style='padding-left: 20px;'>";
							a +="<span style='font-size:20px'>└</span>"+qnalist[i].c_Content+"<br><span style='font-size:8px'>"
							+qnalist[i].c_Date+" "+qnalist[i].c_Id+"</span></td>";
						}else{
							a +="<td style=''>"+qnalist[i].c_Content +"<br><span style='font-size:8px'>"
							+qnalist[i].c_Date+" "+qnalist[i].c_Id+"</span></td>";
						}
						
						a +="</tr><tr><td>";
						
						if( ((qnalist[i].c_Subno==0)&&(${(not empty farmer || not empty admin)}))&&qnalist[i].c_Id !='삭제' ){
							a +="<input name ='"+qnalist[i].c_Seq+"' class='qnasubbutton' type='button' value='답글' onclick='qnasubbutton('"+qnalist[i].c_Seq+"')' />";
						}
						
						var qid = qnalist[i].c_Id;
					
				
						//뒤로가기 방지&& ${member.m_Id} == qnalist[i].c_Id(not empty farmer || not empty admin ||(not empty member && member.m_Id == q.c_Id))
						if(  (${(not empty farmer || not empty admin) && qnalist[i].c_Id !='삭제' })|| ( '${member.m_Id}'==qid )){
							var seq= qnalist[i].c_Seq;
							//a+="<input type='button' value='수정' onclick='updatebutton("+seq+")'/>"
							//a+="&nbsp;&nbsp;<input type='button' value='삭제' onclick='qnadeletebutton("+seq+")'/>";
							a+="<input type='button' class='updatebutton' name='"+seq+"' value='수정' onclick='updatebutton(this.name)'/>";
							a+="&nbsp;&nbsp;<input type='button' class='qnadeletebutton' name='"+seq+"' value='삭제' onclick='qnadeletebutton(this.name)'/>";
						}
						//if( ( ${(not empty farmer || not empty admin)} || ( ${not empty member &&(member.m_Id == qnalist[i].c_Id) }  ) ) && qnalist[i].c_Id !='삭제' ){
						a+="</td></tr></table><div><hr/></div>";
					}
					document.getElementById("qnatalbe").innerHTML=a;
					
					var b="";
					if(page.pro == true){//페이징 처리 부분
						b += "<a id = '"+page.pagestart+"-1 ' style='cursor:pointer' onclick= 'pagebutton("+page.pagestart+" -1 )' >이전 </a>";
					}
					var i = page.pagestart;
					for(i; i < page.pageend+1; i++){
						b += "<a id = 'page"+i+"' style='cursor:pointer' onclick= 'pagebutton("+i+")' >"+i+"</a>";;
					}
					if(page.post == true){
						b += "<a id = '"+page.pageend+"+1 ' style='cursor:pointer' onclick= 'pagebutton("+page.pageend+" +1 )' >다음 </a>";
					}
					pagesystem.innerHTML = b;
			
			},
			error : function(a, b, c) {
				//통신 실패시 발생하는 함수(콜백)
				alert("a:" + a + "b:" + b + "c:" + c);
			}
		});
	
}	
	
	
	



</script>
<style>

.product__pagination a, .blog__pagination a {
    display: inline-block;
    width: 30px;
    height: 30px;
    border: 1px solid #b2b2b2;
    font-size: 14px;
    color: #b2b2b2;
    font-weight: 700;
    line-height: 28px;
    text-align: center;
    margin-right: 16px;
    -webkit-transition: all, 0.3s;
    -moz-transition: all, 0.3s;
    -ms-transition: all, 0.3s;
    -o-transition: all, 0.3s;
    transition: all, 0.3s;
}
.product__pagination, .blog__pagination {
    padding-top: 10px;
}

.product__pagination a:hover, .blog__pagination a:hover {
    background: #7fad39;
    border-color: #7fad39;
    color: #ffffff;
}



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

.qnasubbutton, .updatebutton, .qnadeletebutton,#qnaupdate,#qnaupdateexit{
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #00BC4B;
	color: #fff;
	margin-top: 20px;
	border: solid 0.5px #212529;
	transition: all 0.5s ease-in-out 0s;
	width: 60px
}
.qnasubbutton:hover, .updatebutton:hover, .qnadeletebutton:hover #qnaupdate:hover, #qnaupdateexit:hover{
	background: #4CAF00;
	color: #fff;
	text-decoration: none;
	width: 60px
}

#qnaupdate,#qnaupdateexit{
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #00BC4B;
	color: #fff;
	margin-top: 20px;
	border: solid 0.5px #212529;
	transition: all 0.5s ease-in-out 0s;
	width: 100px
}
#qnaupdate:hover, #qnaupdateexit:hover{
	background: #4CAF00;
	color: #fff;
	text-decoration: none;
	width: 100px
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

.onlyNumber{
  width: 40px;
  text-align : center;
}
}

@media screen and (max-width: 768px) {
	div.select{
	width: 250px;
	}
	.onlyNumber{
	  width: 40px;
	  text-align : center;
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
				lnb = $("#lnb").offset().top;
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
				
				$("#selectproduct").click(function() {
				
				
					var product = $('#productname').text();//선택 작물 리스트 값 저장.
					var amout = document.getElementById('iniamout').value;//소비자 선택 값.
					var rowid = "product"+product;
					var pnum = "pnum"+product;
					var total = "total"+product;
					var amout2 = document.getElementById('iniamout').value;
					 var oneprice = ${oneproduct.p_Landprice} * amout;
					 var cn1 = oneprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					 var cn1 = cn1 +'원';
				
					 if(!(document.getElementById(rowid))){
							var text="";	
								text += document.getElementById('table1').innerHTML
							
							    text += '<table id="'+rowid+'"style="width: 100%;">';
								text += '<tr><td>'+product+ '</td><td></td></tr>' ;
								text += '<tr><td><i class="fas fa-minus-circle" style="font-size:24px; vertical-align: middle;"></i>&nbsp;&nbsp;';
								text += '<input class="onlyNumber" type=text min=1  name=productamout value='+amout+' size=10>';
								text += '&nbsp;&nbsp;<span class="landfont">평</span>&nbsp;&nbsp;<i class="fas fa-plus-circle" style="font-size:24px; vertical-align: middle;"></i>';	
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
									var onetotalprice =((${oneproduct.p_Manpay} * amout2)+ (${oneproduct.p_Landprice} * amout2)); 
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
									document.getElementById(b_Totalprice).value= onetotalprice;
					 }else{
						 alert("동일 제품이 존재합니다. 수량을 조절해주십시요.")
					 }
					 lnb = $("#lnb").offset().top;
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
					  var producttext = $(this).parent().parent().parent().parent().attr('id');
					  var product="";		
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
						 if(producttext !=null){
							  product= producttext.substring(7);
							  var b_Land = ("b_Land" + product);
						      var b_Totalprice = ("b_Totalprice" + product);
						      document.getElementById(b_Land).value= number;
							  document.getElementById(b_Totalprice).value= (number)*(${oneproduct.p_Landprice}+${oneproduct.p_Manpay});
							  
						  }
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
				  var producttext = $(this).parent().parent().parent().parent().attr('id');
				  var product="";
				  
				  if((number>1)){
						number = parseInt(number) - 1;
						if(producttext !=null){
							  product= producttext.substring(7);
							  var b_Land = ("b_Land" + product);
						      var b_Totalprice = ("b_Totalprice" + product);
						      document.getElementById(b_Land).value= number;
						      document.getElementById(b_Totalprice).value= (number)*(${oneproduct.p_Landprice}+${oneproduct.p_Manpay});
							  
						 }
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
						var producttext = $(this).parent().parent().parent().parent().attr('id');
						var product="";
						if(producttext !=null){
							  product= producttext.substring(7);
							  var b_Land = ("b_Land" + product);
						      var b_Totalprice = ("b_Totalprice" + product);
						      document.getElementById(b_Land).value= 0;
							  document.getElementById(b_Totalprice).value= 0;
							  
						 }
						
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
						lnb = $("#lnb").offset().top;
				});
		    	
		    	$(document).on("click",'.qnasubbutton',function qnasubbutton() {
		    		var testid = $(this).parent().parent().parent().parent().next().children().next();
		    		 if($("#qnaupdateexit").length >0){
		    			 
		    		 	var qnaid = $("#qnaupdateexit");
	    			 	oneqna(qnaid);
	    			 }
		    		 if( ($("#subqna").length > 0)&&(testid.length) ){
		    			 $("#subqna").parent().html("<hr>");
		    		 }else if(($("#subqna").length > 0)){
		    			 $("#subqna").parent().html("<hr>");
		    			 var name = $(this).attr('name');
			    		 var divtext = $(this).parent().parent().parent().parent().next();
			    		 var innertext ="";
			    		 innertext +="<hr><table id='subqna'><tr><td colspan='1'><label>댓글 내용</label></td>"; 
			    		 innertext +="<td><textarea rows='2' cols='150' class='form-control' id='c_Content2' name='c_Content2' placeholder='* 내용을 입력하세요.' required>";
			    		 innertext +="</textarea></td></tr><tr>";
			    		 innertext +="<td><input id='qnainsert' name='"+name+"' type='submit' class='btn btn-dark' value='댓글 작성' onclick='subqnainsert(this.name)'>&nbsp;&nbsp;</td>";
			    		 innertext +="</tr></table><hr>";
			    		 divtext.html(innertext);
		    		 }else{
		    			 var name = $(this).attr('name');
			    		 var divtext = $(this).parent().parent().parent().parent().next();
			    		 var innertext ="";
			    		 innertext +="<hr><table id='subqna'><tr><td colspan='1'><label>댓글 내용</label></td>"; 
			    		 innertext +="<td><textarea rows='2' cols='150' class='form-control' id='c_Content2' name='c_Content2' placeholder='* 내용을 입력하세요.' required>";
			    		 innertext +="</textarea></td></tr><tr>";
			    		 innertext +="<td><input id='qnainsert' name='"+name+"' type='submit' class='btn btn-dark' value='댓글 작성' onclick='subqnainsert(this.name)'>&nbsp;&nbsp;</td>";
			    		 innertext +="</tr></table><hr>";
			    		 divtext.html(innertext);
		    		 }
		    	});	
		    	
		    			
		    	$(document).on("click",'.updatebutton',function updatebutton() {
			    		 
		    			if($("#qnaupdateexit").length >0){
		    				
		    				var qnaid = $("#qnaupdateexit");
		    				oneqna(qnaid);
		    			}
		    		
		    			if( ($("#subqna").length > 0)){
			    			 $("#subqna").parent().html("<hr>");
			    		 }
		    			var name = $(this).attr('name');
		    			var updatetr = $(this).parent().parent().parent();
		    			var updatetext = "";
		    			updatetext +="<tbody><tr><td colspan='1'><label>댓글 내용</label></td>";
		    			updatetext +="<td><textarea rows='2' cols='150' class='form-control' id='c_Contentupdate' name='c_Contentupdate' placeholder='* 내용을 입력하세요.' required>";
		    			updatetext +="</textarea></td></tr><tr>";
		    			updatetext +="<td><input id='qnaupdate' name='"+name+"' type='button' value='수정완료' onclick='qnaupdate(this.name)'></td>;"
		    			updatetext +="<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id='qnaupdateexit' name='"+name+"' type='button' value='수정취소' onclick='qnaupdateexit(this.name)'></td></tr></<tbody>"
		    			updatetr.html(updatetext);
		    	});
		    			
		        $(window).scroll(function() {
		          var window = $(this).scrollTop();
		          var lnbcenter = $("#lnbcenter").offset().top;
		          if(lnbcenter <= window) {
		            $("#lnb").addClass("fixed");
		            $("#nonecenter").css("display","block");
		          } else {
		            $("#lnb").removeClass("fixed");
		            $("#nonecenter").css("display","none");
		          }
		        })
	});

	</script>

</head>
<body>

	<%
		MemberBean member = ((MemberBean) session.getAttribute("member"));
		FarmerBean farmer = ((FarmerBean) session.getAttribute("farmer"));
		AdminBean admin = ((AdminBean) session.getAttribute("admin"));
	%>

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

					<div align="right" class="col-lg-12" id="productaccept">
						<c:choose>
							<c:when test="${oneproduct.p_Accept eq 'Y'}">
									승인처리상태 <input style="width: 60px;" class='mybtn' name='N'
									type="button" value="승인" onclick="productaccept('N')" />
							</c:when>
							<c:otherwise>
								미승인처리상태  <input style="width: 60px;" class='mybtn2' name='Y'
									type="button" value="미승인" onclick="productaccept('Y')" />

							</c:otherwise>
						</c:choose>
					</div>
					<div align="right" class="col-lg-12" id="productupdate">
						<a class="btn btn-sm btn-success"
							href="/AdRegDetailForm?p_No=${oneproduct.p_No}">수정</a>
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
						
						<div>
							<h4>
								평당 가격 :
								<fmt:formatNumber value="${oneproduct.p_Landprice }"
									pattern="#,###" />
								원
							</h4>
							
						</div>
						<div>
							<h4>
								평당 인건비:
								<fmt:formatNumber value="${oneproduct.p_Manpay }"
									pattern="#,###" />
								원
							</h4>
						</div>
						<hr>
						

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
							
							<i class="fas fa-minus-circle" style='font-size:24px; vertical-align: middle;'>&nbsp;
							</i><input class="onlyNumber" id="iniamout" type=text min=1  name=amount value=1 size=10>
							&nbsp;<span class="landfont">평</span>&nbsp;
							<i class="fas fa-plus-circle" style='font-size:24px; vertical-align: middle;'></i>
							&nbsp;<input id="selectproduct" style="width: 50px;" type=button class="mybtn" value="선택" onClick="selectproduct()">
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
							<span>구입농작물</span>
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
				
				<div id="lnbcenter"></div>
				<div id="lnb" style="text-align: center;">
				   <ul>
				     <li><a href="#lnbposition" class="sidenav">설명</a></li>
				     <li><a href="#movereview"  class="sidenav" onclick="move()">댓글</a></li>
				   </ul>
				 </div>
				 <br><br>
				 <div id="nonecenter" style="height: 59px;display: none;"></div>
		<div class="container">
			<div class="row">				 
				<div class="col-lg-12">
					<div class="product__details__tab">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc"
									style="text-align: center;">
								<p style="font-size:24px;color:black">${oneproduct.p_Content}</p>
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
							<div id="movereview"></div>
							<br>
							<hr/>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
									<div class="qnatalbe" id="qnatalbe">
										
										
											<c:forEach var="q" items="${qnalist }" varStatus="status">
												<table style="width:100%">
													<tr>
														<c:choose>
															<c:when test="${q.c_Subno > 0}">
																<td style="padding-left: 20px;">
																	<span style="font-size:20px">└</span>
																	${q.c_Content}
																	<br>
																	<span style='font-size:8px'>
																	${q.c_Date} ${q.c_Id} 
																	</span>
																</td>
   															 </c:when>
   															 <c:otherwise>
   															 	<td style="">
																	${q.c_Content }
																	<br>
																	<span style='font-size:8px'>
																	${q.c_Date} ${q.c_Id} 
																	</span>
																</td>
   															 </c:otherwise>
														</c:choose>
														
													</tr>
													<tr>
														<td>
															<c:if test="${(q.c_Subno == 0 && (not empty farmer || not empty admin))&&q.c_Id !='삭제'}">
																<input name="${q.c_Seq}" class="qnasubbutton" type="button" value="답글" onclick="qnasubbutton('${q.c_Seq}')" />
															</c:if>
														
															<c:if test="${(not empty farmer || not empty admin ||(not empty member && member.m_Id == q.c_Id))&&q.c_Id !='삭제'}">
																<input name="${q.c_Seq}" class="updatebutton" type="button" value="수정" onclick="updatebutton('${q.c_Seq}')" />&nbsp;
																<input name="${q.c_Seq}" class="qnadeletebutton" type="button" value="삭제" onclick="qnadeletebutton('${q.c_Seq}')" />
															</c:if>
														</td>
													</tr>
												</table>
												<div>
													<hr/>
												</div>							                        
					                       </c:forEach> 
										
										
										
									</div>
									
								
										<div align="center" class="product__pagination" id="pagesystem">
	                    
						                	<c:if test="${pagebeen.pro eq 'true' }">
											    <a id = "page${pagebeen.pagestart -1}" style="cursor:pointer" onclick="pagebutton(${pagebeen.pagestart -1})">이전 </a>
											</c:if>
												  
											<c:if test="${pagebeen.pagestart != '0' }">
												<c:forEach var="i" begin="${pagebeen.pagestart}" end="${pagebeen.pageend}" step="1">
													<a id = "page${i}" style="cursor:pointer" onclick="pagebutton(${i })">${i }</a>  
												</c:forEach>    
											</c:if>
											
										    <c:if test="${pagebeen.post eq 'true'}">
											    <a id = "page${pagebeen.pageend +1}" style="cursor:pointer" onclick="pagebutton(${pagebeen.pageend +1})">다음 </a>
											</c:if>
											
					                    </div>
						
									<hr>
										<table>
											<tr>
												<td colspan="1"><label>댓글 내용</label></td>
												<td><textarea rows="2" cols="150" class="form-control"
														id="c_Content" name="c_Content" placeholder="* 내용을 입력하세요." required></textarea></td>
											</tr>
											<tr>
											<td><input id="qnainsert" name="1" type="submit" class="btn btn-dark" value="댓글 작성" onclick="qnainsert(this.name)">&nbsp;&nbsp;</td>
											</tr>
										</table>
								<hr>
								<br>
							</div>
						</div>
					
				</div>
				
			</div>
		</div>
		
	</section>

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


	<script src="resources/product/js/jquery-ui.min.js"></script>
	<script src="resources/product/js/jquery.slicknav.js"></script>
	<script src="resources/product/js/mixitup.min.js"></script>
	<script src="resources/product/js/owl.carousel.min.js"></script>
	<script src="resources/product/js/main.js"></script>
	<script src="resources/product/js/jquery.dd.min.js"></script>



</body>
</html>
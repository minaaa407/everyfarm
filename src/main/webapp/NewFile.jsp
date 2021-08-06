<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lib/w3.css">
<style>
.mySlides {display:none}
</style>
<body>

<div class="w3-content" style="max-width:1200px">
  <img class="mySlides" src="resources/1/test1.png" style="width:100%">
  <img class="mySlides" src="resources/1/test2.png" style="width:100%">
  <img class="mySlides" src="resources/1/test3.png" style="width:100%">
  
  
  <div class="w3-row-padding w3-section">
    <div class="w3-col s4">
      <img class="demo w3-border w3-hover-shadow" src="resources/1/test1.png" style="width:10%" onclick="currentDiv(1)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-border w3-hover-shadow" src="resources/1/test2.png" style="width:10%" onclick="currentDiv(2)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-border w3-hover-shadow" src="resources/1/test3.png" style="width:10%" onclick="currentDiv(3)">
    </div>
  </div>
</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-border-red", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-border-red";
}
</script>

</body>
</html> 


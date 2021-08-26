<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
onlynumber = clicked_id.replace(/[^0-9]/g,'');
index_i_arr.length = 0;
check_length = $("input:checkbox[name='choose']:checked").length;
product = $('#b_Totalprice'+onlynumber).text().replace(/[^0-9]/g,'');



landprice = $('#p_Landprice'+onlynumber).text().replace(/[^0-9]/g,'');
manpay = $('#p_Manpay'+onlynumber).text().replace(/[^0-9]/g,'');

	var leftzerodelete = 0;
    	leftzerodeleteval = ($('#'+clicked_id).val().replace(/(^0+)/, "") * 1);
    	
    	if (checktrue) {
    		aleart("a");
    		producttotal = producttotal - (product * 1);
    		eachtotalvar = (leftzerodeleteval * (landprice * 1)) + (leftzerodeleteval * (manpay * 1));
			document.getElementById("b_Totalprice"+onlynumber).innerHTML = eachtotalvar + "원";
			document.getElementById("Totalprice"+onlynumber).value = eachtotalvar; 
			product = $('#b_Totalprice'+onlynumber).text().replace(/[^0-9]/g,'');
			
			producttotal = producttotal + (product * 1);
			document.getElementById("producttotal").innerHTML = producttotal + "원";
			document.getElementById("discount").innerHTML = producttotal * 0.03 + "원";
			document.getElementById("finaltotal").innerHTML = producttotal - (producttotal * 0.03) + deliverytotal + "원";
			checktrue = false;
		} else {
			aleart("b");
			eachtotalvar = (leftzerodeleteval * (landprice * 1)) + (leftzerodeleteval * (manpay * 1));
			document.getElementById("b_Totalprice"+onlynumber).innerHTML = eachtotalvar + "원";
			document.getElementById("Totalprice").value = eachtotalvar;
			
		}
    	aleart("c");
    	var bno = $('#'+onlynumber).val() * 1;
		var land = $('#land'+onlynumber).val() * 1;
		var price = eachtotalvar;
		
		window.location.href = "http://localhost:8090/basketUpdate?bno="+bno+"&land="+land+"&price="+price+"&checkindex="+index_i_arr;

		</script>
		</body>
</html>
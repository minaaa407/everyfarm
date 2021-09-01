// 우편번호 자르기
	var post = '${Member.m_Addr }';
	var lastpost = post.slice(-6, -1);
	var firstpost = post.slice(0, -7);
	console.log(firstpost);
	console.log(lastpost);
	document.getElementById('postcode').value = lastpost;
	document.getElementById('raddr1').value = firstpost;
	
	// 전화번호
	var tel = $('#tel').val();
	var tel1 = $('#tel1').val();
	var tel2 = $('#tel2').val();
	
	// 이메일
	var email = '${Member.m_Id}';
	var strArray = email.split('@');
	console.log(strArray[0] + ', ' + strArray[1]);
	var mail1 = document.getElementById('mail1').value = strArray[0];
	var mail2 = document.getElementById('mail2').val = strArray[1];
	console.log(mail1 + mail2);
	
	$(document).ready(function(){
		var name = '${Member.m_Name }';
		var empty = '';
		$("input:radio[id=sameaddr]").prop("checked", true); // 사용자동일에 체크되어있음
		if($("input:radio[id=sameaddr]").is(":checked")) {       // 사용자동일에 체크되어있으면 실행
			$("input:radio[id=otheraddr]").prop("checked", false);  // 새로운배송지에 체크 해제
			$('#m_Name').val(name);       $('#m_Name').prop('readonly', true);
			$('#postcode').val(lastpost); $('#postcode').prop('readonly', true);
			$('#raddr1').val(firstpost);  $('#raddr1').prop('readonly', true);
			$('#tel').val(tel);			  $('#tel').prop('readonly', true);
			$('#tel1').val(tel1);		  $('#tel1').prop('readonly', true);
			$('#tel2').val(tel2);		  $('#tel2').prop('readonly', true);
			$('#mail1').val(mail1);  	  $('#mail1').prop('readonly', true);
			$('#mail2').val(mail2);		  $('#mail2').prop('readonly', true);
			$("#mail").hide();
			console.log(name);
		}
	});
	 
	// 새로운 배송지 체크할 경우	
	 $(function(){
		 var empty = '';
	      $("input:radio[id=otheraddr]").click(function(){
	    	  $("input:radio[id=sameaddr]").prop("checked", false);
	    	  $('#m_Name').val(empty);   $('#m_Name').prop('readonly', false);
	    	  $('#postcode').val(empty); $('#postcode').prop('readonly', false);
			  $('#raddr1').val(empty);	 $('#raddr1').prop('readonly', false);
			  $('#tel').val(empty);		 $('#tel').prop('readonly', false);
			  $('#tel1').val(empty);	 $('#tel1').prop('readonly', false);
			  $('#tel2').val(empty);	 $('#tel2').prop('readonly', false);
			  $('#mail1').val(empty);	 $('#mail1').prop('readonly', false);
			  $('#mail2').val(empty);	 $('#mail2').prop('readonly', false);
			  $("#mail").show();
	    	  console.log(empty + "empty");
	      });
	});
	 
	// 사용자 동일에 체크할 경우
	 $(function(){
		 var name = '${Member.m_Name }';
	      $("input:radio[id=sameaddr]").click(function(){
	    	  $("input:radio[id=otheraddr]").prop("checked", false);
	    	  $('#m_Name').val(name);        $('#m_Name').prop('readonly', true);
	    	  $('#postcode').val(lastpost);	 $('#postcode').prop('readonly', true);
			  $('#raddr1').val(firstpost);	 $('#raddr1').prop('readonly', true);
			  $('#tel').val(tel);			 $('#tel').prop('readonly', true);
			  $('#tel1').val(tel1);			 $('#tel1').prop('readonly', true);
			  $('#tel2').val(tel2);			 $('#tel2').prop('readonly', true);
			  $('#mail1').val(mail1);		 $('#mail1').prop('readonly', true);
			  $('#mail2').val(mail2);		 $('#mail2').prop('readonly', true);
			  $("#mail").hide();	
	    	  console.log(name);
	      });
	});
	 
	
	// 셀렉트 박스 배송메시지
	$("#memo").on("change", function() {
	    var $select = $(this);
	    $("#omessage").val(function(i, val) {
	        return val = $select.val();
	    })
	});
	
	// 배송메시지 id값 dm에다 전달
	function memo1(){
		document.getElementById('pay_Deliverymemo').value=document.getElementById('memo').value;
		document.getElementById('dm').value=document.getElementById('pay_Deliverymemo').value;
		
	}
	
	// 주소 API
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(
							data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';
						if (data.bname !== ''
								&& /[동|로|가]$/g
										.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' ('
									+ extraRoadAddr
									+ ')';
						}
						document
								.getElementById('postcode').value = data.zonecode;
						document
								.getElementById('pay_Address1').value = roadAddr;
						document
								.getElementById("pay_Address2").value = data.jibunAddress;
						if (roadAddr !== '') {
							document
									.getElementById("pay_Address3").value = extraRoadAddr;
						} else {
							document
									.getElementById("pay_Address3").value = '';
						}
						var guideTextBox = document
								.getElementById("guide");
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr
									+ ')';
							guideTextBox.style.display = 'block';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr
									+ ')';
							
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
	
	function submit() {
		// 주소
		var address1 = document.getElementById('postcode').value;
		var address2 = document.getElementById('raddr1').value;
		var address3 = document.getElementById('raddr2').value;
		var address = address1 + address2 + address3;
		document.getElementById('Ad').value=address;
	
		document.pay_data.submit();
	}
	
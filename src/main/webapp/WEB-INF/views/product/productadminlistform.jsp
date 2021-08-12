<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.top {
	text-align: center;
}

.top p {
	font-size: 0.8em;
	color: gray;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
}

thead th {
	padding-top: 15px;
	padding-bottom: 15px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
	background: #f3f6f7;
}

tbody td {
	width: 350px;
	padding: 10px;
	font-size: 0.9em;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
}

tbody tr #num {
	width: 80px;
}

tbody tr #title {
	width: 420px;
	text-align: left;
}

tbody tr #name {
	width: 100px;
}

tbody tr #date {
	width: 100px;
}

tbody tr #readc {
	width: 80px;
}
#pageList {
	margin: auto;
	width: 50%;
	text-align: center;
}
</style>

<script>
function paging(i){
	var page = "page" + i;
	document.getElementById('selectpage').value = i;
	document.myHiddenForm.submit();
}

function search(){
	
	var select = document.getElementById('productselect').value;
	
	var text = document.getElementById('selectText').value;
	if(select == "p_Id"){
		text = "%" + text + "%";
	}else{
		text = text;
	}
	document.getElementById('where').value = select;
	document.getElementById('wherecolumn').value= text;
	
	document.myHiddenForm.submit();
}


</script>

<title></title>
</head>

<body>
	<div class="table">
	<h2>상품 리스트</h2>
		<table>
			<thead>
				<tr>
					<th class="one"></th>
					<th class="two">상품번호</th>
					<th>아이디</th>
					<th>메인이미지</th>
					<th>제목</th>
					<th>토지 사이즈</th>
					<th>등록날짜</th>
					<th>상품등록</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${productlist}">
					<tr>
						<td class="content"><input type="checkbox" name="check"
							value="${p.p_No}" form="myhiddenform"></td>
						<td class="content"><a href="proregdetailform?p_No=${p.p_No}">${p.p_No}</a></td>
						<td class="content">${p.p_Id}</td>
						<td class="content">${p.p_Img}</td>
						<td class="content">${p.p_Title}</td>
						<td class="content">${p.p_Land}</td>
						<td class="content">${p.p_Date}</td>
						<td><input class="buttonmenuadmin" type="button" value="${p.p_Accept}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
	<div id="pageList" class="product__pagination">
			                    
				                	<c:if test="${pagebeen.pro eq 'true' }">
									    <a id = "page${pagebeen.pagestart -1}" style="cursor:pointer" onclick="paging(${pagebeen.pagestart -1})">이전 </a>
									</c:if>	  
			
									<c:forEach var="i" begin="${pagebeen.pagestart}" end="${pagebeen.pageend}" step="1">
										   <a id = "page${i}" style="cursor:pointer" onclick="paging(${i })">${i }</a>  
										</c:forEach>    
								    	<c:if test="${pagebeen.post eq 'true'}">
									    <a id = "page${pagebeen.pageend +1}" style="cursor:pointer" onclick="paging(${pagebeen.pageend +1})">다음 </a>
									</c:if>
			                    </div>
			                    <!-- form 해당 부분 scrip 이벤트 통해서 자동 전송 처리 -->
			                    <form:form commandName="pagebeen" name = "myHiddenForm" action="/productadminlistform" method="post">
										<input type="hidden" id = "selectpage" name="selectpage" value="1">
										<input type="hidden" id = "pagestart" name="pagestart" value="${pagebeen.pagestart}">
										<input type="hidden" id = "pageend" name="pageend" value="${pagebeen.pageend}">
										<input type="hidden" id = "endnumber" name="endnumber" value="${pagebeen.endnumber}">
										<input type="hidden" id = "limit" name="limit" value="${pagebeen.limit}">
										<input type="hidden" id = "offset" name="offset" value="${pagebeen.offset}">
										<input type="hidden" id = "tableindex" name="tableindex" value="${pagebeen.tableindex}">
										<input type="hidden" id = "pagingnumber" name="pagingnumber" value="${pagebeen.pagingnumber}">
										<input type="hidden" id = "pro" name="pro" value="${pagebeen.pro}">
										<input type="hidden" id = "post" name="post" value="${pagebeen.post}">
										<input type="hidden" id = "where" name="where" value="${pagebeen.where}">
										<input type="hidden" id = "wherecolumn" name="wherecolumn" value="${pagebeen.wherecolumn}">
			
								</form:form>
	<br/>
			<select name="productselect" id="productselect">
    			<option value="p_No">상품번호</option>
    			<option value="p_Id">아이디</option>
    			<option value="p_Land">토지 사이즈</option>
			</select>
			<input type="text" name="selectText" id="selectText">
			<input type="button" value="검색" onclick="search()">
	
	
	
	
	
</body>
</html>
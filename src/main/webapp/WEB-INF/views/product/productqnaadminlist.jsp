<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	line-height: 1.5;
	text-align: center;
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
	padding: 10px;
	font-size: 0.9em;
	border-bottom: 1px solid #ccc;
}

table #tableseq{
	text-align: center;
	width: 100px;
}

table #tablecontent {
	text-align: left;
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
	if(select == "c_No"){
		text = text;
	}else{
		text = "%" + text + "%";
	}
	document.getElementById('where').value = select;
	document.getElementById('wherecolumn').value= text;
	var aaa = document.getElementById('where').value;
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
					<th class="two">내용</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${productqnalist}">
					<tr>
						<td id = "tableseq" class="content"><a href="proregdetailform?p_No=${c.c_Seq}">${c.c_Seq}</a></td>
						<td id = "tablecontent" class="content"><span style=font-size:24px;>${c.c_Content}</span><br/>
						<span style=font-size:12px;>상품 번호 : ${c.c_No} 아이디 : ${c.c_Id} 등록 날짜 : ${c.c_Date} 비밀글 : ${c.c_Secret}</span></td>
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
			                    <form:form commandName="pagebeen" name = "myHiddenForm" action="/productqnaadminlist" method="post">
			                    
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
										<input type="hidden" id = "where" name="where2" value="${pagebeen.where2}">
										<input type="hidden" id = "wherecolumn" name="wherecolumn2" value="${pagebeen.wherecolumn2}">
										<input type="hidden" id = "orderby" name="orderby" value="${pagebeen.orderby}">
										<input type="hidden" id = "ascdesc" name="ascdesc" value="${pagebeen.ascdesc}">
			
								</form:form>
								<br/>
			<select name="productselect" id="productselect">
				<c:choose>
				    <c:when test="${pagebeen.where eq 'c_Id'}">
				       		<option value="c_Id" selected>아이디</option>
    						<option value="c_No">상품번호</option>
    						<option value="c_Content">내용</option>
				    </c:when>
				    <c:when test="${pagebeen.where eq 'c_No'}">
				       		<option value="c_Id" >아이디</option>
    						<option value="c_No" selected>상품번호</option>
    						<option value="c_Content">내용</option>
				    </c:when>
				    <c:when test="${pagebeen.where eq 'c_Content'}">
				       		<option value="c_Id" >아이디</option>
    						<option value="c_No">상품번호</option>
    						<option value="c_Content" selected>내용</option>
				    </c:when>
				</c:choose>		
			</select>
			
			
			<c:choose>
			    <c:when test="${pagebeen.wherecolumn eq '%%'}">
			       <input type="text" name="selectText" id="selectText">
			    </c:when>
			    <c:otherwise>
			       <input type="text" name="selectText" id="selectText" value="${fn:replace(pagebeen.wherecolumn,'%','')}">
			    </c:otherwise>
			</c:choose>

			
			<input type="button" value="검색" onclick="search()">
	
	
	
	
	
</body>
</html>
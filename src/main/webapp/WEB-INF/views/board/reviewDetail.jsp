<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table class="board_view">
        <caption>상세보기</caption>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>제목</th>	
                <td>${revList.rev_Title}</td>
                <th>조회수</th>
                <td>${revList.rev_Readcount}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${revList.rev_Name}</td>
                <th>작성시간</th>
                <td><fmt:formatDate pattern ="yyyy/MM/dd" value="${revList.rev_Date}" /></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <label> ${revList.rev_Cont}</label> 
                </td>
            </tr>
        </tbody>
    </table>
    <a  href="/reviewList" id="list" class="btn">목록으로</a>
    <a href="/reviewUpdate?rev_No=${revList.rev_No}" id="modify" class="btn">수정하기</a>
    <a href="/reviewDelete?rev_No=${revList.rev_No}">삭제하기</a>
     
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click",function(e){
                e.preventDefault();
                fn_openBoardList();
            })
        })
        
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
            comSubmit.submit();
        }
        function fn_openBoardModify(){
            var idx = "${map.IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardModify.do'/>");
            comSubmit.addParam("IDX",idx);
            comSubmit.submit();
        }
    </script> 
</body>
</html>
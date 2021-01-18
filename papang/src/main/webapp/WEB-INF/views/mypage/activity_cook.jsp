<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
.center_div {
    min-height: 750px;
    display: block;
    margin: 176px 15% 9px 23%;
    width: 65%;
}
   
.yra:link{color:blue; text-decoration:underline}  
      .yra:visited{color:blue;text-decoration:none}   
      .yra:hover {color:#ff00ff; text-decoration:underline}              
</style>
<body>
		<h3>요리</h3>
		<hr />
		<div align="right">
			<form id="filterFrm" name="filterFrm" action="goNoticeBoardPage.do"
				method="get">
				
			</form>
		</div>
		<br>
			<table class="table" id="dataTable">
				<thead>
					<tr class="tableTrTh">
						<th width="15%" class="tableTh">게시글번호</th>
						<th width="20%" class="tableTh">제목</th>			
						<th width="15%" class="tableTh">작성자</th>
						<th width="15%" class="tableTh">분류</th>
		 				<th width="15%" class="tableTh">조회수</th>
					</tr>
				</thead>  
				<tbody>
				<c:forEach var="co" items="${cos6}"> 
					<tr>
						<td align="center">${co.cook_no}</td>
						<td align="center"><a class="yra" href="${pageContext.request.contextPath}/activity/cookView?cook_no=${co.cook_no}&ac_category=요리" class="boardTagA">${co.cook_title}</a></td>
						<td align="center">${co.mbr_id}</td>
						<td align="center">${co.cook_category}</td>
						<td align="center">${co.cook_hit}</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
			<br>	
		<div align="right">
			
		</div>
</body>
		</html>


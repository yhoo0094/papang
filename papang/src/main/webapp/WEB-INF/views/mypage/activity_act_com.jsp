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
		<h3>활동 후기</h3>
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
						<th width="20%" class="tableTh">사진</th>			
						<th width="15%" class="tableTh">후기내용</th>
						<th width="15%" class="tableTh">평점</th>
		 				<th width="15%" class="tableTh">분류</th>
					</tr>
				</thead>  
				<tbody> 
				<c:forEach var="co" items="${cos6}">   
					<tr> 
						<td align="center">${co.ac_no}</td>
						<td align="center"><img class= "img1" id = "ac_pic" name="ac_pic" 
						src="${pageContext.request.contextPath}/images/actCom/${co5.ac_pic}">
						<td align="center">${co.ac_content}</td> 
						<td align="center">${co.ac_rate}</td> 
						<td align="center">${co.ac_category}</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
			<br>	
		<div align="right">
			
		</div>
</body>
		</html>


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
      
.img1 {
  width: 200px;
  height: 200px;
  object-fit: cover;
}          
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
						<td style="text-align: center; vertical-align: middle;">${co.ac_no}</td>
						<td style="text-align: center; vertical-align: middle;"><img class= "img1" id = "ac_pic" name="ac_pic" 
						src="${pageContext.request.contextPath}/images/actCom/${co.ac_pic}">
						<td style="text-align: center; vertical-align: middle;"><a class="yra" href="${pageContext.request.contextPath}/community/form?com_no=${co.ac_content}" class="boardTagA">${co.ac_content}</a></td> 
						<td style="text-align: center; vertical-align: middle;">${co.ac_rate}</td> 
						<td style="text-align: center; vertical-align: middle;">${co.ac_category}</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
			<br>	
		<div align="right">
			
		</div>
</body>
		</html>


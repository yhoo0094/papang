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
		<h3>답변게시판</h3>
		<hr />
		<div align="right">
			<form id="filterFrm" name="filterFrm" action="goNoticeBoardPage.do"
				method="get">
				<select id="type" name="type">
					<option value="">분류
					<option value="공지사항">공지사항
					<option value="이벤트">이벤트
				</select> <input type="hidden" name="p" value="1">
			</form>
		</div>
		<br>
			<table class="table" id="dataTable">
				<thead>
					<tr class="tableTrTh">
						<th width="15%" class="tableTh">게시글번호</th>
						<th width="20%" class="tableTh">답글내용</th>
						<th width="15%" class="tableTh">작성자</th>
						<th width="15%" class="tableTh">작성일</th>
						<th width="15%" class="tableTh">분류</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="co2" items="${cos2}">
					<tr> 
						<td align="center">${co2.cc_no}</td>
						<td align="left"> <a class="yra" href="${pageContext.request.contextPath}/community/form?com_no=${co2.com_no}" class="boardTagA">${co2.cc_content}</td>
						<td align="center">${co2.mbr_id}</td>
						<td align="center">${co2.cc_date}</td>
						<td align="center">${co2.cc_category}</td>
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
			<br>	
		<div align="right">
			
		</div>
</body>
		</html>


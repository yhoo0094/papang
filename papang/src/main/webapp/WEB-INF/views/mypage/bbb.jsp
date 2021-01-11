<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
      	      <table class="table" id="dataTable"> 
				<thead>
					<tr class="tableTrTh"> 
						<th width="15%" class="tableTh">고객 아이디</th>
						<th width="20%" class="tableTh">아이 이름</th>
						<th width="20%" class="tableTh">아이 성별</th>
						<th width="20%" class="tableTh">일한 날짜</th>
						<th width="15%" class="tableTh">하루 일당</th>
					
					</tr>
				</thead>  
				<tbody>
				<c:forEach var="co8" items="${cos7}" >
					<tr> 
			
						<td align="center">${co8.mbr_id}</td>
						<td align="center">${co8.chi_name}</td>
						<td align="center">${co8.chi_gender}</td>
						<td align="center">${co8.workingday}</td>
						<td align="center">${co8.srv_pay}</td>
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
			
			합계 <input type="text" id="a" name="a">
</body>
</html>
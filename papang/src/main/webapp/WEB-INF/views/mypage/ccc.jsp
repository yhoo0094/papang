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
						<th width="15%" class="tableTh">예약번호</th>
						<th width="15%" class="tableTh">날짜</th>
						<th width="20%" class="tableTh">가격</th>
						<th width="20%" class="tableTh">상태</th>
						
					
					</tr>
				</thead>  
				<tbody>
				<c:forEach var="co8" items="${cos7}" >
					<tr> 	 
						<td align="center">${co8.srv_no}</td>		
						<td align="center">${co8.srv_date}</td>
						<td align="center">${co8.srv_pay}</td>
						<td align="center">${co8.srv_status}</td>
					  
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
			
			 　　　　　　　　　　　 　월급<input id="result" type="text" name="result" style = "text-align:right" value="${sitter_revVO.sum}" >원
</body>
</html>
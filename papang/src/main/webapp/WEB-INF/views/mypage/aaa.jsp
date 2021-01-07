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
						<th width="15%" class="tableTh">상품 번호</th>
						<th width="20%" class="tableTh">상품 사진</th>
						<th width="20%" class="tableTh">상품 명</th>
						<th width="20%" class="tableTh">상품 가격</th>
						<th width="15%" class="tableTh">상품 수량</th>
					
					</tr>
				</thead>  
				<tbody>
				<c:forEach var="co8" items="${cos7}" >
					<tr> 
			
						<td align="center">${co8.pro_no}</td>
						<td align="center">${co8.pro_pic}</td>
						<td align="center">${co8.pro_name}</td>
						<td align="center">${co8.pro_price}</td>
						<td align="center">${co8.bag_cnt}</td>
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
</body>
</html>
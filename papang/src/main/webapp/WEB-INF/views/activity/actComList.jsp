<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/active/css/cookList.css" />
<title>Insert title here</title>
<style>
table {
	border: 1px solid black;
	margin: 0 0 0 160px;
}

td {
	border: 1px solid black;
	width: 240px;
	height: 200px;
}

.titleTd {
	height: 50px;
	width: 80%;
}

.imgDiv {
	width: 100%;
	height: 125%;
}
</style>
</head>
<body>
	<div class="Bigtitle">후기 리스트</div>
	<table>
		<c:forEach items="${actList}" var="actlist">
		<tr>
			<td rowspan="2"><img class="imgDiv"
				src="${pageContext.request.contextPath}/images/actCom/${actlist.ac_pic}">
			</td>
			<td class="titleTd">${actlist.mbr_id} 별점</td>
		</tr>
		<tr>
			<td>${actlist.ac_content}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
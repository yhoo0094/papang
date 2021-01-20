<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/active/css/cookList.css" />
<title>Insert title here</title>
<style>
td {
	width: 240px;
	height: 200px;
	border-radius: 0 8px 8px 0;
}

.titleTd {
	height: 50px;
	width: 80%;
	border-bottom: 20px solid rgb(249, 196, 94);
}

.imgDiv {
	width: 100%;
	height: 130%;
}

.acListDiv {
	height: 300px;
	padding: 20px;
	border-radius: 8px;
	width: 90%;
	background-color: rgb(249, 196, 94);
	margin: 0 0 40px 0;
}

table {
	background-color: white;
	margin: 0 0 50px 0;
}

th {
	font-size: 18px;
	text-align: left;
	padding-left: 10px;
}

.starimg {
	width: 10px;
	height: 10px;
}
</style>

</head>
<body>
	<div class="Bigtitle">후기 리스트</div>



	<c:forEach items="${actList}" var="actlist">
		<div class="acListDiv">
			<table>
				<tr>
					<td rowspan="2"><img class="imgDiv"
						src="${pageContext.request.contextPath}/images/actCom/${actlist.ac_pic}">
					</td>
					<th class="titleTd">${actlist.mbr_id}
						<p id="starP"></p>

					</th>
				</tr>
				<tr>
					<td>${actlist.ac_content}</td>
				</tr>
			</table>
		</div>

	</c:forEach>

</body>
</html>
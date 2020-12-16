<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>USER</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/main/css/modern-business.css" rel="stylesheet">

<style>
/* 레이아웃 */
.fixed-top {height: 100px;background-color: rgb(249, 196, 94);}
body {background-color: #fff5d2;}
.py-5 {background-color: rgb(249, 196, 94);}
/* 버튼css */
 </style>
 
</head>
<section class="content">
	<tiles:insertAttribute name="header" />
	<!--  /WEB-INF/views/common/layout/header.jsp -->
	<body style="background-color: #fff5d2">
		<tiles:insertAttribute name="body" />
		<!-- body -->
	</body>
	<tiles:insertAttribute name="footer" />
	<!-- /WEB-INF/views/common/layout/footer.jsp -->
</section>
</html>
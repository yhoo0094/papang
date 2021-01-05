<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menuTitleDiv, .sidebarMenuDiv {
		margin: 2px;
	}
	.sidebarMenu{
		color: #393e46;
	}
	.menuBar{
		display: inline-block;
		padding: 10px;
		border-radius: 10px;
		position: fixed;
		left: 3%;
		top: 40%;
	}
</style>
</head>
<body>
	<div class="menuBar strongYellow" align="center">
		<div class="menuTitleDiv"><b class="menuTitle">베이비시터</b></div>
		<div class="sidebarMenuDiv"><a class="sidebarMenu" href="${pageContext.request.contextPath}/sitter/board">시터 리스트</a></div>
		<div class="sidebarMenuDiv"><a class="sidebarMenu" href="${pageContext.request.contextPath}/sitter/reservationView">예약정보</a></div>
	</div>
</body>
</html>
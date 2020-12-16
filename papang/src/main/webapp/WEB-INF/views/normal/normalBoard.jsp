<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 표준안</title>
<!-- 부트스트랩 넣기 시작 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<style>
.pagination, li.active, .pagination li {
	display: inline-block;
}
.pagination a, li.active {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
}

.pagination li.active {
	background-color: rgb(255,136,38);
	color: black;
	border: 1px solid #ddd;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.pagination a, li.active {
	border-radius: 5px;
	border-bottom-left-radius: 5px;
}

.bodybodybody {
padding : 20%;
}
</style>
</head>
<body class="bodybodybody">
	<br>
	<h3>공지사항</h3>
	<hr/>
	<div align="right">
		<form id="filterFrm" name="filterFrm" action="goNoticeBoardPage.do"
			method="get">
			<select id="type" name="type">
				<option value="">분류
				<option value="공지사항">공지사항					
				<option value="이벤트">이벤트
			</select> 
			<input type="hidden" name="p" value="1">
		</form>
	</div>
	<br>
	<div align="center">
		<table class="table">
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>제목</th>
					<th>분류</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="#">제목텍스트</a></td>
					<td>분류텍스트</td>
					<td>20-12-16 12:20</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		<br>
		<my:paging paging="${paging}" jsfunc="goPage"/>
	</div>
	<div align="right">
		<button id="createBtn">글쓰기</button>
	</div>
</body>
</html>

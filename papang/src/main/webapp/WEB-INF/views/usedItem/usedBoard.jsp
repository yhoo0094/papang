<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<html>
<head>
<title>중고게시판</title>
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
	background-color: rgb(255, 136, 38);
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

.pagination ul {
	width: 100%;
}

.sizeDiv {
	padding: 4% 10% 2%;
}

th {
	text-align: center;
}

body {
	background-color: #fff5d2;
}

.tableTrTh {
	background-color: rgb(249, 196, 94);
}

.boardTagA {
	color: black;
}

.btnWrite {
 margin-right: 5%
}

/* 임시 나중에 삭제할 것 */
a.active {
	background-color: rgb(249, 196, 94);
}
</style>
</head>
<body>
	<div class="sizeDiv">
		<br>
		<h3>게시판</h3>
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
		<div align="center">
			<table class="table">
				<thead>
					<tr class="tableTrTh">
						<th width="15%">게시글번호</th>
						<th width="20%">제목</th>
						<th width="15%">분류</th>
						<th width="15%">작성일자</th>
						<th width="15%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center">1</td>
						<td><a href="#" class="boardTagA">제목텍스트</a></td>
						<td align="center">분류텍스트</td>
						<td align="center">20-12-16 12:20</td>
						<td align="center">0</td>
					</tr>
					<tr>
						<td align="center">2</td>
						<td><a href="#" class="boardTagA">제목텍스트</a></td>
						<td align="center">분류텍스트</td>
						<td align="center">20-12-16 12:20</td>
						<td align="center">0</td>
					</tr>
					<tr>
						<td align="center">3</td>
						<td><a href="#" class="boardTagA">제목텍스트</a></td>
						<td align="center">분류텍스트</td>
						<td align="center">20-12-16 12:20</td>
						<td align="center">0</td>
					</tr>
				</tbody>
			</table>
			<br>
			<%-- <my:paging paging="${paging}" jsfunc="goPage" /> --%>
			
			<!-- 임시! 나중에 삭제할 것 -->
			<div class="pagination">
				<a href="#">&laquo;</a> 
				<a href="#">1</a> 
				<a class="active" href="#">2</a>
				<a href="#">3</a> 
				<a href="#">4</a> <a href="#">5</a> 
				<a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>
			
			
		</div>
		<div align="right">
			<button id="createBtn" class="btnYellow bSamll btnWrite">글쓰기</button>
		</div>
	</div>
</body>
</html>

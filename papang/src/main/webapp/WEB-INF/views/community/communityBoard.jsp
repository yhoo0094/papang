<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style type="text/css">

</style>
</head>
<body>
	<br>
	<h3 style="display: inline;">커뮤니티 게시판</h3>
	<form class="category" action="#"
		method="get">
		<select id="type" name="type" style="width: 100%">
			<option value="">분류
			<option value="정보">정보
			<option value="일상">일상
			<option value="질문">질문
		</select>
	</form>
	<hr />
	<br>
	<div align="center">
		<table class="table" id="dataTable">
			<thead>
				<tr class="tableTrTh">
					<th width="15%" class="tableTh">분류</th>
					<th width="20%" class="tableTh">제목</th>
					<th width="15%" class="tableTh">작성자</th>
					<th width="15%" class="tableTh">작성일</th>
					<th width="15%" class="tableTh">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center">정보</td>
					<td><a href="#" class="boardTagA">제목텍스트</a></td>
					<td align="center">A씨</td>
					<td align="center">20-12-16 12:20</td>
					<td align="center">0</td>
				</tr>
				<tr>
					<td align="center">일상</td>
					<td><a href="#" class="boardTagA">제목텍스트</a></td>
					<td align="center">B씨</td>
					<td align="center">20-12-16 12:20</td>
					<td align="center">0</td>
				</tr>
				<tr>
					<td align="center">질문</td>
					<td><a href="#" class="boardTagA">제목텍스트</a></td>
					<td align="center">C씨</td>
					<td align="center">20-12-16 12:20</td>
					<td align="center">0</td>
				</tr>
			</tbody>
		</table>
		<br>
	</div>
	<div align="right">
		<button id="createBtn" class="btnYellow bSamll btnWrite">글쓰기</button>
	</div>
</body>

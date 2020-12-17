<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style type="text/css">
	.temt {
		padding: 100px;
	}
</style>
</head>
<body>
<div class="temt">
	<br>
		<h3>커뮤니티 게시판</h3>
		<hr />
		<div align="right">
			<form id="filterFrm" name="filterFrm" action="goNoticeBoardPage.do"
				method="get">
				<select id="type" name="type">
					<option value="">분류
					<option value="정보">정보
					<option value="일상">일상
					<option value="질문">질문
				</select> 
				<input type="text">
				<button type="submit" class="btnYellow bSamll">검색</button>
				<input type="hidden" name="p" value="1">
			</form>
		</div>
		<br>
		<div align="center">
			<table class="table">
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
			
			<%--
			페이지네이션 넣을 때 아래에 '임시!' 삭제하고 이거 사용 
			<script>
			function goPage(p) {
				filterFrm.p.value = p;
				$("#filterFrm").submit();
			}
			</script>
			<my:paging paging="${paging}" jsfunc="goPage" />
			--%> 
			
			<!-- 임시! 나중에 삭제할 것 -->
			<div class="pagination" style="display: inline-block;">
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

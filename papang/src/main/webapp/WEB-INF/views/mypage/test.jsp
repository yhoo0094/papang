<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.center_div {
    min-height: 750px;
    display: block;
    margin: 176px 15% 9px 23%;
    width: 65%;
}
</style>
</head>
<body>
<h3>날먹게시판</h3>
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
			<table class="table" id="dataTable">
				<thead>
					<tr class="tableTrTh">
						<th width="15%" class="tableTh">게시글번호</th>
						<th width="20%" class="tableTh">제목</th>
						<th width="15%" class="tableTh">작성자</th>
						<th width="15%" class="tableTh">작성일</th>
						<th width="15%" class="tableTh">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center">1</td>
						<td><a href="#" class="boardTagA">제목텍스트333</a></td>
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
					<tr>
						<td align="center">3</td>
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
					<tr>
						<td align="center">3</td>
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
					<tr>
						<td align="center">3</td>
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
					<tr>
						<td align="center">3</td>
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
		<div align="right">
			
		</div>
</body>
</html>
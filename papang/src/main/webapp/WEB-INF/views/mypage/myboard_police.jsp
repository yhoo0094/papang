<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-input{}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
.input_small {width: 400px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: center;
font-size:50px;
}
p {
    margin-top: 0;
    margin-bottom: 1rem;
}
.content_div{width: 90%;
    margin: 0px 0px 0px 200px;}
    .w3-large {
    margin: 0 0 60px 230px;
}

.center_div {
    min-height: 750px;
    display: block;
    margin: 176px 15% 9px 23%;
    width: 65%;
}
</style>
<title></title>
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
						<th width="15%" class="tableTh">번호</th>
						<th width="20%" class="tableTh">신고사유</th>
						<th width="15%" class="tableTh">처리결과</th>
						<th width="15%" class="tableTh">처리된 날짜</th>
						<th width="15%" class="tableTh">신고ID</th>
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
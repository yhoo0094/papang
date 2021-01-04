<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style type="text/css">
.category {
	display: inline;
	float: right;
	width: 10%;
}
</style>
</head>
<body>
	<br>
	<h3 style="display: inline;">중고장터 게시판</h3>
	<form class="category" action="#"
		method="get">
		<select id="type" name="used_loc" style="width: 100%">
			<option value='택배' selected>택배</option>
			<option value='서울'>서울</option>
			<option value='부산'>부산</option>
			<option value='대구'>대구</option>
			<option value='인천'>인천</option>
			<option value='광주'>광주</option>
			<option value='대전'>대전</option>
			<option value='울산'>울산</option>
			<option value='강원'>강원</option>
			<option value='경기'>경기</option>
			<option value='경남'>경남</option>
			<option value='경북'>경북</option>
			<option value='전남'>전남</option>
			<option value='전북'>전북</option>
			<option value='제주'>제주</option>
			<option value='충남'>충남</option>
			<option value='충북'>충북</option>
		</select>
	</form>
	<hr />
	<br>
	<div align="center">
		<table class="table" id="marketTable">
			<thead>
				<tr class="tableTrTh">
					<th width="5%" class="tableTh">글번호</th>
					<th width="10%" class="tableTh">분류</th>
					<th width="25%" class="tableTh">사진</th>
					<th width="30%" class="tableTh">제목</th>
					<th width="15%" class="tableTh">작성자</th>
					<th width="10%" class="tableTh">작성일</th>
					<th width="5%" class="tableTh">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center">00001</td>
					<td align="center">판매중</td>
					<td align="center">사진</td>
					<td><a href="#" class="boardTagA">제목텍스트</a></td>
					<td align="center">홍길동</td>
					<td align="center">20-12-16 12:20</td>
					<td align="center">0</td>
				</tr>
				<tr>
					<td align="center">00002</td>
					<td align="center">판매중</td>
					<td align="center">사진</td>
					<td><a href="#" class="boardTagA">제목텍스트</a></td>
					<td align="center">전우치</td>
					<td align="center">20-12-16 12:20</td>
					<td align="center">0</td>
				</tr>
				<tr>
					<td align="center">00003</td>
					<td align="center">판매완료</td>
					<td align="center">사진</td>
					<td><a href="#" class="boardTagA">제목텍스트</a></td>
					<td align="center">김유신</td>
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

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
	<h3 style="display: inline;">장바구니</h3>
	<hr />
	<br>
	<div align="center">
		<table class="table" id="dataTable">
			<thead>
				<tr class="tableTrTh">
					<th width="10%" class="tableTh">선택</th>
					<th width="30%" class="tableTh">사진</th>
					<th width="30%" class="tableTh">상품명</th>
					<th width="10%" class="tableTh">수량</th>
					<th width="20%" class="tableTh">가격</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center"><input type="checkbox"></td>
					<td align="center">사진</td>
					<td><a href="#" class="boardTagA">상품명</a></td>
					<td align="center"><select id="bag_cnt" name="bag_cnt">
					<option value="1" selected>1</option>
					<option value="2" selected>2</option>
					<option value="3" selected>3</option>
					<option value="4" selected>4</option>
					<option value="5" selected>5</option>
					</select></td>
					<td align="center">2000원 x n개</td>
				</tr>
				
			</tbody>
		</table>
		<br>
	</div>
	<div align="right">
		<button id="purchaseBtn" class="btnYellow btnWrite">선택상품 구매</button>
		<button id="deleteBtn" class="btnGray btnWrite">선택상품 삭제</button>
	</div>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
		<table class="table">
			<thead>
				<tr class="tableTrTh">
					<th width="12%" class="tableTh">
					<input type="checkbox" name="allCheck" id="allCheck">
					<!-- lable for="allCheck">모두선택</lable-->
					</th>
					<th width="20%" class="tableTh">사진</th>
					<th width="30%" class="tableTh">상품명</th>
					<th width="15%" class="tableTh">개당가격</th>
					<th width="8%" class="tableTh">수량</th>
					<th width="15%" class="tableTh">가격</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cart}" var="cart">
				<tr>
					<td align="center"><input type="checkbox" name="chBox" class="chBox" data-bag_no="${cart.bag_no}"></td>
					<td align="center"><img style="max-width: 100%; height: auto" src="${pageContext.request.contextPath}/images/${cart.pro_pic}"></td>
					<td><a href="../market/itemDetail?pro_no=${cart.pro_no}" class="boardTagA">${cart.pro_name}</a></td>
					<td align="center">${cart.pro_price}원</td>
					<td align="center">${cart.bag_cnt}</td>
					<td align="center">${cart.pro_price * cart.bag_cnt}원</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br>
	</div>
	<div align="right">
		<button id="purchaseBtn" class="btnYellow btnWrite">선택상품 구매</button>
		<button id="deleteBtn" class="btnGray btnWrite">선택상품 삭제</button>
	</div>
	<script type="text/javascript">
$("#allCheck").click(function(){
	var chk = $("#allCheck").prop("checked");
	if(chk){
		$(".chBox").prop("checked", true);
	} else{
		$(".chBox").prop("checked", false);
	}
})
$(".chBox").click(function(){
	$("#allCheck").prop("checked", false);
})
$("#deleteBtn").click(function(){
	var confirm_val = confirm("선택 상품을 삭제하시겠습니까?");

	if(confirm_val){
		var checkArr = new Array();
		$("input[class='chBox']:checked").each(function(){
			checkArr.push($(this).attr("data-bag_no"));
		});
		$.ajax({
			url : "${pageContext.request.contextPath}/market/cartDelete",
			type : "post",
			data : {chBox : checkArr},
			success : function(result){
				console.log("이게뭐다냐" + checkArr)
				if (result == 1){
					location.href = "${pageContext.request.contextPath}/marketList/cart"
				} else { alert("삭제 실패"); }
			}
		})
	}
})

</script>
</body>

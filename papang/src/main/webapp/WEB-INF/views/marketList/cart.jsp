<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<style type="text/css">
.category {
	display: inline;
	float: right;
	width: 10%;
}

.cartResult {
	padding: 20px;
}

.cartResult {
	width: 80%;
}

.sum {
	float: left;
}

.order {
	float: right;
}

td {
	font-size: 15px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<br>
	<h3 style="display: inline;">장바구니</h3>
	<div align="right">
		<button id="deleteBtn" class="btnGray btnWrite">선택상품 삭제</button>
	</div>
	<hr />
	<br>
	<div align="center">
		<table class="table">
			<thead>
				<tr class="tableTrTh">
					<th width="5%" class="tableTh"><input type="checkbox"
						name="allCheck" id="allCheck"> <!-- lable for="allCheck">모두선택</lable-->
					</th>
					<th width="25%" class="tableTh">사진</th>
					<th width="30%" class="tableTh">상품명</th>
					<th width="15%" class="tableTh">개당가격</th>
					<th width="10%" class="tableTh">수량</th>
					<th width="15%" class="tableTh">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sum" value="0" />
				<c:forEach items="${cart}" var="cart">
					<tr>
						<td align="center"><input type="checkbox" name="chBox"
							class="chBox" data-bag_no="${cart.bag_no}" onClick="itemSum()"
							value="${cart.pro_price * cart.bag_cnt}"> <input
							type="hidden" name="bag_no" value="${cart.bag_no}"></td>
						<td align="center"><img style="max-width: 100%; height: auto"
							src="${pageContext.request.contextPath}/images/${cart.pro_pic}"></td>
						<td><a href="../market/itemDetail?pro_no=${cart.pro_no}"
							class="boardTagA">${cart.pro_name}</a></td>
						<td align="center">${cart.pro_price}원</td>
						<td align="center">${cart.bag_cnt}</td>
						<td align="center">${cart.pro_price * cart.bag_cnt}원</td>
					</tr>
					<c:set var="sum" value="${sum + (cart.pro_price * cart.bag_cnt)}" />
				</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
		function itemSum(){
////////////////////////////////////////////외않되 ?? ㅠ ??
			var str = "";
			var sum = 0;
			var cnt = $(".chBox").length;
			for(var i=0; i<cnt; i++){
				if($(".chBox")[i].checked == true){
					console.log("d>>>"+ $(".chBox"));
					sum += parseInt($(".chBox")[i].val());
				}
			}
			$("#selSum").val(sum+" 원"); // 선택상품 가격
			console.log("sum>>>" + sum);
			$("#amount").val(sum); // 주문할때 넘길 돈
		}
		</script>
		<br>
	</div>
	<div class="cartResult" align="center" style="margin: auto;">
		<div class="sum">
			총 합계 : <strong><fmt:formatNumber pattern="###,###,###"
					value="${sum}" />원</strong> 선택 상품 합계 : <strong id="selSum"
				style="margin-right: 30%;"></strong>
		</div>
		<div class="orderAll">
			<form id="orderForm" method="post">
				<input type="hidden" name="order_sum" id="amount" value="${sum}">
				<input type="hidden" name="chk[]" id="chk" value="">
				<button id="OrderBtn" class="btnRed bBig">전체상품 구매</button>
			</form>
		</div>
		<!-- div class="order">
		<form id="selectOrderForm" method="post">
		<input type="hidden" name="select_sum" id="amount" value="">
		<input type="hidden" name="chk[]" id="chk" value="">
		<button id="selectOrderBtn" class="btnYellow btnWrite">선택상품 구매</button>
	</form>
	</div-->
	</div>
	<script type="text/javascript">
$("#allCheck").click(function(){
	var chk = $("#allCheck").prop("checked");
	if(chk){
		$(".chBox").prop("checked", true);
// 		itemSum();
	} else{
		$(".chBox").prop("checked", false);
// 		itemSum();
	}
});
$(".chBox").click(function(){
	$("#allCheck").prop("checked", false);
// 	itemSum();
});
// 전체상품 주문 -> 단순 ok
// $("#OrderBtn").click(function(){
// 	if(confirm("전체상품을 주문하시겠습니까?")){
// 		alert("감사합니다");
		
// 		$("#orderForm").submit();
// 	}
// });
// 전체상품 주문 -> 결제
$("#OrderBtn").click(function(){
	//if(confirm("전체상품을 주문하시겠습니까?")){
		 var IMP = window.IMP; // 생략가능
	        IMP.init('imp35581825'); // "가맹점 식별코드"를 사용
	     // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	        var amount = $("#amount").val();
// 	     	var mbr_id = ${user.mbr_id};
	     	var link;
	     	
	     	IMP.request_pay({
	     	    pg : 'inicis',
	     	    pay_method : 'card',
	     	    merchant_uid : 'merchant_' + new Date().getTime(),
	     	    name : '주문명:결제테스트',
	     	    amount : 14000,
	     	    buyer_email : 'iamport@siot.do',
	     	    buyer_name : '구매자이름',
	     	    buyer_tel : '010-1234-5678',
	     	    buyer_addr : '서울특별시 강남구 삼성동',
	     	    buyer_postcode : '123-456'
	     	}, function(rsp) {
	     	    if ( rsp.success ) {
	     	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	     	    	$.ajax({
	     	    		url: "${pageContext.request.contextPath}/market/order", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	     	    		type: 'POST',
	     	    		dataType: 'json',
	     	    		data: {
	     	    			order_sum : amount
	     		    		//기타 필요한 데이터가 있으면 추가 전달
	     	    		}
	     	    	}).done(function(data) {
	     	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	     	    		if ( everythings_fine ) {
	     	    			var msg = '결제가 완료되었습니다.';
	     	    			msg += '\n고유ID : ' + rsp.imp_uid;
	     	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	     	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	     	    			msg += '카드 승인번호 : ' + rsp.apply_num;

	     	    			alert(msg);
	     	    		} else {
	     	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	     	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	     	    		}
	     	    	});
	     	    } else {
	     	        var msg = '결제에 실패하였습니다.';
	     	        msg += '에러내용 : ' + rsp.error_msg;

	     	        alert(msg);
	     	    }
	     	});
	//}
})
// $("#selectOrderBtn").click(function(){
// 	var checkArr = new Array();
// 	$("input[class='chBox']:checked").each(function(){
// 		checkArr.push($(this).attr("data-bag_no"));
// 	});
// 	$("#chk").val(checkArr);
// 	if(confirm("선택상품을 주문하시겠습니까?")){
// 		alert("감사합니다");
// 		$("#selectOrderForm").submit();
// 		$.ajax({
// 			url : "${pageContext.request.contextPath}/market/order",
// 			type : "post",
// 			data : {chBox : checkArr},
// 			success : function(result){
// 				if (result == 1){
// 					location.href = "${pageContext.request.contextPath}/market/orderList"
// 				} else { alert("주문 실패"); }
// 			}
// 		})
// 	}
//});
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
				if (result == 1){
					location.href = "${pageContext.request.contextPath}/marketList/cart"
				} else { alert("삭제 실패"); }
			}
		})
	}
});
</script>
	<!-- div class="cartResult" align="center" style="margin: auto;">
	<div class="sum">
		총 합계 : <strong><fmt:formatNumber pattern="###,###,###" value="${sum}" />원</strong>
	</div>
	<div class="order">
		<button type="button" class="orderBtn btnRed">주문하기</button>
	</div>
</div -->
</body>

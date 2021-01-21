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
.orderAll {
	display: none;
}
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp35581825'); // "가맹점 식별코드"를 사용
	})
</script>
</head>
<body>
	<br>
	<h3 style="display: inline;">장바구니</h3>
	<div align="right">
		<!-- button id="updateBtn" class="btnYellow" onclick="location.href='/papang/market/cartUpdate'">수량 수정</button -->
		<button id="deleteBtn" class="btnGray">선택 삭제</button>
	</div>
	<hr />
	<br>
	<div align="center">
		<table class="table">
			<thead>
				<tr class="tableTrTh">
					<th width="5%" class="tableTh"><input type="checkbox"
						name="allCheck" id="allCheck">
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
							class="chBox" data-pro_no="${cart.pro_no}" data-bag_cnt="${cart.bag_cnt}" data-bag_no="${cart.bag_no}" value="${cart.pro_price * cart.bag_cnt}">
							<input type="hidden" name="bag_no" value="${cart.bag_no}"></td>
						<td align="center"><img style="max-width: 100%; height: auto"
							src="${pageContext.request.contextPath}/resources/images/market/${cart.pro_pic}"></td>
						<td><a href="../market/itemDetail?pro_no=${cart.pro_no}"
							class="boardTagA">${cart.pro_name}</a></td>
						<td align="center">${cart.pro_price} 원</td>
						<td align="center"><input class="count" type="number" value="${cart.bag_cnt}" min="1" max="${cart.pro_cnt}" required>
						<input type="hidden" value="${cart.bag_no}"></td>
						<td align="center" class="rsSum"><fmt:formatNumber
							pattern="###,###,###" value="${cart.pro_price * cart.bag_cnt}" />원</td>
					</tr>
					<c:set var="sum" value="${sum + (cart.pro_price * cart.bag_cnt)}" />
				</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
		$(".count").focusout(function(){
			var bag_cnt = $(this).val();
			var bag_no = $(this).next().val();
			
			// 수량수정
			$.ajax({
 				url: "${pageContext.request.contextPath}/market/cartUpdate",
 				type: "POST",
 				data : {
 					bag_cnt : bag_cnt,
//  					pro_no : pro_no,
 					bag_no : bag_no},
 				success : function(){
 					location.reload();
 				}, error: function(){
 					alert("수정 실패");
 					location.reload();
 				}
 			})
		})
		</script>
		<br>
	</div>
	<div class="cartResult" style="margin: auto;">
		<div class="sum" align="left">
			<h3>총 합계 : <strong><fmt:formatNumber pattern="###,###,###"
					value="${sum}" />원</strong></h3>
		</div>
		<div align="right">
		<c:if test="${sum != 0}">
		<button type="button" class="infoBtn btnYellow bMedium">주문정보 입력</button>
		<script type="text/javascript">
			$(".infoBtn").click(function(){
				$(".orderAll").slideDown();
				$(".infoBtn").slideUp();
			});
		</script>
		</c:if>
		</div>
	</div>
	<br>
	<div class="orderAll" style="margin-top: 3%;">
		<form id="orderForm" name="frm" method="post" autocomplete="off">
			<div style="width: 50%; display: inline-block; margin-left: 10%;" align="left">
				<h3>주문정보</h3>
				<table class="table">
					<tr>
						<td class="txt" width="20%">수신인</td>
						<td><input type="text" id="addressee" name="addressee"
							style="width: 80%;" class="form-control" value="${user.mbr_name}"></td>
					</tr>
					<tr>
						<td class="txt">우편번호</td>
						<td><input type="text" id="post" name="post" style="width: 60%;"
							class="form-control" value="${user.mbr_post}" readonly>
						<input type="button" id="postSearch" class="btnYellow"
							value="우편번호 검색" onclick="sample2_execDaumPostcode()" style="padding: 5px; width: 100px;"></td>
					</tr>
					<tr>
						<td class="txt">주소</td>
						<td><input type="text" id="addr1" style="width: 80%;" readonly
							name="addr1" class="form-control" value="${user.mbr_addr1}"></td>
					</tr>
					<tr>
						<td class="txt">참고사항</td>
						<td><input type="text" id="addr3" style="width: 80%;" readonly
							class="form-control" name="addr3" value="${user.mbr_addr3}"></td>
					</tr>
					<tr>
						<td class="txt">상세주소</td>
						<td><input type="text" id="addr2" style="width: 80%;"
							class="form-control" name="addr2" value="${user.mbr_addr2}"></td>
					</tr>
				</table>
			</div>
			<div style="float: right; margin-top: 100px;">
				<input type="hidden" name="order_sum" id="amount" value="${sum}">
				<button type="button" id="OrderBtn" class="btnRed bMedium">전체상품 구매</button>
				<button type="button" id="cancelBtn" class="btnGray bMedium">입력취소</button>
				<script type="text/javascript">
				$("#cancelBtn").click(function(){
					$(".orderAll").slideUp();
					$(".infoBtn").slideDown();
				});
				</script>
			</div>
		</form>
		<div id="layer"
			style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
				id="btnCloseLayer"
				style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
				onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
		<script type="text/javascript">
			// 우편번호 찾기 화면을 넣을 element
			var element_layer = document.getElementById('layer');
		
			function closeDaumPostcode() {
				// iframe을 넣은 element를 안보이게 한다.
				element_layer.style.display = 'none';
			}
		
			function sample2_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수
		
								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}
		
								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if (data.userSelectedType === 'R') {
									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraAddr !== '') {
										extraAddr = ' (' + extraAddr + ')';
									}
									// 조합된 참고항목을 해당 필드에 넣는다.
									document.getElementById("addr3").value = extraAddr;
		
								} else {
									document.getElementById("addr3").value = '';
								}
		
								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('post').value = data.zonecode;
								document.getElementById("addr1").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("addr2").focus();
		
								// iframe을 넣은 element를 안보이게 한다.
								// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								element_layer.style.display = 'none';
							},
							width : '100%',
							height : '100%',
							maxSuggestItems : 5
						}).embed(element_layer);
		
				// iframe을 넣은 element를 보이게 한다.
				element_layer.style.display = 'block';
		
				// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
				initLayerPosition();
			}
		
			// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
			// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
			// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
			function initLayerPosition() {
				var width = 300; //우편번호서비스가 들어갈 element의 width
				var height = 400; //우편번호서비스가 들어갈 element의 height
				var borderWidth = 5; //샘플에서 사용하는 border의 두께
		
				// 위에서 선언한 값들을 실제 element에 넣는다.
				element_layer.style.width = width + 'px';
				element_layer.style.height = height + 'px';
				element_layer.style.border = borderWidth + 'px solid';
				// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
				element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
						+ 'px';
				element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
						+ 'px';
			}
		</script>
	</div>
<script>
$("#allCheck").click(function(){
	var chk = $("#allCheck").prop("checked");
	if(chk){
		$(".chBox").prop("checked", true);
	} else{
		$(".chBox").prop("checked", false);
	}
});
$(".chBox").click(function(){
	$("#allCheck").prop("checked", false);
});
// 전체상품 주문 -> 결제
$("#OrderBtn").on("click",function(){
	
	var f = document.frm;
	if (f.addressee.value == "") {
		alert("수신인을 입력하세요");
		f.addressee.focus();
		return false;
	}
	if (f.post.value == "") {
		alert("우편번호를 입력하세요");
		f.post.focus();
		return false;
	}
	if (f.addr1.value == "") {
		alert("주소를 입력하세요");
		f.addr1.focus();
		return false;
	}
	if (f.addr2.value == "") {
		alert("상세주소를 입력하세요");
		f.addr2.focus();
		return false;
	}
	return true;
	
	if(confirm("전체상품을 주문하시겠습니까?")){
	     // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	        var amount = $("#amount").val();
	     	var addressee = $("#addressee").val();
	     	var post = $("#post").val();
	     	var addr1 = $("#addr1").val();
	     	var addr2 = $("#addr2").val();
	     	var addr3 = $("#addr3").val();
	     	
	     	var link;
	     	var proArr = new Array();
			$("input[class='chBox']").each(function(){
				proArr.push($(this).attr("data-pro_no"));
			});
			var bagArr = new Array();
			$("input[class='chBox']").each(function(){
				bagArr.push($(this).attr("data-bag_cnt"));
			});
			
			
			var IMP = window.IMP; // 생략가능
   			 IMP.init('imp35581825'); // "가맹점 식별코드"를 사용
	     	IMP.request_pay({
	     	    pg : 'inicis',
	     	    pay_method : 'card',
	     	    merchant_uid : 'merchant' + new Date().getTime(),
	     	    name : '주문명:결제테스트',
	     	    amount : 100,
	     	    buyer_email : '${user.mbr_email}',
	     	    buyer_name : addressee,
	     	    buyer_tel : '${user.mbr_phone}',
	     	    buyer_addr : addr1 + "(" + addr3 + ")" + addr2,
	     	    buyer_postcode : post
	     	}, function(rsp) {
	     	    if ( rsp.success ) {
	     	    	var msg = '결제가 완료되었습니다.';
 	    			msg += '\n고유ID : ' + rsp.imp_uid;
 	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
 	    			msg += '\결제 금액 : ' + rsp.paid_amount;
 	    			msg += '카드 승인번호 : ' + rsp.apply_num;

 	    			// 재고 업데이트, 출고내역 등록
 	    			$.ajax({
 	    				url: "${pageContext.request.contextPath}/market/changeWare",
 	    				type: "POST",
 	    				data : {
 	    					proArr : proArr,
 	    					bagArr : bagArr},
 	    				success : function(){
 	    					// 결제 정보, 결제 상세, 카트 비우기
 	   	     	    		$.ajax({
 	   	     	    			url: "${pageContext.request.contextPath}/market/order",
 	   	     	    			type: 'POST',
 	   	     	    			dataType: 'json',
 	   	     	    			data: { order_sum : amount,
		 	   	     	    			addressee : addressee,
			 	   	     	    		post : post,
			 	   	     	    		addr1 : addr1,
			 	   	     	    		addr2 : addr2,
			 	   	     	    		addr3 : addr3
 	   	     	    			}, success : function(){
 	   	     	    				alert(msg);
 	   	     	    				location.href = "${pageContext.request.contextPath}/mypage/market_buyinfo"
 	   	     	    			},error:function(){
 	   	     	    				alert("실패");
 	   	     	    			}
 	   	     	    		});
 	    				}, error: function(){
 	    				}
 	    			})
	     	    } else {
	     	        var msg = '결제에 실패하였습니다.';
	     	        msg += '에러내용 : ' + rsp.error_msg;

	     	        alert(msg);
	     	    }
	     	});
		}
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
				if (result == 1){
					location.href = "${pageContext.request.contextPath}/marketList/cart"
				} else { alert("삭제 실패"); }
			}
		})
	}
});
</script>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
th {
	min-width: 100px;
	text-align: right;
}

th>span {
	margin-right: 20px;
	font-size: 20px;
	margin: 30px;
}

td>span {
	font-size: 30px;
	margin: 30px;
}

#plusBtn, #minusBtn {
	border: none;
	background: none;
}
</style>

<div class="container center_div">
	<h1 class="mt-4 mb-3">${pro.pro_name}</h1>
	<div class="row">
		<div class="col-lg-6">
			<img class="img-fluid rounded mb-4"
				src="${pageContext.request.contextPath}/images/${pro.pro_pic}"
				alt="${pro.pro_name}">
		</div>
		<div class="col-lg-6">
			<p />

			<p />
			<div>
				<table>
					<tbody>
						<tr>
							<th scope="row"><span>상품명</span></th>
							<td><span><strong>${pro.pro_name}</strong></span></td>
						</tr>
						<tr>
							<th scope="row"><span>판매가</span></th>
							<td><span><strong><fmt:formatNumber
											pattern="###,###,###" value="${pro.pro_price}" />원</strong></span></td>
						</tr>
						<tr>
							<th scope="row"><span>상품번호</span></th>
							<td><span><strong>${pro.pro_no}</strong></span></td>
						</tr>
						<tr>
							<th scope="row"><span>기업명</span></th>
							<td><span><strong>${pro.pro_cn}</strong></span></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<c:if test="${!empty admin.ad_id}">
								<td><button type="button" class="btnYellow" id="itemUpdate" onclick="location.href='/papang/market/itemUpdateForm?pro_no=${pro.pro_no}'">수정</button></td>
								<td><button type="button" class="btnRed" id="itemDelete" onclick="location.href='/papang/market/itemDelete?pro_no=${pro.pro_no}'">삭제</button></td>
							</c:if>
							<c:if test="${!empty user.mbr_id}">
								<td colspan="2"><input type="hidden" name="pro_no"
									id="pro_no" value="${pro.pro_no}"> 구입수량
									<button type="button" id="minusBtn">-</button><input
									type="text" class="numBox" min="1" value="1" readonly>
									<button type="button" id="plusBtn">+</button> 
									<!-- 이때 max 값을 상품수량.. 입출고를 통해 결정된 총수량.. 글구 input type hidden 으로해서도 한개 정하고 -->
									 <!-- 상품재고보다 적은수만 되게 하는 스크립트 script src="/js/stockBtn.js".. -->
									<button type="submit" class="btnRed" id="addCartBtn">장바구니</button>
									<!-- 이때 장바구니에 이미 들어가있으면 +1 되게하기 button onclick="" --> 
									<script type="text/javascript">
										// 수량 설정
										$("#plusBtn").click(function() {
											var num = $(".numBox").val();
											var plusNum = Number(num) + 1;
											$(".numBox").val(plusNum);
										});
										$("#minusBtn").click(function() {
											var num = $(".numBox").val();
											var minusNum = Number(num) - 1;
											if (minusNum <= 0) {
												$(".numBox").val(num);
											} else {
												$(".numBox").val(minusNum);
											}
										});
										// 장바구니 담기 버튼 클릭
										$("#addCartBtn").click(function() {
											var pro_no = $("#pro_no").val();
											var bag_cnt = $(".numBox").val();
											var data = {pro_no : pro_no,
														bag_cnt : bag_cnt};
											$.ajax({
													url : "${pageContext.request.contextPath}/market/cartInsert",
													type : "post",
													data : data,
													success : function(result) {
														if (result == 1) {
															alert("카드에 담겼습니다");
															$(".numBox").val("1");
														}
													}, error : function() {
														alert("실패");
													}
											})
										})
									</script></td>
							</c:if>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>	<!-- /.row -->
	<!-- 상세보기 -->
	<div>
		<h2>상세정보</h2>
		<div class="col-lg-10">
			<p>${pro.pro_detail }</p>
		</div>
	</div>
</div>

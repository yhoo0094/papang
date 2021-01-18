<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
th {
    min-width: 120px;
    text-align: center;
}
.tableDiv{width: 100%;}
#idTable{width: 100%;}
th>span {
	margin-right: 20px;
	font-size: 20px;
	margin: 30px;
}

td>span {
	font-size: 20px;
	margin: 30px;
}

#plusBtn, #minusBtn {
	border: none;
	background: none;
}
.proInfo{width: 140%;}
.center_div {
    margin: 140px 15% 50px 12%;
    width: 80%;
}
.proDetail {margin-top:130px;width: 1200px;}
h1 {
    font-family:'Jua', sans-serif;
}

.worh{color:rgb(232 80 80);}
.row {background-color: white;margin-right: -85px;}
.mb-4{margin-bottom: 0px!important;}
.col-lg-6{padding:0px;}
.col-lg-10 {flex: 0px;}
.img-fluid {
    max-width: 100%;
    height: 450px;
}
.col-lg-10{background-color: white;max-width: 123.333333%;}
.font-sy{color:#58391c;font-size: 30px;}
#idTable {
    width: 120%;
    height: 290px;
}
.buyDiv,.btnClass{display: inline-block;}
.buyDiv{    height: 90px;width: 120%;}
#addCartBtn{margin: 0 30px 0 40px;}
.numBox{height: 60px; border: none;}
.tableBor{border:1px solid #CCCCCC;}
hr{width: 760px;}
.bMedium {width: 170px;}
</style>
<script>
$(()=>{
	// 장바구니 담기 버튼 클릭
	$("#addCartBtn").click(function() {
		var pro_no = $("#pro_no").val();
		var bag_cnt = $(".numBox").val();
		var data = {pro_no : pro_no,
					bag_cnt : bag_cnt};
		var chk = {pro_no : pro_no}
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/cartCnt?pro_no="+pro_no,
			type : 'get',
			success : function(rs) {
				if (rs != 0) { // 중복있음
					alert("장바구니에 이미 담긴 상품입니다");
				} else {
					// 카드에 담기는거..
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
				}
			},
			error : function() {
				alert("장바구니 담기 실패");
			}
		})
		
	})
	

	
	
	
});
</script>

<div class="container center_div">
	<h1 class="mt-4 mb-3 font-sy" >${pro.pro_name}</h1>
	<div class="row">
			<img class="img-fluid rounded mb-4"
				src="${pageContext.request.contextPath}/resources/images/market/${pro.pro_pic}"
				alt="${pro.pro_name}">
		<div class="col-lg-6 proInfo">
			<p />

			<p />
			<div class="tableDiv">
				<table id="idTable">
					<tbody>
					<tr>
					<c:if test="${!empty admin.ad_id}">
								<td><button type="button" class="btnYellow" id="itemUpdate" onclick="location.href='/papang/market/itemUpdateForm?pro_no=${pro.pro_no}'">수정</button></td>
								<td><button type="button" class="btnRed" id="itemDelete" onclick="location.href='/papang/market/itemDelete?pro_no=${pro.pro_no}'">삭제</button></td>
							</c:if>
					</tr>
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
							<th scope="row"><span>상품재고</span></th>
							<td><c:if test="${pro.pro_cnt != 0}"><span><strong>${pro.pro_cnt}</strong></span></c:if>
							<c:if test="${pro.pro_cnt == 0}"><span class="worh"><strong>재고가 없습니다</strong></span></c:if></td>
						</tr>
						<tr>
							<th scope="row"><span>기업코드</span></th>
							<td><span><strong>${pro.pro_cc}</strong></span></td>
						</tr>
					</tbody>
				<%-- 	<tfoot>
						<tr>
							
							<c:if test="${!empty user.mbr_id and pro.pro_cnt != 0}">
								<td colspan="2"> --%>
									
					<!-- 				<button type="button" id="plusBtn">+</button> 
									<button type="button" id="minusBtn">-</button> -->
									<!-- 이때 max 값을 상품수량.. 입출고를 통해 결정된 총수량.. 글구 input type hidden 으로해서도 한개 정하고 -->
									 <!-- 상품재고보다 적은수만 되게 하는 스크립트 script src="/js/stockBtn.js".. -->
								
									<!-- 이때 장바구니에 이미 들어가있으면 +1 되게하기 button onclick="" --> 
								<!-- 	<script type="text/javascript">
										// 수량 설정
										$("#plusBtn").click(function() {
											var num = $(".numBox").val();
											var plusNum = Number(num) + 1;
											if(plusNum > ${pro.pro_cnt}){
												$(".numBox").val(num);
											} else{
												$(".numBox").val(plusNum);
											}
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
									
									</script> -->
							<%-- 		</td>
							</c:if>
						</tr>
							
					</tfoot> --%>
				</table>
				<hr/>
				<c:if test="${!empty user.mbr_id and pro.pro_cnt != 0}">
				<div>
					<table style="width: 730px;">
						<tr>
							<th scope="row" rowspan="2" style="width: 280px;">
							<input type="hidden" name="pro_no" id="pro_no" value="${pro.pro_no}">
								<span>구입수량</span>
							</th>
							<td class="tableBor" rowspan="2" style="width: 170px;"> 
								<input type="text" class="numBox" min="1" value="1" readonly="true">
							</td>
							<td rowspan="1" class="tableBor">
								<button type="button" id="plusBtn">+</button>
							</td>
							<td rowspan="2">
								<button type="submit" class="btnRed bMedium" id="addCartBtn">장바구니</button>
							</td>
						</tr>
						<tr>
							<td class="tableBor" rowspan="1"><button type="button" id="minusBtn">-</button></td>
	
						</tr>
					</table>
				</div>
				
			<%-- 	<input type="hidden" name="pro_no" id="pro_no" value="${pro.pro_no}">
				<div class="buyDiv">
				구입수량 <input type="text" class="numBox" min="1" value="1" readonly>
				<div>
					<div class="btnClass1">
						<button type="button" id="plusBtn">+</button> 
					</div>
					<div class="btnClass1">
						<button type="button" id="minusBtn">-</button>
					</div>
				</div>
					<div class="btnClass">	
						<button type="submit" class="btnRed bMedium" id="addCartBtn">장바구니</button>
					</div>
					</div> --%>
				</c:if>
			</div>
		</div>
	</div>	<!-- /.row -->
	
	<script>
	// 수량 설정
	 $("#plusBtn").click(function() { 
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;
		if(plusNum > ${pro.pro_cnt}){
			$(".numBox").val(num);
		} else{
			$(".numBox").val(plusNum);
		}
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

	</script>
	
	<!-- 상세보기 -->
	<div class="proDetail" align="center">
	<div align="left">
		<h2>상세정보</h2>
	</div>
		<div class="col-lg-10" >
			<p>${pro.pro_detail }</p>
		</div>
	</div>
</div>

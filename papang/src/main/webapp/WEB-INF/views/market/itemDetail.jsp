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
.numBox{height: 60px; border: none;width: 80px;text-align: center;}
.tableBor{border:1px solid #CCCCCC;}
hr{width: 760px;}
.bMedium {width: 170px; font-size:20px;margin-left: 30px;}
/* table,td,th {border:1px solid black;} */
.tableBor{ width: 10px;text-align: center;}
.allCount{width: 160px;text-align: center;font-size: 20px;font-weight: bold;}
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
							if(confirm("장바구니로 이동하시겠습니까?")){
								location.href="${pageContext.request.contextPath}/marketList/cart"
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
	
// 	// 바로구매 버튼 클릭
// 	$("#directBtn").click(function() {
// 		var pro_no = $("#pro_no").val();
// 		var bag_cnt = $(".numBox").val();
// 		var data = {pro_no : pro_no,
// 					bag_cnt : bag_cnt};
// 		var chk = {pro_no : pro_no}
// 		$.ajax({
// 			url : "${pageContext.request.contextPath}/ajax/cartCnt?pro_no="+pro_no,
// 			type : 'get',
// 			success : function(rs) {
// 				if (rs != 0) { // 중복있음
// 					alert("장바구니에 이미 담긴 상품입니다");
// 				} else {
// 					// 카드에 담기는거..
// 					$.ajax({
// 						url : "${pageContext.request.contextPath}/market/cartInsert",
// 						type : "post",
// 						data : data,
// 						success : function(result) {
// 							if (result == 1) {
// 								$(".numBox").val("1");
// 								location.href="${pageContext.request.contextPath}/marketList/cart"
// 							}
// 						}, error : function() {
// 							alert("실패");
// 						}
// 					})
// 				}
// 			},
// 			error : function() {
// 				alert("장바구니 담기 실패");
// 			}
// 		})
// 	})
});
</script>

<div class="container center_div">
	<h1 class="mt-4 mb-3 font-sy" >${pro.pro_name}</h1>
	<div class="row">
			<img class="img-fluid rounded mb-4"
				src="${pageContext.request.contextPath}/resources/images/market/${pro.pro_pic}" alt="${pro.pro_name}">
		<div class="col-lg-6 proInfo">
			<p />

			<p />
			<div class="tableDiv">
				<table id="idTable">
					<tbody>
					<tr>
						<c:if test="${!empty admin.ad_id}">
								<td colspan="2" align="right"><button type="button" class="bMedium btnYellow" id="itemUpdate" onclick="location.href='/papang/market/itemUpdateForm?pro_no=${pro.pro_no}'">수정</button>
								<button type="button" class="bMedium btnGray" id="itemDelete">삭제</button>
								<button type="button" class="bMedium btnRed" onclick="location.href='/papang/admin/warehousing?pro_no=${pro.pro_no}&pro_name=${pro.pro_name}'">입고하기</button></td>
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
							<td><span><strong>${pro.pro_no}</strong></span>
							<input type="hidden" name="pro_no" id="pro_no" value="${pro.pro_no}"></td>
						</tr>
						<tr>
							<th scope="row"><span>상품재고</span></th>
							<td><c:if test="${pro.pro_cnt != 0}"><span><strong>${pro.pro_cnt}</strong></span></c:if>
							<c:if test="${pro.pro_cnt == 0}"><span class="worh"><strong>재고가 없습니다</strong></span></c:if>
							<input type="hidden" value="${pro.pro_cnt}" id="pro_cnt"></td>
						</tr>
						<tr>
							<th scope="row"><span>기업명</span></th>
							<td><span><strong>${pro.pro_cn}</strong></span></td>
						</tr>
					</tbody>
				</table>
				<hr/>
				<c:if test="${!empty user.mbr_id and pro.pro_cnt != 0}">
				<div>
					<table style="width: 740px;">
						<tr>
							<th scope="row" rowspan="2" style="width: 120px;">
								<span>구입수량</span>
							</th>
							<td class="tableBor" rowspan="2"> 
								<input type="text" class="numBox" min="1" value="1" readonly>
							</td>
							<td rowspan="1" class="tableBor">
								<button  type="button" id="plusBtn">+</button>
							</td>
							<td rowspan="2" class="allCount">
								 <button type="submit" class="btnRed bMedium" id="addCartBtn">장바구니</button> 
							</td>
						</tr>
						<tr>
							<td class="tableBor" rowspan="1"><button type="button" id="minusBtn">-</button></td>
						</tr>
					</table>
				</div>
				</c:if>
			</div>
		</div>
	</div>	<!-- /.row -->
	
	<script>
	// 수량 설정
	 $("#plusBtn").click(function() { 
		var pro_cnt = $("#pro_cnt").val();
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;
		if(plusNum > pro_cnt){
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
	// 삭제
	$("#itemDelete").click(function() { 
		var pro_no = $("#pro_no").val();
		if(confirm("상품을 삭제하시겠습니까?")){
			location.href='/papang/market/itemDelete?pro_no='+pro_no;
		}
	})
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

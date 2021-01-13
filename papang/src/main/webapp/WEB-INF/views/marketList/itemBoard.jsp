<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
#lnb {
	margin-left: 50px;
	width: 20%;
}
.noDepth>a {
	align 
}
/*.h-100>a {
	min-height: 300px;
 	max-height: 300px;
	overflow: hidden;
} */
.card-img-top {
	width: 100%;
 	height: 300px;
	display: block;
/* 	border-radius: 10px; */
/* 	-webkit-transform: translate(50%, 50%); */
/* 	-ms-transform: translate(50%, 50%); */
/* 	transform: translate(50%, 50%); */
/* 	padding-top: 100%; */
/* 	position: relative; */
	
}
thead, .dataTables_length{
	display: none;
}

.marketTableTr {
	display: inline;
	width: 50%;
	padding: 6px;
	border-radius: 10px;
}
.marketTableTr>td {
    width: 260px;
}

</style>

<div class="container center_div">
	<h2>전체 상품</h2>
	<div align="right">
		<c:if test="${!empty admin.ad_id}">
			<button type="button" class="btnYellow bMedium"
				onclick="location.href='/papang/market/itemInsertForm'">상품등록</button>
		</c:if>
	</div>
	<a href="${pageContext.request.contextPath}/marketList/itemBoardPriceDesc">가격 높은순</a>
	<div id="marketListBoard">
		<table class="table" id="dataTable">
			<thead>
				<tr>
					<th>r</th>
					<th>r</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pro" items="${ pro }">
				<c:if test="${ !empty pro.pro_cnt }">
					<tr class="marketTableTr">
					<td style="display: none; width: 0px"><p>${pro.pro_no}</p></td>
						<td><p style="display: none">${pro.pro_no}</p>
							<div class="portfolio-item">
								<div class="card h-100 strongYellow">
									<a href="../market/itemDetail?pro_no=${pro.pro_no}"><img
										class="card-img-top"
										src="${pageContext.request.contextPath}/resources/images/market/${pro.pro_pic}"></a>
									<div class="card-body">
									<c:if test="${pro.pro_cnt == 0}">
									<font style="color: red;">품절</font>
									</c:if>
										<h4 class="card-title">
											<a href="../market/itemDetail?pro_no=${pro.pro_no}">${pro.pro_name}</a>
										</h4>
										<p class="card-text">${pro.pro_price}</p>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

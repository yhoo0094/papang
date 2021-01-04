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
.h-100>a {
	min-height: 300px;
/* 	max-height: 300px; */
	overflow: hidden;
}
.card-img-top {
	width: 100%;
 	height: auto;
	display: block;
/* 	border-radius: 10px; */
/* 	-webkit-transform: translate(50%, 50%); */
/* 	-ms-transform: translate(50%, 50%); */
/* 	transform: translate(50%, 50%); */
/* 	padding-top: 100%; */
/* 	position: relative; */
	
}
thead, .marketTable_filter, .marketTables_length{
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
	
	<div id="marketListBoard">
		<table class="table" id="marketTable">
			<thead>
				<tr>
					<th class="tableTh">r</th>
					<th class="tableTh">r</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pro" items="${ pro }">
					<tr class="marketTableTr">
					<td style="display: none; width: 0px"><p>${pro.pro_no}</p></td>
						<td><p style="display: none">${pro.pro_no}</p>
							<div class="portfolio-item">
								<div class="card h-100 strongYellow">
									<a href="../market/itemDetail?pro_no=${pro.pro_no}"><img
										class="card-img-top"
										src="${pageContext.request.contextPath}/images/${pro.pro_pic}"></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="../market/itemDetail?pro_no=${pro.pro_no}">${pro.pro_name}</a>
										</h4>
										<p class="card-text">${pro.pro_price}</p>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="right">
		<button type="button"
			onclick="location.href='/papang/market/itemInsertForm'">등록</button>
	</div>
</div>

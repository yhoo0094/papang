<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
.card-img-top {
	width: 100%;
	height: auto;
	display: block;
	border-radius: 10px;
}
thead, .dataTable_filter, .dataTables_length{
	display: none;
}

.dataTableTr {
	display: inline;
	width: 50%;
	padding: 6px;
	border-radius: 10px;
}
.dataTableTr>td {
    width: 260px;
}

</style>
<script type="text/javascript">

</script>
<div class="container center_div">
	<h2>전체 상품</h2>
	
	<div id="divForEntryNum">
<!-- 	<div class="col-sm-12 col-md-12"> -->
<!-- 	<div id="dataTable_filter" class="dataTables_filter" align="right"> -->
<!-- 	<label for="search"> -->
<!-- 	검색:  -->
<!-- 	<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"> -->
<!-- 	</label> -->
<!-- 	</div> -->
<!-- 	</div> -->
		<table class="table" id="dataTable">
		
			<thead>
				<tr>
					<th>가</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pro" items="${ pro }">
					<tr class="dataTableTr">
						<td>

							<div class="portfolio-item">
								<div class="card h-100 strongYellow">
									<a href="../market/itemDetail?pro_no=${pro.pro_no}"><img
										class="card-img-top"
										src="${pageContext.request.contextPath}/resources/images/${pro.pro_pic}"></a>
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

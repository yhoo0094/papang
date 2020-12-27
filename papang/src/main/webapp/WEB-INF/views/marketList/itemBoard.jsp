<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
img { max-width: 300px; height: auto; }
</style>
<script type="text/javascript">
/* 	$(function() {
		itemList();
	})
	function itemList() {

	} */
</script>
<div class="container center_div">
	<h2>전체 상품</h2>

	<div class="row">
<!-- row 를 고정해주고 얘한테 ajax로 append 혹은 c:forEach -->
	<c:forEach var="pro" items="${ pro }">
		<div class="col-lg-4 col-sm-6 portfolio-item">
			<div class="card h-100">
				<a href="market/itemDetail?pro_no=${pro.pro_no}"><img class="card-img-top"
					src="${pageContext.request.contextPath}/resources/images/${pro.pro_pic}"></a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="market/itemDetail?pro_no=${pro.pro_no}">${pro.pro_name}</a>
					</h4>
					<p class="card-text">${pro.pro_price}</p>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
	<div align="right"><button type="button" onclick="">등록</button></div>
</div>

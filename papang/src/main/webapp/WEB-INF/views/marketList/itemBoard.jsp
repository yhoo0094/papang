<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- %@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" -->



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
		<div class="col-lg-4 col-sm-6 portfolio-item">
			<div class="card h-100">
				<a href="#"><img class="card-img-top"
					src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="#">상품명</a>
					</h4>
					<p class="card-text">본문</p>
				</div>
			</div>
		</div>
	</div>
	<div align="right"><button type="button" onclick="">등록</button></div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container center_div">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">
		<small>상품명 </small> ${pro.pro_name}
	</h1>
	<!-- 관리자일때만 수정/삭제버튼 모양새를 하이퍼링크로 할지 아니면 버튼으로 할지 골라 -->
	<!-- c:if test='${!empty ad_id}'-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="market/itemUpdateForm?pro_no=${pro.pro_no}">수정</a></li>
			<li class="breadcrumb-item active"><a href="market/itemDelete?pro_no=${pro.pro_no}">삭제</a></li>
		</ol>
	<!-- /c:if -->
	<!-- Intro Content -->
	<div class="row">
		<div class="col-lg-6">
			<img class="img-fluid rounded mb-4"
				src="${pageContext.request.contextPath}/resources/images/${pro.pro_pic}"
				alt="${pro.pro_name}">
		</div>
		<div class="col-lg-6">
			<p />
			<h2>${pro.pro_name}</h2>
			<p />
			<div>
				<table>
					<tbody>
						<tr>
							<th scope="row"><span>판매가</span></th>
							<td><span><strong>${pro.pro_price}원</strong></span></td>
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
						<tr><!-- ${empty ad_id} &&  -->
							<td>
							<c:if test="${!empty user.mbr_id}">
								<button type="button" class="btn" id="buynow">결제</button>
							</c:if>
							<c:if test="${empty user.mbr_id}">
								<button type="button" class="btn" id="itemUpdate">수정</button>
							</c:if>
							</td>
							<td>
							<!-- 이때 장바구니에 이미 들어가있으면 +1 되게하기 -->
							<c:if test="${!empty user.mbr_id}">
								<button type="button" class="btn" id="cart">장바구니</button> <!-- 이때 장바구니에 이미 들어가있으면 +1 되게하기 -->
							</c:if>
							<c:if test="${empty user.mbr_id}">
								<button type="button" class="btnRed" id="itemDelete">삭제</button>
							</c:if>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<!-- /.row -->
	<!-- 상세보기 -->
	<div>
		<h2>상세정보</h2>
		<div class="col-lg-10">
			<img class="img-fluid rounded mb-4"
				src="http://placehold.it/1200x1000" alt="">
				<p>${pro.pro_detail }</p>
		</div>
	</div>

	<!-- Team Members -->
	<h2>이거 필요없ㅇ르거같은디</h2>

	<div class="row">
		<div class="col-lg-4 mb-4">
			<div class="card h-100 text-center">
				<img class="card-img-top" src="http://placehold.it/750x450" alt="">
				<div class="card-body">
					<h4 class="card-title">Team Member</h4>
					<h6 class="card-subtitle mb-2 text-muted">Position</h6>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio
						officiis odit.</p>
				</div>
				<div class="card-footer">
					<a href="#">name@example.com</a>
				</div>
			</div>
		</div>
		<div class="col-lg-4 mb-4">
			<div class="card h-100 text-center">
				<img class="card-img-top" src="http://placehold.it/750x450" alt="">
				<div class="card-body">
					<h4 class="card-title">Team Member</h4>
					<h6 class="card-subtitle mb-2 text-muted">Position</h6>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio
						officiis odit.</p>
				</div>
				<div class="card-footer">
					<a href="#">name@example.com</a>
				</div>
			</div>
		</div>
		<div class="col-lg-4 mb-4">
			<div class="card h-100 text-center">
				<img class="card-img-top" src="http://placehold.it/750x450" alt="">
				<div class="card-body">
					<h4 class="card-title">Team Member</h4>
					<h6 class="card-subtitle mb-2 text-muted">Position</h6>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio
						officiis odit.</p>
				</div>
				<div class="card-footer">
					<a href="#">name@example.com</a>
				</div>
			</div>
		</div>
	</div>

</div>

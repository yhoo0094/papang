<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
body {
	margin: 120px;
}
</style>
<div class="container center_div">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">
		<small>카테고리명</small> 상품명
	</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.html">Home</a></li>
		<li class="breadcrumb-item active">About</li>
	</ol>

	<!-- Intro Content -->
	<div class="row">
		<div class="col-lg-6">
			<img class="img-fluid rounded mb-4" src="http://placehold.it/500x600"
				alt="">
		</div>
		<div class="col-lg-6">
		<div>
		<!-- 관리자 아이디가 따로 있으니까 c:if 에서 admin의 id값이 비지 않았을때 보는걸로 하면..될듯..?? -->
		<c:if test='${!empty ad_id}'>
		<button type="button" class="btn" id="itemUpdate">수정</button>
		<button type="button" class="btn" id="itemDelete">삭제</button>
		</c:if>
		</div>
			<p />
			<h2>상품명</h2>
			<p />
			<div>
				<table>
					<tbody>
						<tr>
							<th scope="row"><span>판매가</span></th>
							<td><span><strong>0,000원</strong></span></td>
						</tr>
						<tr>
							<th scope="row"><span>상품번호</span></th>
							<td><span><strong>123456</strong></span></td>
						</tr>
						<tr>
							<th scope="row"><span>기업명</span></th>
							<td><span><strong>파팡</strong></span></td>
						</tr>
					</tbody>

				</table>

			</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed
				voluptate nihil eum consectetur similique? Consectetur, quod,
				incidunt, harum nisi dolores delectus reprehenderit voluptatem
				perferendis dicta dolorem non blanditiis ex fugiat.</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Saepe, magni, aperiam vitae illum voluptatum aut sequi impedit non
				velit ab ea pariatur sint quidem corporis eveniet. Odit, temporibus
				reprehenderit dolorum!</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et,
				consequuntur, modi mollitia corporis ipsa voluptate corrupti eum
				ratione ex ea praesentium quibusdam? Aut, in eum facere corrupti
				necessitatibus perspiciatis quis?</p>
		</div>
	</div>
	<!-- /.row -->

	<!-- Team Members -->
	<h2>Our Team</h2>

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
	<!-- /.row -->

	<!-- Our Customers -->
	<h2>Our Customers</h2>
	<div class="row">
		<div class="col-lg-2 col-sm-4 mb-4">
			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
		</div>
		<div class="col-lg-2 col-sm-4 mb-4">
			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
		</div>
		<div class="col-lg-2 col-sm-4 mb-4">
			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
		</div>
		<div class="col-lg-2 col-sm-4 mb-4">
			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
		</div>
		<div class="col-lg-2 col-sm-4 mb-4">
			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
		</div>
		<div class="col-lg-2 col-sm-4 mb-4">
			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
		</div>
	</div>
	<!-- /.row -->
</div>

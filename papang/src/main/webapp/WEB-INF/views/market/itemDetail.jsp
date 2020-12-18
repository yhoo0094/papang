<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>

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
				<%-- 		<c:if test='${!empty ad_id}'> --%>
				<button type="button" class="btnRed" id="itemUpdate">수정</button>
				<button type="button" class="btnRed" id="itemDelete">삭제</button>
				<!-- 		</c:if> -->
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
					<tfoot>
						<tr>
							<td>
								<button type="button" class="btn" id="buynow">결제</button>
							</td>
							<td>
								<button type="button" class="btn" id="cart">장바구니</button> <!-- 이때 장바구니에 이미 들어가있으면 +1 되게하기 -->
							</td></tr>
					
						</tfoot>
				</table>

			</div>
			<p>뭐 더 쓸 내용없는데</p>
			<p>이 수많은 빈칸을 우야노</p>
			<p>흠냐..</p>
			<p>버튼을 위에 테이블에 같이둘지, 아래에 p태그 밑에 따로 둘지도 고민이야</p>
<p>		<button type="button" class="btnRed" id="buynow">결제</button>
			</p>
<p>		<button type="button" class="btnYellow" id="cart">장바구니</button>
			</p>
<!-- 이때 장바구니에 이미 들어가있으면 +1 되게하기 -->
		</div>
	</div>
	<!-- /.row -->
<!-- 상세보기 -->
<div>
<h2>상세정보</h2>
<div class="col-lg-10">
			<img class="img-fluid rounded mb-4"
				src="http://placehold.it/1200x1000" alt="">
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
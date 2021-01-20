<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin</title>
<link
	href="${pageContext.request.contextPath}/resources/admin/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<!-- font  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<style>
body{
width : 90%;
margin: 0 0 0 5%;
}
*{font-family: 'Noto Sans KR', sans-serif;}

.buttonclass {
	box-shadow: 0px 0px 0px 2px #9fb4f2;
	background:linear-gradient(to bottom, #172e57 5%, #476e9e 100%);
	background-color:#172e57;
	border-radius:10px;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
	padding:7px 8px;
	text-decoration:none;
	text-shadow:0px 1px 0px #283966;
}
.buttonclass:hover {
	background:linear-gradient(to bottom, #476e9e 5%, #172e57 100%);
	background-color:#476e9e;
}
.buttonclass:active {
	position:relative;
	top:1px;
}




</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">papang</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			
		</form>
		<!-- Navbar-->
		
		
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/">papang 페이지</a> 
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/sittermember">시터/회원 관리 페이지</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin">
							<div class="sb-nav-link-icon">
								<i class="fas fa-house-user"></i>
							</div> Home
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/nqInsert">
							<div class="sb-nav-link-icon">
								<i class="fas fa-exclamation"></i>
							</div>  공지사항 관리
						</a>
						
						 <a class="nav-link collapsed" href="" data-toggle="collapse"
							data-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="far fa-address-card"></i>
							</div> 시터/회원 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="${pageContext.request.contextPath}/admin/sittermember">시터/회원
									관리</a> <a class="nav-link"
									href="${pageContext.request.contextPath}/admin/sitterSchedule">시터
									월급 관리</a>
							</nav>
						</div>

						 <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/banner">
							<div class="sb-nav-link-icon">
								<i class="fab fa-accusoft"></i>
							</div> 배너 관리
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/warehousing">
							<div class="sb-nav-link-icon">
								<i class="fas fa-boxes"></i>
							</div> 재고 관리
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/report">
							<div class="sb-nav-link-icon">
								<i class="fas fa-flag"></i>
							</div> 신고 관리
						</a>



						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/sitterChart">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 시터 매출 현황
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/productChart">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 장터 매출 현황
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">대구광역시 중구 국채보상로 537 5층  |   대표번호 : (053)421-2460 |  사업자번호 : 573-33-00097  | </div>
					
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">

					<tiles:insertAttribute name="body" />
					<!-- body -->

				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid"></div>
			</footer>
		</div>
	</div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/js/scripts.js"></script>

<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

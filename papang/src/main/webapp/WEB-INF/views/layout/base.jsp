<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>papang</title>

<!-- Bootstrap core CSS -->
<!-- <link
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">

<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script> -->	

<link href="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/main/css/modern-business.css"
	rel="stylesheet">

<!-- 게시판 css -->
<link
	href="${pageContext.request.contextPath}/resources/main/css/normal.css"
	rel="stylesheet">

<!-- 파일업로드 nqInsertReg.jsp -->
<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">
<style>
/* 레이아웃 */
.fixed-top {
	height: 100px;
	background-color: rgb(249, 196, 94);
}

body {
	background-color: #fff5d2;
}

.py-5 {
	background-color: rgb(249, 196, 94);
	position: static;
	display: block;
	bottom: 0%;
	width: 100%;
}

html {
	font-family: 'Spoqa Han Sans', sans-serif;
}
/* 버튼css */
.btnYellow {
	background-color: rgb(249, 196, 94);
	border: none;
}

.btnRed {
	background-color: #ff8080;
	border: none;
}

.btnGray {
	background-color: #bbbbbb;
	border: none;
}

.bSamll {
	width: 70px;
	height: 30px;
}

.bMedium {
	width: 150px;
	height: 60px;
	font-weight: bold;
}

.bBig {
	width: 200px;
	height: 120px;
	font-weight: bold;
}

.fcolor {
	color: #444;
	font-weight: bold;
}

.center_div {
	min-height: 690px;
	display: block;
	margin: 140px 15% 50px 15%;
	width: 70%;
}

.bannderImg{
	float: right;
	width: 10%;
	height: 700px;
	margin-top: 3%;
	margin-right: 10px;
}

/* .naviClass, .banner_div, .center_div{
	display: block;
} */

/* 공용css */
	/* 헤더에 있는 진한 주황색 */
	.strongYellow {background-color: rgb(249, 196, 94);}
	/* 배경에 연한 노란색 */
	.background {background-color: #fff5d2;}
	/* 흰배경 */
	.whiteBackground{background-color: white;}

.custom-select, .form-control {
	display: inline;
	width: auto;
}

</style>
</head>

<body>
	<div class="naviClass">
		<!-- Navigation -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark">
			<div class="container">
				<a class="navbar-brand" href="index.html">Start Bootstrap</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="about.html">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="services.html">Services</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Portfolio </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="portfolio-1-col.html">1
									Column Portfolio</a> <a class="dropdown-item"
									href="portfolio-2-col.html">2 Column Portfolio</a> <a
									class="dropdown-item" href="portfolio-3-col.html">3 Column
									Portfolio</a> <a class="dropdown-item" href="portfolio-4-col.html">4
									Column Portfolio</a> <a class="dropdown-item"
									href="portfolio-item.html">Single Portfolio Item</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Blog </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdownBlog">
								<a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
								<a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
								<a class="dropdown-item" href="blog-post.html">Blog Post</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPages" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Other Pages </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdownPages">
								<a class="dropdown-item" href="full-width.html">Full Width
									Page</a> <a class="dropdown-item" href="sidebar.html">Sidebar
									Page</a> <a class="dropdown-item" href="faq.html">FAQ</a> <a
									class="dropdown-item" href="404.html">404</a> <a
									class="dropdown-item" href="pricing.html">Pricing Table</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<tiles:insertAttribute name="left" />
	<tiles:insertAttribute name="banner" />
	<div class="center_div">
		<tiles:insertAttribute name="body" />
	</div>
	
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/main/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- 페이지네이션 날로먹는 빌드 시작 -->
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/assets/demo/datatables-demo.js"></script>
	<!-- 페이지네이션 날로먹는 빌드 끝 -->
	
	<script type="text/javascript">
		$(()=>{
			$("#dataTable_filter").attr("align","right");
			$("#dataTable_length").attr("align","left");
			$("#divForEntryNum .custom-select").empty();
			$("#divForEntryNum .custom-select").append("<option value='3'>3</option>");
			$("#divForEntryNum .custom-select").append("<option value='6' selected='selected'>6</option>");
			$("#divForEntryNum .custom-select").trigger("onchange");
			$("#divForEntryNum .custom-select").trigger("onclick");
		})
	</script>
</body>

</html>

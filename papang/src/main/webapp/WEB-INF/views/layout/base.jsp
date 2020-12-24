<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>papang</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Custom styles for this template(메인페이지 BX슬라이더) -->
<link href="${pageContext.request.contextPath}/resources/main/css/modern-business.css" rel="stylesheet"> 

 <%-- <!-- 파일업로드 nqInsertReg.jsp -->
<script src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">
 --%>
<!-- font  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<!-- 써머노트 -->
<script src="${pageContext.request.contextPath}/resources/json.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">

<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/resources/main/css/normal.css" rel="stylesheet">
<style>
/* 레이아웃 */
.fixed-top {height: 100px;background-color: rgb(249, 196, 94);}
body {background-color: #fff5d2;}
.py-5 {background-color: rgb(249, 196, 94);position: static;display: block;bottom: 0%;width: 100%;}
* {font-family: 'Jua', sans-serif;}
/* 버튼css */
.btnYellow {background-color: rgb(249, 196, 94);border: none;}

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
	min-height: 750px;
	display: block;
	margin: 140px 15% 50px 15%;
	width: 70%;
}

.main_div {
	display: block;
	margin: 100px 0 50px 0;
}

.bannderImg{
	float: right;
	width: 10%;
	height: 700px;
	margin-top: 3%;
	margin-right: 10px;
}

.papanglogo{
	width: 90px;
    height: 90px;
    border-radius: 10px;
}

#navbarResponsive{
	font-size: 30px;
}

.navbar-dark .navbar-nav .nav-link {
    color: #fff5d2;
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
.util{
    display: block;

}
.util .right{
	display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 12px;
}
a.item {
	padding: 0 0.6em;
    border-right: 1px solid #f2efea;
    height: 1em;
    line-height: 1em;
}

</style>
</head>

<body>
<div class="util">
<div class="util right" align="right">
<c:if test='${empty mbr_id}'>
	<a class="item" href="${pageContext.request.contextPath}/member" onfocus="blur()">
	회원가입&nbsp;</a>
</c:if>
<c:if test='${empty mbr_id}'>
	<a href="${pageContext.request.contextPath}/loginForm" onfocus="blur()">
	로그인&nbsp;</a>
</c:if>
<c:if test='${!empty mbr_id}'>
	<a href="${pageContext.request.contextPath}/mypage/myhome" onfocus="blur()">
	마이페이지&nbsp;</a>
</c:if>
<c:if test='${!empty mbr_id}'>
	<a href="${pageContext.request.contextPath}/marketList/cart" onfocus="blur()">
	장바구니&nbsp;</a>
</c:if>
<c:if test='${!empty mbr_id}'>
	<a href="${pageContext.request.contextPath}/logout" onfocus="blur()">
	로그아웃&nbsp;</a>
</c:if>
</div>
</div>

	<div class="naviClass">

		<!-- Navigation -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img class="papanglogo" alt="로고" src="${pageContext.request.contextPath}/resources/images/new_logo2.png"> </a>
				<div class="collapse navbar-collapse" id="navbarResponsive" align="center">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/communityBoard">커뮤니티</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/marketList/itemBoard">장터</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">자장가</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">활동</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">육아서적</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/sitterBoard">베이비시터</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Q&A</a>
						</li>
						<!-- <li class="nav-item dropdown"><a
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
							</div></li> -->
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<tiles:insertAttribute name="left" />
	<tiles:insertAttribute name="banner" />
	<div class="main_div">
		<tiles:insertAttribute name="main" />
	</div>
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
			/*$("#divForEntryNum .custom-select").empty();
			$("#divForEntryNum .custom-select").append("<option value='10'>10</option>");
			$("#divForEntryNum .custom-select").trigger("change"); */
		})
	</script>
	
</body>

</html>

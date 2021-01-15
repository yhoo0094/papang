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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>
/* 레이아웃 */
.fixed-top {height: 100px;background-color: rgb(249, 196, 94);}
body {background-color: #fff5d2;}
.py-5 {background-color: rgb(249, 196, 94);position: static;display: block;bottom: 0%;width: 100%;}
*{font-family: 'Jua', sans-serif;}


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

.topnav {
    width: 60px;
    height: 60px;
    margin: 0 0 0 280px;
}

.card-body {
    height: 200px;
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


/* main css*/
	@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
figure.snip1200 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 220px;
  max-width: 310px;
  max-height: 310px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 16px;
}
figure.snip1200 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}
figure.snip1200 img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}
figure.snip1200 figcaption {
  position: absolute;
  top: 45%;
  left: 7%;
  right: 7%;
  bottom: 45%;
  border: 1px solid white;
  border-width: 1px 1px 0;
}
figure.snip1200 .heading {
  overflow: hidden;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
  position: absolute;
  bottom: 0;
  width: 100%;
}
figure.snip1200 h2 {
  display: table;
  margin: 0 auto;
  padding: 0 10px;
  position: relative;
  text-align: center;
  width: auto;
  text-transform: uppercase;
  font-weight: 400;
}
figure.snip1200 h2 span {
  font-weight: 800;
}
figure.snip1200 h2:before,
figure.snip1200 h2:after {
  position: absolute;
  display: block;
  width: 1000%;
  height: 1px;
  content: '';
  background: white;
  top: 50%;
}
figure.snip1200 h2:before {
  left: -1000%;
}
figure.snip1200 h2:after {
  right: -1000%;
}
figure.snip1200 p {
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  position: absolute;
  width: 100%;
  padding: 0 20px;
  margin: 0;
  opacity: 0;
  line-height: 1.6em;
  font-size: 1.1em;
}
figure.snip1200 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}
figure.snip1200:hover img,
figure.snip1200.hover img {
  opacity: 0.25;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
figure.snip1200:hover figcaption,
figure.snip1200.hover figcaption {
  top: 7%;
  bottom: 7%;
}
figure.snip1200:hover p,
figure.snip1200.hover p {
  opacity: 1;
  -webkit-transition-delay: 0.35s;
  transition-delay: 0.35s;
}

figure.snip1200 img {
    height: 340px;
}
figure.snip1200 {
max-width: 340px;
max-height: 340px;
}	
.my-4 {
    margin-top: 3.8rem!important;
    color: rgb(64, 60, 60);
}
.fontTitle {margin: 40px 0 20px 0;color:rgb(64, 60, 60);font-size: 2rem;}
.card-img-top {height: 300px;}
.btn:focus {
    box-shadow: none;
}
.card-body {
    height: 100px;
}

.card-text{color: #fa91a2;}
.card_title2, .card-title{color: rgb(64, 60, 60);}
.pro_no{display: none;}
.card_title2:hover{color: #fa91a2;text-decoration: none;}
</style>
<script type="text/javascript">
	$(function() {
		
		if($('#aid').val() != null && $('#aid').val() != ''){
			alarmlist();
			alarmUpdate()
		}
		
			
		
		// console.log('테스트');
	});
	
	function alarmUpdate() {
		//수정 버튼 클릭
		var aid = $('#aid').val();
		$('#findPop').on('show.bs.modal', function (e) {
     
			$.ajax({
				url : "${pageContext.request.contextPath}/alarm",
				type : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					mbr_id : aid
				}),
				contentType : 'application/json',
				success : function(data) {
					$('#alarmcount').html(0);
				},
				error : function(xhr, status, message) {
					
				}
			});
			console.log($(this).val());
			
		});
	}
	//사용자 목록 조회 요청
	function alarmlist() {
	var aid = $('#aid').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/alarm',
			type : 'GET',
			data: {mbr_id : aid},
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : alarmlistResult
		});
	}//userList

	//사용자 목록 조회 응답
	function alarmlistResult(data) {
	
	$.each(data, function(idx, item) {
		$('<tr>').append($('<td>').html(item.arm_content)).append(
				$('<td>').html(item.arm_date + '일전')).append(	
						$('<input type=\'hidden\' id=\'hidden_arm_no\'>')
								.val(item.arm_no)).appendTo('#modaltable tbody');
				$('#alarmcount').html(item.arm_count);
	});
	}
	

	
	
	</script>
</head>

<body>


	<div class="naviClass">

		<!-- Navigation -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img class="papanglogo" alt="로고" src="${pageContext.request.contextPath}/resources/images/new_logo2.png"> </a>
				<div class="collapse navbar-collapse" id="navbarResponsive" align="center">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/community/board">커뮤니티</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/marketList/itemBoard">장터</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/activity/playList">놀이</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/activity/cookList">요리</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/vaccination/vaccinationList">예방접종</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/sitter/board">베이비시터</a>
						</li>
					</ul>
				</div>
				<div class="util right" align="right" style="margin-bottom: 70px">
<c:if test='${!empty admin.ad_id}'>
	<a class="item" href="${pageContext.request.contextPath}/admin" onfocus="blur()">
	관리자페이지로 이동</a>
</c:if>
  <button type="button"  style="margin-right: 30px;" id="findBtn" data-toggle="modal" data-target="#findPop"><img src="${pageContext.request.contextPath}/resources/images/login/bell1.png" style="width:20px;border: none"></img></button>
  <label id='alarmcount' style="left: 170 px ">0</label>
 
<c:if test='${empty user.mbr_id and empty admin.ad_id}'>
	<a class="item" href="${pageContext.request.contextPath}/member/joinForm" onfocus="blur()">
	회원가입</a>
</c:if>
<c:if test='${empty user.mbr_id and empty admin.ad_id}'>
	<a href="${pageContext.request.contextPath}/member/loginForm" onfocus="blur()">
	로그인</a>
</c:if>
<c:if test='${!empty user.mbr_id}'>
	<a class="item" href="${pageContext.request.contextPath}/mypage/myhome" onfocus="blur()">
	마이페이지</a>
</c:if>
<c:if test='${!empty user.mbr_id}'>
	<a class="item" href="${pageContext.request.contextPath}/marketList/cart" onfocus="blur()">
	장바구니</a>
</c:if>
<c:if test='${!empty user.mbr_id or !empty admin.ad_id}'>
	<a href="${pageContext.request.contextPath}/member/logout" onfocus="blur()">
	로그아웃</a>
</c:if>
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
		<input type='hidden' value='${user.mbr_id}' id='aid'>
	</div>
	
	<!-- /.container -->
	
	
   <div class="modal" id="findPop">
      <div class="modal-dialog modal-dialog-scrollable">
         <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
               <h1 class="modal-title">알림</h1>
               <button type="button" class="close" data-dismiss="modal">×</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" align="center">
             <table id='modaltable'>
             <tbody></tbody>
             </table>
            </div>
         </div>
      </div>
   </div>


	
	
	
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
		src="${pageContext.request.contextPath}/resources/main/js/datatables-demo.js"></script>
	<!-- 페이지네이션 날로먹는 빌드 끝 -->
	
	<script type="text/javascript">
		$(()=>{
 			$("#dataTable_filter").attr("align","right");
			$("#dataTable_length").attr("align","left");
			
/*			$("#divForEntryNum .custom-select").empty();
			$("#divForEntryNum .custom-select").append("<option value='10'>10</option>");
			$("#divForEntryNum .custom-select").trigger("change");
			
			$("#communityBoardTable .tableTh:eq(0)").trigger("click"); */
		})
	</script>
	<script src="${pageContext.request.contextPath}/js/sangmin.js"></script>
	<script src="${pageContext.request.contextPath}/js/play.js"></script>
	<script src="${pageContext.request.contextPath}/js/market.js"></script>
	
	
</body>

</html>

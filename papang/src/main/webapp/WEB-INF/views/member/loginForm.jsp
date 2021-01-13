<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>
img.loginpage {
	max-width: 40px;
	height: auto;
}

a.loginpage {
	/* 	font-family: Ubuntu-Regular; */
	font-size: 14px;
	line-height: 1.7;
	color: #666666;
	margin: 0px;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
}

a.loginpage:focus {
	outline: none !important;
}

a.loginpage:hover {
	text-decoration: none;
	color: #fff;
}

p.loginpage {
	/* 	font-family: Ubuntu-Regular; */
	font-size: 14px;
	line-height: 1.7;
	color: #666666;
	margin: 0px;
}

</style>
<script type="text/javascript">
	function findIdCheck() {
		var frm1 = document.frm1;
		if (frm1.name.value == "") {
			alert("이름을 입력하세요");
			frm1.name.focus();
			return false;
		}
		if(frm1.email.value == "") {
			alert ("이메일 주소를 입력하세요");
			frm1.email.focus();
			return false;
		}
		else {
			var mbr_name = $("#name").val();
			var mbr_email = $("#email").val();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/findId",
				data : {
					"mbr_name" : mbr_name,
					"mbr_email" : mbr_email
				},
				error:function(xhr,status,msg){
					alert("존재하지 않는 회원입니다");
				}, success : function (result){
					var id = result;
					alert("아이디는 " + result + " 입니다");
				}
			});
			return false;
		}
	}
	function findPwCheck() {
		var frm2 = document.frm2;
		if(frm2.id2.value == "") {
			alert ("아이디를 입력하세요");
			frm2.id2.focus();
			return false;
		}
		if (frm2.email2.value == "") {
			alert("이메일을 입력하세요");
			frm2.email2.focus();
			return false;
		}
		else {
			var mbr_id = $("#id2").val();
			var mbr_email = $("#email2").val();

			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/findPw",
				data : {
					"mbr_id" : mbr_id,
					"mbr_email" : mbr_email,
				},
				dataType : "json",
				error:function(xhr,status,msg){
					alert("존재하지 않는 회원입니다");
				}, success : function (result){
					alert("이메일이 전송되었습니다");
				}
			})
			return false;
		}
	}
</script>
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #fff5d2;">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41"> 로그인 </span>
				<p class="loginpage" align="right">
					<a class="loginpage"
						href="${pageContext.request.contextPath}/member/adminLoginForm">관리자로그인</a>
				</p>
				<form class="login100-form validate-form p-b-33 p-t-5" id="frm"
					name="frm" method="post"
					action="${pageContext.request.contextPath}/member/login">

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="mbr_id"
							placeholder="아이디"> <span class="focus-input100"
							data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" name="mbr_pw"
							placeholder="비밀번호"> <span class="focus-input100"
							data-placeholder="&#xe80f;"></span>
					</div>
					<!-- div align="center">
						<input type="checkbox" id="remember" name="remember" ${checked}>
						<small> 아이디 기억하기</small>
					</div -->
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn" id="loginBtn" type="submit">Login</button>
					</div>
					<div align="center" style="margin-top: 10px">
						<p class="loginpage">
							<a class="loginpage"
								href="${pageContext.request.contextPath}/member/joinForm">회원가입</a>
						</p>
						<p class="loginpage">
							<a class="loginpage" data-toggle="modal" data-target="#idPop">아이디찾기</a>&nbsp;&nbsp;
<%-- href="${pageContext.request.contextPath}/member/findIdForm" --%>
							<a class="loginpage" data-toggle="modal" data-target="#pwPop">비밀번호찾기</a>
<%-- href="${pageContext.request.contextPath}/member/findPwForm" --%>
						</p>
					</div>
					<!-- 소셜로그인 -->
					<div class="login100-form-social flex-c-m" style="margin-top: 20px">
						<a class="loginpage" href="${kakao_url}"><button type="button"
								class="social-item flex-c-m m-r-5">
								<img class="loginpage"
									src="${pageContext.request.contextPath}/resources/images/icon/kakaotalk.png">
							</button> </a>&nbsp;&nbsp;&nbsp; <a href="#"><button type="button"
								class="social-item flex-c-m m-r-5">
								<img class="loginpage"
									src="${pageContext.request.contextPath}/resources/images/icon/naver.png">
							</button> </a>
					</div>
				</form>
			</div>
		</div>
	</div>


<!-- id찾기 -->
	<div class="modal" id="idPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">아이디 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form id="frm1" name="frm1" method="post">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">이름</td>
								<td><input type="text" class="form-control" id="name" name="mbr_name" placeholder="이름"></td>
							</tr>
							<tr>
								<td class="txt">이메일</td>
								<td><input type="email" class="form-control" id="email" name="mbr_email" placeholder="이메일"></td>
							</tr>
						</table>
						<button type="submit" name="fid" id="fid" class="btnRed" onclick="return findIdCheck()">아이디찾기</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal" style="margin-left: 10px;">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 비번찾기 -->
	<div class="modal" id="pwPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">비밀번호 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form id="frm2" name="frm2" method="post">
					 <!-- action="findPw.do" -->
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">아이디</td>
								<td><input type="text" class="form-control" id="id2" name="mbr_id" placeholder="아이디"></td>
							</tr>
							<tr>
								<td class="txt">이메일</td>
								<td><input type="email" class="form-control" id="email2" name="mbr_email" placeholder="이메일"></td>
							</tr>
						</table>
						<button type="submit" name="fpw" id="fpw" class="btnRed" onclick="return findPwCheck()">비밀번호찾기</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal" style="margin-left: 10px;">취소</button>
					</form>
				</div>
				<!--  input type="text" id ="showPw" style="text-align: center;" readonly-->
			</div>
		</div>
	</div>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>

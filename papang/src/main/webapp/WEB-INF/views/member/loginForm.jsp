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



/* .social-item {
  width: 50px;
  height: 50px;
} */
</style>
<!-- script type="text/javascript">
function formCheck() {
	var frm = document.frm;
	if (frm.mbr_id.value == "") {
		alert("사용자 아이디를 입력하세요");
		frm.mbr_id.focus();
		return false;
	}
	if (frm.mbr_pw.value == "") {
		alert("비밀번호를 입력하세요");
		frm.mbr_pw.focus();
		return false;
	}
	return true;
}
</script -->
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/login/favicon.ico" />
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
							<a class="loginpage"
								href="${pageContext.request.contextPath}/member/findIdForm">아이디찾기</a>&nbsp;&nbsp;
							<a class="loginpage"
								href="${pageContext.request.contextPath}/member/findPwForm">비밀번호찾기</a>
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


	<div id="dropDownSelect1"></div>

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

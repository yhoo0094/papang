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
<script type="text/javascript">
// 	$(function() {
// 		$("#loginBtn").click(function() {
// 			var mbr_id = $("#mbr_id").val();
// 			var mbr_pw = $("#mbr_pw").val();
// 			//var remember = $("#remember").is(":checked");
// 			$.ajax({
// 				type : "post",
// 				url : "${pageContext.request.contextPath}/member/login",
// 				data : {
// 					mbr_id : mbr_id,
// 					mbr_pw : mbr_pw,
// 					//remember : remember
// 				},
// 				success : function(data) {
// 					if (data == 0) { // 데이터없음 = 로그인X
// 						alert("회원이 아닙니다");
// 					} else {
// 						location.href = "main/main";
// 					}
// 				}

// 			})
// 		})
// 	})
</script>
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41"> 로그인 </span>
				<form class="login100-form validate-form p-b-33 p-t-5" id="frm"
					name="frm" method="post" action="${pageContext.request.contextPath}/member/login">

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="mbr_id"
							placeholder="아이디"> <span
							class="focus-input100" data-placeholder="&#xe82a;"></span>
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
						<button class="login100-form-btn" id="loginBtn" type="submit">
							Login</button>
					</div>
					<div align="center" style="margin-top: 10px">
						<p class="loginpage">
							<a class="loginpage" href="${pageContext.request.contextPath}/member/joinForm">회원가입</a>
						</p>
						<p class="loginpage">
							<a class="loginpage" href="${pageContext.request.contextPath}/member/findIdForm">아이디찾기</a>&nbsp;&nbsp;
							<a class="loginpage" href="${pageContext.request.contextPath}/member/findPwForm">비밀번호찾기</a>
						</p>
					</div>
					<!-- 소셜로그인 -->
					<div class="login100-form-social flex-c-m" style="margin-top: 20px">
						<a class="loginpage" href="#"><button type="button"
								class="social-item flex-c-m m-r-5">
								<img  class="loginpage"
									src="${pageContext.request.contextPath}/resources/images/icon/kakaotalk.png">
							</button> </a>&nbsp;&nbsp;&nbsp; <a href="#"><button type="button"
								class="social-item flex-c-m m-r-5">
								<img  class="loginpage"
									src="${pageContext.request.contextPath}/resources/images/icon/naver.png">
							</button> </a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
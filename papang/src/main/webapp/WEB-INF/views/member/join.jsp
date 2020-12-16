<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {margin: 0;padding: 0;}

body {
	margin: 20px auto;
}

li {
	list-style: none;
}

a {
	
} /* lnb */
#lnb {
	position: relative;
	width: 500px;
}

#lnb h1 {
	height: 40px;
	text-align: center;
	color: #fff;
	font-size: 20px;
	line-height: 1.8;
	letter-spacing: -2px;
	background: #d71a21;
}

#lnb>ul {
	
}

#lnb>ul>li {
	border-bottom: 1px solid #dcdcdc;
}

#lnb>ul>li>a {
	display: block;
	padding: 14px 35px 14px 15px;
	color: inherit;
	font-size: 14px;
	background: #f5f2ec
		url(https://t1.daumcdn.net/cfile/tistory/2417E04D570C5C0225) no-repeat
		95% 15px;
}

#lnb>ul>li a:hover {
	color: #d91c1b;
	background-color: #f5f2ec;
}

#lnb>ul>li.on>a {
	color: #d91c1b;
	background: #f5f2ec
		url('https://t1.daumcdn.net/cfile/tistory/257B794F570C5C0D1A')
		no-repeat 95% 14px;
}

#lnb>ul>li ul {
	display: none;
}

#lnb>ul>li>ul>li>a {
	display: block;
	padding: 0 25px 14px 14px;
	color: #inherit;
	font-size: 12px;
	background: #f5f2ec
		url('https://t1.daumcdn.net/cfile/tistory/2417E04D570C5C0225')
		no-repeat 95% 1px;
}

#lnb>ul>li>ul>li>a {
	color: #d91c1b;
	background-color: #f5f2ec;
}

#lnb>ul>li>ul>li.on a {
	color: #d91c1b;
	background: #f5f2ec
		url('https://t1.daumcdn.net/cfile/tistory/257B794F570C5C0D1A')
		no-repeat 95% 3px;
}

#lnb>ul>li>ul li ul {
	display: none;
	padding-bottom: 8px;
	background-color: #f5f2ec;
}

#lnb>ul>li>ul li li a {
	display: block;
	padding: 0 25px 10px 22px;
	color: #666;
	font-size: 12px;
	background-color: #f5f2ec;
}

#lnb>ul>li>ul>li li a:hover {
	color: #d91c1b;
}

#lnb>ul li.noDepth a {
	background-image: none !important;
}
#lnb{display: inline-block;}
.w3-margin-top {
    margin-top: 16px!important;
    display: inline-block;
    width: 100%;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>회원가입</title>
<script type="text/javascript">
	function formCheck() {
		var f = document.frm;
		if (f.mbr_id.value == "") {
			alert("아이디를 입력하세요");
			f.mbr_id.focus();
			return false;
		}
		if (f.mbr_pw.value == "") {
			alert("비밀번호를 입력하세요");
			f.mbr_pw.focus();
			return false;
		}
		if (f.mbr_nm.value == "") {
			alert("이름 입력하세요");
			f.mbr_nm.focus();
			return false;
		}
		if (f.mbr_birth.value == "") {
			alert("생년월일을 선택하세요");
			f.mbr_birth.focus();
			return false;
		}
		if (isNaN(f.mbr_phone.value)) {
			alert("전화번호는 숫자만 입력가능합니다");
			f.mbr_phone.focus();
			return false;
		}
		if (f.mbr_phone.value == "") {
			alert("전화번호를 입력하세요");
			f.mbr_phone.focus();
			return false;
		}
		if (isNaN(f.mbr_account.value)) {
			alert("계좌번호는 숫자만 입력가능합니다");
			f.mbr_account.focus();
			return false;
		}
		return true;
	}
	function IdCheck() {
		if ($("#mbr_id").val() == "") {
			alert("아이디를 입력하세요");
			return;
		}
	}

	$('.pw').focusout(function() {
		var pw1 = $("#mbr_pw").val();
		var pw2 = $("#mbr_pw2").val();

		if (pw1 != "" && pw2 == "") {
			null;
		} else if (pw1 != "" || pw2 != "") {
			if (pw1 == pw2) {
				$("#alert-success").css("display", "inline-block");
				$("#alert-fail").css("display", "none");
			} else {
				//alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요");
				$("#alert-success").css("display", "none");
				$("#alert-fail").css("display", "inline-block");
			}
		}
	});
</script>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>회원 가입</h3>
			</div>
			<div>
				<form id="myForm" action="../member/update_mypage.do" method="post">
					<p>
						<label>이름</label> <input class="w3-input" type="text" id="id"
							name="id" readonly value="${ member.id }">
					</p>
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="id"
							name="id" readonly value="${ member.id }">
					</p>
					<p>
						<label>생년월일</label> <input class="w3-input" type="date"
							id="email" name="email" value="${ member.email }" required>
					</p>
					<p class="w3-center"></p>
					<input type="hidden" name="id" value="${ member.id }">
					<p>
						<label>Password</label> <input class="w3-input" id="old_pw"
							name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> <input class="w3-input" id="pw"
							name="pw" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">변경</button>
						<button type="submit" id="joinBtn2"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">취소</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
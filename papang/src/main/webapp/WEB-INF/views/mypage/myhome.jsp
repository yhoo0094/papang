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
.w3-input{}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
.input_small {width: 200px; height: 30px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: center;
font-size:50px;
}
p {
    margin-top: 0;
    margin-bottom: 1rem;
}
</style>
<title>마이페이지</title>
</head>
<body>
	<div class="w3-content w3-container divmargin">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">회원 정보 수정</h3>
			</div>
			<div>
			 
				<!-- <form id="myForm" action="../member/update_mypage.do" method="post"> -->
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
						<label>닉네임</label> <input class="w3-input" id="pw2"  required>
					</p>
					<p>
						<label>핸드폰</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>주소</label>    <input  type="password" class="input_small"
							id="pw2" type="password" required>  ㅡ   <input  type="password" class="input_small"
							id="pw2" type="password" required> <button>주소검색</button>
					</p>
					<p>
							<input class="w3-input" type="password"
							id="pw2" type="password" placeholder="상세정보" required>
					</p>
					<p>
						<label>계좌번호</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>이메일</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="btnYellow bMedium">변경</button>
						<button type="submit" id="joinBtn2"
							class="btnGray bMedium">취소</button>
					</p>
				<!--</form>-->
			</div>
		</div>
	</div>



</body>

</html>
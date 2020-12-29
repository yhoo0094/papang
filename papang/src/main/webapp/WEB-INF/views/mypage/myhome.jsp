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
.content_div{width: 90%;
    margin: 0px 0px 0px 200px;}
    .w3-large {
    margin: 0 0 60px 230px;
}
table tbody tr td {
  font-size: 24px;
}
</style>
<title>마이페이지</title>
</head>
<body> 
	<div>
		<div>
			<div class="w3-large" align="center">
				<h3 class="big_title">회원 정보 수정</h3>
			</div>
			<div class="content_div">
			 
				 <form id="fim" name="fim" action="update" method="post"> 
					<p>
						<label>이름</label> <input class="w3-input" type="text" id="mbr_name"
							name="mbr_name" readonly value="${ memberVO.mbr_name}">
					</p>
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="mbr_id"
							name="mbr_id" readonly value="${ memberVO.mbr_id }">
					</p>
					<p>
						<label>생년월일</label> <input class="w3-input" type="text"
							id="mbr_birth" name="mbr_birth" value="${ memberVO.mbr_birth }">
					</p>
					<p class="w3-center"></p>
					<input type="hidden" name="id" value="${ memberVO.mbr_pw }">
					<p>
						<label>Password</label> <input class="w3-input" id="mbr_pw"
							name="mbr_pw" type="password" value="${ memberVO.mbr_pw }">
					</p>
					<p>
						<label>New Password</label> <input class="w3-input" id="mbr_pw"
							name="mbr_pw" type="password" value="${ memberVO.mbr_pw }">
					</p>
					<p>
						<label>닉네임</label> <input class="w3-input" id="mbr_nick" name="mbr_nick"  value="${ memberVO.mbr_nick }">
					</p>
					<p>4
						<label>핸드폰</label> <input class="w3-input" type="text"
							id="mbr_phone" name="mbr_phone" type="text" value="${ memberVO.mbr_phone }">
					</p>
					<p>
						<label>주소</label>    <input  type="text" class="input_small"
							id="mbr_addr1" name="mbr_addr1" value="${ memberVO.mbr_addr1 }" >  ㅡ   <input  type="text" class="input_small"
							id="mbr_addr1" name="mbr_addr1" type="text" value="${ memberVO.mbr_addr1 }"> <button>주소검색</button>
					</p>
					<p>
							<input class="w3-input"
							id="pw2" type="text" placeholder="상세정보" value="${ memberVO.mbr_addr2 }">
					</p>
					<p>
						<label>계좌번호</label> <input class="w3-input" 
							id="mbr_account" name="mbr_account"  value="${ memberVO.mbr_account }">
					</p>
					<p>
						<label>이메일</label> <input class="w3-input"
							id="mbr_email" name="mbr_email" type="text"  value="${ memberVO.mbr_email }">
					</p>
					
					<p class="w3-center">
						<button type="submit" id="myhomechange"
							class="btnYellow bMedium">변경</button>
						<button type="reset"
							class="btnGray bMedium">취소</button>
					</p>
					
				</form>
			</div>
		</div>
	</div>



</body>

</html>
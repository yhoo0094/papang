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
</style>
<title>마이페이지</title>
</head>
<body>
	<div class="w3-content w3-container divmargin">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">회원 탈퇴</h3>
			</div>
			<div>
				</br>
			    <h4>회원탈퇴 주의사항</h4>
			    1. 회원 탈퇴는 즉시 처리되며, 개인정보가 모두 삭제됩니다. </br>
			   <p style="color:red">2. 단, 게시판 등에 공유하신 게시물은 탈퇴 후에도 삭제되지 않습니다.</p>
			   	</br>
			   
			   
			   	<form id="myForm" action="../member/update_mypage.do" method="post"> 
			   	<label style="font-size:20px;margin:50px">아이디　</label><input class="input_small" type="text" id="id"

							name="id" readonly value="${ member.id }">
			    </br>
				<label style="font-size:20px;margin:50px">이름　　</label><input class="input_small" type="text" id="id"
							name="id" readonly value="${ member.id }">
				</br>
				<label style="font-size:20px;margin:50px">비밀번호</label><input class="input_small" type="password" id="id"
							name="id"  value="${ member.id }">
							
						<p class="w3-center";>
						<button type="submit" id="joinBtn" 
							class="btnYellow bMedium">변경</button>
						<button type="submit" id="joinBtn2"
							class="btnGray bMedium">취소</button>
					</p>	
			    </form>
			
			</div>
		</div>
	</div>



</body>

</html>
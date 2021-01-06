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
			 
				 <form id="fim" name="fim" action="update" method="post" onsubmit="return submitCheck();"> 
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
							id="mbr_birth" readonly name="mbr_birth" value="${ memberVO.mbr_birth }">
					</p>
					<p class="w3-center"></p>
					<input type="hidden" name="id" value="${ memberVO.mbr_pw }">
					<p> 
						<label style="color: red">비밀번호</label> 
							<div class="content_content">
   								 <input type="password" id="mbr_pw" name ="mbr_pw" class="pw w3-input" placeholder="비밀번호" >
   								 <span>8~15자리의 영문, 숫자, 특수문자의 입력이 가능합니다.</span>
							</div>  
					</p>
					<p> 
						<label style="color: red">비밀번호 확인</label> 
						<div class="content_content">
   								 <input type="password" id="mbr_pw2" name ="mbr_pw2" class="pw w3-input"  placeholder="비밀번호 확인">
    							<span id="alert-success" style="display: none; color: #84FF33; font-weight: bold;">비밀번호가 일치합니다.</span>
    							<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
						</div>
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
							id="mbr_addr2"  name="mbr_addr2" type="text" value="${ memberVO.mbr_addr2 }">
					</p>
					<p>
						<label>계좌번호</label><select  class="input_small" name="mbr_bank" id="mbr_bank">
		 							<option value="${ memberVO.mbr_bank}">${ memberVO.mbr_bank}</option>
									<option value="경남은행">경남은행</option>
									<option value="광주은행">광주은행</option>
									<option value="국민은행">국민은행</option>
									<option value="기업은행">기업은행</option>
									<option value="농협중앙회">농협중앙회</option>
									<option value="농협회원조합">농협회원조합</option>
									<option value="대구은행">대구은행</option>
									<option value="도이치은행">도이치은행</option>
									<option value="부산은행">부산은행</option>
									<option value="산업은행">산업은행</option>
									<option value="상호저축은행">상호저축은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="수협중앙회">수협중앙회</option>
									<option value="신한금융투자">신한금융투자</option>
									<option value="신한은행">신한은행</option>
									<option value="신협중앙회">신협중앙회</option>
									<option value="외환은행">외환은행</option>
									<option value="우리은행">우리은행</option>
									<option value="우체국">우체국</option>
									<option value="전북은행">전북은행</option>
									<option value="제주은행">제주은행</option>
									<option value="카카오뱅크">카카오뱅크</option>
									<option value="케이뱅크">케이뱅크</option>
									<option value="하나은행">하나은행</option>
									<option value="한국씨티은행">한국씨티은행</option>
									<option value="HSBC은행">HSBC은행</option>
									<option value="SC제일은행">SC제일은행</option>
							</select> <input class="w3-input" 
							id="mbr_account" name="mbr_account"  value="${ memberVO.mbr_account }">
					</p>
					<p>
						<label>이메일</label> <input class="w3-input"
							id="mbr_email" name="mbr_email" type="text"  value="${ memberVO.mbr_email }">
					</p>
					
					<p class="w3-center">
						<button type="submit" id="myhomechange"
							class="btnYellow bMedium aa">변경</button>
						<button type="reset"
							class="btnGray bMedium">취소</button>
					</p>
					
				</form>
			</div>
		</div>
	</div>



</body>
<script>
    $('.pw').focusout(function () {
        var pwd1 = $("#mbr_pw").val();
        var pwd2 = $("#mbr_pw2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        } 
    });
    
    

    function submitCheck() {
    	var pwd1 = $("#mbr_pw").val();
        var pwd2 = $("#mbr_pw2").val();
    	 
    	   if(pwd1 == pwd2 ) {
    		   alert("다시 로그인해 주시기 바랍니다");
    	   return true;

    	 } 
    	   else if(pwd1 ==''|| pwd2==''){
    		   alert("비밀번호를 제대로 입력해주세요");
    		   return false
    	   }
    	   else {
    		   alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
    	  return false
    	   }
    	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
body {
	margin: 120px;
}
.row_group {
	width: 100%;
}

.ps_box {
	width: 100%;
}
.inp{
	width: 100%;
}
</style>
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
		//var url = "exclude/idChk.do?mbr_id=" + $("#mbr_id").val(); 
		//open(url,"idchk","width=350, height=50");
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
	<form action="memberJoin" class="frm" name="frm" id="frm" method="post"
		style="margin: auto;">
		<div id="container"
			style="margin: auto; max-width: 768px; min-width: 460px;">
			<div id="content" style="width: 460px;">
				<div class="join_content" style="display: block">
					<div class="row_group">
						<div class="join_row">
							<h5 class="join_title">
								<label for="mbr_id">아이디</label>
							</h5>
							<span class="ps_box"><input type="text" id="mbr_id"
								name="mbr_id" placeholder="아이디"></span> <input type="button"
								id="idchk" class="btnRed" value="중복확인" onclick="IdCheck()"
								style="padding: 5px">
						</div>
						<div class="join_row">
							<h5 class="join_title">
								<label for="mbr_pw">비밀번호</label>
							</h5>
							<span class="ps_box"> <input type="password" class="inp pw"
								id="mbr_pw" name="mbr_pw" placeholder="비밀번호"></span>
							<h5 class="join_title">
								<label for="mbr_pw2">비밀번호 확인</label>
							</h5>
							<span class="ps_box"> <input type="password" class="inp pw"
								id="mbr_pw2" name="mbr_pw2" placeholder="비밀번호 확인"></span><br>
							<span id="alert-success"
								style="display: none; color: #0B8026; font-weight: bold;">비밀번호가
								일치합니다.</span> <span id="alert-fail"
								style="display: none; color: #d92742; font-weight: bold;">비밀번호가
								일치하지 않습니다.</span>
						</div>
						<div class="join_row">
							<h5 class="join_title">
								<label for="mbr_name">이름</label>
							</h5>
							<span class="ps_box">
							<input type="text" id="mbr_name" name="mbr_name" class="inp" placeholder="이름">
							</span>
							<h5 class="join_title">
								<label for="mbr_nick">닉네임</label>
							</h5>
							<span class="ps_box">
							<input type="text" id="mbr_nick" name="mbr_nick" class="inp"
								placeholder="닉네임">
								</span>
							<h5 class="join_title">
								<label for="mbr_birth">생년월일</label>
							</h5><span class="ps_box">
							<input type="date" id="mbr_birth" name="mbr_birth" class="inp"></span>
						</div>
						<div class="join_row">
							<h5 class="join_title">
								<label for="mbr_gender">성별</label>
							</h5>
							<span class="ps_box">
							<input type="radio" id="mbr_gender" name="mbr_gender" value="남"
								checked>남성
							<input type="radio" id="mbr_gender"
								name="mbr_gender" value="녀">여성</span>
							<h5 class="join_title">
								<label for="mbr_phone">전화번호</label>
							</h5><span class="ps_box">
							<input type="text" id="mbr_phone" name="mbr_phone" class="inp"
								placeholder="-없이 입력"></span>
							<h5 class="join_title">
								<label for="mbr_email">이메일<small>(선택)</small></label>
							</h5><span class="ps_box">
							<input type="email" id="mbr_email" name="mbr_email" class="inp"
								placeholder="abc@example.com"></span>
						</div>
						<div class="join_row">
							<h5 class="join_title">
								<label for="mbr_post">우편번호</label>
							</h5><span class="ps_box">
							<input type="text" id="mbr_post" name="mbr_post" readonly></span>
							<span>
							<input type="button" id="postSearch" class="btnRed"
								value="우편번호 검색" onclick="postSearch()" style="padding: 5px">
								</span>
							<h5 class="join_title">
								<label for="mbr_addr1">주소</label>
							</h5><span class="ps_box">
							<input type="text" id="mbr_addr1" name="mbr_addr1" class="inp"></span>
							<h5 class="join_title">
								<label for="mbr_email">상세주소</label>
							</h5><span class="ps_box">
							<input type="text" id="mbr_addr2" name="mbr_addr2" class="inp"
								placeholder="나머지 주소를 입력해주세요"></span>
						</div>
						<div class="join_row">
							<h5 class="join_title">
								<label for="mbr_account">은행</label>
							</h5><span class="ps_box">
							<select name="mbr_bank" id="mbr_bank">
								<option value="">은행명</option>
								<option value="35">경남은행</option>
								<option value="29">광주은행</option>
								<option value="7">국민은행</option>
								<option value="5">기업은행</option>
								<option value="15">농협중앙회</option>
								<option value="17">농협회원조합</option>
								<option value="25">대구은행</option>
								<option value="47">도이치은행</option>
								<option value="27">부산은행</option>
								<option value="3">산업은행</option>
								<option value="41">상호저축은행</option>
								<option value="37">새마을금고</option>
								<option value="11">수협중앙회</option>
								<option value="36">신한금융투자</option>
								<option value="60">신한은행</option>
								<option value="39">신협중앙회</option>
								<option value="9">외환은행</option>
								<option value="19">우리은행</option>
								<option value="56">우체국</option>
								<option value="33">전북은행</option>
								<option value="31">제주은행</option>
								<option value="68">카카오뱅크</option>
								<option value="67">케이뱅크</option>
								<option value="59">하나은행</option>
								<option value="23">한국씨티은행</option>
								<option value="45">HSBC은행</option>
								<option value="21">SC제일은행</option>
							</select> <input type="text" id="mbr_account" name="mbr_account"
								placeholder="계좌번호를 입력해주세요"></span>
						</div>
					</div>
					<div align="center">
						<button type="submit" class="btn" onclick="return formCheck()"
							style="margin-right: 30px;">회원가입</button>
						<button type="reset" class="btnGray" style="margin-right: 30px;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
	</div>
	</div>

</body>
</html>
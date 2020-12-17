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
	<form action="memberJoin" class="frm" name="frm" id="frm" method="post"
		style="margin: auto;">
		<div>
			<table class="table">
				<tr>
					<td class="txt">아이디&nbsp;<span style="color: red;">*</span></td>
					<td><input type="text" id="mbr_id" name="mbr_id"
						placeholder="아이디"></td>
					<td><input type="button" id="idchk" class="btnRed"
						value="중복확인" onclick="IdCheck()" style="padding: 5px"></td>
				</tr>
				<tr>
					<td class="txt">비밀번호&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="password" class="pw" id="mbr_pw"
						name="mbr_pw" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td class="txt">비밀번호 확인&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="password" class="pw" id="mbr_pw2"
						name="mbr_pw2" placeholder="비밀번호 확인"></td>
				</tr>
				<!-- <tr>
					<td colspan="3" style="text-align: center;"><span
						id="alert-success"
						style="display: none; color: #0B8026; font-weight: bold;">비밀번호가
							일치합니다.</span> <span id="alert-fail"
						style="display: none; color: #d92742; font-weight: bold;">비밀번호가
							일치하지 않습니다.</span></td>
				</tr> -->

				<tr>
					<td class="txt">이름&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="text" id="mbr_name"
						name="mbr_name" placeholder="이름"></td>
				</tr>
				<tr>
					<td class="txt">닉네임&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="text" id="mbr_nick"
						name="mbr_nick" placeholder="닉네임"></td>
				</tr>
				<tr>
					<td class="txt">생년월일&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="date" id="mbr_birth"
						name="mbr_birth"></td>
				</tr>
				<tr>
					<td class="txt">성별&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="radio" id="mbr_gender"
						name="mbr_gender" value="남" checked>남성 <input type="radio"
						id="mbr_gender" name="mbr_gender" value="녀">여성</td>
				</tr>
				<tr>
					<td class="txt">전화번호&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="text" id="mbr_phone"
						name="mbr_phone" placeholder="-없이 입력"></td>
				</tr>
				<tr>
					<td class="txt">이메일</td>
					<td colspan="2"><input type="email" id="mbr_email"
						name="mbr_email" placeholder="abc@example.com"></td>
				</tr>
				<tr>
					<td class="txt">우편번호&nbsp;<span style="color: red;">*</span></td>
					<td><input type="text" id="mbr_post" name="mbr_post"></td>
					<td><input type="button" id="postSearch"
						class="btnRed" value="우편번호 검색" onclick="postSearch()" style="padding: 5px"></td>
				</tr>
				<tr>
					<td class="txt">주소&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="text" id="mbr_addr1"
						name="mbr_addr1"></td>
				</tr>
				<tr>
					<td class="txt">상세주소&nbsp;<span style="color: red;">*</span></td>
					<td colspan="2"><input type="text" id="mbr_addr2"
						name="mbr_addr2" placeholder="나머지 주소를 입력해주세요"></td>
				</tr>
				<tr>
					<td class="txt">은행</td>
					<td><input type="text" id="mbr_account" name="mbr_account"
						placeholder="계좌번호를 입력해주세요"></td>
					<td><select name="mbr_bank" id="mbr_bank">
							<option value="">은행명을 선택하세요</option>
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
					</select></td>

				</tr>
			</table>
		</div>
		<div align="center">
			<button type="submit" class="btn"
				onclick="return formCheck()" style="margin-right: 30px;">회원가입</button>
			<button type="reset" class="btnGray"
				style="margin-right: 30px;">취소</button>
		</div>
	</form>
</body>
</html>
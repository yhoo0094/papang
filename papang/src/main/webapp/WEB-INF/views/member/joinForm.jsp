<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.big_title {
	text-align: center;
	font-size: 50px;
}

p {
	margin-top: 0;
	margin-bottom: 1rem;
}
.center_div {
    min-height: 750px;
    display: inline-block;
    margin: 90px 3% 50px 270px;
    width: 70%;
}
</style>
<script type="text/javascript">
	$(function() {
		var f = document.frm;
		// 아이디 중복검사
		$("#mbr_id")
			.blur(
				function() {
					if (f.mbr_id.value != "") {
						var mbr_id = $("#mbr_id").val();
						var regexPattern = /^[A-Za-z0-9]{4,12}$/;
						 if (regexPattern.test(mbr_id)) {
							$.ajax({
								url : "${pageContext.request.contextPath}/ajax/idchk?mbr_id="
										+ mbr_id,
								type : 'get',
								success : function(data) {
									if (data != 0) { // 중복
										$("#idchk").text("사용불가");
										$("#idchk").css("color", "red");
										$("#joinBtn").attr("disabled",
												true);
									} else {
										$("#idchk")
												.text("사용가능");
										$("#idchk").css("color",
												"green");
										$("#joinBtn").attr("disabled",
												false);
									}
								},
								error : function() {
									alert("실패");
								}
							})
// 						 } else {
// 							 $("#idchk").text("글자수가 부족합니다");
// 							 $("#idchk").css("color", "red");
// 							 $("#joinBtn").attr("disabled", true);
						 }
					}
				})
		// 이메일 중복검사
		$("#mbr_email")
			.blur(
				function() {
					if (f.mbr_email.value != "") {
						var mbr_email = $("#mbr_email").val();
					    var regexPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식

					    if (regexPattern.test(mbr_email)) {
							$.ajax({
								url : "${pageContext.request.contextPath}/ajax/emailchk?mbr_email="
										+ mbr_email,
								type : 'get',
								success : function(data) {
									console.log(mbr_email);
									if (data != 0) { // 중복
										$("#emailchk").text("사용불가");
										$("#emailchk").css("color", "red");
										$("#joinBtn").attr("disabled",
												true);
									} else {
										$("#emailchk")
												.text("사용가능");
										$("#emailchk").css("color",
												"green");
										$("#joinBtn").attr("disabled",
												false);
									}
								},
								error : function() {
									alert("실패");
								}
							})
					    }
					}
				})
	});
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
		if (f.mbr_name.value == "") {
			alert("이름 입력하세요");
			f.mbr_name.focus();
			return false;
		}
		if (f.mbr_email.value == "") {
			alert("이메일을 입력하세요");
			f.mbr_email.focus();
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
		if (isNaN(f.mbr_account.value)) {
			alert("계좌번호는 숫자만 입력가능합니다");
			f.mbr_account.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="w3-content w3-container">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">회원가입</h3>
			</div>
			<form action="${pageContext.request.contextPath}/member/join"
				class="frm" name="frm" id="frm" method="post" style="margin: auto;"
				encType="multipart/form-data">
				<div>
					<table class="table">
						<tr>
							<td class="txt" width="20%">아이디&nbsp;<span style="color: red;">*</span></td>
							<td><input type="text" id="mbr_id" name="mbr_id" style="width: 80%;"
								placeholder="문자/숫자를 포함한 4~12자리" class="form-control">
							<span id="idchk"></span></td>
						</tr>
						<tr>
							<td class="txt">비밀번호&nbsp;<span style="color: red;">*</span></td>
							<td><input type="password" style="width: 80%;"
								class="form-control pw" id="mbr_pw" name="mbr_pw"
								placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td class="txt">비밀번호 확인&nbsp;<span style="color: red;">*</span></td>
							<td><input type="password" class="form-control pw" style="width: 80%;"
								id="mbr_pw2" name="mbr_pw2" placeholder="비밀번호 확인">
							<script>
								$('.pw').focusout(
										function() {
											var pw1 = $("#mbr_pw").val();
											var pw2 = $("#mbr_pw2").val();
// 											var regex = /^.*(?=^.{4,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
// 											// 비번 정규식
// 											if (regex.test(pw1)) {
												if (pw1 != "" && pw2 == "") {
													null;
												} else if (pw1 != "" || pw2 != "") {
													if (pw1 == pw2) {
														$("#alert-success").css(
																"display",
																"inline-block");
														$("#alert-fail").css(
																"display", "none");
														$("#joinBtn").attr("disabled",
																false);
													} else {
														//alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요");
														$("#alert-success").css(
																"display", "none");
														$("#alert-fail").css(
																"display",
																"inline-block");
														$("#joinBtn").attr("disabled",
																true);
													}
												}
// 											}
										});
							</script>

							<span id="alert-success"
								style="display: none; color: #0B8026;">비밀번호가
									일치합니다.</span> <span id="alert-fail"
								style="display: none; color: #d92742;">비밀번호가
									일치하지 않습니다.</span></td>
						</tr>
						<tr>
							<td class="txt">이름&nbsp;<span style="color: red;">*</span></td>
							<td><input type="text" id="mbr_name" style="width: 80%;"
								name="mbr_name" placeholder="이름" class="form-control"></td>
						</tr>
						<tr>
							<td class="txt">이메일&nbsp;<span style="color: red;">*</span></td>
							<td><input type="email" id="mbr_email" style="width: 80%;"
								name="mbr_email" placeholder="abc@example.com" class="form-control">
								<span id="emailchk"></span></td>
						</tr>
						<tr>
							<td class="txt">프로필사진</td>
							<td><input type="file" id="mbr_pic" style="width: 80%;"
								name="uploadFile" class="form-control"></td>
						</tr>
						<tr>
							<td class="txt">생년월일&nbsp;<span style="color: red;">*</span></td>
							<td><input type="date" id="mbr_birth" style="width: 80%;"
								name="mbr_birth" class="form-control"></td>
						</tr>
						<tr>
							<td class="txt">성별&nbsp;<span style="color: red;">*</span></td>
							<td><input type="radio" id="mbr_gender" style="margin-left:20px; margin-right: 20px;"
								name="mbr_gender" value="남" checked>남성 <input  style="margin-left:180px; margin-right: 20px;"
								type="radio" id="mbr_gender" name="mbr_gender" value="여">여성</td>
						</tr>
						<tr>
							<td class="txt">전화번호&nbsp;<span style="color: red;">*</span></td>
							<td><input type="text" id="mbr_phone" style="width: 80%;"
								name="mbr_phone" placeholder="-없이 입력" class="form-control"></td>
						</tr>
						<tr>
							<td class="txt">우편번호</td>
							<td><input type="text" id="mbr_post" name="mbr_post" style="width: 80%;"
								class="form-control" placeholder="우편번호" readonly>
							<input type="button" id="postSearch" class="btnYellow"
								value="우편번호 검색" onclick="sample2_execDaumPostcode()" style="padding: 5px; width: 100px;"></td>
						</tr>
						<tr>
							<td class="txt">주소</td>
							<td><input type="text" id="mbr_addr1" style="width: 80%;" readonly
								name="mbr_addr1" class="form-control" placeholder="주소"></td>
						</tr>
						<tr>
							<td class="txt">참고사항</td>
							<td><input type="text" id="mbr_addr3" style="width: 80%;" readonly
								class="form-control" name="mbr_addr3" placeholder="주소 참고사항"></td>
						</tr>
						<tr>
							<td class="txt">상세주소</td>
							<td><input type="text" id="mbr_addr2" style="width: 80%;"
								class="form-control" name="mbr_addr2" placeholder="상세주소"></td>
						</tr>
						<tr>
							<td class="txt">은행</td>
							<td>
							<select name="mbr_bank" id="mbr_bank" style="width: 15%;"
								class="form-control">
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
							</select>
							<input type="text" id="mbr_account" name="mbr_account" style="width: 64.3%;"
								class="form-control" placeholder="계좌번호를 입력해주세요"></td>
						</tr>
					</table>
				</div>
				<div align="center">
					<button type="submit" class="btnRed bMedium" id="joinBtn"
						onclick="return formCheck()" style="margin-right: 30px;">회원가입</button>
					<button type="button" class="btnGray bMedium" style="margin-right: 30px;" onclick="location.href='/papang'">취소</button>
				</div>
			</form>
			<div id="layer"
				style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
					id="btnCloseLayer"
					style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
					onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
			<script>
				// 우편번호 찾기 화면을 넣을 element
				var element_layer = document.getElementById('layer');

				function closeDaumPostcode() {
					// iframe을 넣은 element를 안보이게 한다.
					element_layer.style.display = 'none';
				}

				function sample2_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 각 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var addr = ''; // 주소 변수
									var extraAddr = ''; // 참고항목 변수

									//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										addr = data.roadAddress;
									} else { // 사용자가 지번 주소를 선택했을 경우(J)
										addr = data.jibunAddress;
									}

									// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									if (data.userSelectedType === 'R') {
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
											extraAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraAddr !== '') {
											extraAddr = ' (' + extraAddr + ')';
										}
										// 조합된 참고항목을 해당 필드에 넣는다.
										document.getElementById("mbr_addr3").value = extraAddr;

									} else {
										document.getElementById("mbr_addr3").value = '';
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('mbr_post').value = data.zonecode;
									document.getElementById("mbr_addr1").value = addr;
									// 커서를 상세주소 필드로 이동한다.
									document.getElementById("mbr_addr2")
											.focus();

									// iframe을 넣은 element를 안보이게 한다.
									// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
									element_layer.style.display = 'none';
								},
								width : '100%',
								height : '100%',
								maxSuggestItems : 5
							}).embed(element_layer);

					// iframe을 넣은 element를 보이게 한다.
					element_layer.style.display = 'block';

					// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
					initLayerPosition();
				}

				// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
				// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
				// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
				function initLayerPosition() {
					var width = 300; //우편번호서비스가 들어갈 element의 width
					var height = 400; //우편번호서비스가 들어갈 element의 height
					var borderWidth = 5; //샘플에서 사용하는 border의 두께

					// 위에서 선언한 값들을 실제 element에 넣는다.
					element_layer.style.width = width + 'px';
					element_layer.style.height = height + 'px';
					element_layer.style.border = borderWidth + 'px solid';
					// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
					element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
							+ 'px';
					element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
							+ 'px';
				}
			</script>
		</div>
	</div>
</body>
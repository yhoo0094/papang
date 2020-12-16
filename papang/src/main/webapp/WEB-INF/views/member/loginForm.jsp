<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
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
	/*	function findIdCheck() {
	 var frm3 = document.frm3;
	 if (frm3.nmch.value == "") {
	 alert("이름을 입력하세요");
	 frm3.nmch.focus();
	 return false;
	 }
	 if (frm3.phch.value == "") {
	 alert("전화번호를 입력하세요");
	 frm3.phch.focus();
	 return false;
	 }
	 if (isNaN(frm3.phch.value)) {
	 alert("전화번호는 숫자만 입력가능합니다");
	 frm3.phch.focus();
	 return false;
	 } else {
	 var nmch = $("#nmch").val();
	 var phch = $("#phch").val();

	 $.ajax({
	 url : "ajax/findId.do",
	 data : {
	 "mbr_nm" : nmch,
	 "mbr_phone" : phch
	 },
	 dataType : "json",
	 error : function(xhr, status, msg) {
	 alert("존재하지 않는 회원입니다");
	 },
	 success : function(vo) {
	 var id = vo.mbr_id;
	 $("#showId").val(id);
	 }
	 })
	 return false;
	 }
	 }
	 function findPwCheck() {
	 var frm4 = document.frm4;
	 if (frm4.idchk.value == "") {
	 alert("아이디를 입력하세요");
	 frm4.idchk.focus();
	 return false;
	 }
	 if (frm4.nmchk.value == "") {
	 alert("이름을 입력하세요");
	 frm4.nmchk.focus();
	 return false;
	 }
	 if (frm4.phchk.value == "") {
	 alert("전화번호를 입력하세요");
	 frm4.phchk.focus();
	 return false;
	 }
	 if (isNaN(frm4.phchk.value)) {
	 alert("전화번호는 숫자만 입력가능합니다");
	 frm4.phchk.focus();
	 return false;
	 } else {
	 var idchk = $("#idchk").val();
	 var nmchk = $("#nmchk").val();
	 var phchk = $("#phchk").val();

	 $.ajax({
	 url : "ajax/findPw.do",
	 data : {
	 "mbr_id" : idchk,
	 "mbr_nm" : nmchk,
	 "mbr_phone" : phchk
	 },
	 dataType : "json",
	 error : function(xhr, status, msg) {
	 alert("존재하지 않는 회원입니다");
	 },
	 success : function(vo) {
	 var pw = vo.mbr_pw;
	 $("#showPw").val(pw);
	 }
	 })
	 return false;
	 }
	 }
	 */
</script>
</head>
<body>
	<form class="frm" id="frm" name="frm" action="login.do" method="post"
		style="margin: auto;">
		<div align="center">
			<div style="margin: 20px">
				<input type="text" id="mbr_id" name="mbr_id" placeholder="아이디">
			</div>
			<div style="margin: 20px">
				<input type="password" id="mbr_pw" name="mbr_pw" placeholder="비밀번호">
			</div>
		</div>
		<div align="center">
			<button type="submit" class="btn" onclick="return formCheck()"
				style="margin-right: 30px;">로그인</button>
		</div>
		<div align="center">
			<a href="">ID 찾기</a>&nbsp;&nbsp;&nbsp;
			<a href="">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
			<a href="memberJoin">회원가입</a>
		</div>
	</form>
	<!-- %
		// id, pw 틀리면 화면에 메세지 출력
	String msg = request.getParameter("msg");
	if (msg != null && msg.equals("0")) {
		out.println("<br>");
		out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
	} else if (msg != null && msg.equals("-1")) {
		out.println("<br>");
		out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
	}
	% -->
	<!-- id/비번찾기  -->
	<div class="modal" id="findPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">아이디/비밀번호 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form id="frm2" name="frm2">
						<div id="find" align="center">
							<button type="button" class="btn" id="idBtn" data-toggle="modal"
								data-target="#idPop">ID 찾기</button>
							<button type="button" class="btn" id="pwBtn" data-toggle="modal"
								data-target="#pwPop">비밀번호 찾기</button>
						</div>
						<div style="margin-bottom: 40px;"></div>
						<button type="button" class="btn btn-outline-secondary btn-sm"
							data-dismiss="modal">닫기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--
	<div class="modal" id="idPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<div class="modal-header">
					<h1 class="modal-title">아이디 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<div class="modal-body" align="center">
					<form id="frm3" name="frm3" method="post">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">이름</td>
								<td><input type="text" class="form-control" id="nmch"
									name="nmch" placeholder="이름"></td>
							</tr>
							<tr>
								<td class="txt">전화번호</td>
								<td><input type="text" class="form-control" id="phch"
									name="phch" placeholder="숫자"></td>
							</tr>
						</table>
						<button type="submit" name="fid" id="fid" class="btn btn-danger"
							onclick="return findIdCheck()">아이디찾기</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal"
							style="margin-left: 10px;">취소</button>
					</form>
				</div>
				<input type="text" id="showId" style="text-align: center;" readonly>
			</div>
		</div>
	</div>

	<div class="modal" id="pwPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title">비밀번호 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body" align="center">
					<form id="frm4" name="frm4" method="post">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">아이디</td>
								<td><input type="text" class="form-control" id="idchk"
									name="idchk" placeholder="아이디"></td>
							</tr>
							<tr style="line-height: 32px;">
								<td class="txt">이름</td>
								<td><input type="text" class="form-control" id="nmchk"
									name="nmchk" placeholder="이름"></td>
							</tr>
							<tr>
								<td class="txt">전화번호</td>
								<td><input type="text" class="form-control" id="phchk"
									name="phchk" placeholder="숫자"></td>
							</tr>
						</table>
						<button type="submit" name="fpw" id="fpw" class="btn btn-danger"
							onclick="return findPwCheck()">비밀번호찾기</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal"
							style="margin-left: 10px;">취소</button>
					</form>
				</div>
				<input type="text" id="showPw" style="text-align: center;" readonly>
			</div>
		</div>
	</div>
 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크박스</title>
</head>
<body>
	<tr>
		<td class="txt">이메일 광고 수신여부</td>
		<td colspan="2"><input type="checkbox" class="form-check-input"
			id="mbr_e_yn" name="mbr_e_yn"></td>
	</tr>
	<script type="text/javascript">
		// 현재 체크박스 체크 여부		
		var chk = $("input[id='mbr_e_yn']:checked");
		if (chk) {
			$("#mbr_e_yn").val("y");
		} else {
			$("#mbr_e_yn").val("n");
		}
	</script>
</body>
</html>
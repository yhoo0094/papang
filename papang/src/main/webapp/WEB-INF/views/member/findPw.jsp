<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
td {
	padding: 15px;
}
</style>
<div align="center">
	<table style="width: 50%">
		<tr>
			<td align="right" style="width: 40%"><label>아이디</label></td>
			<td><input type="text" placeholder="아이디" id="mbr_id"
				name="mbr_id" style="width: 100%"></td>
		</tr>
		<tr>
			<td align="right" style="width: 40%"><label>이름</label></td>
			<td><input type="text" placeholder="이름" id="mbr_name"
				name="mbr_name" style="width: 100%"></td>
		</tr>
		<tr>
			<td align="right" style="width: 40%"><label>전화번호</label></td>
			<td><input type="text" placeholder="-없이 기입하세요" id="mbr_phone"
				name="mbr_phone" style="width: 100%"></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="찾기"
				style="margin-right: 30px"><input type="reset" value="취소"></td>
		</tr>
	</table>
</div>
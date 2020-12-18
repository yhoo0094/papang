<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container center_div">
<div>
<h2>중고장터 글 등록</h2>
	<table class="table">
		<tbody>
			<tr>
				<td><strong>글제목</strong></td>
				<td colspan="2"><input type="text" id="used_title"></td>
				<td><select name="used_loc">
						<option value='택배' selected>택배</option>
						<option value='1'>서울</option>
						<option value='2'>부산</option>
						<option value='3'>대구</option>
						<option value='4'>인천</option>
						<option value='5'>광주</option>
						<option value='6'>대전</option>
						<option value='7'>울산</option>
						<option value='8'>강원</option>
						<option value='9'>경기</option>
						<option value='10'>경남</option>
						<option value='11'>경북</option>
						<option value='12'>전남</option>
						<option value='13'>전북</option>
						<option value='14'>제주</option>
						<option value='15'>충남</option>
						<option value='16'>충북</option>
				</select></td>
			</tr>
			<tr>
			<td>가격</td>
			<td colspan="2"><input type="text" id="used_price"></td>
			<td></td>
			</tr>
			<tr>
			<td colspan="4" align="center">
			<textarea rows="20" cols="120"></textarea>
			</td>
			</tr>
			<tr>
			<td>사진</td>
				<td colspan="2"><input type="text">
				</td>
				<td><button type="button" class="btnYellow">찾기</button></td>
						</tr>

		</tbody>
		<tfoot>
		<tr>
		<td colspan="4" align="center"><button type="button" class="btnRed">등록</button>
		<button type="button" class="btnGray">취소</button></td>
		</tfoot>
	</table>
</div>
</div>
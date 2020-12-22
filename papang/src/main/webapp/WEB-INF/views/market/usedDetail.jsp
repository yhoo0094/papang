<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container center_div">
	<div>
		<h2>[used_category] : used_title</h2>
		<table class="table">
			<tbody>
				<tr>
					<td>글번호 : <strong>used_no</strong></td>
					<td>가격 : <strong>used_price</strong></td>
					<td>지역 : <strong>used_loc</strong></td>
				</tr>
				<tr>
					<td>작성자 : <strong>mbr_id</strong>(등급 )
					</td>
					<td>날짜 : <strong>used_date</strong></td>
					<td>조회수 : <strong>used_hit</strong></td>
				</tr>
				<tr>
					<td colspan="3"><img class="img-fluid rounded mb-4"
						src="http://placehold.it/500x600" alt=""> <label>used_content
							여기에 같이해뿌릴까
							내여ㅛㅇ애냐ㅗㅇ해ㅑㄴ오ㅜ야휴ㅜㅋ니ㅑ유ㅑㅐ햖유ㅣㄴ유ㅐ캬도햐ㅐㅋ노ㅠ야ㅐㄴ큫ㅋ니ㅏ대ㅑㅁㄸㅎㅇㄴ퍼ㅣㅐㅏㅓ몌ㅒ쩔갸ㅕ뜡녀ㅠ파ㅠㅑㅕㄷㄹ개ㅃㅁㅉ런ㅇ펴</label></td>
				</tr>
				<tr>
					<td colspan="3"><label>used_content 여기에
							따로하등가..몰몰몲롬롬롬롬롬로먀ㅗ횤ㄴㅇ호ㅑㅐㅋ도햨쨰뚜힠ㄴ아ㅑ풉09좃호ㅠㅇㄴ캐</label></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<br>
<br>
<div align="left">
	<b style="font-size: 20px;">댓글 쓰기</b>
</div>
<table style="width: 100%">
	<tr>
		<td width="90%"><textarea rows="5" cols="102" name="comm"
				style="width: 100%"></textarea></td>
		<td align="center" width="10%" style="padding: 0 0 5px 0"><button
				class="btnYellow insertBtn">등록하기</button></td>
	</tr>
</table>
<br>
<div align="left">
	<b style="font-size: 20px;">댓글 목록</b>
</div>
<table style="width: 100%">
	<tr>
		<td align="center" width="10%">
			<div>아이디</div>
		</td>
		<td width="90%">
			<div>
				댓글 내용&nbsp; <img class="sirenImg" alt="사이렌사진"
					src="${pageContext.request.contextPath}/resources/images/siren.png"
					width="1%" height="1%"> <span style="font-size: 8px">신고하기</span>
			</div>
		</td>
	</tr>
</table>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container center_div">
	<div>
		<h2>[${used.used_category}] : ${used.used_title}</h2>
		<table class="table">
			<tbody>
				<tr>
					<td>글번호 : <strong>${used.used_no}</strong></td>
					<td>가격 : <strong>${used.used_price}</strong></td>
					<td>지역 : <strong>${used.used_loc}</strong></td>
				</tr>
				<tr>
					<td>작성자 : <strong>${used.mbr_id}</strong>(등급 )
					</td>
					<td>날짜 : <strong>${used.used_date}</strong></td>
					<td>조회수 : <strong>${used.used_hit}</strong></td>
				</tr>
				<tr>
					<td colspan="3"><img class="img-fluid rounded" alt="${used.used_pic}"
						src="${pageContext.request.contextPath}/images/${used.used_pic}"></td>
				</tr>
				<tr>
					<td colspan="3">${used.used_content}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<c:if test="${used.mbr_id == user.mbr_id}">
						<td><button type="button" class="btnYellow" id="usedUpdate">수정</button></td>
						<td><button type="button" class="btnRed" id="usedDelete">삭제</button></td>
					</c:if>
				</tr>
			</tfoot>
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
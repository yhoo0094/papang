<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.sirenImg {
	width: 30px;
	height: 30px;
	margin-bottom: 10px
}

.insertBtn {
	height: 126px;
	width: 126px;
}
</style>
<script>
	$(function() {
		//댓글쓰기 버튼 클릭
		$('#commentBtn').on('click', function() {
			var used_no = $("#used_no").val();
			var uc_content = $("#uc_content").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/used/usedComm",
				type : 'POST',
				dataType : 'json',
				data : {
					"used_no" : used_no,
					"uc_content" : uc_content
				},
				success : function(usedCom) {
					location.reload();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status);
				}
			});
		});//댓글쓰기 버튼 클릭
	})
</script>
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
						src="${pageContext.request.contextPath}/resources/images/used/${used.used_pic}"></td>
				</tr>
				<tr>
					<td colspan="3">${used.used_content}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<c:if test="${used.mbr_id == user.mbr_id}">
						<td><button type="button" class="btnYellow" id="usedUpdate" onclick="location.href='/papang/market/usedUpdateForm?used_no=${used.used_no}'">수정</button></td>
						<td><button type="button" class="btnRed" id="usedDelete" onclick="location.href='/papang/market/usedDelete?used_no=${used.used_no}'">삭제</button></td>
					</c:if>
				</tr>
			</tfoot>
		</table>
	</div>
	<div>
	
	</div>
	<c:if test="${not empty used.used_no}">
		<br>
			<div align="left">
				<b style="font-size: 20px;">댓글 쓰기</b>
			</div>
			<form id="commentForm" method="post">
				<table style="width: 100%">
					<tr>
						<td width="90%">
						<textarea name="uc_content" rows="5" cols="102" id="uc_content" style="width: 100%"></textarea>
						<input type="hidden" value="${used.used_no}" name="used_no" id="used_no"></td>
						<td align="center" width="10%" style="padding: 0 0 5px 0">
						<button type="button" id="commentBtn" class="btnYellow insertBtn">등록하기</button></td>
					</tr>
				</table>
			</form>
			<br>
			<div align="left">
				<b style="font-size: 20px;">댓글 목록</b>
			</div>
			<table style="width: 100%">
				<c:forEach items="${used_comList}" var="uc">
					<tr>
						<td align="center" width="10%">
							<div>${uc.mbr_id}</div>
						</td>
						<td width="90%">
							<div id="commentDiv">
								${uc.uc_content}&nbsp; <img class="sirenImg" alt="사이렌사진"
									src="${pageContext.request.contextPath}/resources/images/siren.png"
									width="1%" height="1%"> <span style="font-size: 8px">
									신고하기 </span>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
</div>
<br>

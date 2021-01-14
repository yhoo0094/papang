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
.commentMenu{
	font-size: 12px; 
	cursor: pointer;
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
		});
		
		$("#commentUpdateBtn").on({ //댓글 모달에서 수정하기 버튼 클릭
			"click" : function() {
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/used/usedCommUpdate",  
				    type: 'POST',  
				    dataType: 'json', 
				    data : $("#commentUpdateForm").serialize(),
				    success: function(result) {
				    		console.log(result.uc_content);
				    		$tr.find('#tempt').text(result.uc_content);
				    }, 
				    error:function(xhr, status, message) { 
				        alert(" status: "+status+" er:"+message);
				    } 
				 });
			}
		});
		
		//댓글 수정 버튼 클릭
		$('.commentUpdateBtn').on({
			"click" : function() {
				var uc_no = $(this).parent().find('.commentNumInput').val();
				var commentText = $(this).closest('div').find('.commentContent').text();
				$tr = $(this).closest('div')
				$(this).closest('div').find('.commentContent').eq(0).attr("id","tempt");//댓글 위치
				$('#commentUpdateModal').modal();
				$('#commentUpdateTextarea').val(commentText);
				$('#commentUpdateInput').val(uc_no);
			}
		});
		
		$(".commentDeleteBtn").on({ //댓글 삭제하기
			"click" : function() {
				if(confirm("정말로 삭제하시겠습니까?")){
					var uc_no = $(this).parent().find('.commentNumInput').val();
					var tr =  $(this).closest('tr');
					$.ajax({ 
					    url: "${pageContext.request.contextPath}/used/usedCommDelete",  
					    type: 'POST',  
					    dataType: 'text', 
					    data : {
					    	"uc_no":uc_no
					    }, success: function(number) {
					    	tr.remove();
					    }, error:function(xhr, status, message) { 
					        alert(" status: "+status+" er:"+message);
					    } 
					 });
				}
			}
		})
		// 본문 신고
		$('#reportSpan').on({
			"click" : function() {
				$('#reprotForm').submit();
			}
		});
		
		 //댓글 신고
		$('#reportCommentSpan').on({
			"click" : function() {
				$('#reprotCommentForm').submit();
			}
		});
	})
</script>
<div class="container center_div">
	<div>
		<h2>[${used.used_category}] : ${used.used_title}</h2>
		<c:if test="${user.mbr_id != uc.mbr_id}">
			<span class="commentMenu" id="reportSpan"> <img class="sirenImg" alt="사이렌사진"
				src="${pageContext.request.contextPath}/resources/images/siren.png" width="1%" height="1%">신고하기
			</span>
			<form action="${pageContext.request.contextPath}/used/report" id="reprotForm">
				<input type="hidden" name="mbr_id"
					value="${user.mbr_id}"> <input type="hidden"
					name="repo_category" value="중고장터"> <input type="hidden"
					name="repo_category_no" value="${used.used_no}"> <input
					type="hidden" name="re_mbr_id" value="${used.mbr_id}">
			</form>
		</c:if>
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
								<span class="commentContent" id="tempt">${uc.uc_content}</span>
								<c:if test="${user.mbr_id != uc.mbr_id}">
								<span class="commentMenu" id="reportCommentSpan">
									<img class="sirenImg" alt="사이렌사진"
									src="${pageContext.request.contextPath}/resources/images/siren.png"
									width="1%" height="1%"> 신고하기 </span>
									<form action="${pageContext.request.contextPath}/used/report" id="reprotCommentForm">
										<input type="hidden" name="mbr_id" value="${sessionScope.user.mbr_id}">
										<input type="hidden" name="repo_category" value="중고장터 댓글">
										<input type="hidden" name="repo_category_no" value="${uc.uc_no}">
										<input type="hidden" name="re_mbr_id" value="${uc.mbr_id}">
									</form>
								</c:if>
								<c:if test="${user.mbr_id == uc.mbr_id}">
								<span class="commentMenu">
										<span class="commentMenu commentUpdateBtn">(수정</span> 
										/ <span class="commentMenu commentDeleteBtn">삭제)</span>
										<input type="hidden" value="${uc.uc_no}" class="commentNumInput">
									</span>
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
</div>
<br>
	<!-- Modal 댓글 수정창-->
	<div class="modal fade" id="commentUpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="commentUpdateForm" action="${pageContext.request.contextPath}/community/commentUpdate">
					<input type="hidden" name="uc_no" id="commentUpdateInput">
					<div class="modal-body" align="center">
						<textarea id="commentUpdateTextarea" name="uc_content" rows="5" cols="102" name="comm" style="width: 100%"></textarea>
					</div>
					<div align="right" style="margin-right: 20px; margin-bottom: 20px">
						<button id="commentUpdateBtn" type="button" class="btn btn-primary" data-dismiss="modal">수정</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal -->
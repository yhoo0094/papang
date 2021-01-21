<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style type="text/css">
.communityFormTitle {
	padding: 1%;
}

.communityFormType {
	width: 100%;
	border: none;
}

.sirenImg {
	width: 30px;
	height: 30px;
	margin-bottom: 10px
}

.insertBtn {
	height: 126px;
	width: 126px;
}

.communityFormTxtarea {
	width: 100%;
	height: 100%;
	border: none;
}

.communityFormTable {
	width: 100%;
	border: solid gray 1px;
	border-collapse: collapse;
}

.note-resizebar {
	display: none;
}
.commentMenu{
	font-size: 12px; 
	cursor: pointer;
}
.titleFont{
	display: inline;
	color: rgb(249, 196, 94);
	font-size: 35px;
    font-weight: bold;
}
#titleFont{
	cursor: pointer;
}
</style>
<script type="text/javascript">

	var $tr;
	$(()=>{
		$('#reportCommentSpan').on({ //댓글 신고하기
			"click" : function() {
				if('${sessionScope.user.mbr_id}' != ''){
					$('#reprotCommentForm').submit();	
				} else {
					alert("로그인이 필요합니다.")
				}
			}
		});
		
		$('#reportSpan').on({ //글 신고하기
			"click" : function() {
				if('${sessionScope.user.mbr_id}' != ''){
					$('#reprotForm').submit();	
				} else {
					alert("로그인이 필요합니다.")
				}
			}
		});
		
		$("#commentUpdateBtn").on({ //댓글 모달에서 수정하기 버튼 클릭
			"click" : function() {
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/community/commentUpdate",  
				    type: 'POST',  
				    dataType: 'json', 
				    data : $("#commentUpdateForm").serialize(),
				    success: function(result) {
				    		console.log(result.cc_content);
				    		$tr.find('#tempt').text(result.cc_content);
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
				var cc_no = $(this).parent().find('.commentNumInput').val();
				var commentText = $(this).closest('div').find('.commentContent').text();
				$tr = $(this).closest('div')
				$(this).closest('div').find('.commentContent').eq(0).attr("id","tempt");//댓글 위치
				$('#commentUpdateModal').modal();
				$('#commentUpdateTextarea').val(commentText);
				$('#commentUpdateInput').val(cc_no);
			}
		});
		
		$("#gobackBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/community/board";
			}
		})
		
		$(".commentDeleteBtn").on({ //댓글 삭제하기
			"click" : function() {
				if(confirm("정말로 삭제하시겠습니까?")){
					var cc_no = $(this).parent().find('.commentNumInput').val();
					var tr =  $(this).closest('tr');
					$.ajax({ 
					    url: "${pageContext.request.contextPath}/community/commentDelete",  
					    type: 'POST',  
					    dataType: 'text', 
					    data : {"cc_no":cc_no},
					    success: function(number) {
					    	tr.remove();
					    }, 
					    error:function(xhr, status, message) { 
					        alert(" status: "+status+" er:"+message);
					    } 
					 });
				}
			}
		})
		
		//댓글쓰기 버튼 클릭
		$('#commentInsertBtn').on('click',function(){
			if('${sessionScope.user.mbr_id}' != ''){
				if($('#commentArea').val() != '' && $('#commentArea').val() != null){
					 $.ajax({ 
					    url: "${pageContext.request.contextPath}/community/commentInsert",  
					    type: 'POST',  
					    dataType: 'json', 
					    data : $("#commentForm").serialize(),
					    success: function(community_comVO) {
					    	location.reload();
					    }, 
					    error:function(xhr, status, message) { 
					        alert(" status: "+status+" er:"+message);
					    } 
					 });  	 
				} else {
					alert("댓글 내용을 입력하세요.");
				}
			} else {
				alert("로그인이 필요합니다.");
			}
		});//댓글쓰기 버튼 클릭
		
		$('#titleFont').on({
			"click" : function() {
				location.href = "${pageContext.request.contextPath}/community/board";
			}
		});
		
		if('${update}' == 'true'){
			alert("수정이 완료되었습니다.")
		};
		
		//삭제 버튼 클릭
		$('#deleteBtn').on({
			"click" : function() {
				if(confirm("정말 삭제하시겠습니까?")){
					if('${param.com_no}' != ''){
						var com_no = '${param.com_no}';
						location.href = "${pageContext.request.contextPath}/community/delete?com_no="+com_no
					}	
				}
			}
		});
		
		//업데이트 버튼 클릭
		$('#updateBtn').on({
			"click" : function() {
				if('${param.com_no}' != ''){
					var com_no = '${param.com_no}';
					$('#communityFormMainForm').attr("action","${pageContext.request.contextPath}/community/update?com_no="+com_no);	
					$('#communityFormMainForm').submit();	
				}
				
			}
		});
		
		//제출하기 버튼 클릭
		$('#submitBtn').on('click', function(){
			if($('#com_titleInput').val() == '' || $('#com_titleInput').val() == null){
				alert("제목을 입력하세요");
				return false;
			}
			if($('#com_categorySelect').val() == '' || $('#com_categorySelect').val() == null){
				alert("분류를 선택하세요");
				return false;
			}
			if($('#summernote').val() == '' || $('#summernote').val() == null){
				alert("내용을 입력하세요");
				return false;
			}
			$('#communityFormMainForm').submit();
		})
	})
	
</script>
</head>
<body>
	<h3 class="titleFont" id="titleFont">커뮤니티 게시판</h3><h3 class="titleFont"> > 글 페이지</h3>
	<br><br>
	<div align="center" class="communityFormDiv">
		<form:form
			action="${pageContext.request.contextPath}/community/formInsert"
			modelAttribute="communityVO" id="communityFormMainForm">
			<table class="communityFormTable" border="1">
				<tr>
					<td align="center" width="20%" class="strongYellow">제목</td>
					<td class="whiteBackground" width="80%"><c:if
							test="${not empty param.com_no and communityVO.mbr_id ne sessionScope.user.mbr_id}">
							<form:input path="com_title" type="text"
								class="communityFormType" readonly="true"/>
						</c:if> <c:if
							test="${empty communityVO.com_no or communityVO.mbr_id eq sessionScope.user.mbr_id}">
							<form:input path="com_title" type="text" id="com_titleInput"
								class="communityFormType" />
						</c:if></td>
				</tr>
				<tr>
					<td align="center" class="strongYellow">분류</td>
					<td class="whiteBackground"><select name="com_category" id="com_categorySelect"
						class="communityFormType"
						<c:if test="${not empty communityVO.com_no and communityVO.mbr_id != sessionScope.user.mbr_id}">
							disabled
						</c:if>>
							<option value="">분류를 선택하세요
							<option
								<c:if test="${communityVO.com_category == '정보'}">selected="selected"</c:if>
								value="정보">정보
							<option
								<c:if test="${communityVO.com_category == '일상'}">selected="selected"</c:if>
								value="일상">일상
							<option
								<c:if test="${communityVO.com_category == '질문'}">selected="selected"</c:if>
								value="질문">질문
					</select></td>
				</tr>
				<!-- 수정하기 -->
				<c:if test="${empty communityVO.com_no or communityVO.mbr_id == sessionScope.user.mbr_id}">
					<tr>
						<td align="center" class="strongYellow" style="padding-bottom: 7px">내용</td>
						<td class="whiteBackground"><form:textarea id="summernote"
								path="com_content" class="communityFormTxtarea" rows="20"
								cols="102" name="comm"></form:textarea></td>
					</tr>
				</c:if>
				<!-- 뷰페이지 -->
				<c:if test="${not empty communityVO.com_no and communityVO.mbr_id != sessionScope.user.mbr_id}">
					<tr>
						<td align="center" class="strongYellow" style="padding-bottom: 7px">내용</td>
						<td class="whiteBackground" style="height: 500px;">${communityVO.com_content}</td>
					</tr>
				</c:if>
			</table>
			<br>
			<div align="center">
				<c:if
					test="${not empty communityVO.com_no and communityVO.mbr_id eq sessionScope.user.mbr_id}">
					<button type="button" id="updateBtn" class="btnYellow bMedium">수정하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="deleteBtn" class="btnRed bMedium">삭제하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
				</c:if>
				<c:if test="${empty communityVO.com_no}">
					<button type="button" id="submitBtn" class="btnYellow bMedium">제출하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
				</c:if>
			</div>
		</form:form>
		<form action="${pageContext.request.contextPath}/report.do" id="reprotForm">
			<input type="hidden" name="mbr_id" value="${sessionScope.user.mbr_id}">
			<input type="hidden" name="repo_category" value="커뮤니티">
			<input type="hidden" name="repo_category_no" value="${communityVO.com_no}">
			<input type="hidden" name="re_mbr_id" value="${communityVO.mbr_id}">
		</form>
		<c:if test="${not empty communityVO.com_no}">
			<br>
			<c:if test="${communityVO.mbr_id != sessionScope.user.mbr_id}">
				<div align="right" style="font-size: 16px; float: right; color: #ff577f">
					<span id="reportSpan" class="commentMenu">
						<img class="sirenImg" alt="사이렌사진" src="${pageContext.request.contextPath}/resources/images/siren.png" width="1%" height="1%">글 신고하기
					</span>
				</div>
			</c:if>
			<div align="left">
				<b style="font-size: 20px;">댓글 쓰기</b>
			</div>
			<form
				action="${pageContext.request.contextPath}/community/commentInsert"
				id="commentForm" method="post">
				<table style="width: 100%">
					<tr>
						<td width="90%"><textarea name="cc_content" rows="5" id="commentArea"
								cols="102" name="comm" style="width: 100%"></textarea> <input
							type="hidden" value="${communityVO.com_no}" name="com_no">
							<input type="hidden" value="${communityVO.com_category}"
							name="cc_category"></td>
						<td align="center" width="10%" style="padding: 0 0 5px 0"><button
								type="button" id="commentInsertBtn" class="btnYellow insertBtn">등록하기</button></td>
					</tr>
				</table>
			</form>
			<br>
			<div align="left">
				<b style="font-size: 20px;">댓글 목록</b>
			</div>
			<table style="width: 100%">
				<c:forEach items="${community_comVOList}" var="v">
					<tr class="commentTr">
						<td align="center" width="10%">
							<div>${v.mbr_id}</div>
						</td>
						<td width="90%">
							<div>
								<span class="commentContent" id="tempt">${v.cc_content}</span>
								<c:if test="${sessionScope.user.mbr_id != v.mbr_id}">
									<span class="commentMenu" id="reportCommentSpan">
										<img class="sirenImg" alt="사이렌사진" src="${pageContext.request.contextPath}/resources/images/siren.png" width="1%" height="1%">신고하기
									</span>
									<form action="${pageContext.request.contextPath}/report.do" id="reprotCommentForm">
										<input type="hidden" name="mbr_id" value="${sessionScope.user.mbr_id}">
										<input type="hidden" name="repo_category" value="커뮤니티댓글">
										<input type="hidden" name="repo_category_no" value="${v.cc_no}">
										<input type="hidden" name="re_mbr_id" value="${v.mbr_id}">
									</form>
								</c:if> 
								<c:if test="${sessionScope.user.mbr_id == v.mbr_id}">
									<span class="commentMenu">
										<span class="commentMenu commentUpdateBtn">(수정</span> 
										/ <span class="commentMenu commentDeleteBtn">삭제)</span>
										<input type="hidden" value="${v.cc_no}" class="commentNumInput">
									</span>
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${not empty communityVO.com_no}">
			<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
		</c:if>
	</div>
	<script>
		//여기 아래 부분
		$('#summernote').summernote({
			height : 500, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : false, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
		});
	</script>
	
	<!-- Modal 댓글 수정창-->
	<div class="modal fade" id="commentUpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="commentUpdateForm" action="${pageContext.request.contextPath}/community/commentUpdate">
					<input type="hidden" name="cc_no" id="commentUpdateInput">
					<div class="modal-body" align="center">
						<textarea id="commentUpdateTextarea" name="cc_content" rows="5" cols="102" name="comm" style="width: 100%"></textarea>
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
</body>

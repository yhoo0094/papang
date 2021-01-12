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
</style>
<script type="text/javascript">
	$(()=>{
		$("#gobackBtn").on({
			"click" : function() {
				location.href="${pageContext.request.contextPath}/community/board";
			}
		})
		
		//댓글쓰기 버튼 클릭
		$('#commentInsertBtn').on('click',function(){
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
		});//댓글쓰기 버튼 클릭
		
		//업데이트 버튼 클릭
		$('#updateBtn').on({
			"click" : function() {
				$('#communityFormMainForm').attr("action","${pageContext.request.contextPath}/community/update?com_no="+${param.com_no});
				$('#communityFormMainForm').submit();
			}
		});
		
		//삭제 버튼 클릭
		$('#deleteBtn').on({
			"click" : function() {
				location.href = "${pageContext.request.contextPath}/community/delete?com_no="+${param.com_no}
			}
		});
	})
</script>
</head>
<body>
	<div align="center" class="communityFormTitle strongYellow">
		<h3>커뮤니티 글 등록하기</h3>
	</div>
	<br>
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
								class="communityFormType" readonly="true" />
						</c:if> <c:if
							test="${empty communityVO.com_no or communityVO.mbr_id eq sessionScope.user.mbr_id}">
							<form:input path="com_title" type="text"
								class="communityFormType" />
						</c:if></td>
				</tr>
				<tr>
					<td align="center" class="strongYellow">분류</td>
					<td class="whiteBackground"><select name="com_category"
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
				<tr>
					<td align="center" class="strongYellow" style="padding-bottom: 7px">내용</td>
					<td class="whiteBackground"><form:textarea id="summernote"
							path="com_content" class="communityFormTxtarea" rows="20"
							cols="102" name="comm"></form:textarea></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<c:if test="${not empty communityVO.com_no and communityVO.mbr_id eq sessionScope.user.mbr_id}">
					<button type="button" id="updateBtn" class="btnYellow bMedium">수정하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="deleteBtn" class="btnRed bMedium">삭제하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
				</c:if>
				<c:if test="${empty communityVO.com_no}">
					<button type="submit" id="submitBtn" class="btnYellow bMedium">제출하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
				</c:if>
			</div>
		</form:form>
		<c:if test="${not empty communityVO.com_no}">
			<br>
			<div align="left">
				<b style="font-size: 20px;">댓글 쓰기</b>
			</div>
			<form
				action="${pageContext.request.contextPath}/community/commentInsert"
				id="commentForm" method="post">
				<table style="width: 100%">
					<tr>
						<td width="90%"><textarea name="cc_content" rows="5"
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
					<tr>
						<td align="center" width="10%">
							<div>${v.mbr_id}</div>
						</td>
						<td width="90%">
							<div id="commentDiv">
								${v.cc_content}&nbsp; <img class="sirenImg" alt="사이렌사진"
									src="${pageContext.request.contextPath}/resources/images/siren.png"
									width="1%" height="1%"> <span style="font-size: 8px">
									신고하기 </span>
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
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style type="text/css">
</style>
</head>
<body>
	<br>
	<h3 style="display: inline;">커뮤니티 게시판</h3>
	<form id="communityBoardCategory" class="category" action="${pageContext.request.contextPath}/community/board" method="post">
		<select name="com_category" style="width: 100%">
			<option value="">분류
			<option <c:if test="${communityVO.com_category == '정보'}">selected="selected"</c:if> value="정보">정보
			<option <c:if test="${communityVO.com_category == '일상'}">selected="selected"</c:if> value="일상">일상
			<option <c:if test="${communityVO.com_category == '질문'}">selected="selected"</c:if> value="질문">질문
		</select>
	</form>
	<hr/>
	<br>
	<div align="center" id = communityBoardTable>
		<table class="table" id="dataTable">
			<thead>
				<tr class="tableTrTh">
					<th width="15%" class="tableTh">분류</th>
					<th width="20%" class="tableTh">제목</th>
					<th width="15%" class="tableTh">작성자</th>
					<th width="15%" class="tableTh">작성일</th>
					<th width="15%" class="tableTh">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${CommunityVOList}" var="v">
				<tr>
					<td align="center">${v.com_no}. ${v.com_category}</td>
					<td><a href="${pageContext.request.contextPath}/community/form?com_no=${v.com_no}" class="boardTagA">${v.com_title}</a></td>
					<td align="center">${v.mbr_id}</td>
					<td align="center">${v.com_date}</td>
					<td align="center">${v.com_hit}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br>
	</div>
	<div align="right">
		<button id="createBtn" class="btnYellow bSamll btnWrite">글쓰기</button>
	</div>
	<script type="text/javascript">
 		$(()=>{
			$("#createBtn").on({
				"click" : function() {
					location.href="${pageContext.request.contextPath}/community/form";		
				}
			})
			$("#communityBoardCategory").on({
				"change" : function() {
					$("#communityBoardCategory").submit();
				}
			})
		})
		
	</script>

</body>

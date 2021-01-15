<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style type="text/css">
.noticeTitleTd{
	color: #007bff;
}	
.titleFont{
	display: inline;
	color: rgb(249, 196, 94);
	font-size: 35px;
    font-weight: bold;
}
</style>
</head>
<body>
	<br>
	<h3 class="titleFont">커뮤니티 게시판</h3>
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
					<th width="5%" class="tableTh">No.</th>
					<th width="30%" class="tableTh">제목</th>
					<th width="10%" class="tableTh">작성자</th>
					<th width="15%" class="tableTh">작성일</th>
					<th width="10%" class="tableTh">분류</th>
					<th width="10%" class="tableTh">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${NqVOList}" var="v">
				<tr class="noticeTitleTd">
					<td align="center"><span style="display: none;">99999999${v.nq_no}</span></td>
					<td><span style="display: none;">A</span><a href="${pageContext.request.contextPath}/community/noticeForm?nq_no=${v.nq_no}">${v.nq_title}</a></td>
					<td align="center"><span style="display: none;">A</span>${v.ad_id}</td>
					<td align="center"><span style="display: none;">A</span>${v.nq_date}</td>
					<td align="center"><span style="display: none;">A</span>${v.nq_category}</td>
					<td align="center"><span style="display: none;">A</span>${v.nq_hit}</td>
				</tr>
			</c:forEach>
			<c:forEach items="${CommunityVOList}" var="v">
				<tr>
					<td align="center">${v.com_no}</td>
					<td><span style="display: none;">B</span><a href="${pageContext.request.contextPath}/community/form?com_no=${v.com_no}" class="boardTagA">${v.com_title}</a></td>
					<td align="center"><span style="display: none;">B</span>${v.mbr_id}</td>
					<td align="center"><span style="display: none;">B</span>${v.com_date}</td>
					<td align="center"><span style="display: none;">B</span>${v.com_category}</td>
					<td align="center"><span style="display: none;">B</span>${v.com_hit}</td>
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

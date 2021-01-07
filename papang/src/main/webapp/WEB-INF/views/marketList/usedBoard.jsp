<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
<style type="text/css">
.category {
	display: inline;
	float: right;
	width: 10%;
}
</style>
</head>
<body>
	<br>
	<h3 style="display: inline;">중고장터 게시판</h3>
	<form id="usedBoardCategory" class="category" action="${pageContext.request.contextPath}/marketList/usedBoard" method="post">
		<select id="used_loc" name="used_loc" style="width: 100%">
			<option value="" selected>지역
			<option <c:if test="${used.used_loc == '택배'}">selected="selected"</c:if> value='택배'>택배</option>
			<option <c:if test="${used.used_loc == '서울'}">selected="selected"</c:if> value='서울'>서울</option>
			<option <c:if test="${used.used_loc == '부산'}">selected="selected"</c:if> value='부산'>부산</option>
			<option <c:if test="${used.used_loc == '대구'}">selected="selected"</c:if> value='대구'>대구</option>
			<option <c:if test="${used.used_loc == '인천'}">selected="selected"</c:if> value='인천'>인천</option>
			<option <c:if test="${used.used_loc == '광주'}">selected="selected"</c:if> value='광주'>광주</option>
			<option <c:if test="${used.used_loc == '대전'}">selected="selected"</c:if> value='대전'>대전</option>
			<option <c:if test="${used.used_loc == '울산'}">selected="selected"</c:if> value='울산'>울산</option>
			<option <c:if test="${used.used_loc == '강원'}">selected="selected"</c:if> value='강원'>강원</option>
			<option <c:if test="${used.used_loc == '경기'}">selected="selected"</c:if> value='경기'>경기</option>
			<option <c:if test="${used.used_loc == '경남'}">selected="selected"</c:if> value='경남'>경남</option>
			<option <c:if test="${used.used_loc == '경북'}">selected="selected"</c:if> value='경북'>경북</option>
			<option <c:if test="${used.used_loc == '전남'}">selected="selected"</c:if> value='전남'>전남</option>
			<option <c:if test="${used.used_loc == '전북'}">selected="selected"</c:if> value='전북'>전북</option>
			<option <c:if test="${used.used_loc == '제주'}">selected="selected"</c:if> value='제주'>제주</option>
			<option <c:if test="${used.used_loc == '충남'}">selected="selected"</c:if> value='충남'>충남</option>
			<option <c:if test="${used.used_loc == '충북'}">selected="selected"</c:if> value='충북'>충북</option>
		</select>
	</form>
	<hr />
	<br>
	<div align="center">
		<table class="table" id="marketTable">
			<thead>
				<tr class="tableTrTh">
					<th width="5%" class="tableTh">글번호</th>
					<th width="10%" class="tableTh">분류</th>
					<th width="25%" class="tableTh">사진</th>
					<th width="30%" class="tableTh">제목</th>
					<th width="15%" class="tableTh">작성자</th>
					<th width="10%" class="tableTh">작성일</th>
					<th width="5%" class="tableTh">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${usedList}" var="used">
				<tr>
					<td align="center">${used.used_no}</td>
					<td align="center">${used.used_category}</td>
					<td align="center">사진</td>
					<td><a href="${pageContext.request.contextPath}/market/usedDetail?used_no=${used.used_no}">${used.used_title}</a></td>
					<td align="center">${used.mbr_id}</td>
					<td align="center">${used.used_date}</td>
					<td align="center">${used.used_hit}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br>
	</div>
	<c:if test="${!empty user.mbr_id}">
	<div align="right">
		<button id="createBtn" class="btnYellow bMedium"
		onclick="location.href='/papang/market/usedInsertForm'">글쓰기</button>
	</div>
	</c:if>
<script>
$(function(){
	$("#usedBoardCategory").on({
		"change" : function() {
			$("#usedBoardCategory").submit();
		}
	})
}
</script>
</body>

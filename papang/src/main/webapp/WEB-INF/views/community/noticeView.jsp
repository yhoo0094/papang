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
	})
</script>
</head>
<body>
	<div align="center" class="communityFormTitle strongYellow">
		<h3>공지사항</h3>
	</div>
	<br>
	<div align="center" class="communityFormDiv">
		<table class="communityFormTable" border="1">
			<tr>
				<td align="center" width="20%" class="strongYellow">제목</td>
				<td class="whiteBackground" width="80%">
					${nqVO.nq_title}
				</td>
			</tr>
			<tr>
				<td align="center" width="20%" class="strongYellow">첨부파일</td>
				<td class="whiteBackground" width="80%">
					<a href="${pageContext.request.contextPath}/community/filedown?uFile=${nqVO.nq_file}">${nqVO.nq_file}</a> 
				</td>
			</tr>
			<tr>
				<td align="center" class="strongYellow" style="padding-bottom: 7px">내용</td>
				<td class="whiteBackground" style="height: 500px">
					${nqVO.nq_content}
				</td>		
			</tr>
		</table>
	</div>
	<br>
	<div align="center">
			<button type="button" id="gobackBtn" class="btnGray bMedium">돌아가기</button>
	</div>
</body>

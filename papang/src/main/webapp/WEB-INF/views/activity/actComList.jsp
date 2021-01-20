<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/active/css/cookList.css" />
<title>Insert title here</title>
<style>
td {
	width: 240px;
	height: 200px;
	border-radius: 0 8px 8px 0;
}

.titleTd {
	height: 50px;
	width: 1050px;
	padding: 0 10px 0 20px;
}

.imgDiv {
	width: 100%;
	height: 130%;
}

.acListDiv {
	height: 300px;
	padding: 20px;
	border-radius: 8px;
	width: 100%;
	background-color: rgb(249, 196, 94);
	margin: 0 0 40px 0;
}

table {

	margin: 0 0 50px 0;
}

th {
	font-size: 18px;
	text-align: left;
	padding-left: 10px;
}

.starimg {
	width: 10px;
	height: 10px;
}
.btnDiv{float: right; display: inline-block;}
.ttarea{width: 98%;
    height: 200px;
    border: none;
   margin-left: 20px;
    font-size: 18px;
    padding-left: 10px;}
.bMedium {
	width: 70px;
	height: 40px;
	font-weight: bold;
}
.updateBtn:hover{color:red;}
.deleteBtn:hover{color:red;}
</style>
<script>
$(()=>{

	//후기 업데이트
	 $('.updateBtn').on('click',function() {
		
		var ac_category = $(this).closest('table').prevAll('#ac_category').val();
		var ac_no = $(this).closest('table').prevAll('#ac_no').val();
		var pc_no = $(this).closest('table').prevAll('#pc_no').val();
		var mbr_id = $(this).closest('table').find('#mbr_id').text();
		var ac_content = $(this).closest('table').find('#ac_content').text();
		
		$.ajax({
			url : "../actUpdate",
			type : 'POST',
			dataType : 'text',
			data : {'ac_content' : ac_content,
				   'mbr_id' : mbr_id,
				   'ac_category' : ac_category,
				   'ac_no' : ac_no,
				   'pc_no' : pc_no},
			success:function(result) {
				alert('수정이 완료되었습니다');
			},//success
			error : function(xhr, status, message) {
				alert("status: " + status + " er:" + message);
			}//error
		});//ajax
	}); //btnevent
	
	//후기 삭제
	 $('.deleteBtn').on('click',function() {
			
			var ac_category = $(this).closest('table').prevAll('#ac_category').val();
			var ac_no = $(this).closest('table').prevAll('#ac_no').val();
			var pc_no = $(this).closest('table').prevAll('#pc_no').val();
			var mbr_id = $(this).closest('table').find('#mbr_id').text();
			var ac_content = $(this).closest('table').find('#ac_content').text();
			
			$.ajax({
				url : "../actDelete",
				type : 'POST',
				dataType : 'text',
				data : {
					   'mbr_id' : mbr_id,
					   'ac_category' : ac_category,
					   'ac_no' : ac_no,
					   'pc_no' : pc_no},
				success:function(result) {
					alert('삭제 되었습니다');
					location.reload();
				},//success
				error : function(xhr, status, message) {
					alert("status: " + status + " er:" + message);
				}//error
			});//ajax
		}); //btnevent

});
</script>
</head>
<body>
	<div class="Bigtitle">후기 리스트</div>

	<c:forEach items="${actList}" var="actlist">
		<div class="acListDiv">
		<input id="ac_category" type="hidden" name="ac_category" value="${actlist.ac_category}">
		<input id="ac_no" type="hidden" name="ac_no" value="${actlist.ac_no}">
		<input id="pc_no" type="hidden" name="pc_no" value="${actlist.pc_no}">		
			<table>
				<tr>
					<td rowspan="2">
						<img class="imgDiv" src="${pageContext.request.contextPath}/images/actCom/${actlist.ac_pic}">
					</td>
					<th class="titleTd"><span id="mbr_id">${actlist.mbr_id}</span>
					<c:if test="${actlist.mbr_id eq user.mbr_id}">
						<div class="btnDiv">
							<span class="updateBtn">수정</span> | 
							<span class="deleteBtn">삭제</span>
						</div>
					</c:if>
					</th>
				</tr>
				<tr>
					<td class="contentTd"><textarea class="ttarea" id="ac_content" name="ac_content">${actlist.ac_content}</textarea></td>
				</tr>
			</table>
		</div>
	</c:forEach>

</body>
</html>
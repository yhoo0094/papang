<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<link rel = "preconnect"href = "https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style>
	.cook_content{background-color:rgb(249, 196, 94);width: 70%; border-radius: 10px;margin: 40px 10px 10px 170px;height: 100%;}
	.cView_title{height: auto;padding: 20px 40px 0 40px;}
	.cView_category{height: 120px;padding: 20px 40px 0 40px;}
    .btnRed{font-size: 18px;}
    .in_title, .in_category{border: none;width: 100%;height: 50px;border-radius: 5px;padding-left: 12px;font-size: 20px;}
 	.note-statusbar{display: none;}
 	.note-editor ,.note-frame {border: none;width: 1020px;width: 980px;border: none;}
 	.note-editable{background-color: white;border-radius: 0 0 8px 8px;}
 	.cook_content {padding: 20px 20px 40px 20px;}
 	.note-editor.note-frame{border:none;}
 	.note-editor .note-toolbar {padding: 15px 0 15px 5px;}
 	.btn_div{margin:30px 0 0 0;}
 	.bMedium{font-size: 18px;margin: 10px;}
 	.note-editable{font-size: 23px;}
</style>
<script>
$(()=>{
	
	$('#updateBtn').on('click',function(){
		alert('수정이 완료 되었습니다.');
		$('#frm').attr('action','updateSuccessCook');
		$('#frm').submit();
	});
	
	$('#insertBtn').on('click',function(){
		var cook_title = $('#frm').find('#cook_title').val();
		var cook_category = $("#cook_category option:selected").val();
		var summernote = $('#frm').find('#summernote').val();
		
		if(cook_title==""|| cook_title==null) {
			alert("제목을 입력하세요.");
			$('#cook_title').focus();
			return false;
		} 
		
	 	if(cook_category==""|| cook_category==null||cook_category=="-- 카테고리 선택 --") {
			alert("카테고리를 선택하세요.");
			$('#cook_category').focus();
			return false;
		}  
		
		if(summernote==""|| summernote==null) {
			alert("내용을 작성하세요.");
			$('#summernote').focus();
			return false;
		} 
		
		return true;
	});
	
	
	
});

</script>
<body>
<!-- 전체 div 시작 -->
<div>
	<div class="Bigtitle">아빠와 요리해요 > 글 등록</div>	
		<div class="cook_content">
		<form action="${pageContext.request.contextPath}/activity/insertCook" method="post" id="frm">
			<div class="cView_title">
				<input class="in_title" id="cook_title" name="cook_title" placeholder="제목을 입력하세요" <c:if test="${not empty param.cook_no}">value='${cookVO.cook_title}'</c:if>>
				<input type="hidden" name="mbr_id"  value="${user.mbr_id}">
				<input type="hidden" name="cook_no"  value="${cookVO.cook_no}">
			</div>
				<div class="cView_category">
				<select class="in_category" name="cook_category" id="cook_category">
					<option selected>-- 카테고리 선택 --</option>
					<option value="이유식" <c:if test="${cookVO.cook_category == '이유식'}">selected</c:if>>이유식</option>
					<option value="아이와함께" <c:if test="${cookVO.cook_category == '아이와함께'}">selected</c:if>>아이와함께</option>
					<option value="비건아이" <c:if test="${cookVO.cook_category == '비건아이'}">selected</c:if>>비건아이</option>
					<option value="육식아이" <c:if test="${cookVO.cook_category == '육식아이'}">selected</c:if>>육식아이</option>
				</select>
			</div>
			
			<div align="center">
				<textarea name="cook_content" id="summernote"
								class="communityFormTxtarea" rows="20" cols="102" >${cookVO.cook_content}</textarea>
			</div>
			<div class="btn_div" align="center">
				<c:if test="${empty param.cook_no}">	
					<button type="submit" class="btnRed bMedium" id="insertBtn">등록하기</button>
				</c:if>
				<c:if test="${not empty param.cook_no}">
					<button class="btnRed bMedium" id="updateBtn" type="button">수정하기</button>
				</c:if>
				<button type="reset" class="btnGray bMedium" id="cancleBtn">취소</button>
			</div>
		</form>
	</div>
</div>
<!--전체 div 끝 --> 


<script>
//여기 아래 부분
$('#summernote').summernote({
	height : 500, // 에디터 높이
	width : 800,
	minHeight : null, // 최소 높이
	maxHeight : null, // 최대 높이
	focus : true, // 에디터 로딩후 포커스를 맞출지 여부
	lang : "ko-KR", // 한글 설정
});
	</script>
</body>
</html>
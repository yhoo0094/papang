<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		alert('글 수정 완료');
		$('#frm').attr('action','updateSuccess');
		$('#frm').submit();
	});
	

	$('#insertBtn').on('click',function(){
		var play_title = $('#frm').find('#play_title').val();
		var play_category = $("#play_category option:selected").val();
		var summernote = $('#frm').find('#summernote').val();
		
		if(play_title==""|| play_title==null) {
			alert("제목을 입력하세요.");
			$('#play_title').focus();
			return false;
		} 
		
	 	if(play_category==""|| play_category==null||play_category=="-- 카테고리 선택 --") {
			alert("카테고리를 선택하세요.");
			$('#play_category').focus();
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
	<div class="Bigtitle">아빠와 함께 놀아요 > 글 등록</div>	
		<div class="cook_content">
		<form id="frm" action="${pageContext.request.contextPath}/activity/insertPlay" method="post">
			<div class="cView_title">
				<input type="hidden" name="play_no"  value="${playVO.play_no}">
				<input class="in_title" id="play_title" name="play_title" placeholder="제목을 입력하세요" 
				<c:if test="${not empty param.play_no}">value=${playVO.play_title}</c:if>>
				<input type="hidden" name="mbr_id"  value="${user.mbr_id}">
			</div>
			<div class="cView_category">
				<select class="in_category" name="play_category" id="play_category">
					<option>-- 카테고리 선택 --</option>
					<option value="예비아빠" <c:if test="${playVO.play_category == '예비아빠'}">selected</c:if>>예비아빠</option>
					<option value="만0~1세" <c:if test="${playVO.play_category == '만0~1세'}">selected</c:if>>만0~1세</option>
					<option value="만2세" <c:if test="${playVO.play_category == '만2세'}">selected</c:if>>만2세</option>
					<option value="만3~6세" <c:if test="${playVO.play_category == '만3~6세'}">selected</c:if>>만3~6세</option>
				</select>
			</div>
			<div align="center">
				<textarea name="play_content" id="summernote"
								class="communityFormTxtarea" rows="20" cols="102" >${playVO.play_content}</textarea>
			</div>
			<div class="btn_div" align="center">
				<c:if test="${empty param.play_no}">
					<button class="btnRed bMedium" type="submit" id="insertBtn">등록하기</button>
				</c:if>
				<c:if test="${not empty param.play_no}">
					<button class="btnRed bMedium" id="updateBtn" type="button">수정하기</button>
				</c:if>
				<button class="btnGray bMedium" id="cancleBtn" type="reset">취소</button>
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